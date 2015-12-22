From: Joakim Tjernlund <Joakim.Tjernlund-27rvihrghlNWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] powerpc/fsl: Update fman dt binding with pcs-phy and
 tbi-phy
Date: Tue, 22 Dec 2015 15:56:57 +0000
Message-ID: <1450799843.28718.56.camel@infinera.com>
References: <1450757888-14216-1-git-send-email-igal.liberman@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1450757888-14216-1-git-send-email-igal.liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Content-Language: en-US
Content-ID: <AD703585BA7F2142A8F78A1BAB54AFAE-27rvihrghlNWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "igal.liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <igal.liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: "scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "shaohui.xie-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <shaohui.xie-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "madalin.bucur-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <madalin.bucur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2015-12-22 at 06:18 +0200, igal.liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org wrote:
> From: Igal Liberman <igal.liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>=20
> Signed-off-by: Igal Liberman <igal.liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
> =A0.../devicetree/bindings/powerpc/fsl/fman.txt=A0=A0=A0=A0=A0=A0=A0|=
=A0=A0=A039 ++++++++++++++++++++
> =A01 file changed, 39 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/powerpc/fsl/fman.txt
> b/Documentation/devicetree/bindings/powerpc/fsl/fman.txt
> index 1fc5328..7a6d7c3 100644
> --- a/Documentation/devicetree/bindings/powerpc/fsl/fman.txt
> +++ b/Documentation/devicetree/bindings/powerpc/fsl/fman.txt
> @@ -315,6 +315,16 @@ PROPERTIES
> =A0		Value type: <phandle>
> =A0		Definition: A phandle for 1EEE1588 timer.
> =A0
> +- pcsphy-handle
> +		Usage required for "fsl,fman-memac" MACs
> +		Value type: <phandle>
> +		Definition: A phandle for pcsphy.
> +
> +- tbi-handle
> +		Usage required for "fsl,fman-dtsec" MACs
> +		Value type: <phandle>
> +		Definition: A phandle for tbiphy.
> +
> =A0EXAMPLE
> =A0
> =A0fman1_tx28: port@a8000 {
> @@ -340,6 +350,7 @@ ethernet@e0000 {
> =A0	reg =3D <0xe0000 0x1000>;
> =A0	fsl,fman-ports =3D <&fman1_rx8 &fman1_tx28>;
> =A0	ptp-timer =3D <&ptp-timer>;
> +	tbi-handle =3D <&tbi0>;
> =A0};
> =A0
> =A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> @@ -415,6 +426,13 @@ PROPERTIES
> =A0		The settings and programming routines for internal/external
> =A0		MDIO are different. Must be included for internal MDIO.
> =A0
> +For internal PHY device on internal mdio bus, a PHY node should be c=
reated.
> +See the definition of the PHY node in booting-without-of.txt for an
> +example of how to define a PHY (Internal PHY has no interrupt line).
> +- For "fsl,fman-mdio" compatible internal mdio bus, the PHY is TBI P=
HY.
> +- For "fsl,fman-memac-mdio" compatible internal mdio bus, the PHY is=
 PCS PHY,
> +=A0=A0PCS PHY addr must be '0'.

Will this replace the need for fixed PHYs ?

=A0 =A0Jocke--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
