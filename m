Return-Path: <SRS0=PEGO=GY=redhat.com=hdegoede@kernel.org>
Subject: Re: [PATCH v2 1/5] usb: typec: tcpm: pdo matching optimization
References: <1521817127-23061-1-git-send-email-jun.li@nxp.com>
 <1521817127-23061-2-git-send-email-jun.li@nxp.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <1091023e-5d6c-39e9-f52c-30d84147ef47@redhat.com>
Date: Tue, 3 Apr 2018 17:17:16 +0200
MIME-Version: 1.0
In-Reply-To: <1521817127-23061-2-git-send-email-jun.li@nxp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Li Jun <jun.li@nxp.com>, gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com, heikki.krogerus@linux.intel.com
Cc: linux@roeck-us.net, rmfrfs@gmail.com, yueyao.zhu@gmail.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

Hi,

On 23-03-18 15:58, Li Jun wrote:
> This patch is a combination of commit 57e6f0d7b804
> ("typec: tcpm: Only request matching pdos") and source
> pdo selection optimization based on it, instead of only
> compare between the same pdo type of sink and source,
> we should check source pdo voltage range is within the
> voltage range of one sink pdo.
> 
> Signed-off-by: Li Jun <jun.li@nxp.com>
> ---
>   drivers/usb/typec/tcpm.c | 127 +++++++++++++++++++++++++++++++++--------------
>   1 file changed, 90 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm.c b/drivers/usb/typec/tcpm.c
> index 677d121..50a1979 100644
> --- a/drivers/usb/typec/tcpm.c
> +++ b/drivers/usb/typec/tcpm.c
> @@ -254,6 +254,9 @@ struct tcpm_port {
>   	unsigned int nr_src_pdo;
>   	u32 snk_pdo[PDO_MAX_OBJECTS];
>   	unsigned int nr_snk_pdo;
> +	unsigned int nr_fixed; /* number of fixed sink PDOs */
> +	unsigned int nr_var; /* number of variable sink PDOs */
> +	unsigned int nr_batt; /* number of battery sink PDOs */
>   	u32 snk_vdo[VDO_MAX_OBJECTS];
>   	unsigned int nr_snk_vdo;
>  

These 3 variables are now no longer needed.

> @@ -1772,40 +1775,65 @@ static int tcpm_pd_check_request(struct tcpm_port *port)
>   	return 0;
>   }
>   
> -static int tcpm_pd_select_pdo(struct tcpm_port *port)
> +#define min_power(x, y) min(pdo_max_power(x), pdo_max_power(y))
> +#define min_current(x, y) min(pdo_max_current(x), pdo_max_current(y))
> +
> +static int tcpm_pd_select_pdo(struct tcpm_port *port, int *sink_pdo,
> +			      int *src_pdo)
>   {
> -	unsigned int i, max_mw = 0, max_mv = 0;
> +	unsigned int i, j, max_src_mv = 0, min_src_mv = 0, max_mw = 0,
> +		     max_mv = 0, src_mw = 0, src_ma = 0, max_snk_mv = 0,
> +		     min_snk_mv = 0;
>   	int ret = -EINVAL;
>   
>   	/*
> -	 * Select the source PDO providing the most power while staying within
> -	 * the board's voltage limits. Prefer PDO providing exp
> +	 * Select the source PDO providing the most power which has a
> +	 * matchig sink cap.
>   	 */
>   	for (i = 0; i < port->nr_source_caps; i++) {
>   		u32 pdo = port->source_caps[i];
>   		enum pd_pdo_type type = pdo_type(pdo);
> -		unsigned int mv, ma, mw;
>   
> -		if (type == PDO_TYPE_FIXED)
> -			mv = pdo_fixed_voltage(pdo);
> -		else
> -			mv = pdo_min_voltage(pdo);
> +		if (type == PDO_TYPE_FIXED) {
> +			max_src_mv = pdo_fixed_voltage(pdo);
> +			min_src_mv = max_src_mv;
> +		} else {
> +			max_src_mv = pdo_max_voltage(pdo);
> +			min_src_mv = pdo_min_voltage(pdo);
> +		}
>   
>   		if (type == PDO_TYPE_BATT) {
> -			mw = pdo_max_power(pdo);
> +			src_mw = pdo_max_power(pdo);
>   		} else {
> -			ma = min(pdo_max_current(pdo),
> -				 port->max_snk_ma);
> -			mw = ma * mv / 1000;
> +			src_ma = pdo_max_current(pdo);
> +			src_mw = src_ma * min_src_mv / 1000;
>   		}
>   
> -		/* Perfer higher voltages if available */
> -		if ((mw > max_mw || (mw == max_mw && mv > max_mv)) &&
> -		    mv <= port->max_snk_mv) {
> -			ret = i;
> -			max_mw = mw;
> -			max_mv = mv;
> +		for (j = 0; j < port->nr_snk_pdo; j++) {
> +			pdo = port->snk_pdo[j];
> +
> +			if (pdo_type(pdo) == PDO_TYPE_FIXED) {
> +				min_snk_mv = pdo_fixed_voltage(pdo);
> +				max_snk_mv = pdo_fixed_voltage(pdo);
> +			} else {
> +				min_snk_mv = pdo_min_voltage(pdo);
> +				max_snk_mv = pdo_max_voltage(pdo);
> +			}
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
> +				}
> +				break;
> +			}
>   		}
> +
>   	}
>   
>   	return ret;
> @@ -1816,13 +1844,14 @@ static int tcpm_pd_build_request(struct tcpm_port *port, u32 *rdo)
>   	unsigned int mv, ma, mw, flags;
>   	unsigned int max_ma, max_mw;
>   	enum pd_pdo_type type;
> -	int index;
> -	u32 pdo;
> +	int src_pdo_index, snk_pdo_index;
> +	u32 pdo, matching_snk_pdo;
>   
> -	index = tcpm_pd_select_pdo(port);
> -	if (index < 0)
> +	if (tcpm_pd_select_pdo(port, &snk_pdo_index, &src_pdo_index) < 0)
>   		return -EINVAL;
> -	pdo = port->source_caps[index];
> +
> +	pdo = port->source_caps[src_pdo_index];
> +	matching_snk_pdo = port->snk_pdo[snk_pdo_index];
>   	type = pdo_type(pdo);
>   
>   	if (type == PDO_TYPE_FIXED)
> @@ -1830,26 +1859,28 @@ static int tcpm_pd_build_request(struct tcpm_port *port, u32 *rdo)
>   	else
>   		mv = pdo_min_voltage(pdo);
>   
> -	/* Select maximum available current within the board's power limit */
> +	/* Select maximum available current within the sink pdo's limit */
>   	if (type == PDO_TYPE_BATT) {
> -		mw = pdo_max_power(pdo);
> -		ma = 1000 * min(mw, port->max_snk_mw) / mv;
> +		mw = min_power(pdo, matching_snk_pdo);
> +		ma = 1000 * mw / mv;
>   	} else {
> -		ma = min(pdo_max_current(pdo),
> -			 1000 * port->max_snk_mw / mv);
> +		ma = min_current(pdo, matching_snk_pdo);
> +		mw = ma * mv / 1000;
>   	}
> -	ma = min(ma, port->max_snk_ma);
>   
>   	flags = RDO_USB_COMM | RDO_NO_SUSPEND;
>   
>   	/* Set mismatch bit if offered power is less than operating power */
> -	mw = ma * mv / 1000;
>   	max_ma = ma;
>   	max_mw = mw;
>   	if (mw < port->operating_snk_mw) {
>   		flags |= RDO_CAP_MISMATCH;
> -		max_mw = port->operating_snk_mw;
> -		max_ma = max_mw * 1000 / mv;
> +		if (type == PDO_TYPE_BATT &&
> +		    (pdo_max_power(matching_snk_pdo) > pdo_max_power(pdo)))
> +			max_mw = pdo_max_power(matching_snk_pdo);
> +		else if (pdo_max_current(matching_snk_pdo) >
> +			 pdo_max_current(pdo))
> +			max_ma = pdo_max_current(matching_snk_pdo);
>   	}
>   
>   	tcpm_log(port, "cc=%d cc1=%d cc2=%d vbus=%d vconn=%s polarity=%d",
> @@ -1858,16 +1889,16 @@ static int tcpm_pd_build_request(struct tcpm_port *port, u32 *rdo)
>   		 port->polarity);
>   
>   	if (type == PDO_TYPE_BATT) {
> -		*rdo = RDO_BATT(index + 1, mw, max_mw, flags);
> +		*rdo = RDO_BATT(src_pdo_index + 1, mw, max_mw, flags);
>   
>   		tcpm_log(port, "Requesting PDO %d: %u mV, %u mW%s",
> -			 index, mv, mw,
> +			 src_pdo_index, mv, mw,
>   			 flags & RDO_CAP_MISMATCH ? " [mismatch]" : "");
>   	} else {
> -		*rdo = RDO_FIXED(index + 1, ma, max_ma, flags);
> +		*rdo = RDO_FIXED(src_pdo_index + 1, ma, max_ma, flags);
>   
>   		tcpm_log(port, "Requesting PDO %d: %u mV, %u mA%s",
> -			 index, mv, ma,
> +			 src_pdo_index, mv, ma,
>   			 flags & RDO_CAP_MISMATCH ? " [mismatch]" : "");
>   	}
>   
> @@ -3599,6 +3630,19 @@ int tcpm_update_sink_capabilities(struct tcpm_port *port, const u32 *pdo,
>   }
>   EXPORT_SYMBOL_GPL(tcpm_update_sink_capabilities);
>   
> +static int nr_type_pdos(const u32 *pdo, unsigned int nr_pdo,
> +			enum pd_pdo_type type)
> +{
> +	int count = 0;
> +	int i;
> +
> +	for (i = 0; i < nr_pdo; i++) {
> +		if (pdo_type(pdo[i]) == type)
> +			count++;
> +	}
> +	return count;
> +}
> +
>   struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev *tcpc)
>   {
>   	struct tcpm_port *port;
> @@ -3644,6 +3688,15 @@ struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev *tcpc)
>   					  tcpc->config->nr_src_pdo);
>   	port->nr_snk_pdo = tcpm_copy_pdos(port->snk_pdo, tcpc->config->snk_pdo,
>   					  tcpc->config->nr_snk_pdo);
> +	port->nr_fixed =  nr_type_pdos(port->snk_pdo,
> +				       port->nr_snk_pdo,
> +				       PDO_TYPE_FIXED);
> +	port->nr_var = nr_type_pdos(port->snk_pdo,
> +				    port->nr_snk_pdo,
> +				    PDO_TYPE_VAR);
> +	port->nr_batt = nr_type_pdos(port->snk_pdo,
> +				     port->nr_snk_pdo,
> +				     PDO_TYPE_BATT);
>   	port->nr_snk_vdo = tcpm_copy_vdos(port->snk_vdo, tcpc->config->snk_vdo,
>   					  tcpc->config->nr_snk_vdo);
>   
> 

And the code setting them thus also is no longer needed.

Otherwise this looks good to me now.

Regards,

Hans
