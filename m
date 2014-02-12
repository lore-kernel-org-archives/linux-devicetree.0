From: "Anson.Huang-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <Anson.Huang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: [PATCH 2/2] ARM: imx: add speed grading check for i.mx6 soc
Date: Wed, 12 Feb 2014 09:44:49 +0000
Message-ID: <1660e5d9d8eb44cfbc29d504604db12d@BY2PR03MB315.namprd03.prod.outlook.com>
References: <1392191777-15703-1-git-send-email-b20788@freescale.com>
 <1392191777-15703-2-git-send-email-b20788@freescale.com>
 <20140212093926.GB24834@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140212093926.GB24834-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Right, will improve it in V2, thanks.

Best Regards.
Anson Huang
=A0
=46reescale Semiconductor Shanghai
Tel:021-28937058

>-----Original Message-----
>From: Shawn Guo [mailto:shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org]
>Sent: Wednesday, February 12, 2014 5:39 PM
>To: Huang Yongcai-B20788
>Cc: kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-arm-
>kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>Subject: Re: [PATCH 2/2] ARM: imx: add speed grading check for i.mx6 s=
oc
>
>On Wed, Feb 12, 2014 at 03:56:17PM +0800, Anson Huang wrote:
>> The fuse map of speed_grading[1:0] defines the max speed of ARM, see
>> below the definition:
>>
>> 2b'11: 1200000000Hz;
>> 2b'10: 996000000Hz;
>> 2b'01: 852000000Hz; -- i.MX6Q Only, exclusive with 996MHz.
>> 2b'00: 792000000Hz;
>>
>> Need to remove all illegal setpoints according to fuse map.
>>
>> Signed-off-by: Anson Huang <b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>> ---
>>  arch/arm/mach-imx/mach-imx6q.c |   22 ++++++++++++++++++++--
>>  1 file changed, 20 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm/mach-imx/mach-imx6q.c
>> b/arch/arm/mach-imx/mach-imx6q.c index f9cbbf9..ad9da1f 100644
>> --- a/arch/arm/mach-imx/mach-imx6q.c
>> +++ b/arch/arm/mach-imx/mach-imx6q.c
>> @@ -219,8 +219,10 @@ static void __init imx6q_init_machine(void)
>>  #define OCOTP_CFG3			0x440
>>  #define OCOTP_CFG3_SPEED_SHIFT		16
>>  #define OCOTP_CFG3_SPEED_1P2GHZ		0x3
>> +#define OCOTP_CFG3_SPEED_996MHZ		0x2
>> +#define OCOTP_CFG3_SPEED_852MHZ		0x1
>>
>> -static void __init imx6q_opp_check_1p2ghz(struct device *cpu_dev)
>> +static void __init imx6q_opp_check_speed_grading(struct device
>> +*cpu_dev)
>>  {
>>  	struct device_node *np;
>>  	void __iomem *base;
>> @@ -238,11 +240,27 @@ static void __init imx6q_opp_check_1p2ghz(stru=
ct
>device *cpu_dev)
>>  		goto put_node;
>>  	}
>>
>> +	/*
>> +	 * SPEED_GRADING[1:0] defines the max speed of ARM:
>> +	 * 2b'11: 1200000000Hz;
>> +	 * 2b'10: 996000000Hz;
>> +	 * 2b'01: 852000000Hz; -- i.MX6Q Only, exclusive with 996MHz.
>> +	 * 2b'00: 792000000Hz;
>> +	 * We need to set the max speed of ARM according to fuse map.
>> +	 */
>>  	val =3D readl_relaxed(base + OCOTP_CFG3);
>>  	val >>=3D OCOTP_CFG3_SPEED_SHIFT;
>
>	val &=3D 0x3;
>
>Then you do not need to do it in every if-clause below.
>
>>  	if ((val & 0x3) !=3D OCOTP_CFG3_SPEED_1P2GHZ)
>>  		if (dev_pm_opp_disable(cpu_dev, 1200000000))
>>  			pr_warn("failed to disable 1.2 GHz OPP\n");
>> +	if ((val & 0x3) < OCOTP_CFG3_SPEED_996MHZ)
>> +		if (dev_pm_opp_disable(cpu_dev, 996000000))
>> +			pr_warn("failed to disable 996 MHz OPP\n");
>> +	if (cpu_is_imx6q()) {
>> +		if ((val & 0x3) !=3D OCOTP_CFG3_SPEED_852MHZ)
>
>	if (cpu_is_imx6q() && val !=3D OCOTP_CFG3_SPEED_852MHZ)
>
>Shawn
>
>> +			if (dev_pm_opp_disable(cpu_dev, 852000000))
>> +				pr_warn("failed to disable 852 MHz OPP\n");
>> +	}
>>
>>  put_node:
>>  	of_node_put(np);
>> @@ -268,7 +286,7 @@ static void __init imx6q_opp_init(void)
>>  		goto put_node;
>>  	}
>>
>> -	imx6q_opp_check_1p2ghz(cpu_dev);
>> +	imx6q_opp_check_speed_grading(cpu_dev);
>>
>>  put_node:
>>  	of_node_put(np);
>> --
>> 1.7.9.5
>>
>>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
