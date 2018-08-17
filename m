Return-Path: <SRS0=cRVz=LA=maxiiot.com=tony.lee@kernel.org>
From: Tony Lee <tony.lee@maxiiot.com>
Message-Id: <FD4B0317-09B5-4C48-A26E-02294A4484FE@maxiiot.com>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_A2F4D6B6-58F1-4871-B9BA-4E701595A621"
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: serdev: How to attach serdev devices to USB based tty devices?
Date: Fri, 17 Aug 2018 13:55:58 +0800
In-Reply-To: <3639955d-5990-1c82-7158-ac07b33c41f2@suse.de>
References: <3639955d-5990-1c82-7158-ac07b33c41f2@suse.de>
To: =?utf-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc: Rob Herring <robh@kernel.org>, "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, linux-usb@vger.kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linux-MIPS <linux-mips@linux-mips.org>, Stefan Rehm <rehm@miromico.ch>, Xue Liu <liuxuenetmail@gmail.com>, "LoRa_Community_Support@semtech.com" <LoRa_Community_Support@semtech.com>, Oliver Neukum <oneukum@suse.com>, Alexander Graf <agraf@suse.de>, Ben Whitten <ben.whitten@lairdtech.com>, devicetree@vger.kernel.org, Jian-Hong Pan <starnight@g.ncu.edu.tw>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>


--Apple-Mail=_A2F4D6B6-58F1-4871-B9BA-4E701595A621
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Dear Andreas,

About adding vendor ID our GL5x12, it seems we will need to modify our =
hardware after investigation.
So, this hardware modification and schedule will be discuss and plan at =
Maxiiot. Please wait for further update.





Best Regards,

=E6=9D=8E=E5=BC=98=E5=BD=AC
Tony Lee

CN Mobile  +86.135.3778.7870
TW Mobile  +886.939.979.139   =20

MAXIIOT =E6=B7=B1=E5=9C=B3=E5=B8=82=E6=B4=BE=E6=B4=9B=E5=BE=B7=E7=A7=91=E6=
=8A=80=E6=9C=89=E9=99=90=E5=85=AC=E5=8F=B8
TEL: +86.755.2645.9429
FAX: +86.755.2947.6513
=E4=BF=A1=E7=94=A8=E4=BB=A3=E7=A2=BC: 91440300359881668D
Email: tony.lee@maxiiot.com
Web: www.maxiiot.com

=E6=B7=B1=E5=9C=B3=E5=B8=82=E5=AE=9D=E5=AE=89=E5=8C=BA=E7=95=99=E4=BB=99=E4=
=BA=8C=E8=B7=AF1=E5=B7=B716=E5=8F=B7=E5=8D=97=E5=A4=A9=E8=BE=89=E5=88=9B=E7=
=A0=94=E4=B8=AD=E5=BF=833=E6=A5=BC302=E5=AE=A4
Room 302, 3F, No. 16, Lane 1, Liuxian No.2 Road,=20
Bao an District. 518100 Shenzhen, China=20

