From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/5] arm: mvebu: Add device tree for 98DX3236 SoCs
Date: Thu, 22 Dec 2016 16:53:08 -0600
Message-ID: <20161222225308.4npzerakj2axmbuw@rob-hp-laptop>
References: <20161222041328.3303-1-chris.packham@alliedtelesis.co.nz>
 <20161222041328.3303-5-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161222041328.3303-5-chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Dec 22, 2016 at 05:13:27PM +1300, Chris Packham wrote:
> The Marvell 98DX3236, 98DX3336, 98DX4521 and variants are switch ASICs
> with integrated CPUs. They are similar to the Armada XP SoCs but have
> different I/O interfaces.
> 
> Signed-off-by: Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
> ---
>  .../devicetree/bindings/arm/marvell/98dx3236.txt   |  10 +
>  arch/arm/boot/dts/armada-xp-98dx3236.dtsi          | 231 +++++++++++++++++++++
>  arch/arm/boot/dts/armada-xp-98dx3336.dtsi          |  78 +++++++
>  arch/arm/boot/dts/armada-xp-98dx4251.dtsi          |  78 +++++++
>  4 files changed, 397 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/marvell/98dx3236.txt
>  create mode 100644 arch/arm/boot/dts/armada-xp-98dx3236.dtsi
>  create mode 100644 arch/arm/boot/dts/armada-xp-98dx3336.dtsi
>  create mode 100644 arch/arm/boot/dts/armada-xp-98dx4251.dtsi
> 
> diff --git a/Documentation/devicetree/bindings/arm/marvell/98dx3236.txt b/Documentation/devicetree/bindings/arm/marvell/98dx3236.txt
> new file mode 100644
> index 000000000000..e7dc9b2dd90b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/marvell/98dx3236.txt
> @@ -0,0 +1,10 @@
> +Marvell 98DX3236, 98DX3336 and 98DX4251 Platforms Device Tree Bindings
> +----------------------------------------------------------------------
> +
> +Boards with a SoC of the Marvell 98DX3236, 98DX3336 and 98DX4251 families
> +shall have the following property:
> +
> +Required root node property:
> +
> +compatible: one of "marvell,armadaxp-98dx3236", "marvell,armadaxp-98dx3336"
> +            or "marvell,armadaxp-98dx4251"

The 3336 and 4251 are compatible with 3236 according to the dts files. 
That needs to be expressed here.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
