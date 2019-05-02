From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH v2 6/6] soc/fsl/qe: qe.c: fold qe_get_num_of_snums into
 qe_snums_init
Date: Thu, 2 May 2019 06:54:07 +0200
Message-ID: <5457d33f-b691-6406-138d-0fc633c1d24c@c-s.fr>
References: <20190430133615.25721-1-rasmus.villemoes@prevas.dk>
 <20190501092841.9026-1-rasmus.villemoes@prevas.dk>
 <20190501092841.9026-7-rasmus.villemoes@prevas.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190501092841.9026-7-rasmus.villemoes@prevas.dk>
Content-Language: fr
Sender: linux-kernel-owner@vger.kernel.org
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Scott Wood <oss@buserror.net>, Mark Rutland <mark.rutland@arm.com>, Rasmus Villemoes <Rasmus.Villemoes@prevas.se>
List-Id: devicetree@vger.kernel.org



Le 01/05/2019 à 11:29, Rasmus Villemoes a écrit :
> The comment "No QE ever has fewer than 28 SNUMs" is false; e.g. the
> MPC8309 has 14. The code path returning -EINVAL is also a recipe for
> instant disaster, since the caller (qe_snums_init) uncritically
> assigns the return value to the unsigned qe_num_of_snum, and would
> thus proceed to attempt to copy 4GB from snum_init_46[] to the snum[]
> array.
> 
> So fold the handling of the legacy fsl,qe-num-snums into
> qe_snums_init, and make sure we do not end up using the snum_init_46
> array in cases other than the two where we know it makes sense.
> 
> Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>

Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>

> ---
>   drivers/soc/fsl/qe/qe.c | 46 ++++++++++++++---------------------------
>   1 file changed, 16 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/soc/fsl/qe/qe.c b/drivers/soc/fsl/qe/qe.c
> index 325d689cbf5c..276d7d78ebfc 100644
> --- a/drivers/soc/fsl/qe/qe.c
> +++ b/drivers/soc/fsl/qe/qe.c
> @@ -308,24 +308,33 @@ static void qe_snums_init(void)
>   	int i;
>   
>   	bitmap_zero(snum_state, QE_NUM_OF_SNUM);
> +	qe_num_of_snum = 28; /* The default number of snum for threads is 28 */
>   	qe = qe_get_device_node();
>   	if (qe) {
>   		i = of_property_read_variable_u8_array(qe, "fsl,qe-snums",
>   						       snums, 1, QE_NUM_OF_SNUM);
> -		of_node_put(qe);
>   		if (i > 0) {
> +			of_node_put(qe);
>   			qe_num_of_snum = i;
>   			return;
>   		}
> +		/*
> +		 * Fall back to legacy binding of using the value of
> +		 * fsl,qe-num-snums to choose one of the static arrays
> +		 * above.
> +		 */
> +		of_property_read_u32(qe, "fsl,qe-num-snums", &qe_num_of_snum);
> +		of_node_put(qe);
>   	}
>   
> -	qe_num_of_snum = qe_get_num_of_snums();
> -
> -	if (qe_num_of_snum == 76)
> +	if (qe_num_of_snum == 76) {
>   		snum_init = snum_init_76;
> -	else
> +	} else if (qe_num_of_snum == 28 || qe_num_of_snum == 46) {
>   		snum_init = snum_init_46;
> -
> +	} else {
> +		pr_err("QE: unsupported value of fsl,qe-num-snums: %u\n", qe_num_of_snum);
> +		return;
> +	}
>   	memcpy(snums, snum_init, qe_num_of_snum);
>   }
>   
> @@ -641,30 +650,7 @@ EXPORT_SYMBOL(qe_get_num_of_risc);
>   
>   unsigned int qe_get_num_of_snums(void)
>   {
> -	struct device_node *qe;
> -	int size;
> -	unsigned int num_of_snums;
> -	const u32 *prop;
> -
> -	num_of_snums = 28; /* The default number of snum for threads is 28 */
> -	qe = qe_get_device_node();
> -	if (!qe)
> -		return num_of_snums;
> -
> -	prop = of_get_property(qe, "fsl,qe-num-snums", &size);
> -	if (prop && size == sizeof(*prop)) {
> -		num_of_snums = *prop;
> -		if ((num_of_snums < 28) || (num_of_snums > QE_NUM_OF_SNUM)) {
> -			/* No QE ever has fewer than 28 SNUMs */
> -			pr_err("QE: number of snum is invalid\n");
> -			of_node_put(qe);
> -			return -EINVAL;
> -		}
> -	}
> -
> -	of_node_put(qe);
> -
> -	return num_of_snums;
> +	return qe_num_of_snum;
>   }
>   EXPORT_SYMBOL(qe_get_num_of_snums);
>   
> 
