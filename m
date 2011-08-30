From: Pierre Beaumon <pierre.beaumon-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>
Subject: Arm device tree wonder
Date: Tue, 30 Aug 2011 21:09:47 +0100 (BST)
Message-ID: <1314734987.11994.YahooMailNeo@web132211.mail.ird.yahoo.com>
Reply-To: Pierre Beaumon <pierre.beaumon-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
References: 
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

>From I understanding the goal of the FDT, is to limit board code for each s=
oc and simplify machine code.

=3D=3D=3D info provided by FDT =3D=3D=3D

We describe the mapping of controllers on the soc (irq, memory map). But th=
is info won't change for a given SOC.
What's the point of describing the interrupt controller, timer on FDT ?
Do we really expect to support new SOC without any kernel modification ?
If not why not include for once this info in the kernel and avoid to duplic=
ate it for each board ?

Also most controller aren't stable across SOC version :
- there are bugs in hardware (for example omap3 errata is 100 pages) and ne=
w revisions correct them
- new revisions add new features

How the driver is aware of the revision on the controller. Most of the time=
 hardware guys are lazy and don't provide this info in the controller (no v=
ersion register). The driver need to deduce it from the SOC version/revisio=
n (with dynamic detection).

FDT doesn't seem to provide this info and shouldn't (what if a board got di=
fferent SOC revisions).
This means there still a link between driver and machine code for hardware =
probing.

=3D=3D=3D in or out kernel tree FDT ? =3D=3D=3D

Also when the driver is improved (support new feature, ...), how new config=
uration should be provided to FDT ?
Can we break the FDT API or should we provide only new property ?

If we want to support out of kernel FDT, I think we can't break the API.

But what happen if a board/SOC vendor provide a board with a crappy FDT map=
ping, we can rewrite it and do new mapping in mainline kernel.
But that means the vendor FDT is not supported anymore, and we can't boot n=
ew kernel on this board without overriding the vendor FDT.
This is the same problem with acpi table. In theory we could rewrite them, =
but in practice we add workaround in the interpreter.

An alternative should be to always include the FDT with the kernel.
But in this case :
- we don't solve unique board id problem
- we need tags in order bootloader pass limited information
- we can't boot new board of generic kernel
-=A0FDT is only an abstraction for board/machine code that is provided by p=
latform driver/device.

=3D=3D=3D flexibility of FDT =3D=3D=3D

The current code use platform data to configure driver (sdcard bus width, r=
eset pin, speed info, ...).
This is easy to convert it to FDT (textual conversion).

But in the current board code conditional can be used. According to the boa=
rd revision (gpio, fuse, rev atag), different platform data can be provided=
. Same apply for static external device (i2c, spi, ...).
How can this be done with FDT ?
Can FDT support conditional stuff ?
Should we have a FDT per revision, should the bootloader patch the FDT, sho=
uld the kernel select/patch the FDT ?

If we have a FDT per revision, I don't believe it is acceptable to be able =
to flash the FDT with the correct revision.
Production chain can be complex and making the flashing stage detect the re=
vision and flashing the correct FDT can't be easy to do (tools they use can=
 be basic, ...).

If I do a generic module (ie a daughter board containing the SOC/pmu) that =
can be connected to different motherboards.
The size of memory can change, the external devices can change (spi, usb ph=
y present or not, lcd, ...).
The current model can allow to do a generic board code driven by gpio/fuse =
to do the motherboard configuration. And the customer (that integrate modul=
e on their motherboard) doesn't need any kernel modification.

How this will work with FDT ?

Some platform data need callback. How this will work with FDT ?

Sometime when doing a board, we discover too late board bug that can be wor=
karound in the board code.
How this will work with FDT ?
Should be do like in x86 with quirk in kernel according to dmi indentifier =
or have machine code somewhere ?

The kernel FDT can help to unify how platform declare controller resource, =
but I wonder if it will be enough. It could be interesting to have a soc_bu=
s (or even emulate a pci_bus) that is look like the pci_bus.
The advantage of the pci_bus is that it is widely used on most architecture.
Also it provide interesting functions that are not provided by the platform=
_bus :
- vendor/device id/revision
- pci_(enable|disable)_device (were the clock could be manipulated)
- pci_prepare_to_sleep/pci_back_from_sleep (for suspend/resume stuff)

=3D=3D=3D=3D

Arm is different of other architecture (sparc/powerpc) where FDT is used be=
cause there are lot's of Soc with different controllers. Nearly all vendor =
got its own uart, i2c, ...
I am waiting to see how it will work on arm.

But please don't forget arm isn't only used on laptop/netbook that want gen=
eric kernel.
It is used for a wide variety of applications. These applications may not b=
e found in the mainline kernel, but that don't mean nobody use them.

Also I believe one big arm problem is a lack of common infrastructure that =
lead to code duplication.
Some machine try to do too much things. omap2 (mach-omap2 + plat-omap) is a=
bout 80 KSLOC over 400KSLOC (76 mach + plat directories). That 8 times bigg=
er than the average ((80/2)/(400/76))! There are either common stuff that s=
hould be shared, or some stuff should be moved in drivers.

Also the directory organization of mach-*, plat-* is quite complex.
Why not put a top level directory with the soc family name, and then put in=
 that directory mach-*/plat-* directories.
