From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 04/14] bus: mvebu-mbus: Add static window allocation to
 the DT binding
Date: Thu, 13 Jun 2013 00:20:30 +0200
Message-ID: <201306130020.30437.arnd@arndb.de>
References: <1370623671-7748-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <201306122352.32749.arnd@arndb.de>
 <20130612220250.GA14852@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20130612220250.GA14852@obsidianresearch.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Cc: Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, devicetree-discuss@lists.ozlabs.org, Grant Likely <grant.likely@secretlab.ca>, Maen Suleiman <maen@marvell.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

On Thursday 13 June 2013, Jason Gunthorpe wrote:
> On Wed, Jun 12, 2013 at 11:52:32PM +0200, Arnd Bergmann wrote:
> > Whether that results in an optimum mapping or not depends on the actual
> > sizes for the child nodes. Since everything is a power-of-two size,
> > a first-fit algorithm actually isn't bad at all.
> 
> The windows must be aligned to their size. eg 1M size window must be
> aligned to a 1M boundary.
> 
> First fit only works if you allocate from largest alignment
> requirement to smallest, otherwise the worst case is something like
> nearly double the largest alignment wasted in alignment padding.

Yes, I realize that, which is why I said it depends on the actual sizes.
If you have a lot of windows that are all the same size and nothing larger,
the worst case isn't too bad.

	Arnd
