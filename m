From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH v2 5/6] soc/fsl/qe: qe.c: support fsl,qe-snums property
Date: Thu, 2 May 2019 06:52:45 +0200
Message-ID: <53c8e642-5efa-c476-92b7-a70d5598b217@c-s.fr>
References: <20190430133615.25721-1-rasmus.villemoes@prevas.dk>
 <20190501092841.9026-1-rasmus.villemoes@prevas.dk>
 <20190501092841.9026-6-rasmus.villemoes@prevas.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190501092841.9026-6-rasmus.villemoes@prevas.dk>
Content-Language: fr
Sender: linux-kernel-owner@vger.kernel.org
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Scott Wood <oss@buserror.net>, Mark Rutland <mark.rutland@arm.com>, Rasmus Villemoes <Rasmus.Villemoes@prevas.se>
List-Id: devicetree@vger.kernel.org



Le 01/05/2019 à 11:29, Rasmus Villemoes a écrit :
> Add driver support for the newly introduced fsl,qe-snums property.
> 
> Conveniently, of_property_read_variable_u8_array does exactly what we
> need: If the property fsl,qe-snums is found (and has an allowed size),
> the array of values get copied to snums, and the return value is the
> number of snums - we cannot assign directly to num_of_snums, since we
> need to check whether the return value is negative.
> 
> Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>

Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>

> ---
>   drivers/soc/fsl/qe/qe.c | 16 ++++++++++++++--
>   1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/fsl/qe/qe.c b/drivers/soc/fsl/qe/qe.c
> index 0fb8b59f61ad..325d689cbf5c 100644
> --- a/drivers/soc/fsl/qe/qe.c
> +++ b/drivers/soc/fsl/qe/qe.c
> @@ -283,7 +283,6 @@ EXPORT_SYMBOL(qe_clock_source);
>    */
>   static void qe_snums_init(void)
>   {
> -	int i;
>   	static const u8 snum_init_76[] = {
>   		0x04, 0x05, 0x0C, 0x0D, 0x14, 0x15, 0x1C, 0x1D,
>   		0x24, 0x25, 0x2C, 0x2D, 0x34, 0x35, 0x88, 0x89,
> @@ -304,7 +303,21 @@ static void qe_snums_init(void)
>   		0x28, 0x29, 0x38, 0x39, 0x48, 0x49, 0x58, 0x59,
>   		0x68, 0x69, 0x78, 0x79, 0x80, 0x81,
>   	};
> +	struct device_node *qe;
>   	const u8 *snum_init;
> +	int i;
> +
> +	bitmap_zero(snum_state, QE_NUM_OF_SNUM);
> +	qe = qe_get_device_node();
> +	if (qe) {
> +		i = of_property_read_variable_u8_array(qe, "fsl,qe-snums",
> +						       snums, 1, QE_NUM_OF_SNUM);
> +		of_node_put(qe);
> +		if (i > 0) {
> +			qe_num_of_snum = i;
> +			return;
> +		}
> +	}
>   
>   	qe_num_of_snum = qe_get_num_of_snums();
>   
> @@ -313,7 +326,6 @@ static void qe_snums_init(void)
>   	else
>   		snum_init = snum_init_46;
>   
> -	bitmap_zero(snum_state, QE_NUM_OF_SNUM);
>   	memcpy(snums, snum_init, qe_num_of_snum);
>   }
>   
> 