> Andreas F=C3=A4rber <afaerber@suse.de> =E6=96=BC 2018=E5=B9=B48=E6=9C=88=
14=E6=97=A5 10:28 =E5=AF=AB=E9=81=93=EF=BC=9A
>=20
> Hi Rob et al.,
>=20
> For my LoRa network driver project [1] I have found your serdev
> framework to be a valuable help for dealing with hardware modules
> exposing some textual or binary UART interface.
>=20
> In particular on arm(64) and mips this allows to define an unlimited
> number of serdev drivers [2] that are associated via their Device Tree
> compatible string and can optionally be configured via DT properties.
>=20
> And in theory it seems serdev has also grown support for ACPI.
>=20
> Now, a growing number of vendors are placing such modules on a USB =
stick
> for easy evaluation on x86_64 PC hardware, or are designing mPCIe or =
M.2
> cards using their USB pins. While I do not yet have access to such a
> device myself, it is my understanding that devices with USB-UART =
bridge
> chipsets (e.g., FTDI) will show up as /dev/ttyUSBx and devices with an
> MCU implementing the CDC USB protocol (e.g., Pico-cell gateway =3D =
picoGW)
> will show up as /dev/ttyACMx.
> On the Raspberry Pi I've seen that Device Tree nodes can be used to =
pass
> information to on-board devices such as MAC address to Ethernet =
chipset,
> but that does not seem all that useful for passing a serdev child node
> to hot-plugged devices at unpredictable hub/port location (where it
> should not interfere with regular USB-UART cables for debugging), nor
> would it help ACPI based platforms such as x86_64.
>=20
> My idea then was that if we had some unique criteria like vendor and
> product IDs (or whatever is supported in usb_device_id), we could =
write
> a usb_driver with suitable USB_DEVICE*() macro. In its probe function =
we
> could call into the existing tty driver's probe function and =
afterwards
> try creating and attaching the appropriate serdev device, i.e. a fixed
> USB-to-serdev driver mapping. Problem is that most devices don't seem =
to
> implement any unique identifier I could make this depend on - either =
by
> using a standard FT232/FT2232/CH340G chip or by using =
STMicroelectronics
> virtual com port identifiers in CDC firmware and only differing in the
> textual description [3] the usb_device_id does not seem to match on.
>=20
> The obvious solution would of course be if hardware vendors could =
revise
> their designs to configure FTDI/etc. chips uniquely. I hear that that
> may involve exchanging the chipset, increasing costs, and may impact
> existing drivers. Wouldn't help for devices out there today either.
>=20
> For the picoGW CDC firmware, Semtech does appear to own a USB vendor =
ID,
> so it would seem possible to allocate their own product IDs for SX1301
> and SX1308 respectively to replace the generic STMicroelectronics IDs,
> which the various vendors could offer as firmware updates.
>=20
> All outside my control though.
>=20
> Oliver therefore suggested to not mess with USB drivers and instead =
use
> a line discipline (ldisc). It seems that for example the userspace =
tool
> slattach takes a tty device and performs an ioctl to switch the =
generic
> tty device into a special N_SLIP protocol mode, implemented in [4].
>=20
> However, the existing number of such ldisc modes appears to be below =
30,
> with hardly any vendor-specific implementation, so polluting its =
number
> space seems undesirable? And in some cases I would like to use the =
same
> protocol implementation over direct UART and over USB, so would like =
to
> avoid duplicate serdev_device_driver and tty_ldisc_ops =
implementations.
>=20
> Long story short, has there been any thinking about a userspace
> interface to attach a given serdev driver to a tty device?
>=20
> Or is there, on OF_DYNAMIC platforms, a way from userspace to =
associate
> a DT fragment (!=3D DT Overlay) with a given USB device dynamically, =
to
> attach a serdev node with sub-nodes?
>=20
> Any other ideas how to cleanly solve this?
>=20
> In some cases we're talking about a "simple" AT-like command =
interface;
> the picoGW implements a semi-generic USB-SPI bridge that may host a
> choice of 2+ chipsets, which in turn has two further sub-devices with =
3+
> chipset choices (theoretically clk output and rx/tx options etc.) =
each.
> (For the latter I'm thinking we'll need a serdev driver exposing a
> regmap_bus and then implement regmap_bus based versions of the SPI
> drivers like Ben and I refactored SX1257 in [2] last weekend.)
>=20
> Thanks,
> Andreas
>=20
> [1] https://patchwork.ozlabs.org/cover/937545/
> [2]
> =
https://git.kernel.org/pub/scm/linux/kernel/git/afaerber/linux-lora.git/tr=
ee/drivers/net/lora?h=3Dlora-next
> [3]
> =
https://github.com/Lora-net/picoGW_mcu/blob/master/src/usb_cdc/Src/usbd_de=
sc.cpp#L59
> [4]
> =
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dr=
ivers/net/slip/slip.c#n1281
>=20
> --=20
> SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> GF: Felix Imend=C3=B6rffer, Jane Smithard, Graham Norton
> HRB 21284 (AG N=C3=BCrnberg)


