From: Leo Li <leoyang.li@nxp.com>
Subject: RE: [linux-devel] [PATCH 3/3] core-arm: add a member about
 dma_map_ops    in dev_archdata struct
Date: Fri, 11 Aug 2017 16:38:14 +0000
Message-ID: <AM4PR0401MB1699052B428E871569697F988F890@AM4PR0401MB1699.eurprd04.prod.outlook.com>
References: <1502445633-33772-1-git-send-email-yinbo.zhu@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1502445633-33772-1-git-send-email-yinbo.zhu@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Yinbo Zhu <yinbo.zhu@nxp.com>Yinbo Zhu <yinbo.zhu@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Felipe Balbi <balbi@kernel.org>
Cc: open list <devicetree@vger.kernel.org>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Catalin Marinas <catalin.marinas@arm.com>, open list <linux-usb@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, Doug Ledford <dledford@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bart Van Assche <bart.vanassche@sandisk.com>, moderated list <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: linux-devel-bounces@gforge.freescale.net [mailto:linux-devel-
> bounces@gforge.freescale.net] On Behalf Of yinbo.zhu@nxp.com
> Sent: Friday, August 11, 2017 5:01 AM
> To: linux-devel@gforge.freescale.net; Yinbo Zhu <yinbo.zhu@nxp.com>; Rob
> Herring <robh+dt@kernel.org>; Mark Rutland <mark.rutland@arm.com>;
> Russell King <linux@armlinux.org.uk>; Felipe Balbi <balbi@kernel.org>
> Cc: open list <devicetree@vger.kernel.org>; Laurent Pinchart
> <laurent.pinchart+renesas@ideasonboard.com>; Catalin Marinas
> <catalin.marinas@arm.com>; open list <linux-usb@vger.kernel.org>; open li=
st
> <linux-kernel@vger.kernel.org>; Doug Ledford <dledford@redhat.com>;
> Stefano Stabellini <sstabellini@kernel.org>; Greg Kroah-Hartman
> <gregkh@linuxfoundation.org>; Bart Van Assche
> <bart.vanassche@sandisk.com>; moderated list <linux-arm-
> kernel@lists.infradead.org>
> Subject: [linux-devel] [PATCH 3/3] core-arm: add a member about
> dma_map_ops in dev_archdata struct
>=20
> From: "yinbo.zhu" <yinbo.zhu@nxp.com>

The dma_ops was just moved from struct dev_archdata to struct device with c=
ommit 5657933dbb6e25feaf5d8df8c88f96cdade693a3.  Don't duplicate the dma_op=
s in both places if you don't have a good reason.

>=20
> Signed-off-by: yinbo.zhu <yinbo.zhu@nxp.com>
> ---
>  arch/arm/include/asm/device.h | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/arm/include/asm/device.h b/arch/arm/include/asm/device.=
h
> index 220ba20..c93d3df 100644
> --- a/arch/arm/include/asm/device.h
> +++ b/arch/arm/include/asm/device.h
> @@ -7,6 +7,7 @@
>  #define ASMARM_DEVICE_H
>=20
>  struct dev_archdata {
> +const struct dma_map_ops        *dma_ops;
>  #ifdef CONFIG_DMABOUNCE
>  	struct dmabounce_device_info *dmabounce;  #endif
> --
> 2.1.0.27.g96db324
>=20
> _______________________________________________
> linux-devel mailing list
> linux-devel@gforge.freescale.net
> https://emea01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fgforg=
e.
> freescale.net%2Fmailman%2Flistinfo%2Flinux-
> devel&data=3D01%7C01%7Cleoyang.li%40nxp.com%7Cc83542988dac448bd8b908
> d4e0a230af%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0&sdata=3D1pbSjxG781
> yjcCF%2BuXbRCkV6ytbfTTgQkHNWmm0e9nk%3D&reserved=3D0
