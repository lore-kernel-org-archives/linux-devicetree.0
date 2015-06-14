From: Karsten Merker <merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH V2] ARM: dts: sun6i: Add dts file for MSI
 Primo81 tablet
Date: Sun, 14 Jun 2015 20:55:05 +0200
Message-ID: <1434308106-27704-1-git-send-email-merker@debian.org>
References: <20150108095213.GR7853@lukather>
Reply-To: merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDP2XNNJ7IFBBL4466VQKGQEWO4Y2YI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20150108095213.GR7853@lukather>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Siarhei Siamashka <siarhei.siamashka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Karsten Merker <merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Maxime Ripard wrote:
> On Sat, Dec 27, 2014 at 09:37:20AM +0200, Siarhei Siamashka wrote:
> > The MSI Primo81 is an A31s based tablet, with 1G RAM, 16G NAND,
> > 1024x768 IPS LCD display, mono speaker, 0.3 MP front camera, 2.0 MP
> > rear camera, 3500 mAh battery, gt911 touchscreen, mma8452 accelerometer
> > and rtl8188etv usb wifi. Has "power", "volume+" and "volume-" buttons
> > (both volume buttons are also connected to the UBOOT_SEL pin). The
> > external connectors are represented by MicroSD slot, MiniHDMI, MicroUSB
> > OTG and 3.5mm headphone jack. More details are available at
> >     http://linux-sunxi.org/MSI_Primo81
> >
> > This initial dts file only provides support for mmc, wifi and uart
> > (there is no external connector for uart though). Graphics can be used
> > via simplefb. However, without usb otg, there are no reasonable means
> > to handle user input yet.
[...]
> These two patches look very good overall.
>=20
> There's two things about the two of them though:
>   - We just switched to using the DT includes, please use them for
>     your GPIO flags and pinctrl drive strength and pull
>     configurations.
>   - We will switch soon to using the kind of syntax used for example
>     by TI in their DTSes (you can look at the beaglebone black for an
>     good example.), it would be great if you could use that in your
>     two DTSes, in order to avoid changing everything again in a near
>     future.

As far as I can see nobody has taken this up until now, so I have
slightly reworked Siarhei's original patch:

- changed the numeric pinctrl and gpio values to their symbolic
  equivalents

- changed the include syntax from /include/ to #include to make
  the dts build with current kernels.

I have current u-boot master working on the tablet (booted from
SD card), with console on the LCD, USB-OTG-support and a USB
keyboard.  A defconfig patch for OTG+keyboard support has been
submitted to the u-boot list.

Unfortunately I have not yet had much luck with the kernel.
I try to get Hans de Goede's sunxi-wip branch
(https://github.com/jwrdegoede/linux-sunxi/tree/sunxi-wip) to
work on the Primo81, but I have not yet been able to get any
kernel output on the LCD.  Debugging this is slightly difficult
as I currently lack an SD breakout board, so I have no way to
get a serial console for now.

Siarhei, could you perhaps give Hans' sunxi-wip branch a try on
your Primo81? AFAIK you have a breakout board for it.

Regards,
Karsten
--=20
Gem. Par. 28 Abs. 4 Bundesdatenschutzgesetz widerspreche ich der Nutzung
sowie der Weitergabe meiner personenbezogenen Daten f=C3=BCr Zwecke der
Werbung sowie der Markt- oder Meinungsforschung.

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
