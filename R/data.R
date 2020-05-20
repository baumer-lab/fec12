#' Candidates Master metadata
#'
#' @description Basic information for each candidate.
#'
#' @format A data frame with 7397 rows and 15 columns, providing information
#' for each candidate:
#' \describe{
#'   \item{cand_id}{A 9-character alpha-numeric code assigned to a candidate by the FEC, which remains
#'   the same across election cycles if running for the same office}
#'   \item{cand_name}{Candidate name}
#'   \item{cand_pty_affiliation}{The political party affiliation reported by the candidate}
#'   \item{cand_election_yr}{Candidate's election year from a Statement of Candidacy or state ballot list}
#'   \item{cand_office_st}{Candidate's state}
#'   \item{cand_office}{Candidate office with designation: H = House, P = President, S = Senate}
#'   \item{cand_office_district}{Congressional district number: Congressional at-large 00, Senate 00, Presidential 00}
#'   \item{cand_ici}{Incumbent challenger status with designation: C = Challenger, I = Incumbent, O = Open Seat}
#'   \item{cand_status}{Candidate status with designation: C = Statutory candidate, F = Statutory candidate for future election,
#'   N = Not yet a statutory candidate, P = Statutory candidate in prior cycle}
#'   \item{cand_pcc}{ID of the candidate's principal campaign committee assigned by FEC}
#'   \item{cand_st1}{Candidate's Mailing address - street 1}
#'   \item{cand_st2}{Candidate's Mailing address - street 2}
#'   \item{cand_city}{Candidate's Mailing address - city}
#'   \item{cand_st}{Candidate's Mailing address - state}
#'   \item{cand_zip}{Candidate's Mailing address - ZIP code}
#' }
#' @source <https://www.fec.gov/campaign-finance-data/candidate-master-file-description/>, updated 2020-03-02
"candidates"

#' Committee contributions metadata
#'
#' @description Provides data pertaining to each candidate and their contibutions from committees during the 2016 general election.
#'
#' @format A data frame with 1000 rows and 15 columns with information about candidate committee contibutions.
#' \describe{
#'   \item{cmte_id}{A 9-character alpha-numeric code assigned to a committee by the Federal Election Commission}
#'   \item{amndt_ind}{Amendment indicator: Indicates if the report being filed is new (N), an amendment (A) to a previous
#'   report or a termination (T) report}
#'   \item{rpt_tp}{Indicates the type of report filed, listed here:
#'   \url{https://www.fec.gov/campaign-finance-data/report-type-code-descriptions/}}
#'   \item{transaction_pgi}{This code indicates the election for which the contribution was made.
#'   EYYYY (election Primary, General, Other plus election year)}
#'   \item{transaction_tp}{Transaction types, listed here:
#'   \url{https://www.fec.gov/campaign-finance-data/transaction-type-code-descriptions/}}
#'   \item{entity_tp}{Entity Type:
#'
#'   CAN = Candidate
#'
#'   CCM = Candidate Committee
#'
#'   COM = Committee
#'
#'   IND = Individual (a person)
#'
#'   ORG = Organization (not a committee and not a person)
#'
#'   PAC = Political Action Committee
#'
#'   PTY = Party Organization}
#'   \item{name}{Contributor/lender/transfer Name}
#'   \item{city}{City}
#'   \item{state}{State}
#'   \item{zip_code}{ZIP Code}
#'   \item{transaction_dt}{Transaction date (YYYY-MM-DD)}
#'   \item{transaction_amt}{Transaction Amount}
#'   \item{other_id}{For contributions from individuals this column is null.
#'   For contributions from candidates or other committees this column will contain that contributor's FEC ID}
#'   \item{cand_id}{A 9-character alpha-numeric code assigned to a candidate by the FEC, which remains
#'   the same across election cycles if running for the same office}
#'   \item{tran_id}{Only for Electronic Filings. A unique identifier associated with each itemization or transaction
#'   appearing in an FEC electronic file. A transaction ID is unique for a specific committee for a specific report.}
#' }
#' @source <https://www.fec.gov/campaign-finance-data/contributions-committees-candidates-file-description/>, Updated 2020-03-02
"contributions"

