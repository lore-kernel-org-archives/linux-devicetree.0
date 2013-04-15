From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCHv8 00/19] PCIe support for the Armada 370 and Armada XP SoCs
Date: Mon, 15 Apr 2013 11:46:20 -0400
Message-ID: <20130415154620.GE28693@titan.lakedaemon.net>
References: <1365541601-14095-1-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1365541601-14095-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Russell King <linux@arm.linux.org.uk>, Tawfik Bayouk <tawfik@marvell.com>, Arnd Bergmann <arnd@arndb.de>, Maen Suleiman <maen@marvell.com>, linux-pci@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Thierry Reding <thierry.reding@avionic-design.de>, Grant Likely <grant.likely@secretlab.ca>, Olof Johansson <olof@lixom.net>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Andrew Murray <andrew.murray@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, Gregory Clement <gregory.clement@free-electrons.com>, Mitch Bradley <wmb@firmworks.com>, linux-arm-kernel@lists.infradead.org, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
List-Id: devicetree@vger.kernel.org

Thomas,

On Tue, Apr 09, 2013 at 11:06:21PM +0200, Thomas Petazzoni wrote:
> Hello,
> 
> This series of patches introduces PCIe support for the Marvell Armada
> 370 and Armada XP. In the future, we plan to extend the driver to
> cover Kirkwood platforms, and possibly other Marvell EBU platforms as
> well.
> 
> Here is the current status of the different patches:
> 
>  * Patches 1-5 are awaiting a formal Acked-by from the Device Tree
>    maintainers. Patches 1-3 are the new version of the OF PCI range
>    parsing functions from Andrew Murray, which he worked on after the
>    comments from Rob Herring. Patches 4 and 5 are much more trivial
>    and have been around since many versions of this series.

Applied to mvebu/drivers


>  * Patch 6 and 10, that are touching drivers/pci/ have been formally
>    Acked-by Bjorn Helgaas, the PCI maintainer.

Applied to mvebu/drivers

>  * Patch 7, which is touching arch/arm/kernel, has been merged by
>    Russell King already, see
>    http://www.arm.linux.org.uk/developer/patches/viewpatch.php?id=7683/1.

Added remote branch dependency on rmk/for-next in mvebu/soc

>  * Patches 8 and 9 are touching drivers/clk, and are awaiting an
>    Acked-by from Mike Turquette. However, they are fairly trivial
>    patches, so they shouldn't cause too much problem.

Applied to mvebu/drivers

> 
>  * All the other patches touch mvebu-specific things, either
>    mach-mvebu or the related Device Tree files or defconfig, so it's
>    up to the Marvell maintainers to pick them up.

Patches 10,11,19 applied to mvebu/soc with dep on rmk/for-next, and
mvebu/drivers (in /soc to catch mvebu-mbus dependency).

I'm going to flag a separate PR for this marked "late" so that it goes
in *after* rmk/for-next.

thx,

Jason.
