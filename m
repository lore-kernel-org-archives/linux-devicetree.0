From: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Subject: Re: [RFC PATCH 0/3] mtd: nand: add randomizer support
Date: Thu, 1 May 2014 11:59:46 -0600
Message-ID: <20140501175946.GA14539@obsidianresearch.com>
References: <1398906592-24677-1-git-send-email-b.brezillon.dev@gmail.com>
 <20140501163407.GB3296@obsidianresearch.com>
 <536284E1.50001@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <536284E1.50001-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, May 01, 2014 at 07:31:13PM +0200, Boris BREZILLON wrote:

> I totally agree with you, this is not a randomizer but rather a scrambler.
> The reason I chose the "randomizer" word is that all the documents I
> read are talking about randomizers.
> But, other than I don't have any concern about changing all references
> to "randomizer" into "scrambler" ;-).

If nobody else says anything, Scrambler is at least consistent with
Wikipedia..

and 'descrambler' sounds better than 'unrandomizer' :)
 
> > BTW, there are security concerns here. The scrambler PRBS must not be
> > predictable by the user, otherwise they can write data that undoes the
> > scramble and defeat it, ie deliberately writing the last 2k of a 4k
> > write block as all 0's after scrambling could cause the first 2k to be
> > lost. That feels like something that could be scary ..
> 
> AFAICT, the scramblers/randomizers used in NAND applications are all
> predictable, which means the scrambler state does not depend on the last
> data being scrambled.

Right, I'm not surprised storage would use a synchronous scrambler,
self-synchronizing scramblers make the most sense for communication..

However, with a synchronous scrambler the security concern boils down
to how robust and unpredictable is the PRBS.

For instance, re-using the same PRBS seed and staring point for every
block is probably a bad idea.

At the very least I would think the block number should be included in
the per-block seed of the PRBS.

And also a per-parition/device global seed..

I suspect even a properly seeded LFSR is sufficent, but by no means
have I studied this :)

> For example, the sunxi HW scrambler is using a Fibonacci LFSR [1].
> Do you have any example of non predictable scrambler that are used to
> scramble NAND data ?

The benifit here is that the scrambled data is completely private to
the driver and flash chip. So any attack on the scrambler would have
to use the driver as some kind of oracle to search for
synchornization. Eg running through the full keyspace of an N-Bit LFSR
by writing an anti-scrambled block, reading it back and checking if it
is corrupted.

This is why per-block randomization of the PRBS is very important - if
the attacker has only filesytems access then they don't know the block
number and now have to attack the filesystem block allocator as well
as the LFSR block-independent seed to generate an anti-scrambler data
pattern.

But that is just an off the cuff feeling. It would be smart to study
it further :)

Regards,
Jason
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
