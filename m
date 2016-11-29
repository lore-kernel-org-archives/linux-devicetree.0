From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: Add symlinks for cros-ec-keyboard and cros-ec-sbs
Date: Tue, 29 Nov 2016 10:16:44 +0100
Message-ID: <3849737.6EZ01tNVi6@diego>
References: <1463090530-21864-1-git-send-email-dianders@chromium.org> <20161128235132.GA71295@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161128235132.GA71295-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Montag, 28. November 2016, 15:51:35 schrieb Brian Norris:
> Hi Olof, Arnd,
> 
> On Thu, May 12, 2016 at 03:02:10PM -0700, Doug Anderson wrote:
> > We'd like to be able to use the cros-ec-keyboard.dtsi and
> > cros-ec-sbs.dtsi snippets for arm64 devices.  Currently those files live
> > in the arm/boot/dts directory.
> > 
> > Let's follow the convention set by commit 8ee57b8182c4 ("ARM64: dts:
> > vexpress: Use a symlink to vexpress-v2m-rs1.dtsi from arch=arm") and use
> > a symlink.  Note that in this case we put the files in a new
> > "include/common" directory since these snippets may need to be
> > referenced by dts files in many different subdirectories.
> > 
> > Signed-off-by: Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > ---
> > Note that, as of right now, there are no users of this.  However, given
> > development happening it is almost 100% certain that users will arrive
> > soon.  If we need to wait for the first user before landing this we can
> > leave this on the back burner.  If it's OK to have no users (yet), let's
> > land.
> 
> This may not fit your definition of "soon", but I'm looking to start
> using these files in arch/arm64/. I'll probably carry along this patch
> and resend when I'm ready, but it'd be just as well if you'd merge it
> now (or express a preference for a different directory structure).

Till now I was expecting to just pick up this patch as well once the first 
(rk3399-)users arrived. But of course it could also be picked up separately.


> >  arch/arm64/boot/dts/include/common/cros-ec-keyboard.dtsi | 1 +
> >  arch/arm64/boot/dts/include/common/cros-ec-sbs.dtsi      | 1 +
> >  2 files changed, 2 insertions(+)
> >  create mode 120000
> >  arch/arm64/boot/dts/include/common/cros-ec-keyboard.dtsi
> >  create mode 120000 arch/arm64/boot/dts/include/common/cros-ec-sbs.dtsi
> > 
> > \ No newline at end of file
> > 
> > diff --git a/arch/arm64/boot/dts/include/common/cros-ec-keyboard.dtsi
> > b/arch/arm64/boot/dts/include/common/cros-ec-keyboard.dtsi new file mode
> > 120000
> > index 000000000000..1c1889f0a791
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/include/common/cros-ec-keyboard.dtsi
> > @@ -0,0 +1 @@
> > +../../../../../arm/boot/dts/cros-ec-keyboard.dtsi
> > \ No newline at end of file
> > diff --git a/arch/arm64/boot/dts/include/common/cros-ec-sbs.dtsi
> > b/arch/arm64/boot/dts/include/common/cros-ec-sbs.dtsi new file mode
> > 120000
> > index 000000000000..3d7ae9c88bcd
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/include/common/cros-ec-sbs.dtsi
> > @@ -0,0 +1 @@
> > +../../../../../arm/boot/dts/cros-ec-sbs.dtsi
> 
> FWIW:
> 
> Reviewed-by: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

I'm also running with this on my rk3399-gru and it sucessfully enables the 
cros-ec keyboard :-) ,so if anyone picks it up before me they can add

Reviewed-by: Heiko Stueber <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Tested-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
