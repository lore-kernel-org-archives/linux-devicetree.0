From: =?UTF-8?Q?=27Ond=C5=99ej_Jirman=27_via_linux=2Dsunxi?= <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Subject: Re: [PATCH v3 06/16] drm/sun4i: Release exclusive clock
 lock when disabling TCON
Date: Fri, 9 Mar 2018 08:55:31 +0100
Message-ID: <20180309075531.jvwo72j4o6k2h7rg@core.my.home>
References: <20180301213442.16677-1-jernej.skrabec@siol.net>
 <20180309001314.bu3zcv5gyqsc52fx@core.my.home>
 <20180309004455.5s2ohse4jpwinre5@core.my.home>
 <2311763.nDsHW3lYFU@jernej-laptop>
Reply-To: megi-DlDF6nMZSto@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBC55PRMWZULRB5X3RDKQKGQEWLROJSY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2311763.nDsHW3lYFU@jernej-laptop>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Cc: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On Fri, Mar 09, 2018 at 07:19:33AM +0100, Jernej =C5=A0krabec wrote:
> Hi,
>=20
> Dne petek, 09. marec 2018 ob 01:44:55 CET je Ond=C5=99ej Jirman napisal(a=
):
> > Hi,
> >=20
> > I've debugged this further and it seems that the code has incorrect
> > assumptions. See docs for mode_set_nofb.
> >=20
> > https://elixir.bootlin.com/linux/v4.16-rc4/source/include/drm/drm_modes=
et_he
> > lper_vtables.h#L209
> >
>=20
> Does this happen with https://github.com/jernejsk/linux-1/tree/h3_hdmi_v3=
 ?

Haven't tested, but it probably does, looking at the code. Try
restarting the X server a bunch of times.

> I also tested running X, but I don't remember having the issue.
> =20
> > I've added traces to a few functions that call clk_.*exclusive.*()
> > functions, and I see this after a few restarts of Xorg server:
> >=20
> > [    0.783842] *** sun4i_tcon1_mode_set()
> > [    0.783886] *** sun4i_tcon_channel_set_status(..., 1, true)
> > [    6.881690] *** sun4i_tcon_channel_set_status(..., 1, false)
> > [    6.881758] *** sun4i_tcon_channel_set_status(..., 1, true)
> > [   52.335085] *** sun4i_tcon_channel_set_status(..., 1, false)
> > [   52.335343] *** sun4i_tcon_channel_set_status(..., 1, true)
> > [   68.921079] *** sun4i_tcon_channel_set_status(..., 1, false)
> > [   68.921337] *** sun4i_tcon_channel_set_status(..., 1, true)
> >=20
> > mode_set_nofb is called just once, yet sun4i_tcon_channel_set_status(..=
., 1,
> > false) is called multiple times, which leads to unbalanced calls to
> > clk_set_rate_exclusive and clk_rate_exclusive_put.
> >=20
> > I don't know how to fix this.
>=20
> Since there is no function to check if clock is protected, flag can be=20
> introduced within TCON which is set when clock rate is protected and unse=
t=20
> when it is unprotected. That way we could track if clk_rate_exclusive_put=
()=20
> needs to be called or not.

I think that will not help. Protection is set in sun4i_tcon1_mode_set()
and that's called only once, but sun4i_tcon_channel_set_status(..., 1, fals=
e)
can be called multiple times, so the first call would disable protection
and the clock would be unprotected from then on, even though the display
would be active.

Perhaps the protection needs to be enabled in sun4i_tcon_channel_set_status=
(...,
true).

regards,
  o.