--Apple-Mail=_A2F4D6B6-58F1-4871-B9BA-4E701595A621
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D"">Dear =
Andreas,<div class=3D""><br class=3D""></div><div class=3D"">About =
adding vendor ID our GL5x12, it seems we will need to modify our =
hardware after investigation.</div><div class=3D"">So, this hardware =
modification and schedule will be discuss and plan at Maxiiot. Please =
wait for further update.<br class=3D""><div class=3D"">
<div dir=3D"auto" style=3D"color: rgb(0, 0, 0); letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; word-wrap: =
break-word; -webkit-nbsp-mode: space; line-break: after-white-space;" =
class=3D""><div style=3D"color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;"><br =
class=3D"Apple-interchange-newline"><br class=3D""></div><div =
style=3D"color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;"><br class=3D""><br class=3D""><br =
class=3D"">Best Regards,<br class=3D""><br class=3D"">=E6=9D=8E=E5=BC=98=E5=
=BD=AC<br class=3D"">Tony Lee<br class=3D""><br class=3D"">CN Mobile =
&nbsp;+86.135.3778.7870<br class=3D"">TW Mobile &nbsp;+886.939.979.139 =
&nbsp; &nbsp;<br class=3D""><br class=3D"">MAXIIOT =
=E6=B7=B1=E5=9C=B3=E5=B8=82=E6=B4=BE=E6=B4=9B=E5=BE=B7=E7=A7=91=E6=8A=80=E6=
=9C=89=E9=99=90=E5=85=AC=E5=8F=B8<br class=3D"">TEL: =
+86.755.2645.9429<br class=3D"">FAX: +86.755.2947.6513<br =
class=3D"">=E4=BF=A1=E7=94=A8=E4=BB=A3=E7=A2=BC: 91440300359881668D<br =
class=3D""><a href=3D"mailto:tony.lee@maxiiot.com" =
class=3D"">Email:&nbsp;tony.lee@maxiiot.com</a><br =
class=3D"">Web:&nbsp;www.maxiiot.com<br class=3D""><br =
class=3D"">=E6=B7=B1=E5=9C=B3=E5=B8=82=E5=AE=9D=E5=AE=89=E5=8C=BA=E7=95=99=
=E4=BB=99=E4=BA=8C=E8=B7=AF1=E5=B7=B716=E5=8F=B7=E5=8D=97=E5=A4=A9=E8=BE=89=
=E5=88=9B=E7=A0=94=E4=B8=AD=E5=BF=833=E6=A5=BC302=E5=AE=A4<br =
class=3D"">Room 302, 3F, No. 16, Lane 1,&nbsp;Liuxian No.2 =
Road,&nbsp;<br class=3D"">Bao an District. 518100 =
Shenzhen,&nbsp;China&nbsp;</div></div>
</div>
<div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">Andreas F=C3=A4rber &lt;<a href=3D"mailto:afaerber@suse.de" =
class=3D"">afaerber@suse.de</a>&gt; =E6=96=BC 2018=E5=B9=B48=E6=9C=8814=E6=
=97=A5 10:28 =E5=AF=AB=E9=81=93=EF=BC=9A</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div class=3D"">Hi =
Rob et al.,<br class=3D""><br class=3D"">For my LoRa network driver =
project [1] I have found your serdev<br class=3D"">framework to be a =
valuable help for dealing with hardware modules<br class=3D"">exposing =
some textual or binary UART interface.<br class=3D""><br class=3D"">In =
particular on arm(64) and mips this allows to define an unlimited<br =
class=3D"">number of serdev drivers [2] that are associated via their =
Device Tree<br class=3D"">compatible string and can optionally be =
configured via DT properties.<br class=3D""><br class=3D"">And in theory =
it seems serdev has also grown support for ACPI.<br class=3D""><br =
class=3D"">Now, a growing number of vendors are placing such modules on =
a USB stick<br class=3D"">for easy evaluation on x86_64 PC hardware, or =
are designing mPCIe or M.2<br class=3D"">cards using their USB pins. =
While I do not yet have access to such a<br class=3D"">device myself, it =
is my understanding that devices with USB-UART bridge<br =
class=3D"">chipsets (e.g., FTDI) will show up as /dev/ttyUSBx and =
devices with an<br class=3D"">MCU implementing the CDC USB protocol =
(e.g., Pico-cell gateway =3D picoGW)<br class=3D"">will show up as =
/dev/ttyACMx.<br class=3D"">On the Raspberry Pi I've seen that Device =
Tree nodes can be used to pass<br class=3D"">information to on-board =
devices such as MAC address to Ethernet chipset,<br class=3D"">but that =
does not seem all that useful for passing a serdev child node<br =
class=3D"">to hot-plugged devices at unpredictable hub/port location =
(where it<br class=3D"">should not interfere with regular USB-UART =
cables for debugging), nor<br class=3D"">would it help ACPI based =
platforms such as x86_64.<br class=3D""><br class=3D"">My idea then was =
that if we had some unique criteria like vendor and<br class=3D"">product =
IDs (or whatever is supported in usb_device_id), we could write<br =
class=3D"">a usb_driver with suitable USB_DEVICE*() macro. In its probe =
function we<br class=3D"">could call into the existing tty driver's =
probe function and afterwards<br class=3D"">try creating and attaching =
the appropriate serdev device, i.e. a fixed<br class=3D"">USB-to-serdev =
driver mapping. Problem is that most devices don't seem to<br =
class=3D"">implement any unique identifier I could make this depend on - =
either by<br class=3D"">using a standard FT232/FT2232/CH340G chip or by =
using STMicroelectronics<br class=3D"">virtual com port identifiers in =
CDC firmware and only differing in the<br class=3D"">textual description =
[3] the usb_device_id does not seem to match on.<br class=3D""><br =
class=3D"">The obvious solution would of course be if hardware vendors =
could revise<br class=3D"">their designs to configure FTDI/etc. chips =
uniquely. I hear that that<br class=3D"">may involve exchanging the =
chipset, increasing costs, and may impact<br class=3D"">existing =
drivers. Wouldn't help for devices out there today either.<br =
class=3D""><br class=3D"">For the picoGW CDC firmware, Semtech does =
appear to own a USB vendor ID,<br class=3D"">so it would seem possible =
to allocate their own product IDs for SX1301<br class=3D"">and SX1308 =
respectively to replace the generic STMicroelectronics IDs,<br =
class=3D"">which the various vendors could offer as firmware updates.<br =
class=3D""><br class=3D"">All outside my control though.<br class=3D""><br=
 class=3D"">Oliver therefore suggested to not mess with USB drivers and =
