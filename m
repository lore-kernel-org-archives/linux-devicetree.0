From: Huang Shijie <shijie.huang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] mtd: gpmi: Remove "We support only one NAND chip" from
 bindings doc
Date: Tue, 2 Dec 2014 08:38:40 +0800
Message-ID: <20141202003840.GA11370@shldeISGChi005.sh.intel.com>
References: <1417097929-17832-1-git-send-email-sr@denx.de>
 <20141128014832.GA3113@localhost.localdomain>
 <54781DD5.5030801@denx.de>
 <20141129024047.GA5056@localhost.localdomain>
 <20141130065326.GB3608@norris-Latitude-E6410>
 <20141130154255.GB14834@localhost.localdomain>
 <547C3BB9.1010706@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <547C3BB9.1010706-ynQEQJNshbs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Roese <sr-ynQEQJNshbs@public.gmane.org>
Cc: Huang Shijie <shijie8-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Dec 01, 2014 at 10:58:17AM +0100, Stefan Roese wrote:
> On 30.11.2014 16:42, Huang Shijie wrote:
> > On Sat, Nov 29, 2014 at 10:53:26PM -0800, Brian Norris wrote:
> >> On Sat, Nov 29, 2014 at 10:40:50AM +0800, Huang Shijie wrote:
> >>> On Fri, Nov 28, 2014 at 08:01:41AM +0100, Stefan Roese wrote:
> >>>> On 28.11.2014 02:48, Huang Shijie wrote:
> >>>>> On Thu, Nov 27, 2014 at 03:18:49PM +0100, Stefan Roese wrote:
> >>>>>> This sentence "We support only one NAND chip now" is not true any more.
> >>>>>> Multiple chips are supported. So lets remove this sentence to not
> >>>>>
> >>>>> The gpmi can only supports one chip. Of course, there are maybe two dies
> >>>>> in this single chip.
> >>>>
> >>>> Now I'm a bit confused. The i.MX6 supports 4 chips select signals. And isn't
> >>>> "two dies in this single chip" not practically the same as connecting 2 (or
> >>>> more) chips (same device) to multiple chip selects of the SoC? Where is the
> >>>> difference here?
> >>> The "one chip" here is means the "one package" (TSOP or BGA ....).
> >>
> >> Then why is this even in the DT binding doc? Isn't that a board-level
> >> constraint (and not a chip property) which should be obvious to the
> >> user? If so, then should we just drop the language? Or at a minimum,
> >> make it more specific so it doesn't confuse readers.
> > 
> > yes. It is okay to send a patch to make it more clear.
> > 
> >>
> >>> (In logic, "two dies in this single chip" is same as connecting 2 chips
> >>> to the gpmi.)
> >>
> >> ...which means that logically, you can connect more than one chip to the
> >> GPMI, right?
> > The gpmi can only connect with one physical chip now, but there maybe
> > two DIEs in this chip.
> 
> I really fail to see why you make this distinction between two chips on a die
> and two external chips. For the SoC this should really look identical, right?
> 
> Please explain again, why exactly only two chips on one die are supported.
There are only 8 data lines for gpmi.  I guess there may bugs in the
gpmi driver to support the two external chips in such case:
        Two different processes access different NAND chips at the same
	time.

I even did not have enough time to test the "two chips on a die" case very carefully before
I left freescale.

> 
> BTW: We have a custom i.MX6DL based board with 2 NAND chips connected. And

Very good. Please test this board with the UBIFS in the multi processes
case. (I ever used the bonnie++) 


> Linux seems to support both chips just fine. Here the boot log:
> 
> [    1.085812] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xdc
> [    1.092218] nand: Micron MT29F4G08ABADAH4
> [    1.096245] nand: 512MiB, SLC, page size: 2048, OOB size: 64
> [    1.102171] nand: 2 chips detected
> [    1.106156] gpmi-nand 112000.gpmi-nand: enable the asynchronous EDO mode 5
> [    1.113094] Scanning device for bad blocks
could you please post more log?

thanks
Huang Shijie

> 
> Comments welcome...
> 
> Thanks,
> Stefan
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
