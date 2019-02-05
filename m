From: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [PATCH RESEND v2 08/12] dt-bindings: add binding
 for generic eDP panel
Date: Tue, 5 Feb 2019 17:36:49 +0100
Message-ID: <20190205163649.GG3271@phenom.ffwll.local>
References: <20190203185501.8958-9-anarsoul@gmail.com>
 <20190204074350.GC16448@ulmo>
 <CA+E=qVecudACOEXt74Kf=UA_F-uuHgEqHzKpYAq1ocMx3Sx+eQ@mail.gmail.com>
 <20190204082353.GE19087@ulmo>
 <20190204094012.GP3271@phenom.ffwll.local>
 <20190204112218.GB10412@ulmo>
 <20190204155909.GU3271@phenom.ffwll.local>
 <20190204162258.GB25476@ulmo>
 <20190205085737.GY3271@phenom.ffwll.local>
 <20190205102419.GA591@ulmo>
Reply-To: daniel-/w4YWyX8dFk@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDYZDG4VSMIRBJXX43RAKGQE4TKBDSY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20190205102419.GA591@ulmo>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Laurent Pinchart <Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, arm-linux <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 05, 2019 at 11:24:19AM +0100, Thierry Reding wrote:
> On Tue, Feb 05, 2019 at 09:57:37AM +0100, Daniel Vetter wrote:
> > On Mon, Feb 04, 2019 at 05:22:58PM +0100, Thierry Reding wrote:
> > > On Mon, Feb 04, 2019 at 04:59:09PM +0100, Daniel Vetter wrote:
> > > > On Mon, Feb 04, 2019 at 12:22:18PM +0100, Thierry Reding wrote:
> > > > > On Mon, Feb 04, 2019 at 10:40:12AM +0100, Daniel Vetter wrote:
> > > > > > On Mon, Feb 04, 2019 at 09:23:59AM +0100, Thierry Reding wrote:
> > > > > > > On Mon, Feb 04, 2019 at 12:13:55AM -0800, Vasily Khoruzhick wrote:
> > > > > > > > On Sun, Feb 3, 2019 at 11:43 PM Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > > > > > > > >
> > > > > > > > > On Sun, Feb 03, 2019 at 10:54:57AM -0800, Vasily Khoruzhick wrote:
> > > > > > > > > > eDP panels usually have EDID EEPROM, so there's no need to define panel
> > > > > > > > > > width/height or any modes/timings in dts. But this panel still may have
> > > > > > > > > > regulator and/or backlight.
> > > > > > > > > >
> > > > > > > > > > Signed-off-by: Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > > > > > > > > > ---
> > > > > > > > > >  .../devicetree/bindings/display/panel/panel-edp.txt        | 7 +++++++
> > > > > > > > > >  1 file changed, 7 insertions(+)
> > > > > > > > > >  create mode 100644 Documentation/devicetree/bindings/display/panel/panel-edp.txt
> > > > > > > > >
> > > > > > > > > Please don't try to make panels look more generic than they really are.
> > > > > > > > > You're going to have to provide a compatible string for your device that
> > > > > > > > > is more specific than "panel-edp". You claim that you don't need any
> > > > > > > > > extra information that is panel specific, but you don't know that now.
> > > > > > > > > We have in the past thought that we didn't need things like prepare
> > > > > > > > > delay, but then we ran into situations where we did need them.
> > > > > > > > >
> > > > > > > > > Just do what everybody else does. Provide a specific compatible string
> > > > > > > > > and match on that in the panel-simple driver. Even if you can read all
> > > > > > > > > the video timings from an EDID EEPROM, you can still provide a mode in
> > > > > > > > > the panel descriptor to serve as a fallback if for example the EEPROM
> > > > > > > > > is faulty on some device.
> > > > > > > > 
> > > > > > > > Pinebook used several 768p panels that have slightly different timings
> > > > > > > > and recent batch uses 1080p panel.
> > > > > > > > 
> > > > > > > > What panel descriptor should I use as fallback?
> > > > > > > 
> > > > > > > You don't use panel descriptors as fallback. The simple-panel driver
> > > > > > > will bind to a panel device and use the corresponding descriptor. If
> > > > > > > your device tree contains the correct information, the descriptor is
> > > > > > > correct for the panel you have.
> > > > > > > 
> > > > > > > In other words you need to ensure that you have the correct panel in
> > > > > > > device tree for the board that you're using. This is exactly the same
> > > > > > > thing as for other devices.
> > > > > > > 
> > > > > > > One way to to this is to have separate device trees for each variant
> > > > > > > of the board that you want to support. Another variant may be to have
> > > > > > > a common device tree and then have some early firmware update the DTB
> > > > > > > with the correct panel information.
> > > > > > 
> > > > > > This would defeat the point of edp, which is to standardize the mess of
> > > > > > panels (at least somewhat) and avoid having to change the DT/ACPI
> > > > > > tables/firmware for every board you ship. Also, we do have DP quirking
> > > > > > infrastructure already (using the OUI), I think if there's something that
> > > > > > doesn't work then we should quirk it there.
> > > > > 
> > > > > The problem is that while the attempt may have been to standardize, it
> > > > > failed. It doesn't take into account any of the details such as timing
> > > > > between things like powering up the display and enabling the backlight
> > > > > or similar. I don't know how you'd want to "quirk" those kinds of
> > > > > requirements because they are highly panel specific.
> > > > 
> > > > Hm right, we get these from some firmware tables (and mix them with the
> > > > spec one, since some of the firmware values are nonsense). I don't even
> > > > know whether we can read the timings over dp aux somehow (you can power up
> > > > the panel with some pessimistic values to figure those out, and you only
> > > > need dp aux to work, which is much simpler than the entire panel).
> > > > 
> > > > > > What does make sense though imo is if we try not to stuff the edp panel
> > > > > > into panel-simple, because it's anything like a simple dumb panel. There's
> > > > > > also some integration awkwardness since with this panel you need to do dp
> > > > > > aux/i2c transactions to get at the information (edid alone isn't good
> > > > > > enough for edp), and I'm not sure how exactly that's supposed to be
> > > > > > instantiated. Maybe a special function to instantiate an edp panel, which
> > > > > > takes both a DT node and the dp_aux controller would be much better,
> > > > > > instead of trying to auto-match against a DT compatible string and load a
> > > > > > panel driver which is almost all fake.
> > > > > > 
> > > > > > Or we teach dp_aux to register itself and somehow teach panel-edp how it
> > > > > > can get hold of the dp_aux channel it needs.
> > > > > 
> > > > > We already do that. drm_dp_aux registers as an I2C adapter that can be
> > > > > used to read EDID EEPROMs using I2C-over-AUX transactions. We already
> > > > > use that on some platforms.
> > > > > 
> > > > > Also note that simple-panel already supports getting video timings from
> > > > > EDID. If a DDC link is present in DT, the driver will load the modes
> > > > > from EDID and use them.
> > > > 
> > > > Could we extend this to dp aux somehow? For edp you need the dp aux (which
> > > > then gives you the ddc link automatically).
> > > 
> > > I suppose we could do that. We could introduce a new property that would
> > > allow the panel driver to get at the struct drm_dp_aux that can access
> > > the panel. I'm not sure how much that would buy us. I suppose the driver
> > > could go and use that drm_dp_aux to do I2C-over-AUX and ignore any
> > > ddc-bus property in device tree. A drm_dp_aux object could also be used
> > > to access DPCD if that's helpful.
> > > 
> > > The driver proposed here doesn't need access to DPCD, so I'm not sure
> > > that would immediately help.
> > 
> > You definitely need dp aux to drive edp. That's where a lot of the really
> > important stuff is stored, and it sounds like on non-broken panels even
> > the timings (we've never implemented that on i915 somehow).
> 
> I'm not sure I understand what you're saying here. I haven't worked with
> eDP panels in a while, but my recollection is that you can use DP AUX to
> read video timings over EDID. We provide support for that by exporting a
> DP AUX controller as I2C adapter (i.e. register with the I2C subsystem)
> and then that I2C adapter can be used to read the EDID. I wasn't aware
> that eDP panels additionally stored the video timings somewhere else.

I didn't know either, but understood Vasily's comment that this is
possible. Haven't dug around in the specs though.

> What I meant above was that aside from the I2C-over-AUX for reading the
> EDID, this driver doesn't do anything else with DP AUX in order to turn
> the panel on. Looking at the eDP support we have on Tegra, there's a
> DPCD register (DP_SET_POWER) that needs to be written in order to take
> the sink device (i.e. panel) out of the power saving state. We do that
> as part of the connector implementation rather than within the panel
> driver. There are also additional registers such as DP_LINK_BW_SET that
> need to be programmed. I think this is also relevant to regular DP and
> detailed in the specification.
> 
> Given all the above, I'm beginning to think that Rob's right in that
> perhaps we shouldn't be treating eDP panels as panels, but rather to
> make them look more like DP monitors and make all this code part of the
> connector implementation. I think pretty much the only differences to
> regular DP are that we might require some lower-level resources that a
> DP monitor would usually have built-in (reset or power GPIOs, power
> supplies, backlight, ...).
> 
> I'm not sure if that's enough for eDP panels, though. For example the
> AUO B133HTN01 panel, used by the exynos5800-peach-pi, seems to be an eDP
> panel. But the driver also specifies a couple of additional delays which
> suggests that either it violates the eDP specification or that the eDP
> specification doesn't define any power sequencing delays that would've
> been needed. Or perhaps these delays are specified somewhere and the
> driver just doesn't use them?

I honestly don't know, but gut feeling also goes towards making edp
something else than a dumb panel. There's a lot of stuff you need to do
that overlaps with normal DP sinks, plus there's a lot of stuff (but not
everything, or at least it needs some quirking sometimes) that you're
supposed to autodiscover. But I'm not sure what's the best solution really
is, since for i915 all the quirking we need is in some i915-specific
tables (and I'm not even sure how much of that quirking is really
necessary, and how much just convenience for us because the fw already did
the hard work of poking the information out of the panel).
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
