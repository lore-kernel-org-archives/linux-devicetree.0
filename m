From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFCv1 02/11] irqchip: move IRQ driver for Armada 370/XP
Date: Tue, 26 Mar 2013 16:54:41 +0000
Message-ID: <201303261654.41873.arnd@arndb.de>
References: <1364316746-8702-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1364316746-8702-3-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1364316746-8702-3-git-send-email-thomas.petazzoni@free-electrons.com>
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
Cc: Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Russell King <linux@arm.linux.org.uk>, Jason Cooper <jason@lakedaemon.net>, Tawfik Bayouk <tawfik@marvell.com>, Olof Johansson <olof@lixom.net>, linux-pci@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Thierry Reding <thierry.reding@avionic-design.de>, Grant Likely <grant.likely@secretlab.ca>, Maen Suleiman <maen@marvell.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Andrew Murray <andrew.murray@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, Gregory Clement <gregory.clement@free-electrons.com>, Mitch Bradley <wmb@firmworks.com>, linux-arm-kernel@lists.infradead.org, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
List-Id: devicetree@vger.kernel.org

On Tuesday 26 March 2013, Thomas Petazzoni wrote:
> When the Marvell Armada 370/XP support was included in the kernel, the
> drivers/irqchip/ directory didn't exist and the minimal infrastructure
> in it also didn't exist. Now that we have those things in place, we
> move the Armada 370/XP IRQ controller driver from
> arch/arm/mach-mvebu/irq-armada-370-xp.c to
> drivers/irqchip/irq-armada-370-xp.c.
> 
> Note in order to reduce code movement and therefore ease the review of
> this patch, we intentionally introduce a forward declaration of
> armada_370_xp_handle_irq(). It is in fact not needed because this
> handler can now simply be implemented before
> armada_370_xp_mpic_of_init(). That will be done in the next commit.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>
