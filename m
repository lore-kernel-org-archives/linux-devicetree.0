From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [RFCv1 00/11] MSI support for Marvell EBU PCIe driver
Date: Thu, 4 Apr 2013 06:16:40 -0300
Message-ID: <20130404091639.GA2245@localhost>
References: <1364316746-8702-1-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1364316746-8702-1-git-send-email-thomas.petazzoni@free-electrons.com>
Sender: linux-pci-owner@vger.kernel.org
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Grant Likely <grant.likely@secretlab.ca>, Russell King <linux@arm.linux.org.uk>, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, Arnd Bergmann <arnd@arndb.de>, Maen Suleiman <maen@marvell.com>, Thierry Reding <thierry.reding@avionic-design.de>, Gregory Clement <gregory.clement@free-electrons.com>, Olof Johansson <olof@lixom.net>, Tawfik Bayouk <tawfik@marvell.com>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Mitch Bradley <wmb@firmworks.com>, Andrew Murray <andrew.murray@arm.com>
List-Id: devicetree@vger.kernel.org

Thomas,

On Tue, Mar 26, 2013 at 05:52:15PM +0100, Thomas Petazzoni wrote:
>=20
> This set of patches introduces Message Signaled Interrupt support in
> the Marvell EBU PCIe driver. It has been successfully tested on the
> Armada XP GP platform and the Armada 370 DB platform with an Intel
> e1000e PCIe network card that supports MSI.
>=20
> This is based on work done by Lior Amsalem <alior@marvell.com>.
>=20
> The patches do the following:
>=20
>  * Patches 1, 2 and 3 move the IRQ controller driver of Armada 370/XP
>    platforms from arch/arm/mach-mvebu/ into drivers/irqchip/ and use
>    the proper irqchip infrastructure. Those changes are not strictly
>    needed to add MSI interrupts support, but since we will be touchin=
g
>    the IRQ controller driver anyway, it sounded like the right time t=
o
>    do this move.
>=20

Given the IRQ controller move to drivers/irqchip is independent of MSI
work, and that we've already agreed this move is fine (Arnd has acked
patch 2), may I suggest that you resend these three first patches
(and perhaps the fourth?) as a separate patchset to be included in v3.1=
0.

This has the advantage that further development on IRQ controller can b=
e
done directly on its proper place, and also the MSI patchset can be
simplified.

What do you think?
--=20
Ezequiel Garc=C3=ADa, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
