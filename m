From: "Mohammed, Afzal" <afzal-l0cyMroinI0@public.gmane.org>
Subject: RE: [PATCHv16 5/7] fbmon: add of_videomode helpers
Date: Mon, 7 Jan 2013 08:46:41 +0000
Message-ID: <C8443D0743D26F4388EA172BF4E2A7A93EA7FBF7@DBDE01.ent.ti.com>
References: <1355850256-16135-1-git-send-email-s.trumtrar@pengutronix.de>
 <1355850256-16135-6-git-send-email-s.trumtrar@pengutronix.de>
 <C8443D0743D26F4388EA172BF4E2A7A93EA7FB02@DBDE01.ent.ti.com>
 <20130107080648.GB23478@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130107080648.GB23478-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: "linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Florian Tobias Schandinat <FlorianSchandinat-Mmb7MZpHnFY@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "Valkeinen, Tomi" <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Guennady Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>, "linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Steffen,

On Mon, Jan 07, 2013 at 13:36:48, Steffen Trumtrar wrote:
> On Mon, Jan 07, 2013 at 06:10:13AM +0000, Mohammed, Afzal wrote:

> > This breaks DaVinci (da8xx_omapl_defconfig), following change was
> > required to get it build if OF_VIDEOMODE or/and FB_MODE_HELPERS
> > is not defined. There may be better solutions, following was the
> > one that was used by me to test this series.

> I just did a quick "make da8xx_omapl_defconfig && make" and it builds just fine.
> On what version did you apply the series?
> At the moment I have the series sitting on 3.7. Didn't try any 3.8-rcx yet.
> But fixing this shouldn't be a problem.

You are right, me idiot, error will happen only upon try to make use of
of_get_fb_videomode() (defined in this patch) in the da8xx-fb driver
(with da8xx_omapl_defconfig), to be exact upon adding,

"video: da8xx-fb: obtain fb_videomode info from dt" of my patch series.

The change as I mentioned or something similar would be required as
any driver that is going to make use of of_get_fb_videomode() would
break if CONFIG_OF_VIDEOMODE or CONFIG_FB_MODE_HELPERS is not defined.

And testing was done over v3.8-rc2.

> > > +#if IS_ENABLED(CONFIG_OF_VIDEOMODE)
> > 
> > As _OF_VIDEOMODE is a bool type CONFIG, isn't,
> > 
> > #ifdef CONFIG_OF_VIDEOMODE
> > 
> > sufficient ?
> > 
> 
> Yes, that is right. But I think IS_ENABLED is the preferred way to do it, isn't it?

Now I realize it is.

Regards
Afzal
