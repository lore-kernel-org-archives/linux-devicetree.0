From: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH v6 3/5] ARM: dts: sun8i-h3: add HDMI video nodes
Date: Fri, 25 Nov 2016 11:22:13 +0100
Message-ID: <20161125112213.83420594eb435b6bb1a4d164@free.fr>
References: <cover.1479641523.git.moinejf@free.fr>
	<cdf50b8433e2d9a053e35f8788bfcd5d41504312.1479641523.git.moinejf@free.fr>
	<3188681480066911@web3h.yandex.ru>
Reply-To: moinejf-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCV6DL6LYMNBBW5B4DAQKGQEFAIIR5A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <3188681480066911-UANfZzvcKe1uio3avFS2gg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Cc: Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 25 Nov 2016 17:41:51 +0800
Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org> wrote:

> After removing CLK_PLL_DE's assigned-clock, the kernel passes compilation=
.

The 'pll-de' and 'de' must have a fixed rate. Otherwise, if you do not
use the legacy u-boot, I don't know which can be the rate of the DE.

> However, it cannot recognize any HDMI screen...
>=20
> (My board is Orange Pi One, and I manually added status=3D"okay"; to &lcd=
0, &de, &hdmi)
>=20
> [   16.507802] sun8i-de2 1000000.de-controller: bound 1c0c000.lcd-control=
ler (ops de2_lcd_ops [sun8i_de2_drm])
> [   16.675948] sun8i-de2 1000000.de-controller: bound 1ee0000.hdmi (ops d=
e2_hdmi_fini [sun8i_de2_hdmi])
> [   16.685120] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013)=
.
> [   16.695876] [drm] No driver support for vblank timestamp query.
> [   16.701862] sun8i-de2 1000000.de-controller: No connectors reported co=
nnected with modes
> [   16.713061] [drm] Cannot find any crtc or sizes - going 1024x768
> [   16.734214] Console: switching to colour frame buffer device 128x48
> [   16.751022] sun8i-de2 1000000.de-controller: fb0:  frame buffer device

I put a 'pr_warn' message is case the EDID cannot be read.
Have you this message?

Anyway, there is a problem with the EDID:
- my Orange Pi 2 (H3) randomly fails to read it. But this succeeds after
  rebooting once or twice.
- my Banana Pi M2+ (H3) reads it correctly each time.
- my Banana Pi M3 (A83T) can never read it.

BTW, on first tries, I was forcing a CEA mode thru the kernel command
line. This was working with the OPi2 and BPiM3, but there was no sound.
In the last version, I use a EDID in edid_firmware for having sound
with the BPiM3. This works fine.
But, forcing a CEA mode is no more possible, so, when the OPi2 cannot
read the EDID, the system switches to a VGA mode (default 1024x768)
which is not supported. It seems that this is your case.

So, in brief, if your board cannot read the EDID, put a EDID somewhere
and its path in /sys/module/drm_kms_helper/parameters/edid_firmware.
There will be no console, but X11 will work correctly.

--=20
Ken ar c'henta=C3=B1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