> Best regards,
> Jernej
>=20
> >=20
> > regards,
> >   o.
> >=20
> > On Fri, Mar 09, 2018 at 01:13:14AM +0100, 'Ond=C5=99ej Jirman' via linu=
x-sunxi=20
> wrote:
> > > Hi Jernej,
> > >=20
> > > On Thu, Mar 08, 2018 at 11:57:40PM +0100, Jernej =C5=A0krabec wrote:
> > > > Hi,
> > > >=20
> > > > Dne =C4=8Detrtek, 08. marec 2018 ob 23:47:17 CET je Ond=C5=99ej Jir=
man napisal(a):
> > > > > Hi,
> > > > >=20
> > > > > On Thu, Mar 01, 2018 at 10:34:32PM +0100, Jernej Skrabec wrote:
> > > > > > Currently exclusive TCON clock lock is never released, which, f=
or
> > > > > > example, prevents changing resolution on HDMI.
> > > > > >=20
> > > > > > In order to fix that, release clock when disabling TCON. TCON i=
s
> > > > > > always
> > > > > > disabled first before new mode is set.
> > > > > >=20
> > > > > > Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
> > > > > > ---
> > > > > >=20
> > > > > >  drivers/gpu/drm/sun4i/sun4i_tcon.c | 6 ++++--
> > > > > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > > > > >=20
> > > > > > diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > > > > > b/drivers/gpu/drm/sun4i/sun4i_tcon.c index
> > > > > > 1d714c06ec9d..7f6c4125c89f
> > > > > > 100644
> > > > > > --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > > > > > +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > > > > > @@ -102,10 +102,12 @@ static void
> > > > > > sun4i_tcon_channel_set_status(struct
> > > > > > sun4i_tcon *tcon, int channel,>
> > > > > >=20
> > > > > >  		return;
> > > > > >  =09
> > > > > >  	}
> > > > > >=20
> > > > > > -	if (enabled)
> > > > > > +	if (enabled) {
> > > > > >=20
> > > > > >  		clk_prepare_enable(clk);
> > > > > >=20
> > > > > > -	else
> > > > > > +	} else {
> > > > > > +		clk_rate_exclusive_put(clk);
> > > > > >=20
> > > > > >  		clk_disable_unprepare(clk);
> > > > > >=20
> > > > > > +	}
> > > > > >=20
> > > > > >  }
> > > > >=20
> > > > > At least in the linux-next/master I can't see clk_rate_exclusive_=
get=20
> call:
> > > > It is in drm-misc/drm-misc-fixes:
> > > > https://cgit.freedesktop.org/drm/drm-misc/commit/?h=3Ddrm-misc-fixe=
s&id=3D79
> > > > d103a565d16b1893d990b2ee5e0fe71767759f
> > > >=20
> > > > My patch is also applied in same branch, so there should be no issu=
es
> > > > while
> > > > merging all those branches.
> > > >=20
> > > > linux-next doesn't have either patches currently:
> > > > https://git.kernel.org/pub/
> > > > scm/linux/kernel/git/next/linux-next.git/log/drivers/gpu/drm/sun4i
> > > >=20
> > > > This is issue only if you manually apply one patch without the othe=
r.
> > >=20
> > > I have (and had) both patches applied. There's perhaps some code path=
,
> > > where sun4i_tcon_channel_set_status(..., false) is called in unbalanc=
ed
> > > way with regards to clk_set_rate_exclusive().
> > >=20
> > > The issue occurs when starting Xorg. But Xorg works fine.
> > >=20
> > > regards,
> > >=20
> > >   o.
> > >  =20
> > > > Best regards,
> > > > Jernej
> > > >=20
> > > > > $ git grep 'exclusive' linux-next/master -- drivers/gpu/drm/sun4i
> > > > >=20
> > > > > linux-next/master:sun4i_hdmi.h:    * On sun5i the threshold is
> > > > > exclusive,
> > > > > i.e. does not include, linux-next/master:sun4i_tcon.c:
> > > > > clk_rate_exclusive_put(clk); linux-next/master:sun4i_tcon.c:
> > > > > clk_set_rate_exclusive(tcon->dclk, mode->crtc_clock * 1000);
> > > > > linux-next/master:sun4i_tcon.c:   clk_set_rate_exclusive(tcon->sc=
lk1,
> > > > > mode->crtc_clock * 1000);
> > > > >=20
> > > > > and the kernel complains too:
> > > > >=20
> > > > > [  841.915161] ------------[ cut here ]------------
> > > > > [  841.915187] WARNING: CPU: 0 PID: 273 at
> > > > > /workspace/megous.com/orangepi-pc/linux-4.16/drivers/clk/clk.c:60=
8
> > > > > clk_rate_exclusive_put+0x48/0x4c [  841.915194] CPU: 0 PID: 273 C=
omm:
> > > > > Xorg
> > > > > Not tainted 4.16.0-rc4-00268-gbac2ecf73ed0 #13 [  841.915196] Har=
dware
> > > > > name: Allwinner sun8i Family
> > > > > [  841.915217] [<c0228440>] (unwind_backtrace) from [<c0225b90>]
> > > > > (show_stack+0x10/0x14) [  841.915228] [<c0225b90>] (show_stack) f=
rom
> > > > > [<c0b094bc>] (dump_stack+0x88/0x9c) [  841.915237] [<c0b094bc>]
> > > > > (dump_stack) from [<c0240294>] (__warn+0xd4/0xf0) [  841.915244]
> > > > > [<c0240294>] (__warn) from [<c0240380>] (warn_slowpath_null+0x40/=
0x48)
> > > > > [
> > > > > 841.915250] [<c0240380>] (warn_slowpath_null) from [<c0619b6c>]
> > > > > (clk_rate_exclusive_put+0x48/0x4c) [  841.915261] [<c0619b6c>]
> > > > > (clk_rate_exclusive_put) from [<c0694624>]
> > > > > (sun4i_tcon_set_status+0x178/0x2f0) [  841.915269] [<c0694624>]
> > > > > (sun4i_tcon_set_status) from [<c06930c0>]
> > > > > (sun4i_crtc_atomic_disable+0x7c/0xe4) [  841.915279] [<c06930c0>]
> > > > > (sun4i_crtc_atomic_disable) from [<c06637fc>]
> > > > > (drm_atomic_helper_commit_modeset_disables+0x390/0x46c) [  841.91=
5288]
> > > > > [<c06637fc>] (drm_atomic_helper_commit_modeset_disables) from
> > > > > [<c0664df4>]
> > > > > (drm_atomic_helper_commit_tail_rpm+0x18/0x64) [  841.915295]
> > > > > [<c0664df4>]
> > > > > (drm_atomic_helper_commit_tail_rpm) from [<c0664da8>]
> > > > > (commit_tail+0x40/0x6c) [  841.915302] [<c0664da8>] (commit_tail)=
 from
