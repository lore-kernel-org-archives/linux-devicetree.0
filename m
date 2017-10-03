From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v3 12/12] ARM: dtsi: axp81x: set pinmux for
 GPIO0/1 when used as LDOs
Date: Tue, 3 Oct 2017 10:06:29 +0800
Message-ID: <CAGb2v67ZV0oZ41WS1Borrz0fDYiXV5B1DTKnPzRQVcodMOOLzQ@mail.gmail.com>
References: <20171002120854.5212-1-quentin.schulz@free-electrons.com>
 <20171002120854.5212-13-quentin.schulz@free-electrons.com> <20171002204235.25d4437a2p5qzrrj@flea>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBP7BZPHAKGQEQYQ7FRA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20171002204235.25d4437a2p5qzrrj@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 3, 2017 at 4:42 AM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> On Mon, Oct 02, 2017 at 12:08:54PM +0000, Quentin Schulz wrote:
>> On AXP813/818, GPIO0 and GPIO1 can be used as LDO as (respectively)
>> ldo_io0 and ldo_io1.
>>
>> Let's add the pinctrl properties to the said regulators.
>>
>> Signed-off-by: Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/axp81x.dtsi | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/axp81x.dtsi b/arch/arm/boot/dts/axp81x.dtsi
>> index f90f257130d5..099b0ddc1bbb 100644
>> --- a/arch/arm/boot/dts/axp81x.dtsi
>> +++ b/arch/arm/boot/dts/axp81x.dtsi
>> @@ -52,6 +52,16 @@
>>               compatible = "x-powers,axp813-gpio";
>>               gpio-controller;
>>               #gpio-cells = <2>;
>> +
>> +             gpio0_ldo: gpio0_ldo {
>> +                     pins = "GPIO0";
>> +                     function = "ldo";
>> +             };
>> +
>> +             gpio1_ldo: gpio1_ldo {
>> +                     pins = "GPIO1";
>> +                     function = "ldo";
>> +             };
>
> The node names are not supposed to contain any hyphens.

Hmm, I was under the impression that hyphens were preferred in
node names, and a warning would be added to dtc later on.
I might be wrong though.

ChenYu
