From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [RESEND PATCH v7 00/22] MBus DT binding: The return of PCIe
Date: Sun, 21 Jul 2013 17:27:00 +0200
Message-ID: <20130721172700.6bd14e58@skate>
References: <1373900271-4722-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20130720165855.GB26625@lunn.ch> <20130720173847.GC26625@lunn.ch>
 <20130720185443.GB21460@localhost> <20130720194559.GA27517@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20130720194559.GA27517@lunn.ch>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Lior Amsalem <alior@marvell.com>, Grant Likely <grant.likely@secretlab.ca>, Jason Cooper <jason@lakedaemon.net>, Arnd Bergmann <arnd@arndb.de>, devicetree-discuss@lists.ozlabs.org, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Maen Suleiman <maen@marvell.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Gregory Clement <gregory.clement@free-electrons.com>, Bjorn Helgaas <bhelgaas@google.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

Dear Andrew Lunn,

On Sat, 20 Jul 2013 21:45:59 +0200, Andrew Lunn wrote:
> > The patchset works only for Armada 370 and Armada XP SoC, not for Kirkwood.
> > For some reason I was completely sure there wasn't any DT-enabled Kirkwood
> > boards with PCIe support.
> 
> I had a quick look at Dove and Orion5x. It looks like there are none
> with PCIe support. So only Kirkwood is broken.

There are some Dove and Orion5x with PCIe support, but none of them are
using the new PCIe driver yet.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
