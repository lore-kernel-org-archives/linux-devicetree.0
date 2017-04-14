From: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/8] ARM: dts: imx7s: Adjust anatop-enable-bit for 'reg_1p0d'
Date: Fri, 14 Apr 2017 09:08:50 -0700
Message-ID: <CAHQ1cqGx+ztj0DC6EL7X2nh0-fWPPzWv-mKQYGuKFN5NnoTYcQ@mail.gmail.com>
References: <20170413133242.5068-1-andrew.smirnov@gmail.com>
 <20170413133242.5068-4-andrew.smirnov@gmail.com> <20170414153243.GA1792@b29396-OptiPlex-7040>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170414153243.GA1792@b29396-OptiPlex-7040>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dong Aisheng <dongas86-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andrey Yurovsky <yurovsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 14, 2017 at 8:32 AM, Dong Aisheng <dongas86-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Thu, Apr 13, 2017 at 06:32:37AM -0700, Andrey Smirnov wrote:
>> In PMU_REG_1P0Dn ENABLE_LINREG is bit 0. Bit 31 is called OVERRIDE and
>> it serves the function of granting permission to GPC IP block to alter
>> various bit-fields of the register. The reason why this property, that
>> trickeld here from Freescale BSP, is set to 31 is because in the code
>> it came from it is used in conjunction with a notifier handler for
>> REGULATOR_EVENT_PRE_DO_ENABLE and REGULATOR_EVENT_PRE_DO_DISABLE
>> events (not found in upstream kernel) that triggers GPC to start
>> manipulating aforementioned other bitfields.
>>
>> Since:
>>       a) none of the aforementioned machinery is implemented by
>>          upstream
>>       b) using 'anatop-enable-bit' in that capacity is a bit of a
>>          semantic stretch
>
> Yes, this does is a bit of semantic stretch.
> FSL using is combined with regulator notify and that do bring a bit
> of complexity.
>
> I'm not sure if it's good to introduce another anatop-override-bit
> to separate, but i'm a bit scare since there's already many....
>

All of those Freescale specific events are replaced by GPCv2 power
domain driver that we discussed in another thread. Since regulator
driver for ANADIG sets up all of the voltages manually (or, more
specifically, GPCv2 driver sets them up via regulator API) I didn't
see any reason to use OVERRIDE instead of just ENABLE.

>From reading the RM it seems that main reason for using OVERRIDE as
opposed to ENABLE would be to leverage advanced hardware power
management capabilities of the SoC which I don't think are implemented
in upstream kernel. Do you think there's a use-case for
anatop-override-bit property?

>>
>> simplify the situation by setting the value of 'anatop-enable-bit' to
>> point to ENABLE_LINREG (same as i.MX6).
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
>>  arch/arm/boot/dts/imx7s.dtsi | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
>> index 22c9788..8fee299 100644
>> --- a/arch/arm/boot/dts/imx7s.dtsi
>> +++ b/arch/arm/boot/dts/imx7s.dtsi
>> @@ -516,7 +516,7 @@
>>                                       anatop-min-bit-val = <8>;
>>                                       anatop-min-voltage = <800000>;
>>                                       anatop-max-voltage = <1200000>;
>> -                                     anatop-enable-bit = <31>;
>> +                                     anatop-enable-bit = <0>;
>
> The change of this line seems already exist in patch 1.

I am going to squash all three patches into a single one.

Thanks,
Andrey Smirnov
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