#' Committees metadata
#'
#' @description Provides data pertaining to each committee registered with the Federal Election Commission.
#'
#' @format A data frame with 17654 rows and 15 columns with information about FEC committees.
#' \describe{
#'   \item{cmte_id}{A 9-character alpha-numeric code assigned to a committee by the Federal Election Commission}
#'   \item{cmte_nm}{Name of the committee}
#'   \item{tres_nm}{The officially registered treasurer for the committee}
#'   \item{cmte_st1}{Street 1}
#'   \item{cmte_st2}{Street 2}
#'   \item{cmte_city}{City}
#'   \item{cmte_st}{State}
#'   \item{cmte_zip}{ZIP Code}
#'   \item{cmte_dsgn}{A = Authorized by a candidate
#'
#' B = Lobbyist/Registrant PAC
#'
#' D = Leadership PAC
#'
#' J = Joint fundraiser
#'
#' P = Principal campaign committee of a candidate
#'
#' U = Unauthorized}
#'   \item{cmte_tp}{Committee Type, listed here: \url{https://www.fec.gov/campaign-finance-data/committee-type-code-descriptions/}}
#'   \item{cmte_pty_affiliation}{Committee Party, listed here: \url{https://www.fec.gov/campaign-finance-data/party-code-descriptions/}}
#'   \item{cmte_filing_freq}{Filing frequency: A = Administratively terminated,
#'
#'   D = Debt
#'
#'   M = Monthly filer
#'
#'   Q = Quarterly filer
#'
#'   T = Terminated
#'
#'   W = Waived}
#'   \item{org_tp}{Interest group category:
#'
#'   C = Corporation
#'
#'   L = Labor organization
#'
#'   M = Membership organization
#'
#'   T = Trade association
#'
#'   V = Cooperative
#'
#'   W = Corporation without capital stock}
#'   \item{connected_org_nm}{Connected organization's name}
#'   \item{cand_id}{Candidate identification:When a committee has a committee type designation of H, S, or P,
#'   the candidate's identification number will be entered in this field.}
#' }
#' @source <https://www.fec.gov/campaign-finance-data/committee-master-file-description/>, updated 2020-03-02
"committees"

#' Individual Contributions Master metadata
#'
#' @description Information for a simple random sample of transactions from
#' individuals to candidates/committees.
#'
#' @format A data frame with 1000 rows and 16 columns providing information for each transaction:
#' \describe{
#'   \item{cmte_id}{A 9-character alpha-numeric code assigned to a committee by the Federal Election Commission}
#'   \item{amndt_ind}{Amendment indicator: Indicates if the report being filed is new (N), an amendment (A) to a previous
#'   report or a termination (T) report}
#'   \item{rpt_tp}{Indicates the type of report filed, listed here:
#'   \url{https://www.fec.gov/campaign-finance-data/report-type-code-descriptions/}}
#'   \item{transaction_pgi}{This code indicates the election for which the contribution was made.
#'   EYYYY (election Primary, General, Other plus election year)}
#'   \item{transaction_tp}{Transaction types, listed here:
#'   \url{https://www.fec.gov/campaign-finance-data/transaction-type-code-descriptions/}}
#'   \item{entity_tp}{Entity Type:
#'
#'   CAN = Candidate
#'
#'   CCM = Candidate Committee
#'
#'   COM = Committee
#'
#'   IND = Individual (a person)
#'
#'   ORG = Organization (not a committee and not a person)
#'
#'   PAC = Political Action Committee
#'
#'   PTY = Party Organization}
#'   \item{name}{Contributor/lender/Transfer Name}
#'   \item{city}{City}
#'   \item{state}{State}
#'   \item{zip_code}{ZIP Code}
#'   \item{employer}{Employer}
#'   \item{occupation}{Occupation}
#'   \item{transaction_dt}{Transaction date (YYYY-MM-DD)}
#'   \item{transaction_amt}{Transaction Amount}
#'   \item{other_id}{For contributions from individuals this column is null.
#'   For contributions from candidates or other committees this column will contain that contributor's FEC ID.}
#'   \item{tran_id}{Only for Electronic Filings. A unique identifier associated with each itemization or transaction
#'   appearing in an FEC electronic file. A transaction ID is unique for a specific committee for a specific report.}
#' }
#' @source <https://www.fec.gov/campaign-finance-data/contributions-individuals-file-description/>, updated 2020-03-02
"individuals"

#' General Federal Election Results
#'
#' @description 2016 House General Election Results
#'
#' @format 3 data frames with information about the House, Senate, and Presidential Election results:
#' \describe{
#'   \item{state}{The state of the votes}
#'   \item{district_id}{District ID}
#'   \item{cand_id}{A code assigned to a candidate by the FEC}
#'   \item{incumbent}{A logical variable: TRUE if incumbent, FALSE if not}
#'   \item{party}{Party of the candidate}
#'   \item{primary_votes}{Number of votes in the primary electiom}
#'   \item{primary_percent}{Percentage of votes in the primary election}
#'   \item{runoff_votes}{Number of runoff votes}
#'   \item{runoff_percent}{Percentage of runoff votes}
#'   \item{general_votes}{Number of votes in the general election}
#'   \item{general_percent}{Percentage of votes in the general election}
#'   \item{won}{A logical variable: TRUE if candidate won, FALSE if not}
#'   \item{footnotes}{Footnotes}
#' }
#' @source <https://transition.fec.gov/general/FederalElections2016.shtml>, updated 2020-03-02
"results_house"

