From: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 5/8] ARM: dts: imx7s: Mark 'gpr' compatible with i.MX6 variant
Date: Fri, 14 Apr 2017 09:30:20 -0700
Message-ID: <CAHQ1cqFX=_Np_NetO2dYjUQLXCqu75p7fmPyCQ+-TVYHY9aiXA@mail.gmail.com>
References: <20170413133242.5068-1-andrew.smirnov@gmail.com>
 <20170413133242.5068-6-andrew.smirnov@gmail.com> <20170414155639.GC1792@b29396-OptiPlex-7040>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170414155639.GC1792@b29396-OptiPlex-7040>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dong Aisheng <dongas86-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andrey Yurovsky <yurovsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 14, 2017 at 8:56 AM, Dong Aisheng <dongas86-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Thu, Apr 13, 2017 at 06:32:39AM -0700, Andrey Smirnov wrote:
>> List GPR block as compatible "fsl,imx6q-iomuxc-gpr" to support drivers
>> requesting it that way (PCIe driver is one example).
>>
>> Cc: yurovsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
>> Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>> Cc: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
>> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
>> Cc: Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
>> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>> Signed-off-by: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/imx7s.dtsi | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
>> index 1a7058f..cc23478 100644
>> --- a/arch/arm/boot/dts/imx7s.dtsi
>> +++ b/arch/arm/boot/dts/imx7s.dtsi
>> @@ -491,7 +491,8 @@
>>                       };
>>
>>                       gpr: iomuxc-gpr@30340000 {
>> -                             compatible = "fsl,imx7d-iomuxc-gpr", "syscon";
>> +                             compatible = "fsl,imx7d-iomuxc-gpr",
>> +                                     "fsl,imx6q-iomuxc-gpr", "syscon";
>
> This looks wrong to me.
> mx7d-iomux-gpr gets a big difference from mx6q-iomux-gpr and mostly
> not compatible.
>

AFAICT, there are no upstream drivers that bind to that string
directly and all of the "consumers" of this node request it as a
syscon device. The only code I could find that does so and that is
shared between i.MX7 and i.MX6Q is i.MX PCIe driver which
distinguishes between variants based on its own compatibility string.

Those two register files are different, true, but I don't think there
are any users who try to use them as if they were the same/compatible.

Thanks,
Andrey Smirnov
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
