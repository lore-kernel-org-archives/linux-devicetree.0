From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH] ARM: BCM5301X: Add missing Netgear R8000 LEDs and Keys
Date: Sat, 28 Jan 2017 15:25:02 +0100
Message-ID: <CACna6rwSs20asivXUsLQtmTtxppnpV4On1Kr8yNBdVYAH_csjg@mail.gmail.com>
References: <20170128134345.5465-1-adityaxavier@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170128134345.5465-1-adityaxavier@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: AdityaXavier <adityaxavier@gmail.com>
Cc: Hauke Mehrtens <hauke@hauke-m.de>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>
List-Id: devicetree@vger.kernel.org

Nice work, you're almost there!

Since quite recently ARM DTS patches have to use extra "dts: " prefix,
I understand you could miss that. Please just change your subject from
ARM: BCM5301X: Add missing Netgear R8000 LEDs and Keys
to
ARM: dts: BCM5301X: Add missing Netgear R8000 LEDs and Keys
and it'll be great.

When bumping patch version it's also nice to include version number in
the tag, e.g.
[PATCH V2]
You can achieve this by e.g.
git format-patch --subject-prefix=3D"PATCH V2" -1


On 28 January 2017 at 14:43, AdityaXavier <adityaxavier@gmail.com> wrote:
> From: Aditya Xavier <adityaxavier@gmail.com>
>
> Added two WAN status LEDs and a GPIO Key for Brightness which were missin=
g.
>
> Signed-off-by: Aditya Xavier <adityaxavier@gmail.com>
> ---

Ideally, in this place should go a changelog. E.g.:
V2: Update subject and change LED names


>  arch/arm/boot/dts/bcm4709-netgear-r8000.dts | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/bcm4709-netgear-r8000.dts b/arch/arm/boot/=
dts/bcm4709-netgear-r8000.dts
> index 92f8a72..90d4420 100644
> --- a/arch/arm/boot/dts/bcm4709-netgear-r8000.dts
> +++ b/arch/arm/boot/dts/bcm4709-netgear-r8000.dts
> @@ -27,18 +27,30 @@
>         leds {
>                 compatible =3D "gpio-leds";
>
> -               power0 {
> +               power-white {
>                         label =3D "bcm53xx:white:power";
>                         gpios =3D <&chipcommon 2 GPIO_ACTIVE_LOW>;
>                         linux,default-trigger =3D "default-on";
>                 };
>
> -               power1 {
> +               power-amber {
>                         label =3D "bcm53xx:amber:power";
>                         gpios =3D <&chipcommon 3 GPIO_ACTIVE_LOW>;
>                         linux,default-trigger =3D "default-off";
>                 };
>
> +               wan-white {
> +                       label =3D "bcm53xx:white:wan";
> +                       gpios =3D <&chipcommon 8 GPIO_ACTIVE_LOW>;
> +                       linux,default-trigger =3D "default-on";
> +               };
> +
> +               wan-amber {
> +                       label =3D "bcm53xx:amber:wan";
> +                       gpios =3D <&chipcommon 9 GPIO_ACTIVE_HIGH>;
> +                       linux,default-trigger =3D "default-off";
> +               };
> +
>                 5ghz-1 {
>                         label =3D "bcm53xx:white:5ghz-1";
>                         gpios =3D <&chipcommon 12 GPIO_ACTIVE_LOW>;
> @@ -104,6 +116,12 @@
>                         linux,code =3D <KEY_RESTART>;
>                         gpios =3D <&chipcommon 6 GPIO_ACTIVE_LOW>;
>                 };
> +
> +               brightness {
> +                       label =3D "Backlight";
> +                       linux,code =3D <KEY_BRIGHTNESS_ZERO>;
> +                       gpios =3D <&chipcommon 19 GPIO_ACTIVE_LOW>;
> +               };
>         };
>  };

Changes look OK, thanks!

--=20
Rafa=C5=82
