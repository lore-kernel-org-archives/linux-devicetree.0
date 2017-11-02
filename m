From: "M.h. Lian" <minghuan.lian-3arQi8VN3Tc@public.gmane.org>
Subject: RE: [PATCH 3/3] ARMv8: pcie: make the DWC EP driver support for
 layerscape
Date: Thu, 2 Nov 2017 09:31:33 +0000
Message-ID: <VI1PR04MB1615DB65A3A9E50B4B31476CE85C0@VI1PR04MB1615.eurprd04.prod.outlook.com>
References: <20171024083045.31135-1-xiaowei.bao@nxp.com>
 <20171024083045.31135-4-xiaowei.bao@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171024083045.31135-4-xiaowei.bao-3arQi8VN3Tc@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "catalin.marinas-5wv7dgnIgG8@public.gmane.org" <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, "will.deacon-5wv7dgnIgG8@public.gmane.org" <will.deacon-5wv7dgnIgG8@public.gmane.org>, "bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org" <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Madalin-cristian Bucur <madalin.bucur-3arQi8VN3Tc@public.gmane.org>, Sumit Garg <sumit.garg-3arQi8VN3Tc@public.gmane.org>, "Y.b. Lu" <yangbo.lu-3arQi8VN3Tc@public.gmane.org>, "hongtao.jia-3arQi8VN3Tc@public.gmane.org" <hongtao.jia-3arQi8VN3Tc@public.gmane.org>, Andy Tang <andy.tang-3arQi8VN3Tc@public.gmane.org>, Leo Li <leoyang.li-3arQi8VN3Tc@public.gmane.org>, "kishon-l0cyMroinI0@public.gmane.org" <kishon-l0cyMroinI0@public.gmane.org>, "jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "pbrobinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <pbrobinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "songxiaowei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org" <songxiaowei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Xiaowei Bao <xiaowei.bao-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Acked-by: Minghuan Lian <minghuan.Lian-3arQi8VN3Tc@public.gmane.org>

> -----Original Message-----
> From: Bao Xiaowei [mailto:xiaowei.bao-3arQi8VN3Tc@public.gmane.org]
> Sent: Tuesday, October 24, 2017 4:31 PM
> To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org; mark.rutland-5wv7dgnIgG8@public.gmane.org; catalin.marinas-5wv7dgnIgG8@public.gmane.org;
> will.deacon-5wv7dgnIgG8@public.gmane.org; bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org; shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org;
> Madalin-cristian Bucur <madalin.bucur-3arQi8VN3Tc@public.gmane.org>; Sumit Garg
> <sumit.garg-3arQi8VN3Tc@public.gmane.org>; Y.b. Lu <yangbo.lu-3arQi8VN3Tc@public.gmane.org>; hongtao.jia-3arQi8VN3Tc@public.gmane.org;
> Andy Tang <andy.tang-3arQi8VN3Tc@public.gmane.org>; Leo Li <leoyang.li-3arQi8VN3Tc@public.gmane.org>;
> kishon-l0cyMroinI0@public.gmane.org; jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org; pbrobinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org;
> songxiaowei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-arm-
> kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-
> pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; Z.q. Hou
> <zhiqiang.hou-3arQi8VN3Tc@public.gmane.org>; Mingkai Hu <mingkai.hu-3arQi8VN3Tc@public.gmane.org>; M.h. Lian
> <minghuan.lian-3arQi8VN3Tc@public.gmane.org>
> Cc: Xiaowei Bao <xiaowei.bao-3arQi8VN3Tc@public.gmane.org>
> Subject: [PATCH 3/3] ARMv8: pcie: make the DWC EP driver support for
> layerscape
>=20
> Layerscape pcie controllers support RC or EP mode, Add the EP mode suppor=
t in
> Kconfig, the driver will support both RC and EP mode, and the driver is a=
ble to
> judge the pcie controllers work on RC or EP mode.
>=20
> Signed-off-by: Bao Xiaowei <xiaowei.bao-3arQi8VN3Tc@public.gmane.org>
> ---
>  drivers/pci/dwc/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/pci/dwc/Kconfig b/drivers/pci/dwc/Kconfig index
> 22ec82fcdea2..b5f507795779 100644
> --- a/drivers/pci/dwc/Kconfig
> +++ b/drivers/pci/dwc/Kconfig
> @@ -108,6 +108,7 @@ config PCI_LAYERSCAPE
>  	depends on PCI_MSI_IRQ_DOMAIN
>  	select MFD_SYSCON
>  	select PCIE_DW_HOST
> +	select PCIE_DW_EP
>  	help
>  	  Say Y here if you want PCIe controller support on Layerscape SoCs.
>=20
> --
> 2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
