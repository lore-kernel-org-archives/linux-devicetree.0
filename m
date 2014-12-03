From: Huang Shijie <shijie.huang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] mtd: gpmi: Remove "We support only one NAND chip" from
 bindings doc
Date: Wed, 3 Dec 2014 08:35:42 +0800
Message-ID: <20141203003542.GA7895@shldeISGChi005.sh.intel.com>
References: <1417097929-17832-1-git-send-email-sr@denx.de>
 <20141128014832.GA3113@localhost.localdomain>
 <54781DD5.5030801@denx.de>
 <20141129024047.GA5056@localhost.localdomain>
 <20141130065326.GB3608@norris-Latitude-E6410>
 <20141130154255.GB14834@localhost.localdomain>
 <547C3BB9.1010706@denx.de>
 <20141202003840.GA11370@shldeISGChi005.sh.intel.com>
 <547D6A0A.70409@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <547D6A0A.70409-ynQEQJNshbs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Roese <sr-ynQEQJNshbs@public.gmane.org>
Cc: Huang Shijie <shijie8-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 02, 2014 at 08:28:10AM +0100, Stefan Roese wrote:
> On 02.12.2014 01:38, Huang Shijie wrote:
> > On Mon, Dec 01, 2014 at 10:58:17AM +0100, Stefan Roese wrote:
> >> On 30.11.2014 16:42, Huang Shijie wrote:
> >>> On Sat, Nov 29, 2014 at 10:53:26PM -0800, Brian Norris wrote:
> >>>> On Sat, Nov 29, 2014 at 10:40:50AM +0800, Huang Shijie wrote:
> >>>>> On Fri, Nov 28, 2014 at 08:01:41AM +0100, Stefan Roese wrote:
> >>>>>> On 28.11.2014 02:48, Huang Shijie wrote:
> >>>>>>> On Thu, Nov 27, 2014 at 03:18:49PM +0100, Stefan Roese wrote:
> >>>>>>>> This sentence "We support only one NAND chip now" is not true any more.
> >>>>>>>> Multiple chips are supported. So lets remove this sentence to not
> >>>>>>>
> >>>>>>> The gpmi can only supports one chip. Of course, there are maybe two dies
> >>>>>>> in this single chip.
> >>>>>>
> >>>>>> Now I'm a bit confused. The i.MX6 supports 4 chips select signals. And isn't
> >>>>>> "two dies in this single chip" not practically the same as connecting 2 (or
> >>>>>> more) chips (same device) to multiple chip selects of the SoC? Where is the
> >>>>>> difference here?
> >>>>> The "one chip" here is means the "one package" (TSOP or BGA ....).
> >>>>
> >>>> Then why is this even in the DT binding doc? Isn't that a board-level
> >>>> constraint (and not a chip property) which should be obvious to the
> >>>> user? If so, then should we just drop the language? Or at a minimum,
> >>>> make it more specific so it doesn't confuse readers.
> >>>
> >>> yes. It is okay to send a patch to make it more clear.
> >>>
> >>>>
> >>>>> (In logic, "two dies in this single chip" is same as connecting 2 chips
> >>>>> to the gpmi.)
> >>>>
> >>>> ...which means that logically, you can connect more than one chip to the
> >>>> GPMI, right?
> >>> The gpmi can only connect with one physical chip now, but there maybe
> >>> two DIEs in this chip.
> >>
> >> I really fail to see why you make this distinction between two chips on a die
> >> and two external chips. For the SoC this should really look identical, right?
> >>
> >> Please explain again, why exactly only two chips on one die are supported.
> > There are only 8 data lines for gpmi.  I guess there may bugs in the
> > gpmi driver to support the two external chips in such case:
> >          Two different processes access different NAND chips at the same
> > 	time.
> 
> I don't see why this should be a problem. All SoC's that support multiple
> NAND chips (I've seen so far) only use 8 data lines for this.

ok.
If your test result can prove that the gpmi can support two chips.

I can ack this patch. (I ever thought the gpmi needs an extra patch to
support the multiple chips)

> 
> > I even did not have enough time to test the "two chips on a die" case very carefully before
> > I left freescale.
> 
> I see. Thanks for the hint. But this "two chips on a die" scenario did
> pass some basic tests, no?
yes. It passed the bonnie++ test.

thanks
Huang Shijie
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
