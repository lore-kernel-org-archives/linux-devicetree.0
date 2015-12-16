From: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>
Subject: Re: [PATCH 1/2] devicetree: sound: add binding for WM8974 codec
Date: Wed, 16 Dec 2015 13:31:30 +0000
Message-ID: <yw1xoadqeczx.fsf@unicorn.mansr.com>
References: <1450270975-17955-1-git-send-email-mans@mansr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1450270975-17955-1-git-send-email-mans@mansr.com> (Mans
	Rullgard's message of "Wed, 16 Dec 2015 13:02:54 +0000")
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Mark,

This is the 1/1 you were missing.

Am I the only one who is annoyed by scripts/get_maintainer.pl not
returning all the addresses it should in cases like this?  Is there som=
e
trick I'm missing?

Mans Rullgard <mans@mansr.com> writes:

> This adds a binding for the Wolfson WM8974 mono audio codec.
>
> Signed-off-by: Mans Rullgard <mans@mansr.com>
> ---
> The Linux driver for this device currently only supports I2C, but SPI
> could easily be added if necessary, and DT bindings are supposed to b=
e
> generic.
> ---
>  Documentation/devicetree/bindings/sound/wlf,wm8974.txt | 15 ++++++++=
+++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/wlf,wm897=
4.txt
>
> diff --git a/Documentation/devicetree/bindings/sound/wlf,wm8974.txt b=
/Documentation/devicetree/bindings/sound/wlf,wm8974.txt
> new file mode 100644
> index 0000000..01d3a7c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/wlf,wm8974.txt
> @@ -0,0 +1,15 @@
> +WM8974 audio CODEC
> +
> +This device supports both I2C and SPI (configured with pin strapping
> +on the board).
> +
> +Required properties:
> +  - compatible: "wlf,wm8974"
> +  - reg: the I2C address or SPI chip select number of the device
> +
> +Examples:
> +
> +codec: wm8974@1a {
> +	compatible =3D "wlf,wm8974";
> +	reg =3D <0x1a>;
> +};
> --=20
> 2.6.3
>

--=20
M=E5ns Rullg=E5rd
