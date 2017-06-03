From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 19/19] ARM: sun6i: a31s: Enable HDMI display output on the
 MSI Primo81 tablet
Date: Sat, 3 Jun 2017 23:31:11 +0800
Message-ID: <CAGb2v66k-LjPnHPLV17JW-zL9m+zBeOoVZN_kwHnU19KS+gfHg@mail.gmail.com>
References: <20170602101024.18940-1-wens@csie.org> <20170602101024.18940-20-wens@csie.org>
 <20170602194219.hiajr7dt2oikm52q@flea.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170602194219.hiajr7dt2oikm52q-ZC1Zs529Oq4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Jun 3, 2017 at 3:42 AM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> On Fri, Jun 02, 2017 at 06:10:24PM +0800, Chen-Yu Tsai wrote:
>> The MSI Primo81 tablet has a micro HDMI connector at the bottom.
>> This is connected to the SoCs HDMI output.
>>
>> Enable the display pipeline and the HDMI output.
>>
>> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/sun6i-a31s-primo81.dts | 25 +++++++++++++++++++++++++
>>  1 file changed, 25 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/sun6i-a31s-primo81.dts b/arch/arm/boot/dts/sun6i-a31s-primo81.dts
>> index f3712753fa42..26154b2f87a3 100644
>> --- a/arch/arm/boot/dts/sun6i-a31s-primo81.dts
>> +++ b/arch/arm/boot/dts/sun6i-a31s-primo81.dts
>> @@ -52,17 +52,42 @@
>>  / {
>>       model = "MSI Primo81 tablet";
>>       compatible = "msi,primo81", "allwinner,sun6i-a31s";
>> +
>> +     hdmi-connector {
>> +             compatible = "hdmi-connector";
>> +             type = "c";
>
> Should we add a connector type for this one?

To be honest I don't know. DRM has HDMI-B to differentiate dual-link
connections, but that is only used by Intel and AMD GPU drivers.
AMD driver has "/* HDMI-B is basically DL-DVI; analog works fine */",
which makes sense since actual HDMI B-type connectors only exist on
paper. None of the other drivers seem to care.

ChenYu
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
