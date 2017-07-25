From: Adam Borowski <kilobyte-b9QjgO8OEXPVItvQsEIGlw@public.gmane.org>
Subject: Re: [PATCH 0/3] Add ethernet0 alias for several A64 boards
Date: Tue, 25 Jul 2017 05:18:19 +0200
Message-ID: <20170725031819.ryllvq5a3tdwyblj@angband.pl>
References: <20170722022852.7868-1-icenowy@aosc.io>
 <20170724075823.7ttjq4tnvoupo776@flea>
 <f4016e61dbe4655a0e672c3377f35dd2@aosc.io>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <f4016e61dbe4655a0e672c3377f35dd2-h8G6r0blFSE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: icenowy-h8G6r0blFSE@public.gmane.org
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 25, 2017 at 11:04:24AM +0800, icenowy-h8G6r0blFSE@public.gmane.org wrote:
> 在 2017-07-24 15:58，Maxime Ripard 写道：
> > On Sat, Jul 22, 2017 at 10:28:49AM +0800, Icenowy Zheng wrote:
> > > Allwinner A64 SoC has an EMAC which is used to provide Ethernet
> > > function on several boards.
> > > 
> > > The EMAC itself doesn't have a fixed MAC address, but the sunxi
> > > mainline U-Boot have the ability to generate one based on the eFUSE
> > > SID in the chip, and add the generated MAC address to the device
> > > tree when booting.
> > > 
> > > The MAC address setting step is based on the device tree's aliases,
> > > and device tree nodes prefixed "ethernet" will get the MAC address
> > > added. However, in several A64 boards' device tree, the alias is not
> > > set up, so that the U-Boot won't set the MAC address.
> > > 
> > > Add the ethernet0 aliases to these boards.
> > > 
> > > I hope this patchset can be queued in 4.13, otherwise 4.13 kernels
> > > won't get non-volatile MAC addresses, and will use random ones
> > > instead, which is annoying to many users.
> > > 
> > > Icenowy Zheng (3):
> > >   arm64: allwinner: a64: add ethernet0 alias for BPi M64 EMAC node
> > >   arm64: allwinner: a64: add ethernet0 alias for Pine64 EMAC node
> > >   arm64: allwinner: a64: add ethernet0 alias for SoPine EMAC node
> > 
> > Applied all three, thanks!
> 
> Sorry, but could you queue them to 4.13?
> 
> Otherwise 4.13 kernel release will have annoying random MAC problem,
> which heavily affects headless usages.

Perhaps it would be better to reword the commit subject as "fix missing
ethernet0 alias ..."?  That'd convey that the previous behaviour is a defect
that needs these patches as a fix.


Meow!
-- 
// If you believe in so-called "intellectual property", please immediately
// cease using counterfeit alphabets.  Instead, contact the nearest temple
// of Amon, whose priests will provide you with scribal services for all
// your writing needs, for Reasonable and Non-Discriminatory prices.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
