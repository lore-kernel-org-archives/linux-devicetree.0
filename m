From: Code Kipper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun4i: A1000: add axp209 regulator nodes
Date: Tue, 20 Dec 2016 16:56:13 +0100
Message-ID: <CAEKpxB=1dew+R0S2xRL0Xk1aa1wKq0Ukmr+XGyJfWER7QZso6g@mail.gmail.com>
References: <20161220102242.2423-1-codekipper@gmail.com> <20161220141613.czhs54laqpovidej@lukather>
Reply-To: codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCHNXO4F7MHBBHVJ4XBAKGQE2CXSPGY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20161220141613.czhs54laqpovidej@lukather>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 20 December 2016 at 15:16, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> On Tue, Dec 20, 2016 at 11:22:42AM +0100, codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
>> From: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>
>> This patch adds the regulator nodes for the axp209 by including
>> the axp209 dtsi.
>>
>> Signed-off-by: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/sun4i-a10-a1000.dts | 34 ++++++++++++++++++++++++++++++++++
>>  1 file changed, 34 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/sun4i-a10-a1000.dts b/arch/arm/boot/dts/sun4i-a10-a1000.dts
>> index 68c6bdb2cf7c..e7394d701856 100644
>> --- a/arch/arm/boot/dts/sun4i-a10-a1000.dts
>> +++ b/arch/arm/boot/dts/sun4i-a10-a1000.dts
>> @@ -196,6 +196,40 @@
>>       };
>>  };
>>
>> +#include "axp209.dtsi"
>> +
>> +&reg_dcdc2 {
>> +     regulator-always-on;
>> +     regulator-min-microvolt = <1000000>;
>> +     regulator-max-microvolt = <1400000>;
>> +     regulator-name = "vdd-cpu";
>> +};
>> +
>> +&reg_dcdc3 {
>> +     regulator-always-on;
>> +     regulator-min-microvolt = <1000000>;
>> +     regulator-max-microvolt = <1250000>;
>> +     regulator-name = "vdd-int-dll";
>> +};
>> +
>> +&reg_ldo1 {
>> +     regulator-name = "vdd-rtc";
>> +};
>> +
>> +&reg_ldo2 {
>> +     regulator-always-on;
>> +     regulator-min-microvolt = <3000000>;
>> +     regulator-max-microvolt = <3000000>;
>> +     regulator-name = "avcc";
>> +};
>> +
>> +&reg_ldo3 {
>> +     regulator-always-on;
>> +     regulator-min-microvolt = <2800000>;
>> +     regulator-max-microvolt = <2800000>;
>> +     regulator-name = "vcc-wifi";
>
> If this is used only for the wifi, there's no point in keeping it
> enabled.
>
> Also, taking the chance to enable cpufreq by setting the cpu-suplly
> property would be a good idea.
Ack....fortunately my A1000 was out of it's box as I've been looking
at the channel reversal issue. I'll respin now.
CK
>
> Thanks!
> Maxime
>
> --
> Maxime Ripard, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
