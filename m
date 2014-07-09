From: Bjorn Andersson <bjorn@kryo.se>
Subject: Re: [PATCH v2] pinctrl: msm: Add msm8960 definitions
Date: Tue, 8 Jul 2014 20:50:38 -0700
Message-ID: <CAJAp7OieWraVQ35hDJ6HQ1ycSkZ1ShKvkkuuRxKUEmti5ethhA@mail.gmail.com>
References: <1403633766-25796-1-git-send-email-bjorn.andersson@sonymobile.com>
	<53AA151E.9090701@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <53AA151E.9090701@suse.de>
Sender: linux-arm-msm-owner@vger.kernel.org
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc: Bjorn Andersson <bjorn.andersson@sonymobile.com>, Linus Walleij <linus.walleij@linaro.org>, Andy Gross <agross@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 24, 2014 at 5:17 PM, Andreas F=C3=A4rber <afaerber@suse.de>=
 wrote:
> Am 24.06.2014 20:16, schrieb Bjorn Andersson:
>> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8960-=
pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,msm8960-pi=
nctrl.txt
>> new file mode 100644
>> index 0000000..6e79eea
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8960-pinctrl=
=2Etxt
> [...]
>> +Example:
>> +
>> +     msmgpio: pinctrl@800000 {
>> +             compatible =3D "qcom,msm8960-pinctrl";
>> +             reg =3D <0x800000 0x4000>;
>> +
>> +             gpio-controller;
>> +             #gpio-cells =3D <2>;
>> +             interrupt-controller;
>> +             #interrupt-cells =3D <2>;
>> +                interrupts =3D <0 32 0x4>;
>
> This line seems space-indented while surrounding ones are tab-indente=
d.
>

Thanks, not only is it incorrectly indented, it's also a bad example
as it's the wrong IRQ for msm8960...

>> +
>> +             pinctrl-names =3D "default";
>> +             pinctrl-0 =3D <&debug_uart>;
>> +
>> +             debug_uart: debug_uart {
>
> While at it, might debug-uart be a better node name? That seems the
> predominant convention and distinguishes from the label.
>

You're right and reference design does not use gsbi8 as uart, so I'll u=
pdate it.

Thanks for the review.

Regards,
Bjorn