#' @rdname results_house
#' @description 2016 Senate General Election Results
"results_senate"

#' @rdname results_house
#' @description 2016 Presidential General Election Results
"results_president"

#' House/Senate Current Campaigns
#'
#' @description Summary financial information for each campaign.
#'
#' @format A data frame with 1898 rows and 25 columns, providing financial
#' information for each House/Senate campaign:
#' \describe{
#'   \item{cand_id}{A code assigned to a candidate by the FEC}
#'   \item{cand_name}{Candidate name}
#'   \item{cand_ici}{Incumbent challenger status with designation:
#'    C = Challenger, I = Incumbent, O = Open Seat}
#'   \item{pty_cd}{Party code}
#'   \item{cand_pty_affiliation}{The political party affiliation reported by the candidate}
#'   \item{ttl_receipts}{Total receipts}
#'   \item{trans_from_auth}{Transfers from authorized committees}
#'   \item{ttl_disb}{Total disbursements}
#'   \item{trans_to_auth}{Transfers to authorized committees}
#'   \item{coh_bop}{Beginning cash}
#'   \item{coh_cop}{Ending cash}
#'   \item{cand_contrib}{Contributions from candidate}
#'   \item{cand_loans}{Loans from candidate}
#'   \item{other_loans}{Other loans}
#'   \item{cand_loan_repay}{Candidate loan repayments}
#'   \item{other_loan_repay}{Other loan repayments}
#'   \item{debts_owed_by}{Debts owed by}
#'   \item{ttl_indiv_contrib}{Total individual contribution}
#'   \item{cand_office_st}{Candidate's state}
#'   \item{cand_office_district}{Candidate's district}
#'   \item{other_pol_cmte_contrib}{Contributions from other political committees}
#'   \item{pol_pty_contrib}{Contributions from party committees}
#'   \item{cvg_end_dt}{Coverage end date (YYYY-MM-DD)}
#'   \item{indiv_refunds}{Refunds to individuals}
#'   \item{cmte_refunds}{Refunds to committees}
#' }
#' @source <https://transition.fec.gov/general/FederalElections2016.shtml>, updated 2020-03-02
"campaigns"

#' Operating Expenditures
#'
#' @description Operating expenditure information for a simple random sample
#' of 1000 entries
#'
#' @format A data frame with 1000 rows and 20 columns:
#' \describe{
#'   \item{cmte_id}{A 9-character alpha-numeric code assigned to a committee by the Federal Election Commission}
#'   \item{amndt_ind}{Amendment indicator: Indicates if the report being filed is new (N), an amendment (A) to a previous
#'   report or a termination (T) report}
#'   \item{rpt_yr}{Report year}
#'   \item{rpt_tp}{Indicates the type of report filed, listed here:
#'   \url{https://www.fec.gov/campaign-finance-data/report-type-code-descriptions}}
#'   \item{line_num}{ndicates FEC form line number}
#'   \item{form_tp_cd}{Indicates FEC form type}
#'   \item{sched_tp_cd}{Schedule type: Schedule B - Itemized disbursements}
#'   \item{name}{Contributor/lender/Transfer Name}
#'   \item{city}{City}
#'   \item{state}{State}
#'   \item{zip_code}{ZIP Code}
#'   \item{transaction_dt}{Transaction date (YYYY-MM-DD)}
#'   \item{transaction_amt}{Transaction Amount}
#'   \item{transaction_pgi}{Primary general indicator}
#'   \item{purpose}{Purpose}
#'   \item{category}{Disbursement category code: 001-012 and 101-107}
#'   \item{category_desc}{Disbursement Category Code Description,
#'   listed here: \url{https://www.fec.gov/campaign-finance-data/disbursement-category-code-descriptions}}
#'   \item{entity_tp}{Entity Type:
#'
#'   CAN = Candidate
#'
#'   CCM = Candidate Committee
#'
#'   COM = Committee
#'
#'   IND = Individual (a person)
#'
#'   ORG = Organization (not a committee and not a person)
#'
#'   PAC = Political Action Committee
#'
#'   PTY = Party Organization}
#'
#'   \item{tran_id}{Only for Electronic Filings. A unique identifier associated with each itemization or transaction
#'   appearing in an FEC electronic file. A transaction ID is unique for a specific committee for a specific report.}
#'
#'   \item{back_ref_tran_id}{Back reference transaction ID: Used to associate one transaction with another transaction in the same report
#'   (using file number, transaction ID and back reference transaction ID).
#'   For example, a credit card payment and the subitemization of specific purchases.
#'   The back reference transaction ID of the specific purchases will equal the transaction ID of the payment to the credit card company.}
#'   }
#' @source <https://www.fec.gov/campaign-finance-data/operating-expenditures-file-description/>, updated 2020-03-02
"expenditures"

