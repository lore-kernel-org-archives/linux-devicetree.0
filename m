Return-Path: <SRS0=WXNT=GK=redhat.com=hdegoede@kernel.org>
Subject: Re: [PATCH 1/5] usb: typec: tcpm: source pdo selection update
References: <1521541570-25363-1-git-send-email-jun.li@nxp.com>
 <1521541570-25363-2-git-send-email-jun.li@nxp.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <adaf1af5-d8f4-6b8c-7258-3cb75bedc9ad@redhat.com>
Date: Tue, 20 Mar 2018 13:26:31 +0100
MIME-Version: 1.0
In-Reply-To: <1521541570-25363-2-git-send-email-jun.li@nxp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Li Jun <jun.li@nxp.com>, gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com, heikki.krogerus@linux.intel.com, linux@roeck-us.net, rmfrfs@gmail.com, yueyao.zhu@gmail.com
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

Hi,

On 20-03-18 11:26, Li Jun wrote:
> Instead of only compare between the same pdo type of sink and source,
> this patch update the source pdo selection by checking the source pdo
> voltage range is within that of sink.
> 
> Signed-off-by: Li Jun <jun.li@nxp.com>

This patch applies on top of the broken reverted commit, but the
revert has already been merged by Linus:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/usb/typec?id=6f566af3462897fc743e3af6ea8cc790a13148ba

This commit is not in usb-next because it went into 4.16 as fix
after 4.16-rc1. As already mentioned in another rhread this needs
to be back-merged into usb-next.

So this needs to be respun to apply on top of the revert so that
it can be merged without issues with Torvald's tree later.

Regards,

Hans



> ---
>   drivers/usb/typec/tcpm.c | 101 +++++++++++++++++------------------------------
>   1 file changed, 37 insertions(+), 64 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm.c b/drivers/usb/typec/tcpm.c
> index cd48a99..20f7ca8 100644
> --- a/drivers/usb/typec/tcpm.c
> +++ b/drivers/usb/typec/tcpm.c
> @@ -1765,7 +1765,9 @@ static int tcpm_pd_check_request(struct tcpm_port *port)
>   static int tcpm_pd_select_pdo(struct tcpm_port *port, int *sink_pdo,
>   			      int *src_pdo)
>   {
> -	unsigned int i, j, max_mw = 0, max_mv = 0, mw = 0, mv = 0, ma = 0;
> +	unsigned int i, j, max_src_mv = 0, min_src_mv = 0, max_mw = 0,
> +		     max_mv = 0, src_mw = 0, src_ma = 0, max_snk_mv = 0,
> +		     min_snk_mv = 0;
>   	int ret = -EINVAL;
>   
>   	/*
> @@ -1777,70 +1779,41 @@ static int tcpm_pd_select_pdo(struct tcpm_port *port, int *sink_pdo,
>   		enum pd_pdo_type type = pdo_type(pdo);
>   
>   		if (type == PDO_TYPE_FIXED) {
> -			for (j = 0; j < port->nr_fixed; j++) {
> -				if (pdo_fixed_voltage(pdo) ==
> -				    pdo_fixed_voltage(port->snk_pdo[j])) {
> -					ma = min_current(pdo, port->snk_pdo[j]);
> -					mv = pdo_fixed_voltage(pdo);
> -					mw = ma * mv / 1000;
> -					if (mw > max_mw ||
> -					    (mw == max_mw && mv > max_mv)) {
> -						ret = 0;
> -						*src_pdo = i;
> -						*sink_pdo = j;
> -						max_mw = mw;
> -						max_mv = mv;
> -					}
> -					/* There could only be one fixed pdo
> -					 * at a specific voltage level.
> -					 * So breaking here.
> -					 */
> -					break;
> -				}
> -			}
> -		} else if (type == PDO_TYPE_BATT) {
> -			for (j = port->nr_fixed;
> -			     j < port->nr_fixed +
> -				 port->nr_batt;
> -			     j++) {
> -				if (pdo_min_voltage(pdo) >=
> -				     pdo_min_voltage(port->snk_pdo[j]) &&
> -				     pdo_max_voltage(pdo) <=
> -				     pdo_max_voltage(port->snk_pdo[j])) {
> -					mw = min_power(pdo, port->snk_pdo[j]);
> -					mv = pdo_min_voltage(pdo);
> -					if (mw > max_mw ||
> -					    (mw == max_mw && mv > max_mv)) {
> -						ret = 0;
> -						*src_pdo = i;
> -						*sink_pdo = j;
> -						max_mw = mw;
> -						max_mv = mv;
> -					}
> -				}
> +			max_src_mv = pdo_fixed_voltage(pdo);
> +			min_src_mv = max_src_mv;
> +		} else {
> +			max_src_mv = pdo_max_voltage(pdo);
> +			min_src_mv = pdo_min_voltage(pdo);
> +		}
> +
> +		if (type == PDO_TYPE_BATT) {
> +			src_mw = pdo_max_power(pdo);
> +		} else {
> +			src_ma = pdo_max_current(pdo);
> +			src_mw = src_ma * min_src_mv / 1000;
> +		}
> +
> +		for (j = 0; j < port->nr_snk_pdo; j++) {
> +			pdo = port->snk_pdo[j];
> +
> +			if (pdo_type(pdo) == PDO_TYPE_FIXED) {
> +				min_snk_mv = pdo_fixed_voltage(pdo);
> +				max_snk_mv = pdo_fixed_voltage(pdo);
> +			} else {
> +				min_snk_mv = pdo_min_voltage(pdo);
> +				max_snk_mv = pdo_max_voltage(pdo);
>   			}
> -		} else if (type == PDO_TYPE_VAR) {
> -			for (j = port->nr_fixed +
> -				 port->nr_batt;
> -			     j < port->nr_fixed +
> -				 port->nr_batt +
> -				 port->nr_var;
> -			     j++) {
> -				if (pdo_min_voltage(pdo) >=
> -				     pdo_min_voltage(port->snk_pdo[j]) &&
> -				     pdo_max_voltage(pdo) <=
> -				     pdo_max_voltage(port->snk_pdo[j])) {
> -					ma = min_current(pdo, port->snk_pdo[j]);
> -					mv = pdo_min_voltage(pdo);
> -					mw = ma * mv / 1000;
> -					if (mw > max_mw ||
> -					    (mw == max_mw && mv > max_mv)) {
> -						ret = 0;
> -						*src_pdo = i;
> -						*sink_pdo = j;
> -						max_mw = mw;
> -						max_mv = mv;
> -					}
> +
> +			if (max_src_mv <= max_snk_mv &&
> +				min_src_mv >= min_snk_mv) {
> +				/* Prefer higher voltages if available */
> +				if ((src_mw == max_mw && min_src_mv > max_mv) ||
> +							src_mw > max_mw) {
> +					*src_pdo = i;
> +					*sink_pdo = j;
> +					max_mw = src_mw;
> +					max_mv = min_src_mv;
> +					ret = 0;
>   				}
>   			}
>   		}
> 
