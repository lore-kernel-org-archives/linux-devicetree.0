From: Horia Geanta <horia.geanta@nxp.com>
Subject: Re: [PATCH] powerpc/dts/fsl: add crypto node alias for B4
Date: Fri, 19 Apr 2019 09:54:54 +0000
Message-ID: <VI1PR0402MB34857D2DAF16A611B11A119598270@VI1PR0402MB3485.eurprd04.prod.outlook.com>
References: <20190320125516.12277-1-horia.geanta@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Scott Wood <oss@buserror.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

Has this slipped through?=0A=
=0A=
On 3/20/2019 2:57 PM, Horia Geant=E3 wrote:=0A=
> crypto node alias is needed by U-boot to identify the node and=0A=
> perform fix-ups, like adding "fsl,sec-era" property.=0A=
> =0A=
> Signed-off-by: Horia Geant=E3 <horia.geanta@nxp.com>=0A=
> ---=0A=
>  arch/powerpc/boot/dts/fsl/b4qds.dtsi | 1 +=0A=
>  1 file changed, 1 insertion(+)=0A=
> =0A=
> diff --git a/arch/powerpc/boot/dts/fsl/b4qds.dtsi b/arch/powerpc/boot/dts=
/fsl/b4qds.dtsi=0A=
> index 999efd3bc167..05be919f3545 100644=0A=
> --- a/arch/powerpc/boot/dts/fsl/b4qds.dtsi=0A=
> +++ b/arch/powerpc/boot/dts/fsl/b4qds.dtsi=0A=
> @@ -40,6 +40,7 @@=0A=
>  	interrupt-parent =3D <&mpic>;=0A=
>  =0A=
>  	aliases {=0A=
> +		crypto =3D &crypto;=0A=
>  		phy_sgmii_10 =3D &phy_sgmii_10;=0A=
>  		phy_sgmii_11 =3D &phy_sgmii_11;=0A=
>  		phy_sgmii_1c =3D &phy_sgmii_1c;=0A=
> =0A=