#' Any Transaction From One Committee To Another
#'
#' @description Transaction information between committees
#'
#' @format A data frame with 1000 rows and 16 columns:
#' \describe{
#'   \item{cmte_id}{A 9-character alpha-numeric code assigned to a committee by the Federal Election Commission}
#'   \item{amndt_ind}{Amendment indicator: Indicates if the report being filed is new (N), an amendment (A) to a previous
#'   report or a termination (T) report}
#'   \item{rpt_tp}{Indicates the type of report filed, listed here:
#'   \url{https://www.fec.gov/campaign-finance-data/report-type-code-descriptions}}
#'   \item{transaction_pgi}{Primary general indicator:This code indicates the election for which the contribution was made.
#'   EYYYY (election Primary, General, Other plus election year)}
#'   \item{transaction_tp}{Transaction type, listed here: \url{https://www.fec.gov/campaign-finance-data/transaction-type-code-descriptions}}
#'   \item{entity_tp}{Entity Type:
#'
#'   CAN = Candidate
#'
#'   CCM = Candidate Committee
#'
#'   COM = Committee
#'
#'   IND = Individual (a person)
#'
#'   ORG = Organization (not a committee and not a person)
#'
#'   PAC = Political Action Committee
#'
#'   PTY = Party Organization}
#'   \item{name}{Contributor/lender/Transfer Name}
#'   \item{city}{City}
#'   \item{state}{State}
#'   \item{zip_code}{ZIP Code}
#'   \item{employer}{Employer}
#'   \item{occupation}{Occupation}
#'   \item{transaction_dt}{Transaction date (YYYY-MM-DD)}
#'   \item{transaction_amt}{Transaction Amount}
#'   \item{other_id}{For contributions from individuals this column is null.
#'   For contributions from candidates or other committees this column will contain that contributor's FEC ID}
#'   \item{tran_id}{Only for Electronic Filings. A unique identifier associated with each itemization or transaction
#'   appearing in an FEC electronic file. A transaction ID is unique for a specific committee for a specific report.}
#'   }
#' @source <https://www.fec.gov/campaign-finance-data/any-transaction-one-committee-another-file-description/>, updated 2020-03-02
"transactions"

#' Political Action Committee (PAC) and Party Summary Financial Information
#'
#' @description PAC and party summary finanicial information
#'
#' @format A data frame with 12049 rows and 27 columns:
#' \describe{
#'   \item{cmte_id}{A 9-character alpha-numeric code assigned to a committee by the Federal Election Commission}
#'   \item{cmte_nm}{Name of the committee}
#'   \item{cmte_tp}{Committee Type, listed here: \url{https://www.fec.gov/campaign-finance-data/committee-type-code-descriptions/}}
#'   \item{cmte_dsgn}{A = Authorized by a candidate
#'
#' B = Lobbyist/Registrant PAC
#'
#' D = Leadership PAC
#'
#' J = Joint fundraiser
#'
#' P = Principal campaign committee of a candidate
#'
#' U = Unauthorized}
#'
#'   \item{cmte_filing_freq}{Filing frequency: A = Administratively terminated,
#'
#'   D = Debt
#'
#'   M = Monthly filer
#'
#'   Q = Quarterly filer
#'
#'   T = Terminated
#'
#'   W = Waived}
#'
#'   \item{ttl_receipts}{Total receipts}
#'   \item{trans_from_aff}{Transfers from affiliates}
#'   \item{indv_contrib}{Contributions from individuals}
#'   \item{other_pol_cmte_contrib}{Contributions from other political committees}
#'   \item{cand_contrib}{Contributions from candidate}
#'   \item{cand_loans}{Candidate loans}
#'   \item{ttl_loans_received}{Total loans received}
#'   \item{ttl_disb}{Total disbursements}
#'   \item{tranf_to_aff}{Transfers to affiliates}
#'   \item{indv_refunds}{Refunds to individuals}
#'   \item{other_pol_cmte_refunds}{Refunds to other political committees}
#'   \item{cand_loan_repay}{Candidate loan repayments}
#'   \item{loan_repay}{Loan repayments}
#'   \item{coh_bop}{Cash beginning of period}
#'   \item{coh_cop}{Cash close of period}
#'   \item{debts_owed_by}{Debts owed by}
#'   \item{nonfed_trans_received}{Nonfederal transfers received}
#'   \item{contrib_to_other_cmte}{Contributions to other committees}
#'   \item{ind_exp}{Independent expenditures}
#'   \item{pty_coord_exp}{Party coordinated expenditures}
#'   \item{nonfed_share_exp}{Nonfederal share expenditures}
#'   \item{cvg_end_dt}{Coverage end date (YYYY-MM-DD)}
#'   }
#' @source <https://www.fec.gov/campaign-finance-data/pac-and-party-summary-file-description/>, updated 2020-03-02
"pac"
