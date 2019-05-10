Return-Path: <SRS0=12eG=TK=renesas.com=yoshihiro.shimoda.uh@kernel.org>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH v2 04/15] dt-bindings: rcar-gen3-phy-usb2: Document use of
 usb_x1
Date: Fri, 10 May 2019 04:38:18 +0000
Message-ID: 
 <OSBPR01MB3174A8008FF1E216893398E8D80C0@OSBPR01MB3174.jpnprd01.prod.outlook.com>
References: <20190509201142.10543-1-chris.brandt@renesas.com>
 <20190509201142.10543-5-chris.brandt@renesas.com>
In-Reply-To: <20190509201142.10543-5-chris.brandt@renesas.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Chris Brandt <Chris.Brandt@renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Simon Horman <horms@verge.net.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Chris-san,

Thank you for the patch!

> From: Chris Brandt, Sent: Friday, May 10, 2019 5:12 AM
>=20
> Document the optional renesas,uses_usb_x1 property.
>=20
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
> v2:
>  * removed 'use_usb_x1' option
>  * document that 'usb_x1' clock node will be detected to determine if
>    48MHz clock exists
> ---
>  Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> index d46188f450bf..79d8360d92e5 100644
> --- a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> +++ b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> @@ -28,7 +28,9 @@ Required properties:
>  	      followed by the generic version.
>=20
>  - reg: offset and length of the partial USB 2.0 Host register block.
> -- clocks: clock phandle and specifier pair(s).
> +- clocks: clock phandle and specifier pair(s). For SoCs that have a sepa=
rate
> +          dedicated 48MHz USB_X1 input, if a 'usb_x1' clock node exists =
and is
> +          set to non-zero, the PHY will use the 48MHZ input for the PLL.

I think we need to add clock-names property for usb_x1 at least.
I checked the other doc "renesas,du.txt".
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Doc=
umentation/devicetree/bindings/display/renesas,du.txt#n31

I think we can reuse it like below:

- clock-names: Name of the clocks. This property is model-dependent.
  - R-Car Gen3 SoCs use a single functional clock. The clock doesn't need t=
o be
    named.
  - RZ/A2 uses a single functional clock as a separate dedicated 48MHz
    USB_X1 input. So, the functional clock must be named "???" and
    the USB_X1 input must be named as "usb_x1".

What do you think? I'm not sure how to be named the functional clock so tha=
t
the sample is named as "???".

Best regards,
Yoshihiro Shimoda

>  - #phy-cells: see phy-bindings.txt in the same directory, must be <1> (a=
nd
>  	      using <0> is deprecated).
>=20
> --
> 2.16.1
