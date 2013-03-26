From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFCv1 01/11] arm: mvebu: move L2 cache initialization in
 init_early()
Date: Tue, 26 Mar 2013 16:53:48 +0000
Message-ID: <201303261653.48998.arnd@arndb.de>
References: <1364316746-8702-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1364316746-8702-2-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1364316746-8702-2-git-send-email-thomas.petazzoni@free-electrons.com>
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
> @@ -72,6 +73,10 @@ void __init armada_370_xp_init_early(void)
>                         ARMADA_370_XP_MBUS_WINS_SIZE,
>                         ARMADA_370_XP_SDRAM_WINS_BASE,
>                         ARMADA_370_XP_SDRAM_WINS_SIZE);
> +
> +#ifdef CONFIG_CACHE_L2X0
> +       l2x0_of_init(0, ~0UL);
> +#endif

I guess you should remove the #ifdef as well here, it's not needed.

	Arnd
