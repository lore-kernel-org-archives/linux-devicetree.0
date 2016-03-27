From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 5/6] Documentation: DT: vdma: update binding doc for
 AXI CDMA
Date: Sun, 27 Mar 2016 12:27:42 -0700
Message-ID: <20160327192742.GJ19212@xsjsorenbubuntu>
References: <1459101966-9932-1-git-send-email-appanad@xilinx.com>
 <1459101966-9932-2-git-send-email-appanad@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1459101966-9932-2-git-send-email-appanad-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kedareswara rao Appana <appana.durga.rao-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, anuragku-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, appanad-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, luis-HiykPkW1eAzzDCI4PIEvbQC/G2K4zDHf@public.gmane.org, svemula-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, anirudh-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, 2016-03-27 at 23:36:06 +0530, Kedareswara rao Appana wrote:
> This patch updates the device-tree binding doc for
> adding support for AXI CDMA.
>=20
> Signed-off-by: Kedareswara rao Appana <appanad-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> ---
> ---> Modified commit message as suggested by Vinod.
> ---> Moved the patch to forward in the series as suggested by vinod.
>=20
>  .../devicetree/bindings/dma/xilinx/xilinx_vdma.txt     | 18 ++++++++=
+++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma=
=2Etxt b/Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt
> index 5841421..2b0c12b 100644
> --- a/Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt
> +++ b/Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt
> @@ -8,8 +8,12 @@ target devices. It can be configured to have one cha=
nnel or two channels.
>  If configured as two channels, one is to transmit to the device and =
another
>  is to receive from the device.
> =20
> +Xilinx AXI CDMA engine, it does transfers between memory-mapped sour=
ce
> +address and a memory-mapped destination address.
> +
>  Required properties:
> -- compatible: Should be "xlnx,axi-vdma-1.00.a" or "xlnx,axi-dma-1.00=
=2Ea"
> +- compatible: Should be "xlnx,axi-vdma-1.00.a" or "xlnx,axi-dma-1.00=
=2Ea" or
> +	      "xlnx,axi-cdma-1.00.a""
>  - #dma-cells: Should be <1>, see "dmas" property below
>  - reg: Should contain VDMA registers location and length.
>  - xlnx,num-fstores: Should be the number of framebuffers as configur=
ed in h/w.
> @@ -80,6 +84,18 @@ axi_dma_0: axidma@40400000 {
>  	} ;
>  } ;
> =20
> +axi_cdma_0: axicdma@7e200000 {
> +       compatible =3D "xlnx,axi-cdma-1.00.a";
> +       #dma-cells =3D <1>;
> +       reg =3D < 0x7e200000 0x10000 >;
> +       xlnx,addrwidth =3D <0x20>;
> +       dma-channel@7e200000 {
> +               compatible =3D "xlnx,axi-dma-mm2s-channel";
> +               interrupts =3D < 0 55 4 >;
> +               xlnx,datawidth =3D <0x40>;
> +       } ;
> +} ;

As in the other patch, the node name should be 'dma-controller@...' and
the inconsistend spacing could be fixed.

Also, it seems this adds pretty much identical examples that just diffe=
r
in the compat string. Is that really needed?

	S=C3=B6ren

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
