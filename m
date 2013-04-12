From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCHv8 12/19] arm: mvebu: add PCIe Device Tree informations
 for Armada 370
Date: Thu, 11 Apr 2013 20:28:11 -0400
Message-ID: <20130412002811.GS28693@titan.lakedaemon.net>
References: <1365541601-14095-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1365541601-14095-13-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1365541601-14095-13-git-send-email-thomas.petazzoni@free-electrons.com>
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

On Tue, Apr 09, 2013 at 11:06:33PM +0200, Thomas Petazzoni wrote:
> The Armada 370 SoC has two 1x PCIe 2.0 interfaces, so we add the
> necessary Device Tree informations to make these interfaces availabel.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  arch/arm/boot/dts/armada-370.dtsi |   51 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)

Patches 12 through 18 applied to mvebu/dt.  Now Gregory can rebase LPAE
:)

thx,

Jason.
