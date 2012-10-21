From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH v2 0/2] DT EHCI support for Kirkwood.
Date: Sat, 20 Oct 2012 21:24:20 -0400
Message-ID: <20121021012420.GD25828@titan.lakedaemon.net>
References: <1350731401-21442-1-git-send-email-andrew@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1350731401-21442-1-git-send-email-andrew-g2DYL2Zd6BY@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Oct 20, 2012 at 01:09:59PM +0200, Andrew Lunn wrote:
> These two patches add DT support to ehci-orion and convert all
> existing Kirkwood DT boards to using DT to instantiate the USB host.
> 
> v1->v2: Remove the phy property from DT. The previous implementation
> was not compatible with the new ideas of a USB phy node. Only orion5x
> needs it anyway, and currently converting orion5x to DT is low
> priority. Adding a phy node later will also not affect backwards
> compatibility.
> 
> Andrew Lunn (2):
>   ARM: Kirkwood: ehci-orion: Add device tree binding
>   ARM: Kirkwood: Convert all DT boards to EHCI via DT.
> 
>  .../devicetree/bindings/usb/ehci-orion.txt         |   15 ++++++++
>  arch/arm/boot/dts/kirkwood.dtsi                    |    7 ++++
>  arch/arm/mach-kirkwood/board-dnskw.c               |    1 -
>  arch/arm/mach-kirkwood/board-dockstar.c            |    1 -
>  arch/arm/mach-kirkwood/board-dreamplug.c           |    1 -
>  arch/arm/mach-kirkwood/board-dt.c                  |    1 +
>  arch/arm/mach-kirkwood/board-goflexnet.c           |    1 -
>  arch/arm/mach-kirkwood/board-ib62x0.c              |    1 -
>  arch/arm/mach-kirkwood/board-iconnect.c            |    1 -
>  arch/arm/mach-kirkwood/board-iomega_ix2_200.c      |    2 --
>  arch/arm/mach-kirkwood/board-km_kirkwood.c         |    1 -
>  arch/arm/mach-kirkwood/board-lsxl.c                |    1 -
>  arch/arm/mach-kirkwood/board-ts219.c               |    1 -
>  drivers/usb/host/ehci-orion.c                      |   38 ++++++++++++++++++--
>  14 files changed, 58 insertions(+), 14 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/usb/ehci-orion.txt

Applied to:

git://git.infradead.org/users/jcooper/linux.git kirkwood/dt

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
