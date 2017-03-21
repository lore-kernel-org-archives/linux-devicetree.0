From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH v4 1/8] dt-bindings: display: add STM32 LTDC driver
Date: Tue, 21 Mar 2017 13:54:18 -0700
Message-ID: <87k27inyf9.fsf@eliezer.anholt.net>
References: <1489597334-16896-1-git-send-email-yannick.fertre@st.com>
 <1489597334-16896-2-git-send-email-yannick.fertre@st.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2131825603=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1489597334-16896-2-git-send-email-yannick.fertre@st.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Yannick Fertre <yannick.fertre@st.com>, Alexandre TORGUE <alexandre.torgue@st.com>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Russell King <linux@armlinux.org.uk>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Benjamin Gaignard <benjamin.gaignard@st.com>Yannick Fertre <yannick.fertre@st.com>
Cc: devicetree@vger.kernel.org, kernel@stlinux.com, Philippe Cornu <philippe.cornu@st.com>, dri-devel@lists.freedesktop.org, Fabien Dessenne <fabien.dessenne@st.com>, Mickael Reulier <mickael.reulier@st.com>, Vincent Abriou <vincent.abriou@st.com>, Gabriel FERNANDEZ <gabriel.fernandez@st.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--===============2131825603==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Yannick Fertre <yannick.fertre@st.com> writes:

> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Yannick Fertre <yannick.fertre@st.com>
> ---
>  .../devicetree/bindings/display/st,stm32-ltdc.txt  | 36 ++++++++++++++++=
++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/st,stm32-lt=
dc.txt
>
> diff --git a/Documentation/devicetree/bindings/display/st,stm32-ltdc.txt =
b/Documentation/devicetree/bindings/display/st,stm32-ltdc.txt
> new file mode 100644
> index 0000000..e8d39c5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/st,stm32-ltdc.txt
> @@ -0,0 +1,36 @@
> +* STMicroelectronics STM32 lcd-tft display controller
> +
> +- ltdc: lcd-tft display controller host
> +  must be a sub-node of st-display-subsystem
> +  Required properties:
> +  - compatible: "st,stm32-ltdc"
> +  - reg: Physical base address of the IP registers and length of memory =
mapped region.
> +  - clocks: A list of phandle + clock-specifier pairs, one for each
> +    entry in 'clock-names'.
> +  - clock-names: A list of clock names. For ltdc it should contain:
> +      - "clk-lcd" for the clock feeding the output pixel clock & IP cloc=
k.

I think you meant "lcd" here.

> +  - resets: reset to be used by the device (defined by use of RCC macro).
> +  Required nodes:
> +    - Video port for RGB output.
> +
> +Example:
> +
> +/ {
> +	...
> +	soc {
> +	...
> +		ltdc: display-controller@40016800 {
> +			compatible =3D "st,stm32-ltdc";
> +			reg =3D <0x40016800 0x200>;
> +			interrupts =3D <88>, <89>;
> +			resets =3D <&rcc STM32F4_APB2_RESET(LTDC)>;
> +			clocks =3D <&rcc 1 CLK_LCD>;
> +			clock-names =3D "lcd";
> +
> +			port {
> +				ltdc_out_rgb: endpoint {
> +				};
> +			};
> +		};
> +	};
> +};
> --=20
> 1.9.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAljRkvoACgkQtdYpNtH8
nuh6WA//ddvWCf3u/nwA0gL0AhE8+hcTc7gwv8zvvjCS2Dp7SWvIwlFzWDMoMqQF
gP93CVxmy7f54gBdKZetmE7Yk6XpXUFXUGpWSCqTCak6+2qD1J248MuugAgt0stL
CdDAcDyB6PX9JHmX9VKE2DaMqqxSeWYhatz182lO7aFFfyHjxtT6QR9HVC83K76C
baVRnWQANKrzwQseO+1Clw+o3Mcv4BMo14FDP5Ne9l0MqNnvOQQPVQCd0ZF3Q8Ic
R4M8yDsMqgC5jaQ6Nd1KtuunqIoxgSVQhhhWookkzqA16Zr8XCiHkOYHSf0nhCFi
/5CnPMYphSgYxDkZ4UQmIZwn7B/toR0Rg8H3hXLyWdWS3xR11urJIInyQN3CLH74
K4klz24NgSueuUdfa4aDzImDauQrg80k4/JGTytTddLttF/UUMecdYidYZ6LC0nK
lumwraCfovOa25tijH+xdy3YNXaicp1p1MUWqw+iVqEr1CvFlPYGMpWk2XTb5a7D
0cRvZ2pT6VxMJbUwsXnxfAum6Ef4BHdmtEYvHl3EkmEt1u+Dh1Sy2KzmWwT17NQ1
nLJjPKj1GjsN9fqbXpay2ATKaYKElRkNnabDEmCNQPNr7CXPhUcRKE23DS0WGnkw
5XHORxxNUvOmA9SOC4ND46ivtE1ZTqmvrvMJVDQGh1mCAEX1htU=
=D371
-----END PGP SIGNATURE-----
--=-=-=--

--===============2131825603==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============2131825603==--
