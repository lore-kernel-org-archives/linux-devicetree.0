From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: Re: [PATCH 1/7] ARM: imx: add timer stop flag to ARM power off state
Date: Tue, 09 Jan 2018 14:37:50 +0100
Message-ID: <bacee8fe00b0ab54dfa6692bfc956ffd@agner.ch>
References: <20180102164223.15230-1-stefan@agner.ch>
 <20180109092232.GA26312@b29396-OptiPlex-7040>
 <AM3PR04MB13155287E5AAAF5407AF68A6F5100@AM3PR04MB1315.eurprd04.prod.outlook.com>
 <1515492803.12538.29.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1515492803.12538.29.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Anson Huang <anson.huang-3arQi8VN3Tc@public.gmane.org>, Dong Aisheng <dongas86-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, dl-linux-imx <linux-imx-3arQi8VN3Tc@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2018-01-09 11:13, Lucas Stach wrote:
> Am Dienstag, den 09.01.2018, 09:25 +0000 schrieb Anson Huang:
>>
>> Best Regards!
>> Anson Huang
>>
>>
>> > -----Original Message-----
>> > From: Dong Aisheng [mailto:dongas86-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org]
>> > Sent: 2018-01-09 5:23 PM
>> > To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
>> > Cc: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org; kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org; Fabio Estevam
>> > <fabio.estevam-3arQi8VN3Tc@public.gmane.org>; robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org; mark.rutland-5wv7dgnIgG8@public.gmane.org;
>> > linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org;
>> > linux-
>> > kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Anson Huang <anson.huang-3arQi8VN3Tc@public.gmane.org>; dl-
>> > linux-imx
>> > <linux-imx-3arQi8VN3Tc@public.gmane.org>
>> > Subject: Re: [PATCH 1/7] ARM: imx: add timer stop flag to ARM power
>> > off state
>> >
>> > On Tue, Jan 02, 2018 at 05:42:17PM +0100, Stefan Agner wrote:
>> > > When the CPU is in ARM power off state the ARM architected timers
>> > > are
>> > > stopped. The flag is already present in the higher power WAIT
>> > > mode.
>> > >
>> > > This allows to use the ARM generic timer on i.MX 6UL/6ULL SoC.
>> > > Without the flag the kernel freezes when the timer enters the
>> > > first
>> > > time ARM power off mode.
>> > >
>> > > Cc: Anson Huang <anson.huang-3arQi8VN3Tc@public.gmane.org>
>> > > Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
>> >
>> > It seems ok at my side.
>> > Did you meet the real issue? If yes, how to reproduce?
>> >
>> > Both mx6sx and mx6ul are using GPT which do not need that flag,
>> > suppose we
>> > should remove it, right?
>> > Anson can help confirm it.
>>
>> For UP system like i.MX6SX, we do NOT enable "cortex-a9-twd-timer",
>> so local
>> timer is NOT used, GPT is used instead, GPT's clock is NOT disabled
>> when cpuidle,
>> so I think we should remove all these Timer stop flag for 6SX
>> CPUIDLE.
> 
> It's correct to set the flag even on UP systems, as the flag means the
> CPU _local_ timer is stopped in this sleep mode. Also there are systems
> out there which are using the TWD on UP, as it operates at a higher
> frequency leading to better wakeup granularity.

Documentation/devicetree/bindings/arm/twd.txt states that TWD provides
"per-cpu local timer". But as far as I can see TWD still uses SPI
interrupts, routed through GIC, so is this the differentiation?

--
Stefan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
