From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 14/14] ARM: dts: imx6: make audmux optional for i.MX6UL
 sound driver
Date: Thu, 14 Jan 2016 20:38:09 -0600
Message-ID: <20160115023809.GA3284@rob-hp-laptop>
References: <1452619291-13625-6-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-7-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-8-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-9-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-10-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-11-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-12-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-13-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-14-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-15-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1452619291-13625-15-git-send-email-LW@KARO-electronics.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Lothar =?iso-8859-1?Q?Wa=DFmann?= <LW@KARO-electronics.de>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Russell King <linux@arm.linux.org.uk>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 12, 2016 at 06:21:31PM +0100, Lothar Wa=DFmann wrote:
> i.MX6UL does not have the audio multiplexer (AUDMUX) like the other
> i.MX6 SoCs, but apart from that can use the same audio driver. Make
> audmux optional for the imx-sgtl5000 driver, so it can be used on
> i.MX6UL too. Furthermore i.MX6UL requires use of the SAI interface
> rather than SSI. Change the DTS documentation accordingly.
>=20
> The patch with the corresponding changes to the imx-sgtl5000 driver
> will be sent separately.
>=20
> Signed-off-by: Lothar Wa=DFmann <LW@KARO-electronics.de>
> ---
>  .../bindings/sound/imx-audio-sgtl5000.txt          | 26 ++++++++++++=
+++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/sound/imx-audio-sgtl50=
00.txt b/Documentation/devicetree/bindings/sound/imx-audio-sgtl5000.txt
> index 2f89db8..fd46671 100644
> --- a/Documentation/devicetree/bindings/sound/imx-audio-sgtl5000.txt
> +++ b/Documentation/devicetree/bindings/sound/imx-audio-sgtl5000.txt
> @@ -6,7 +6,7 @@ Required properties:
> =20
>    - model		: The user-visible name of this sound complex
> =20
> -  - ssi-controller	: The phandle of the i.MX SSI controller
> +  - ssi-controller	: The phandle of the i.MX SSI (or SAI) controller
> =20
>    - audio-codec		: The phandle of the SGTL5000 audio codec
> =20
> @@ -39,6 +39,16 @@ Required properties:
>  Note: The AUDMUX port numbering should start at 1, which is consiste=
nt with
>  hardware manual.
> =20
> +Optional properties:
> +  - fsl,no-audmux	: boolean
> +    			  Required for i.MX6UL (and maybe other SoCs)
> +    			  which don't have an AUDMUX, but still
> +			  feature the same audio subsystem otherwise.

It would have been better if this was a phandle to the audmux and lack=20
of the property meant no audmux. Too late for that I guess.

Acked-by: Rob Herring <robh@kernel.org>

Rob
