From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCHv3 3/3] clocksource: Add Freescale FlexTimer Module (FTM)
 timer support
Date: Mon, 19 May 2014 11:08:20 +0200
Message-ID: <5379CA04.2040801@linaro.org>
References: <1398737939-5334-1-git-send-email-Li.Xiubo@freescale.com> <1398737939-5334-4-git-send-email-Li.Xiubo@freescale.com> <537629C3.30507@linaro.org> <0a6cb1e6380f42279a583ebf7e27dd54@BY2PR03MB505.namprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <0a6cb1e6380f42279a583ebf7e27dd54@BY2PR03MB505.namprd03.prod.outlook.com>
Sender: linux-doc-owner@vger.kernel.org
To: "Li.Xiubo@freescale.com" <Li.Xiubo@freescale.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "shawn.guo@linaro.org" <shawn.guo@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Jingchang Lu <jingchang.lu@freescale.com>
List-Id: devicetree@vger.kernel.org

On 05/19/2014 04:26 AM, Li.Xiubo@freescale.com wrote:
>>> +#define FTM_CNTIN	0x4C
>>> +
>>> +static void __iomem *clksrc_base;
>>> +static void __iomem *clkevt_base;
>>> +static unsigned long peroidic_cyc;
>>> +static unsigned long ps;
>>> +bool big_endian;
>>> +
>>
>> Usually this is encaspulated in a structure.
>>
>> struct ftm_clock_device {
>> 	void __iomem *clksrc_base;
>> 	...
>> };
>>
>>
>>> +static inline u32 ftm_readl(void __iomem *addr)
>>> +{
>>> +	if (big_endian)
>>
>> I am not a big fan of addressing global variables in the functions, =
so
>> if you can pass the structure pointer around here and the other
>> functions instead that would be nice.
>>
>> Otherwise the patch sounds ok. Thanks for taking care of encapsulati=
ng
>> well the functions and commenting the code.
>>
>
> Yes, I did think so.
>
> But some callbacks like =EF=BC=9A
> + static u64 ftm_read_sched_clock(void)
> + {
> +         return ftm_readl(clksrc_base + FTM_CNT);
> + }
>
> Used by :
> + sched_clock_register(ftm_read_sched_clock,....);
>
> If they are encapsulated in a structure, and should the struct instan=
ce
> be one global instance too ? I'm doubting whether will this make sens=
e ?

Actually, I plan in a near future to consolidate the code and factor ou=
t=20
some parts with a common structure across the different drivers. So eve=
n=20
if you address the base@ with the global instance but pass around the=20
structure as parameter, that will be ok because that will be less=20
modifications in the future. It is not a strong requirement, just put i=
n=20
place some encapsulation to make the life easier for after.

>>> +static int __init ftm_calc_closest_round_cyc(unsigned long freq)
>>> +{
>>> +	ps =3D 0;
>>> +
>>> +	do {
>>> +		peroidic_cyc =3D DIV_ROUND_CLOSEST(freq, HZ * (1 << ps++));
>>> +	} while (peroidic_cyc > 0xFFFF);
>>> +
>>> +	if (ps > 7) {
>>> +		pr_err("ftm: the max prescaler is %lu > 7\n", ps);
>>> +		return -EINVAL;
>>> +	}
>>> +
>>
>> Can you explain how this error can happen ?
>>
>
> Yes, the hardware limitation of the 'ps' is 0~7, and the counter regi=
ster
> Is only using the lower 16 bits.
> If the 'freq' value is too big here, then the periodic_cyc may exceed=
 0xFFFF.
>
> Or should I add some comment here ?

Yes, a comment will be welcome.

Thanks
   -- Daniel

--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

