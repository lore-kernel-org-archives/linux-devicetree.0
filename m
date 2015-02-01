From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v3 07/10] ARM: dts: sunxi: Add usb3_vbus
 regulator to common regulators dtsi
Date: Sun, 1 Feb 2015 15:28:20 +0100
Message-ID: <CAGb2v64SaEQiJ1LYUGWj+cv_UG-oEn_gtUuoGGndGuX_pJbZWQ@mail.gmail.com>
References: <1422388455-25923-1-git-send-email-wens@csie.org>
 <1422388455-25923-8-git-send-email-wens@csie.org> <20150201142007.GH4827@lukather>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBGPQXCTAKGQE5KP5CUI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20150201142007.GH4827@lukather>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Feb 1, 2015 at 3:20 PM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> On Wed, Jan 28, 2015 at 03:54:12AM +0800, Chen-Yu Tsai wrote:
>> Some SoCs have a total of 4 possible USB controllers. One such example
>> is the A80, which has one USB3 dual role device and 3 EHCI/OHCI pairs.
>>
>> Add a common VBUS regulator for the last host controller.
>>
>> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/sunxi-common-regulators.dtsi | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/sunxi-common-regulators.dtsi b/arch/arm/boot/dts/sunxi-common-regulators.dtsi
>> index e02baa66b33c..97fe8d73c4f7 100644
>> --- a/arch/arm/boot/dts/sunxi-common-regulators.dtsi
>> +++ b/arch/arm/boot/dts/sunxi-common-regulators.dtsi
>> @@ -130,6 +130,16 @@
>>               status = "disabled";
>>       };
>>
>> +     reg_usb3_vbus: usb3-vbus {
>> +             compatible = "regulator-fixed";
>> +             pinctrl-names = "default";
>> +             regulator-name = "usb3-vbus";
>> +             regulator-min-microvolt = <5000000>;
>> +             regulator-max-microvolt = <5000000>;
>> +             enable-active-high;
>> +             status = "disabled";
>> +     };
>> +
>
> I don't think you replied to this one. What other SoC is using the
> USB3 regulator? Is it worth it to put it in there and bloat all the
> other DTS for something that is only used on a single board so far?

Yes I missed this one. The only other one is A31, which has OHCI2,
but no board routes it to a USB connector with a VBUS regulator.

So yeah, I'll move it to the board DTS.

ChenYu
