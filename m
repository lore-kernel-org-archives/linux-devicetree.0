From: Peter Chen <peter.chen@nxp.com>
Subject: RE: [PATCH v3 1/2] dt-bindings: usb: ci-hdrc-usb2: add property
 power-active-high
Date: Thu, 17 Jan 2019 07:01:21 +0000
Message-ID: <VI1PR04MB5327656AD22454B054CE0AD08B830@VI1PR04MB5327.eurprd04.prod.outlook.com>
References: <20190116105103.28842-2-philipp.puschmann@emlix.com>
 <20190116111133.31326-1-philipp.puschmann@emlix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190116111133.31326-1-philipp.puschmann@emlix.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Puschmann <philipp.puschmann@emlix.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

=20
>=20
> The i.MX6q/dl USB controller may drive the usb power line directly, but t=
he polarity
> depends on the board. Reset state of the polarity is low-active so add th=
is property
> to allow it to be high-active.
>=20

As far as I know, most of i.mx USB controllers (except imx28/23, but they d=
on't have non-core registers)
work like this, and most of them are low active for PP default. Would you j=
ust use "i.mx" at
both your code and your comment?

Peter

> Signed-off-by: Philipp Puschmann <philipp.puschmann@emlix.com>
> ---
> Changes in v3: add description
> ---
>  Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
> b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
> index adae82385dd6..8696e3eff6e7 100644
> --- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
> +++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
> @@ -93,6 +93,7 @@ i.mx specific properties
>  - over-current-active-low: over current signal polarity is active low.
>  - over-current-active-high: over current signal polarity is active high.
>    It's recommended to specify the over current polarity.
> +- power-active-high: power signal polarity is high active (only for
> +imx6q/dl)
>  - external-vbus-divider: enables off-chip resistor divider for Vbus
>=20
>  Example:
> --
> 2.20.1
