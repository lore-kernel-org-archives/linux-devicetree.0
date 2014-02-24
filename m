From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH 00/10] pinctrl: mvebu: remove hard-coded addresses from
 Dove pinctrl
Date: Mon, 24 Feb 2014 13:10:23 -0500
Message-ID: <20140224181023.GA1010@titan.lakedaemon.net>
References: <1393231382-11078-1-git-send-email-sebastian.hesselbarth@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1393231382-11078-1-git-send-email-sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Sebastian, Linus,

I've now created mvebu/pinctrl-dove for this series.  It's based on
v3.14-rc1, and depends on mvebu/pinctrl (which depends on
mvebu/pinctrl-3xx).

I've kept this series in a separate branch in case we encounter an
unforeseen problem with something in here.  Then this branch can be
dropped, and /pinctrl-3xx and /pinctrl will still make it in.

So, all patches except 3 and 4 are in mvebu/pinctrl-dove.  3 and 4 are
in mvebu/dt.

thx,

Jason.

On Mon, Feb 24, 2014 at 09:42:52AM +0100, Sebastian Hesselbarth wrote:
> This is a patches separated from one sent earlier [1] with just the
> removal of any hard-coded reg addresses from Dove pinctrl stub. This
> is a required step for Dove to leave mach-dove, hop into mach-mvebu,
> and become part of multi_v7.
> 
> In the meantime, support for new Armada 375/38x was added that also
> contain patches for pinctrl [2]. The cleanup patches [3] split off from
> the original patch set take care of pinctrl-related changes for Armada
> 375/38x. Since this patch set now already depends on Armada 375/38x
> pinctrl through those cleanup patches, we take care of Armada 375/38x
> binding updates here, too.
> 
> For Dove, this patch set removes all hardcoded addresses from
> pinctrl-dove by either requesting additional resources or a syscon
> provided regmap for global config registers. As this changes existing
> driver to DT binding relationship, all additional resources are probed
> in a backward compatible way. If the corresponding resource cannot be
> found, we derive it from the existing pinctrl resource and warn about
> the old DTB firmware.
> 
> Patches 1-2 add or update binding documentation for dove, global config
> syscon, and pinctrl-dove. Patch 2 also documents missing reg property
> requirement for other mvebu pinctrl nodes, including new Armada 375/38x.
> 
> Patch 3 and 4 add the new pinctrl reg property values and global config
> register syscon to exisiting dove.dtsi.
> 
> Patches 5-6 request either additional reg ranges or the syscon regmap
> in a DT-backward compatible way. If any resource cannot be derived from
> DT node, we warn about an old DTB firmware.
> 
> Patches 7-10 finally remove any hardcoded addresses from Dove SoC
> pinctrl driver and use the iomap/regmap resources instead.
> 
> DT and binding related patches have also been sent to DT maintainers
> and corresponding lists, additional pinctrl related patches have been
> sent to pinctrl/mvebu maintainers and LAKML only.
> 
> This patch set is based on v3.14-rc1 and depends on some cleanup patches
> that will go into v3.15. We have a lot of stuff for v3.15 already in
> mvebu, so I am okay with postponing this and/or the following dove-to-
> mvebu patches for v3.16. As Jason prepares mvebu pinctrl PRs for LinusW,
> it is up to him when to take it with LinusW's Acked-by.
> 
> Nevertheless, there is an *unstable* branch based on v3.14-rc1, with
> mvebu/pinctrl-3xx and mvebu/pinctrl merged in at (still named -for-3.15)
> 
> https://github.com/shesselba/linux-dove.git unstable/dove-pinctrl-for-3.15_v1
> 
> [1] http://www.spinics.net/lists/arm-kernel/msg303496.html
> [2] http://www.spinics.net/lists/arm-kernel/msg306409.html
> [3] http://lkml.org/lkml/2014/2/23/43
> 
> Sebastian Hesselbarth (10):
>   devicetree: bindings: add missing Marvell Dove SoC documentation
>   devicetree: bindings: update MVEBU pinctrl binding documentation
>   ARM: dove: add additional pinctrl registers
>   ARM: dove: add global-config register node
>   pinctrl: mvebu: dove: request additional resources
>   pinctrl: mvebu: dove: request syscon regmap for global registers
>   pinctrl: mvebu: dove: use remapped mpp base registers
>   pinctrl: mvebu: dove: use remapped mpp4 register
>   pinctrl: mvebu: dove: use remapped pmu_mpp registers
>   pinctrl: mvebu: dove: use global register regmap
> 
>  .../devicetree/bindings/arm/marvell,dove.txt       |  22 ++
>  .../pinctrl/marvell,armada-370-pinctrl.txt         |   1 +
>  .../pinctrl/marvell,armada-375-pinctrl.txt         |   1 +
>  .../pinctrl/marvell,armada-38x-pinctrl.txt         |   1 +
>  .../bindings/pinctrl/marvell,armada-xp-pinctrl.txt |   1 +
>  .../bindings/pinctrl/marvell,dove-pinctrl.txt      |   1 +
>  .../bindings/pinctrl/marvell,kirkwood-pinctrl.txt  |   1 +
>  .../bindings/pinctrl/marvell,mvebu-pinctrl.txt     |   2 +-
>  arch/arm/boot/dts/dove.dtsi                        |  10 +-
>  drivers/pinctrl/mvebu/Kconfig                      |   1 +
>  drivers/pinctrl/mvebu/pinctrl-dove.c               | 286 +++++++++++++--------
>  11 files changed, 213 insertions(+), 114 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/arm/marvell,dove.txt
> 
> ---
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
> Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> Cc: Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>
> Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
> Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
> Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
> Cc: Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> -- 
> 1.8.5.3
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
