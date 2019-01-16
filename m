From: Ran Wang <ran.wang_1@nxp.com>
Subject: RE: [PATCH 1/2] usb: dwc3: Add avoiding vbus glitch happen during
 xhci reset
Date: Wed, 16 Jan 2019 07:05:46 +0000
Message-ID: <AM5PR0402MB2865FC8FE157D5CE59126168F1820@AM5PR0402MB2865.eurprd04.prod.outlook.com>
References: <20190116064820.20007-1-ran.wang_1@nxp.com>
 <20190116064820.20007-2-ran.wang_1@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190116064820.20007-2-ran.wang_1@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Felipe Balbi <balbi@kernel.org>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 16, 2019 14:48 Ran Wang wrote:
>

It seems the preface patch (0/2) failed to be accepted by patchwork (could
anyone tell me how to generate it properly with some sommand?),=20
I paste its content here for your reference :

This to fix USB enumeration compatibility issue found on DWC3 (host mode)
IP only.

Some pre-discussion mails can be referred from:
https://lkml.org/lkml/2018/11/23/387
https://lkml.org/lkml/2018/11/22/683

As to the workaround, I know programming xhci register in DWC3 dirver
(probe function) is not good from perspective of SW stack, but it seems
to be the only place to fix this real existing problem (test result show
that doing this in xhci-plat.c or xhci.c would not hlep on this kind of
failure). If who have better idea, please let me know, thanks in advanced.

Ran Wang (2):
 dt-bindings: Add workaround for host mode VBUS glitch when boot
 dwc3 core driver: Add avoiding vbus glitch happen during xhci reset

 Documentation/devicetree/bindings/usb/dwc3.txt |    3 +++
 drivers/usb/dwc3/core.c |   47 +++++++++++++++++++++++++++++++++++++++++++=
++++
 drivers/usb/dwc3/core.h |   10 +++++++++-
 3 files changed, 60 insertions(+), 0 deletions(-)
=20
> When DWC3 is set to host mode by programming register DWC3_GCTL, VUBS
> (or its control signal) will on immediately on related Root Hub ports.
> Then the VUBS will be de-asserted for a little while during xhci reset
> (conducted by xhci driver) for a little while and back to normal.
>=20
> This VBUS glitch might cause some USB devices emuration fail if kernel bo=
ot
> with them connected. One SW workaround which can fix this is to program
> all PORTSC[PP] to 0 to turn off VBUS immediately after setting host mode =
in
> DWC3 driver(per signal measurement result, it will be too late to do it i=
n
> xhci-plat.c or xhci.c).
>=20
> Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
> ---
>  Documentation/devicetree/bindings/usb/dwc3.txt |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt
> b/Documentation/devicetree/bindings/usb/dwc3.txt
> index 8e5265e..dadb530 100644
> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
> @@ -106,6 +106,9 @@ Optional properties:
>  			When just one value, which means INCRX burst
> mode enabled. When
>  			more than one value, which means undefined length
> INCR burst type
>  			enabled. The values can be 1, 4, 8, 16, 32, 64, 128
> and 256.
> + - snps,avoid-vbus-glitch-when-set-host: Power off all Root Hub ports
> immediately
> +			after setting host mode to avoid vbus (negative)
> glitch happen in later
> +			xhci reset. And the vbus will back to 5V automatically
> when reset done.
>=20
>   - in addition all properties from usb-xhci.txt from the current directo=
ry are
>     supported as well
> --
> 1.7.1

Regards,
Ran
