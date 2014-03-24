From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH 0/5] Kirkwood DT Documentation
Date: Sun, 23 Mar 2014 20:22:33 -0400
Message-ID: <20140324002233.GZ15608@titan.lakedaemon.net>
References: <1395492360-1865-1-git-send-email-andrew@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1395492360-1865-1-git-send-email-andrew-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Device Tree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

arm-soc maintainers,

On Sat, Mar 22, 2014 at 01:45:55PM +0100, Andrew Lunn wrote:
> This patchset fixes up a number of issues found by checkpatch in the
> kirkwood DT files or binding Documentation. Vendor Prefixes are
> documented, missing prefixes are added, incorrect prefixes are
> corrected, and Kirkwood SoCs are documented.
> 
> Note that some of these patches contain UTF-8 characters, which the
> mailing lists sometime don't like. The patches can also be found in
> 
> https://github.com/lunn/linux.git v3.14-rc7-next-20140321-dt
> 
> which is based on linux-next tag next-20140321.

I'd like to take this in as 'fixes-non-critical' for v3.15.  However,
I'm having trouble finding a stable, conflict-free branch to base it on.
The main problem seems to be vendor-prefixes.txt.

How would you prefer I handle this?  Or, would you guys just like to
take the series directly?  I'm fine either way.

If taking directly,

Acked-by: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>

thx,

Jason.

> Andrew Lunn (5):
>   DT: Vendor: Add prefixes used by Kirkwood devices
>   DT: bindings: add missing Marvell Kirkwood SoC documentation
>   ARM: Kirkwood: Fix Atmel vendor prefix
>   DT: I2C: Add trivial bindings used by kirkwood boards
>   ARM: Kirkwood: DT: Add missing vendor prefix
> 
>  .../devicetree/bindings/arm/marvell,kirkwood.txt   | 97 ++++++++++++++++++++++
>  .../devicetree/bindings/i2c/trivial-devices.txt    | 16 ++++
>  .../devicetree/bindings/vendor-prefixes.txt        | 13 ++-
>  arch/arm/boot/dts/kirkwood-b3.dts                  |  2 +-
>  arch/arm/boot/dts/kirkwood-cloudbox.dts            |  2 +-
>  arch/arm/boot/dts/kirkwood-dreamplug.dts           |  2 +-
>  arch/arm/boot/dts/kirkwood-laplug.dts              |  2 +-
>  arch/arm/boot/dts/kirkwood-mv88f6281gtw-ge.dts     |  2 +-
>  arch/arm/boot/dts/kirkwood-ns2-common.dtsi         |  4 +-
>  arch/arm/boot/dts/kirkwood-nsa310.dts              |  2 +-
>  arch/arm/boot/dts/kirkwood-nsa310a.dts             |  2 +-
>  arch/arm/boot/dts/kirkwood-openblocks_a6.dts       |  2 +-
>  arch/arm/boot/dts/kirkwood-openblocks_a7.dts       |  2 +-
>  13 files changed, 136 insertions(+), 12 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/arm/marvell,kirkwood.txt
> 
> -- 
> 1.9.1
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
