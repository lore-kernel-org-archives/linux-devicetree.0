From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCHv3 3/3] ARM: mvebu: implement L2/PCIe deadlock workaround
Date: Thu, 15 May 2014 10:36:57 +0100
Message-ID: <20140515093657.GG11117@localhost>
References: <1400145519-28530-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1400145519-28530-4-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1400145519-28530-4-git-send-email-thomas.petazzoni@free-electrons.com>
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
Cc: Lior Amsalem <alior@marvell.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, Jason Cooper <jason@lakedaemon.net>, Tawfik Bayouk <tawfik@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Will Deacon <Will.Deacon@arm.com>, Grant Likely <grant.likely@secretlab.ca>, Gregory Clement <gregory.clement@free-electrons.com>, Nadav Haklai <nadavh@marvell.com>, Rob Herring <robh+dt@kernel.org>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Albin Tonnerre <Albin.Tonnerre@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

On Thu, May 15, 2014 at 10:18:39AM +0100, Thomas Petazzoni wrote:
> The Marvell Armada 375 and Armada 38x SOCs, which use the Cortex-A9
> CPU core, the PL310 cache and the Marvell PCIe hardware block are
> affected a L2/PCIe deadlock caused by a system erratum when hardware
> I/O coherency is used.
> 
> This deadlock can be avoided by mapping the PCIe memory areas as
> strongly-ordered (note: MT_UNCACHED is strongly-ordered), and by
> removing the outer cache sync done in software. This is done in this
> patch, thanks to the new bits of infrastructure added in 'ARM: mm:
> allow sub-architectures to override PCI I/O memory type' and 'ARM: mm:
> add support for HW coherent systems in PL310' respectively.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
