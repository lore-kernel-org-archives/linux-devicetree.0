From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v8 00/28] MBus DT binding for Armada 370/XP and Kirkwood
Date: Tue, 23 Jul 2013 17:24:06 +0200
Message-ID: <20130723152406.GH6846@lunn.ch>
References: <1374586292-4941-1-git-send-email-ezequiel.garcia@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1374586292-4941-1-git-send-email-ezequiel.garcia@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, Arnd Bergmann <arnd@arndb.de>, valentin.longchamp@keymile.com, devicetree-discuss@lists.ozlabs.org, Grant Likely <grant.likely@secretlab.ca>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Maen Suleiman <maen@marvell.com>, Lior Amsalem <alior@marvell.com>, gerlando.falauto@keymile.com, Gregory Clement <gregory.clement@free-electrons.com>, Bjorn Helgaas <bhelgaas@google.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 23, 2013 at 10:31:04AM -0300, Ezequiel Garcia wrote:
> After Andrew Lunn reported [1] this work need to take account of Kirkwood
> to prevent breaking PCIe on such platform, here's a new version adding
> MBus DT binding for Kirkwood and in particular using it to declare PCIe
> properly.

Hi Ezequiel

I boot tested on my Kirkwood QNAP. Both DT and legacy style. Both boot
O.K. My device does not actually have any PCI devices on the bus, so
it is not too good a test. But at least the regression is gone.

Tested-by: Andrew Lunn <andrew@lunn.ch>

	   Andrew
