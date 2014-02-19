From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] of: give priority to the compatible match in
 __of_match_node()
Date: Wed, 19 Feb 2014 12:57:34 -0600
Message-ID: <1392836254.6733.796.camel@snotra.buserror.net>
References: <1392205084-2351-1-git-send-email-haokexin@gmail.com>
	 <CAL_JsqKMi2H=vwoxrOt8QRA2xJeiLqBKKfLtt4QRCRoFk6JUHg@mail.gmail.com>
	 <CAP=VYLr7hqnzW2HLS4GCMFeghCgPmrQZHYst+AUfZc_WNT-Wog@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAP=VYLr7hqnzW2HLS4GCMFeghCgPmrQZHYst+AUfZc_WNT-Wog-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kevin Hao <haokexin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Chris Proctor <cproctor-znpAAEhiOVUQrrorzV6ljw@public.gmane.org>, Stephen N Chivers <schivers-znpAAEhiOVUQrrorzV6ljw@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2014-02-19 at 13:25 -0500, Paul Gortmaker wrote:
> On Thu, Feb 13, 2014 at 2:01 PM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > On Wed, Feb 12, 2014 at 5:38 AM, Kevin Hao <haokexin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >> When the device node do have a compatible property, we definitely
> >> prefer the compatible match besides the type and name. Only if
> >> there is no such a match, we then consider the candidate which
> >> doesn't have compatible entry but do match the type or name with
> >> the device node.
> >>
> >> This is based on a patch from Sebastian Hesselbarth.
> >>   http://patchwork.ozlabs.org/patch/319434/
> >>
> >> I did some code refactoring and also fixed a bug in the original patch.
> >
> > I'm inclined to just revert this once again and avoid possibly
> > breaking yet another platform.
> 
> Well, for what it is worth, today's (Feb19th) linux-next tree fails to boot
> on my sbc8548.   It fails with:
> -----------------------------------------------
> libphy: Freescale PowerQUICC MII Bus: probed
> mdio_bus ethernet@e002400: /soc8548@e0000000/ethernet@24000/mdio@520
> PHY address 1312 is too large
> libphy: Freescale PowerQUICC MII Bus: probed
> libphy: Freescale PowerQUICC MII Bus: probed
> mdio_bus ethernet@e002500: /soc8548@e0000000/ethernet@25000/mdio@520
> PHY address 1312 is too large
> libphy: Freescale PowerQUICC MII Bus: probed
> TCP: cubic registered
> Initializing XFRM netlink socket
> NET: Registered protocol family 17
> <fail nfs mount>
> -----------------------------------------------
> 
> On a normal boot, we should see this:
> -----------------------------------------------
> libphy: Freescale PowerQUICC MII Bus: probed
> libphy: Freescale PowerQUICC MII Bus: probed
> fsl-gianfar e0024000.ethernet: enabled errata workarounds, flags: 0x4
> fsl-gianfar e0024000.ethernet eth0: mac: 02:e0:0c:00:05:fd
> fsl-gianfar e0024000.ethernet eth0: Running with NAPI enabled
> fsl-gianfar e0024000.ethernet eth0: RX BD ring size for Q[0]: 256
> fsl-gianfar e0024000.ethernet eth0: TX BD ring size for Q[0]: 256
> fsl-gianfar e0025000.ethernet: enabled errata workarounds, flags: 0x4
> fsl-gianfar e0025000.ethernet eth1: mac: 02:e0:0c:00:06:fd
> fsl-gianfar e0025000.ethernet eth1: Running with NAPI enabled
> fsl-gianfar e0025000.ethernet eth1: RX BD ring size for Q[0]: 256
> fsl-gianfar e0025000.ethernet eth1: TX BD ring size for Q[0]: 256
> TCP: cubic registered
> Initializing XFRM netlink socket
> NET: Registered protocol family 17
> -----------------------------------------------
> 
> 
> Git bisect says:
> 
> ee8b26ad943aa34acc03ae6cde2b81d8d3d483d4 is the first bad commit
> commit ee8b26ad943aa34acc03ae6cde2b81d8d3d483d4
> Author: Kevin Hao <haokexin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Date:   Tue Feb 18 15:57:30 2014 +0800
> 
>     of: reimplement the matching method for __of_match_node()
> 
>     In the current implementation of __of_match_node(), it will compare
>     each given match entry against all the node's compatible strings
>     with of_device_is_compatible().
> 
>     To achieve multiple compatible strings per node with ordering from
>     specific to generic, this requires given matches to be ordered from
>     specific to generic. For most of the drivers this is not true and
>     also an alphabetical ordering is more sane there.
> 
>     Therefore, we define a following priority order for the match, and
>     then scan all the entries to find the best match.
>       1. specific compatible && type && name
>       2. specific compatible && type
>       3. specific compatible && name
>       4. specific compatible
>       5. general compatible && type && name
>       6. general compatible && type
>       7. general compatible && name
>       8. general compatible
>       9. type && name
>       10. type
>       11. name
> 
>     This is based on some pseudo-codes provided by Grant Likely.
> 
>     Signed-off-by: Kevin Hao <haokexin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>     [grant.likely: Changed multiplier to 4 which makes more sense]
>     Signed-off-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> 
> :040000 040000 8f5dd19174417aece63b308ff299a5dbe2efa5a0
> 8401b0e3903e23e973845ee75b26b04345d803d2 M      drivers
> 
> As a double check, I checked out the head of linux-next, and did a
> revert of the above commit, and my sbc8548 can then boot properly.
> 
> Not doing anything fancy ; using the defconfig exactly as-is, and
> ensuring the dtb is fresh from linux-next HEAD of today.

It looks like the new matching function doesn't check the validity of
the entire match (i.e. everything specified must match the node) before
scoring it.

The ethernet driver has this match (among others):
        {
                .type = "network",
                .compatible = "gianfar",
        },

...while the mdio driver has this match (among others):

        {
                .type = "mdio",
                .compatible = "gianfar", 
                .data = &(struct fsl_pq_mdio_data) {
                        .mii_offset = offsetof(struct fsl_pq_mdio, mii),
                        .get_tbipa = get_gfar_tbipa,
                },
        },

(Yes, it's an awful device tree binding.)

It seems that the ethernet device is being bound to the mdio driver due
to the compatible match, even though type differs.

You could also end up with a .type and/or .name based match,
despite .compatible being present an a mismatch.

-Scott


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
