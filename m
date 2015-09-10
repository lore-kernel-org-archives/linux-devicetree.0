From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: Re: [PATCH] ARM: dts: sun4i: Add dts file for the
 pov protab2-ips9 tablet
Date: Thu, 10 Sep 2015 15:56:10 +0200
Message-ID: <20150910135610.GI9885@lukather>
References: <1441441319-10658-1-git-send-email-hdegoede@redhat.com>
 <20150906163023.GR31584@lukather>
 <55ED3739.609@redhat.com>
 <1441612142.14422.34.camel@plaes.org>
 <55ED4F8F.6080502@redhat.com>
 <1441617262.21530.4.camel@plaes.org>
 <55ED591B.7050705@redhat.com>
 <20150907205216.GW31584@lukather>
 <55EE92E0.1010805@redhat.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="svExV93C05KqedWb"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRB64XY2XQKGQERRIOUQI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <55EE92E0.1010805-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--svExV93C05KqedWb
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Tue, Sep 08, 2015 at 09:48:48AM +0200, Hans de Goede wrote:
> Hi,
> 
> On 07-09-15 22:52, Maxime Ripard wrote:
> >Hi,
> >
> >On Mon, Sep 07, 2015 at 11:30:03AM +0200, Hans de Goede wrote:
> >>>>>bma250 already has devicetree support. It is used in Gemei G9
> >>>>>tablet (sun4i-gemei-g9.dts).
> >>>>
> >>>>Yes I've seen that, but does it actually work? I've not tried but
> >>>>I do not see any compatible string in the actual bma250 code in
> >>>>the kernel, so I believe that this part of the sun4i-gemei-g9.dts
> >>>>file does not work ?
> >>>
> >>>It worked (even without IRQs) when I submitted the patch. Driver
> >>>itself is under iio/accel/bma180.c
> >>
> >>That is really weird, because:
> >>
> >>https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/drivers/iio/accel/bma180.c
> >>
> >>Does not have an of_match_table ... ??
> >
> >Not really, when using DT, i2c will set the i2c_client name to the
> >device part of the compatible [1] [2], and then if the of_device_id
> >lookup fails, will fallback to matching the i2c_client name to the
> >i2c_device_id [3]. Which in our case matches.
> >
> >Maxime
> >
> >[1] http://lxr.free-electrons.com/source/drivers/i2c/i2c-core.c#L1281
> >[2] http://lxr.free-electrons.com/source/drivers/i2c/i2c-core.c#L969
> >[3] http://lxr.free-electrons.com/source/drivers/i2c/i2c-core.c#L461
> 
> Hmm, not sure whether that is a useful feature or an ugly hack :)

Don't shoot the messenger :)

But I don't know either.

> It is sorta unexpected either way. But I can make good use of this to
> enable the accelerometer and maybe also some touchscreens on a bunch of
> boards I have.
> 
> Still should we rely on this? This means relying on Linux kernel behavior,
> rather then something documented in Documentation/devicetree/bindings/...

AFAIK, the behaviour isn't going away, there's been a few patches to
remove the need for i2c_device_id, and they've all been nacked, so I'd
say we can use it as is.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--svExV93C05KqedWb--