> > > > > [<c06652b0>] (drm_atomic_helper_commit+0xbc/0x128) [  841.915311]
> > > > > [<c06652b0>] (drm_atomic_helper_commit) from [<c0668d40>]
> > > > > (restore_fbdev_mode_atomic+0x100/0x1fc) [  841.915319] [<c0668d40=
>]
> > > > > (restore_fbdev_mode_atomic) from [<c0668f1c>]
> > > > > (drm_fb_helper_dpms+0x50/0x130) [  841.915328] [<c0668f1c>]
> > > > > (drm_fb_helper_dpms) from [<c0669e9c>] (drm_fb_helper_blank+0x54/=
0x90)
> > > > > [
> > > > > 841.915337] [<c0669e9c>] (drm_fb_helper_blank) from [<c06088cc>]
> > > > > (fb_blank+0x54/0xa8) [  841.915343] [<c06088cc>] (fb_blank) from
> > > > > [<c0608c80>] (do_fb_ioctl+0x360/0x62c) [  841.915351] [<c0608c80>=
]
> > > > > (do_fb_ioctl) from [<c0362648>] (do_vfs_ioctl+0x9c/0x774) [=20
> > > > > 841.915358]
> > > > > [<c0362648>] (do_vfs_ioctl) from [<c0362d54>] (SyS_ioctl+0x34/0x5=
8) [
> > > > > 841.915364] [<c0362d54>] (SyS_ioctl) from [<c0201120>]
> > > > > (ret_fast_syscall+0x0/0x4c) [  841.915368] Exception stack(0xe5fc=
5fa8
> > > > > to
> > > > > 0xe5fc5ff0)
> > > > > [  841.915373] 5fa0:                   00674f10 00675460 0000000b
> > > > > 00004611
> > > > > 00000001 00000000 [  841.915379] 5fc0: 00674f10 00675460 00000001
> > > > > 00000036
> > > > > 00650474 00000000 006504a4 00675df8 [  841.915382] 5fe0: b61a502c
> > > > > be8acb2c
> > > > > b6192c38 b6b152ec
> > > > > [  841.915386] ---[ end trace fa81b956197707f8 ]---
> > > > >=20
> > > > > It looks like clk_rate_exclusive_put inside
> > > > > sun4i_tcon_channel_set_status is called without first calling som=
e
> > > > > function that would call
> > > > > clk_set_rate_exclusive, leading to unbalanced get/put calls.
> > > > >=20
> > > > > regards,
> > > > >=20
> > > > >   o.
> > > > >  =20
> > > > > >  static void sun4i_tcon_lvds_set_status(struct sun4i_tcon *tcon=
,
> > > > > >=20
> > > > > > --
> > > > > > 2.16.2
> > > > > >=20
> > > > > > --
> > > > > > You received this message because you are subscribed to the Goo=
gle
> > > > > > Groups
> > > > > > "linux-sunxi" group. To unsubscribe from this group and stop
> > > > > > receiving
> > > > > > emails from it, send an email to
> > > > > > linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org For more options, vis=
it
> > > > > > https://groups.google.com/d/optout.
> > > >=20
> > > > --
> > > > You received this message because you are subscribed to the Google
> > > > Groups "linux-sunxi" group. To unsubscribe from this group and stop
> > > > receiving emails from it, send an email to
> > > > linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org For more options, visit
> > > > https://groups.google.com/d/optout.
> > >=20
> > > --
> > > You received this message because you are subscribed to the Google Gr=
oups
> > > "linux-sunxi" group. To unsubscribe from this group and stop receivin=
g
> > > emails from it, send an email to
> > > linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org For more options, visit
> > > https://groups.google.com/d/optout.
>=20
>=20
>=20
>=20
> --=20
> You received this message because you are subscribed to the Google Groups=
 "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
> For more options, visit https://groups.google.com/d/optout.

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
