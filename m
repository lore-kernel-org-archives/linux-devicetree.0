From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: Re: [PATCH v3 00/24] Add support for R40 HDMI pipeline
Date: Wed, 27 Jun 2018 22:25:37 +0200
Message-ID: <4275695.oLYl8XEDF6@jernej-laptop>
References: <20180625120304.7543-1-jernej.skrabec@siol.net> <20180627180215.y5kvvdqeriadxwte@flea> <20180627195043.hfasvppfm2cbudx7@flea>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDQNBWPU7YERBGHGZ7MQKGQEE5HD2II-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180627195043.hfasvppfm2cbudx7@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: wens-jdAy2FN1RRM@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, gustavo-THi1TnShQwVAfugRpC6u6w@public.gmane.org, maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Dne sreda, 27. junij 2018 ob 21:50:43 CEST je Maxime Ripard napisal(a):
> 1;5202;0c
> 
> On Wed, Jun 27, 2018 at 08:02:15PM +0200, Maxime Ripard wrote:
> > On Mon, Jun 25, 2018 at 02:02:40PM +0200, Jernej Skrabec wrote:
> > > This series adds support for R40 HDMI pipeline. It is a bit special
> > > than other already supported pipelines because it has additional unit
> > > called TCON TOP responsible for relationship configuration between
> > > mixers, TCONs and HDMI. Additionally, it has additional gates for DSI
> > > and TV TCONs, TV encoder clock settings and pin muxing between LCD
> > > and TV encoders.
> > > 
> > > However, it seems that TCON TOP will become a norm, since newer
> > > Allwinner SoCs like H6 also have this unit.
> > > 
> > > I tested different possible configurations:
> > > - mixer0 <> TCON-TV0 <> HDMI
> > > - mixer0 <> TCON-TV1 <> HDMI
> > > - mixer1 <> TCON-TV0 <> HDMI
> > > - mixer1 <> TCON-TV1 <> HDMI
> > > 
> > > Please review.
> > 
> > I just applied it. It didn't apply cleanly, so please make sure it
> > does next time, or at least state what the dependencies are.
> 
> And it didn't compile either, because of the compile error that was
> reported to the previous version by kbuild... Those shouldn't be
> ignored and simply fixed.

Sorry about that. I forgot to rebase and had same linux-next base for all 3 
versions.

I actually take a look at that kbuild message, but it just didn't make much 
sense and it worked for me without issues. Merge conflicts would explain that.

Best regards,
Jernej
