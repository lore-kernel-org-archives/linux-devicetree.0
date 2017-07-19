From: Yong <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH RFC 2/2] dt-bindings: add binding documentation for
 Allwinner CSI
Date: Wed, 19 Jul 2017 15:00:38 +0800
Message-ID: <20170719150038.f43e701ad2bb31fbe54e12a2@magewell.com>
References: <1498561654-14658-1-git-send-email-yong.deng@magewell.com>
        <1498561654-14658-3-git-send-email-yong.deng@magewell.com>
        <20170718115530.ssy7g5vv4siqnfpo@tarshish>
        <20170719092249.2fb6ec720ba1b194cea320c8@magewell.com>
        <20170719044923.yae2ye4slvrmtyfe@sapphire.tkos.co.il>
        <20170719142120.d00469cf9fce844d40b9988e@magewell.com>
        <20170719063349.m5yg4n2radkvy74r@sapphire.tkos.co.il>
        <20170719065019.sc2xivtm4d77vrzw@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170719065019.sc2xivtm4d77vrzw@flea>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org, peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, hugues.fruchet-qxv4g6HH51o@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, kamil-MZ2JYD8fkKLYtjvyW6yDsg@public.gmane.org, kieran+renesas-7hKh/agyDeatmTQ+vhA3Yw@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 19 Jul 2017 08:50:19 +0200
Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:

> On Wed, Jul 19, 2017 at 09:33:49AM +0300, Baruch Siach wrote:
> > Hi Yong,
> > 
> > On Wed, Jul 19, 2017 at 02:21:20PM +0800, Yong wrote:
> > > On Wed, 19 Jul 2017 07:49:23 +0300
> > > Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org> wrote:
> > > > On Wed, Jul 19, 2017 at 09:22:49AM +0800, Yong wrote:
> > > > > I am waiting for more comments for the sunxi-csi.h. It's pleasure if
> > > > > you have any suggestions about it.
> > > > 
> > > > You mean sunxi_csi.h, right?
> > > 
> > > Yes. My spelling mistake.
> > > 
> > > > Why do you need the sunxi_csi_ops indirection? Do you expect to add 
> > > > alternative implementations of these ops at some point?
> > > 
> > > I want to seperate the sunxi_video.c and sunxi_csi_v3s.c. 
> > > sunxi_csi_v3s.c is Soc specific. Maybe there will be sunxi_csi_r40.c
> > > in the futrue. But the sunxi_video.c and sunxi_csi.c are common.
> > 
> > I'd say it is a premature optimization. The file separation is fine, IMO, but 
> > the added csi_ops indirection makes the code less readable. Someone with 
> > access to R40 hardware with CSI setup would be a better position to abstract 
> > the platform specific code.
> 
> I agree

Well, I made things complicated.
So, the initial version is just to make V3s CSI working.
Beside csi_ops, are there some comments for sunxi_csi_v3s.c? I will
send a new version in the next few days.

> 
> Maxime
> 
> -- 
> Maxime Ripard, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com


Thanks,
Yong
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
