From: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH v2] powerpc/fsl: Added binding for Freescale CoreNet coherency fabric (CCF)
Date: Thu, 8 May 2014 07:00:44 -0700
Message-ID: <6CE62BBF-BFF4-4F2C-8EFF-B6F87EE6EEE9@kernel.crashing.org>
References: <1397833917-12611-1-git-send-email-diana.craciun@freescale.com>
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1397833917-12611-1-git-send-email-diana.craciun-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Diana Craciun <diana.craciun-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


On Apr 18, 2014, at 8:11 AM, Diana Craciun <diana.craciun-KZfg59tc24xl57MIdRCFDg@public.gmane.org=
> wrote:

> From: Diana Craciun <Diana.Craciun-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>=20
> The CoreNet coherency fabric is a fabric-oriented, conectivity
> infrastructure that enables the implementation of coherent, multicore
> systems. The CCF acts as a central interconnect for cores,
> platform-level caches, memory subsystem, peripheral devices and I/O h=
ost
> bridges in the system.
>=20
> Signed-off-by: Diana Craciun <Diana.Craciun-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
> .../devicetree/bindings/powerpc/fsl/ccf.txt        | 36 +++++++++++++=
+++++++++
> 1 file changed, 36 insertions(+)
> create mode 100644 Documentation/devicetree/bindings/powerpc/fsl/ccf.=
txt
>=20
> diff --git a/Documentation/devicetree/bindings/powerpc/fsl/ccf.txt b/=
Documentation/devicetree/bindings/powerpc/fsl/ccf.txt
> new file mode 100644
> index 0000000..f0b7143
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/powerpc/fsl/ccf.txt
> @@ -0,0 +1,36 @@
> +Freescale CoreNet Coherency Fabric(CCF) Device Tree Binding
> +
> +DESCRIPTION
> +
> +The CoreNet coherency fabric is a fabric-oriented, connectivity infr=
astructure
> +that enables the implementation of coherent, multicore systems.
> +
> +Required properties:
> +
> +- compatible : <string>
> +		Must include "fsl,corenetX-cf", "fsl,corenet-cf" - CoreNet coheren=
cy=20
> +		fabric version X

Can we make this =91fsl,corenet-vX-cf=92.

corenet-v1-cf/corenet-v2-cf looks nicer than corenet1-cf/corenet2-cf

> +
> +- reg : <prop-encoded-array>
> +		A standard property. Represents the CCF registers.
> +
> +- interrupts : <prop-encoded-array>
> +		Interrupt mapping for CCF error interrupt.
> +
> +- fsl,ccf-num-csdids: <u32>
> +		Specifies the number of Coherency Subdomain ID Port Mapping
> +		Registers that are supported by the CCF.
> +
> +- fsl,ccf-num-snoopids: <u32>
> +		Specifies the number of Snoop ID Port Mapping Registers that
> +		are supported by CCF.
> +
> +Example:
> +
> +	corenet-cf@18000 {
> +		compatible =3D "fsl,corenet2-cf", "fsl,corenet-cf";
> +		reg =3D <0x18000 0x1000>;
> +		interrupts =3D <16 2 1 31>;
> +		fsl,ccf-num-csdids =3D <32>;
> +		fsl,ccf-num-snoopids =3D <32>;
> +	};
> --=20
> 1.7.11.7
>=20
>=20
> _______________________________________________
> Linuxppc-dev mailing list
> Linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/linuxppc-dev

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
