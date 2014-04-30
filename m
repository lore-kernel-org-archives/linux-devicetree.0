From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH 00/15] Kirkwood DT fix and cleanup round 1
Date: Wed, 30 Apr 2014 18:49:04 +0200
Message-ID: <20140430164904.GC3082@lunn.ch>
References: <1398862602-29595-1-git-send-email-sebastian.hesselbarth@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1398862602-29595-1-git-send-email-sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Apr 30, 2014 at 02:56:27PM +0200, Sebastian Hesselbarth wrote:
> This is a patch set starting Kirkwood DT cleanup since over time some
> cleanup potential piled up on it. Also, now that Barebox is going to
> reuse the same DT code basis, we need some lowlevel property
> improvements, that we ignore(d) on Linux up to now.
> 
> The patches are based on recent mvebu/dt to ease integration by Jason
> since there are some Kirkwood dts related patches already queued up
> for v3.16.
> 
> The first patch is a real fix and should be treated accordingly. We
> moved pcie-controller nodes to mbus node a while ago. Somehow, we missed
> two boards that should have broken pcie since then. A formal Tested-by
> would be nice by someone who has one of the affected boards.
> 
> Basically, cleanup patches 2-13 up to now comprise:
> - Patch 2 adds node labels for all common and SoC-specific nodes to ease
>   further cleanup series I have in mind:
>   MVEBU maintainers will know, current ocp@f1000000 isn't really correct
>   but should be moved to mbus/internal-regs instead. Unfortunately, there
>   are some 40+ boards replaying ocp bus node. 
>   I _plan_ to convert boards ocp nodes to node label references in
>   subsequent patch sets to finally move the ocp bus nodes to
>   mbus/internal-regs more easily.
> - Patch 3 adds stdout-path to all boards with ttyS0 bootargs:
>   Linux currently doesn't really care about stdout-path property set, but
>   Barebox does. ePAPR explicitly names it, so set it now and ease Barebox
>   progress at least.
> - Patch 4 removes clock-frequency from UART nodes:
>   Back when we didn't have DT clock providers for Kirkwood, TCLK was
>   spread over UART nodes in board files. Just remove the now unnecessary
>   clock-frequency property, as we reference TCLK in the SoCs UART nodes.
> - Patches 5-7 consolidate common pinctrl settings:
>   First, rename the pinctrl node to a more appropriate name as recommended
>   by ePAPR, then add a minimal stub to the toplevel SoC DT include. That
>   stub then gets filled with common pinctrl settings that are currently
>   spead over SoC-specific includes or even board files. Again, this also
>   eases Barebox progress, as pinctrl for a bootloader is a really
>   important property.
> - Patches 8-13 set default pinctrl properties for some nodes:
>   With pinctrl settings in common SoC DT, we can now reference them in the
>   device nodes also located there. If there are other possible pinctrl
>   settings, put a note in front of the corresponding pinctrl node and
>   overwrite the pinctrl setting in the board file.
> - Patches 14 and 15 set some lowlevel properties for Guruplug ethernet:
>   While working with Barebox, I noticed missing phy-connection-type
>   and non-standard PHY's compatible on Guruplug. This also applies to
>   most of the other boards, but Guruplug is the only board I use Barebox
>   on and have the required information.
> 
> Overall commit stats aren't as bad as I initially thought:
> 218 insertions and 300 deletions still is ~25% less LOC :)

Hi Sebastian

Apart from the one patch i raised a question about:

Acked-by: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>

Over the weekend i will try to do some testing with the hardware i
have.

	Thanks
		Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