instead use<br class=3D"">a line discipline (ldisc). It seems that for =
example the userspace tool<br class=3D"">slattach takes a tty device and =
performs an ioctl to switch the generic<br class=3D"">tty device into a =
special N_SLIP protocol mode, implemented in [4].<br class=3D""><br =
class=3D"">However, the existing number of such ldisc modes appears to =
be below 30,<br class=3D"">with hardly any vendor-specific =
implementation, so polluting its number<br class=3D"">space seems =
undesirable? And in some cases I would like to use the same<br =
class=3D"">protocol implementation over direct UART and over USB, so =
would like to<br class=3D"">avoid duplicate serdev_device_driver and =
tty_ldisc_ops implementations.<br class=3D""><br class=3D"">Long story =
short, has there been any thinking about a userspace<br =
class=3D"">interface to attach a given serdev driver to a tty device?<br =
class=3D""><br class=3D"">Or is there, on OF_DYNAMIC platforms, a way =
from userspace to associate<br class=3D"">a DT fragment (!=3D DT =
Overlay) with a given USB device dynamically, to<br class=3D"">attach a =
serdev node with sub-nodes?<br class=3D""><br class=3D"">Any other ideas =
how to cleanly solve this?<br class=3D""><br class=3D"">In some cases =
we're talking about a "simple" AT-like command interface;<br =
class=3D"">the picoGW implements a semi-generic USB-SPI bridge that may =
host a<br class=3D"">choice of 2+ chipsets, which in turn has two =
further sub-devices with 3+<br class=3D"">chipset choices (theoretically =
clk output and rx/tx options etc.) each.<br class=3D"">(For the latter =
I'm thinking we'll need a serdev driver exposing a<br =
class=3D"">regmap_bus and then implement regmap_bus based versions of =
the SPI<br class=3D"">drivers like Ben and I refactored SX1257 in [2] =
last weekend.)<br class=3D""><br class=3D"">Thanks,<br =
class=3D"">Andreas<br class=3D""><br class=3D"">[1] <a =
href=3D"https://patchwork.ozlabs.org/cover/937545/" =
class=3D"">https://patchwork.ozlabs.org/cover/937545/</a><br =
class=3D"">[2]<br class=3D""><a =
href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/afaerber/linux-lor=
a.git/tree/drivers/net/lora?h=3Dlora-next" =
class=3D"">https://git.kernel.org/pub/scm/linux/kernel/git/afaerber/linux-=
lora.git/tree/drivers/net/lora?h=3Dlora-next</a><br class=3D"">[3]<br =
class=3D"">https://github.com/Lora-net/picoGW_mcu/blob/master/src/usb_cdc/=
Src/usbd_desc.cpp#L59<br class=3D"">[4]<br =
class=3D"">https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git/tree/drivers/net/slip/slip.c#n1281<br class=3D""><br class=3D"">-- =
<br class=3D"">SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, =
Germany<br class=3D"">GF: Felix Imend=C3=B6rffer, Jane Smithard, Graham =
Norton<br class=3D"">HRB 21284 (AG N=C3=BCrnberg)<br =
class=3D""></div></div></blockquote></div><br =
class=3D""></div></body></html>=

--Apple-Mail=_A2F4D6B6-58F1-4871-B9BA-4E701595A621--
