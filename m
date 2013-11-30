From: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v5 1/3] mtd: nand: gpio: Add DT property to automatically
 determine bus width
Date: Sat, 30 Nov 2013 01:15:56 -0800
Message-ID: <20131130091556.GD29397@norris.computersforpeace.net>
References: <1384343884-29622-1-git-send-email-shc_work@mail.ru>
 <20131127012158.GR9468@ld-irv-0074.broadcom.com>
 <20131127012338.GS9468@ld-irv-0074.broadcom.com>
 <20131129122551.GC2815@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20131129122551.GC2815@localhost>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Alexander Shiyan <shc_work@mail.ru>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Artem Bityutskiy <dedekind1@gmail.com>, Rob Herring <rob.herring@calxeda.com>, linux-mtd@lists.infradead.org, Haojian Zhuang <haojian.zhuang@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Eric Miao <eric.y.miao@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Pekon Gupta <pekon@ti.com>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 29, 2013 at 09:25:52AM -0300, Ezequiel Garcia wrote:
> On Tue, Nov 26, 2013 at 05:23:38PM -0800, Brian Norris wrote:
> [..]
> > > 
> > > If we do resort to a new binding for auto-buswidth, it should be a
> > > generic one that all NAND drivers can use.
> 
> Why do we need yet another binding to describe something that's
> completely discoverable?

The DT property is not specified only for the sake of the flash chip
itself, but for the sake of the controller which supports it. I suppose
we've kind of overloaded its usage, but it is not entirely
auto-detectable.

> I'm working on *removing* any need to set the bus width, either from the
> driver or from the DT, so I see this patch as step backwards.

Well, I disagree with the removal ;)

> Can anyone help me understand if there's *any* valid use case where we
> want to specify a-priori the bus width, considering it's completely
> discoverable at run-time?

I think the primary use case should be to reflect a limitation in the
hardware (besides just the flash chip). It can mean that the controller
itself only supports one bus width, or that the board is only wired up
for x8, for instance.

Brian

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
