From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: Re: [PATCH v2 00/18] Allwinner R40 HDMI refactoring
Date: Wed, 11 Jul 2018 10:41:54 +0200
Message-ID: <2406320.TaIT7vHipu@jernej-laptop>
References: <20180710203511.18454-1-jernej.skrabec@siol.net> <20180711083036.7attjq4hm5ay5gmn@flea>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDQNBWPU7YERBVMFS7NAKGQEAOKKJEI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180711083036.7attjq4hm5ay5gmn@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: wens-jdAy2FN1RRM@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Dne sreda, 11. julij 2018 ob 10:30:36 CEST je Maxime Ripard napisal(a):
> On Tue, Jul 10, 2018 at 10:34:53PM +0200, Jernej Skrabec wrote:
> > This series fixes several issues found in R40 HDMI patch series after
> > it was applied. Conversation can be found here:
> > http://lists.infradead.org/pipermail/linux-arm-kernel/2018-June/586011.htm
> > l
> > 
> > Patches are based on latest linux-next (next-20180710) and are ordered
> > in such way that they don't break R40 HDMI at any time. Because of that
> > I suggest that whole series goes through drm-misc to preserve that order.
> > 
> > I also tested those patches on H3 to make sure it doesn't break other
> > platforms. However, it would be nice to test for regressions also on
> > older SoCs (with DE1).
> > 
> > Best regards,
> > Jernej
> 
> Applied all patches but the patch 10, thanks!
> Maxime

Ok, I'll send patch 10 separately. However,  patch 4 needs a fix according to 
test build robot:

if (IS_ERR_VALUE(index))
should be:
if (index < 0)

Additionally, due to Arnds patch merged (drm/sun4i: fix build failure with 
CONFIG_DRM_SUN8I_MIXER=m), sun4i_tcon.c needs additional handling if TCON_TOP 
driver is not build.

Best regards,
Jernej
