From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 5/5] ARM: dts: sun6i: Add dts file for CSQ
 CS908 board
Date: Thu, 4 Dec 2014 17:33:09 +0100
Message-ID: <20141204163309.GS30256@lukather>
References: <1416747283-13489-1-git-send-email-hdegoede@redhat.com>
 <1416747283-13489-6-git-send-email-hdegoede@redhat.com>
 <20141125182147.GD25249@lukather>
 <5475962A.4090508@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="szdyR02yM8NCQUEm"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBOE2QKSAKGQE3MV3J2Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5475962A.4090508-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--szdyR02yM8NCQUEm
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi,

On Wed, Nov 26, 2014 at 09:58:18AM +0100, Hans de Goede wrote:
> Hi,
> 
> On 11/25/2014 07:21 PM, Maxime Ripard wrote:
> >On Sun, Nov 23, 2014 at 01:54:43PM +0100, Hans de Goede wrote:
> >>The CSQ CS908 is an A31s based top-set box, with 1G RAM, 8G NAND,
> >>rtl8188etv usb wifi, 2 USB A receptacles (1 connected through the OTG
> >>controller), ethernet, 3.5 mm jack with a/v out and hdmi out:
> >>
> >>http://www.geekbuying.com/item/CS908-Allwinner-A31S-Quad-Core-1-2GHz-Android-4-4-Mini-TV-Box-HDMI-HDD-Player-1G-8G-WIFI-Miracast---Black-333395.html
> >>
> >>Note it has no sdcard slot and therefore can only be fel booted.
> >
> >Thanks a lot for working on this!
> >
> >I also bought another board with an A31s, but it ended up having
> >neither USB OTG or MMC, which rendered it pretty useless.
> 
> Are you sure ? The cs908 also does not have an otg connector,
> as said it has 2 usb-a receptacles, with the following usb "routing":
> 
> usb0 (otg): usb-a receptacle 1 (labeled 1 on the box, 0 on the print)
> usb1 (ehci): routed to internal wifi
> usb2 (ehci): usb-a receptacle 2 (labeled 2 on both the box and the print)
> 
> I'm using fel mode with an usb-a <-> usb-a cable connected to usb0 on
> the cs908. The cs908 has no fel button, so I've hooked up the serial console,
> and then keep 2 pressed on the serial console while inserting the usb-a into
> the PC (which will also power the board). boot0 from the nand will then jump
> into fel mode when it sees the 2 keypress.
> 
> This was an interesting exercise to confirm that everything on the A31s just
> works with A31 code, but now that is confirms A31s devices are not all that
> interesting anymore :)

Ah, that's very interesting... I'll dig this board out then, and try
both USB-A connector. It might very well be just that.

Thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--szdyR02yM8NCQUEm--
