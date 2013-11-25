From: arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org (Arnaud Ebalard)
Subject: Re: [PATCH 3/4] ARM: mvebu: NETGEAR ReadyNAS 104 .dts file cleanup
Date: Mon, 25 Nov 2013 23:03:36 +0100
Message-ID: <87vbzgf8av.fsf@natisbad.org>
References: <cover.1385148929.git.arno@natisbad.org>
	<bd899cfc2b0b3d22a7442d76b3901ca81ca86f11.1385148929.git.arno@natisbad.org>
	<20131122213610.GC30358@obsidianresearch.com>
	<878uwg5b6e.fsf@natisbad.org>
	<20131125194117.GA5413@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131125194117.GA5413-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org> (Jason Gunthorpe's
	message of "Mon, 25 Nov 2013 12:41:17 -0700")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org> writes:

> On Fri, Nov 22, 2013 at 11:22:33PM +0100, Arnaud Ebalard wrote:
>
>> and also the fact that *in my case* the kernel does its job
>> auto-detecting the PHY, I now also wonder how the kernel can
>> use that info and what I get by adding the compatible string.
>
> I think the main rational was to document what chip the phy is to
> people who don't have the hardware...
>
> You probably shouldn't delay your patch on this issue, document the
> phy chip model in a comment?

Will do that.

> Also, check if it is actually an S varient or not, they have the same
> phy-id.. ;)

On the chip, I have 88E1318-NNB2 (PNN1230_3JW 1209 A0P TW). I will see
if I can find more info.

Cheers,

a+
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
