From: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [RFC PATCH 0/3] mtd: nand: add randomizer support
Date: Thu, 01 May 2014 19:31:13 +0200
Message-ID: <536284E1.50001@free-electrons.com>
References: <1398906592-24677-1-git-send-email-b.brezillon.dev@gmail.com> <20140501163407.GB3296@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140501163407.GB3296-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Cc: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


On 01/05/2014 18:34, Jason Gunthorpe wrote:
> On Thu, May 01, 2014 at 03:09:49AM +0200, Boris BREZILLON wrote:
>> Hello,
>>
>> This series is a proposal to add support for randomizers (either software
>> or hardware) to NAND flash controller drivers.
> FWIW, I think the term for reversibly combining a PRBS with data is
> 'scrambling', it is often used in communication systems for similar
> reasons - probabilisticly increasing transition density.
>
> randomizing is something else entirely :)

I totally agree with you, this is not a randomizer but rather a scrambler.
The reason I chose the "randomizer" word is that all the documents I
read are talking about randomizers.
But, other than I don't have any concern about changing all references
to "randomizer" into "scrambler" ;-).

>
> BTW, there are security concerns here. The scrambler PRBS must not be
> predictable by the user, otherwise they can write data that undoes the
> scramble and defeat it, ie deliberately writing the last 2k of a 4k
> write block as all 0's after scrambling could cause the first 2k to be
> lost. That feels like something that could be scary ..

AFAICT, the scramblers/randomizers used in NAND applications are all
predictable, which means the scrambler state does not depend on the last
data being scrambled.
For example, the sunxi HW scrambler is using a Fibonacci LFSR [1].
Do you have any example of non predictable scrambler that are used to
scramble NAND data ?

Best Regards,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
