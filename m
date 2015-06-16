From: Karsten Merker <merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [RFC PATCH V3] ARM: dts: sun6i: Add dts file for MSI
 Primo81 tablet
Date: Tue, 16 Jun 2015 21:11:08 +0200
Message-ID: <1434481869-9432-1-git-send-email-merker@debian.org>
References: <20150616094026.GG11732@lukather>
Reply-To: merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDP2XNNJ7IFBBCHKQGWAKGQEBD6GSKA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20150616094026.GG11732@lukather>
In-Reply-To: <20150616094026.GG11732@lukather>
References: <20150616094026.GG11732@lukather>
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

On Tue, Jun 16, 2015 at 11:40:27AM +0200, Maxime Ripard wrote:

> What I meant in my previous review was to use the syntax
>=20
> &uart0 {
>        some-property;
> };
>  =20
> Instead of duplicating the tree structure like you're doing
> here. We've converted all the DT to that, so you can look around and
> see how it's done in other boards (note that the nodes should be
> sorted by alphabetical order).

Ah, sorry, I had misunderstood your original email in this regard.
Following is a reworked version of the patch.

Changelog:

Version 1
=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Original patch by Siarhei Siamashka

Version 2
=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Use symbolic instead of numeric pinctrl values.

- Change the include syntax from /include/ to #include to make
  the dts build with current kernels.

Version 3
=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Use labels for nodes with modifications in relation to the dtsi
  instead of replicating the tree structure.

- Remove the FSF address from the license header as done in
  http://lists.infradead.org/pipermail/linux-arm-kernel/2015-May/340437.htm=
l
  for the other dts files to remove a checkpatch warning.

- Add msi to the vendor prefix list.

- Remove earlyprintk from the default kernel commandline.

- Replace the console kernel commandline parameter by a
  /chosen/stdout-path node and add an alias serial0 -> uart0.

I have tagged this patch RFC as I am unsure what to do with the
/chosen/stdout-path node. For now, I have set Siarhei's original
choice (first serial port), but I am unsure whether this is the
right thing to do as the Primo81 does by default not have a
user-accessible serial port.  The only way to get a serial
console is to either break the case open and find some test
points that carry the RX/TX lines (which with the Primo81 case
poses a high risk of breaking the display glass), or to use an SD
card breakout board and change the pinmuxing for the SD card pins
to the "serial" function.  The latter would not work without
modifying the dts, so the SD-breakout case doesn't really count
for setting the default stdout-path in the general use case.

On the other hand, setting stdout-path to the serial port does
not seem to influence getting a a boot console on the LCD when
booting from a simplefb-capable u-boot, so there is probably no
harm in doing it.

Comments welcome :-).

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
