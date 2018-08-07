From: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: only apply reset hacks to broken hardware
Date: Tue, 7 Aug 2018 12:22:42 -0700
Message-ID: <20180807192242.GA139259@ban.mtv.corp.google.com>
References: <20180727183313.137943-1-computersforpeace@gmail.com>
 <20180727220337.1b3375ca@bbrezillon>
 <87wotcrz94.fsf@notabene.neil.brown.name>
 <20180731221255.3e65c1fa@bbrezillon>
 <20180731223550.GA60117@ban.mtv.corp.google.com>
 <20180807183901.GB31722@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180807183901.GB31722@rob-hp-laptop>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Zhiqiang Hou <Zhiqiang.Hou@nxp.com>, NeilBrown <neilb@suse.com>, Boris Brezillon <boris.brezillon@bootlin.com>, linux-mtd@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 07, 2018 at 12:39:01PM -0600, Rob Herring wrote:
> On Tue, Jul 31, 2018 at 03:35:50PM -0700, Brian Norris wrote:
> > One reason I didn't specifically say something like "not connected", is
> > because IIUC it's actually *possible* to have a robust boot sequence
> > without the RESET# pin -- e.g., if your boot ROM hardcoded a software
> > reset command (just because it's not really standardized doesn't mean
> > one can't do it).
> 
> Based on that, then it sounds like you need a specific compatible string 
> so you too can know how to s/w reset the device.

We do also support compatible properties for these chips, where needed.
But I don't think that's really needed.

> I guess you are assuming a bootloader didn't leave the flash in an 
> unknown addressing state?

For some of these address states (at least, 3-byte vs. 4-byte
addressing), we can still identify the device independently; the READ ID
command works in either mode.

The problem is that a boot ROM is rarely as complex as a Linux driver
and probably can't be updated. And they usually do stupid things anyway.
So *that's* where you need a well-defined entry state for the flash.

Brian

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
