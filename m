From: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [dtc PATCH V2] Warn on node name unit-address presence/absence mismatch
Date: Fri, 27 Sep 2013 10:34:48 -0500
Message-ID: <2F513172-55DB-4482-8561-872420B07737@codeaurora.org>
References: <1379613263-32080-1-git-send-email-swarren@wwwdotorg.org> <3D2FE31C-A6BB-4F70-9B3B-C55012CB56B3@codeaurora.org> <5244BF7A.4000100@wwwdotorg.org> <1380245438.28561.86.camel@pasglop> <20130927051718.GE2716@voom.fritz.box>
Mime-Version: 1.0 (Apple Message framework v1283)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130927051718.GE2716-RXTfZT5YzpxwFLYp8hBm2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rohit Vaswani <rvaswani-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On Sep 27, 2013, at 12:17 AM, David Gibson wrote:

> On Fri, Sep 27, 2013 at 11:30:38AM +1000, Benjamin Herrenschmidt wrote:
>> On Thu, 2013-09-26 at 17:12 -0600, Stephen Warren wrote:
>>> Well, ePAPR seems pretty specific that unit address and reg are
>>> related,
>>> but says nothing about ranges in the section on node naming, nor about
>>> node naming in the section about ranges.
>>> 
>>> I'd claim that the existing PPC trees are nonconforming, and should be
>>> fixed too:-)
>> 
>> This is tricky, we should probably fix ePAPR here.
>> 
>> If you have a "soc" bus covering a given range of addresses which it
>> forwards to its children devices but doesn't have per-se its own
>> registers in that area, then it wouldn't have a "reg" property. I would
>> thus argue that in the absence of a "reg" property, if a "ranges" one is
>> present, the "parent address" entry in there is an acceptable substitute
>> for the "reg" property as far as unit addresses are concerned.
> 
> So, that's been accepted practice in fdt world for a while; I think
> ePAPR already permits that, in fact.

Are you saying that the bus binding would cover this case or something else?

>> Also don't forget that in real OFW land, the unit address is something
>> that's somewhat bus specific ... for example, PCI uses "dev,fn" rather
>> than the full 96-bit number of the "reg" entry :-)
>> 
>> Another option which would more strictly conform to ePAPR and in fact to
>> of1275 would be to require such bus nodes to have a "reg" property with
>> the address value set to the beginning of the range and the size value
>> set to 0 :-)

Uugh, that's a bit ugly.  I wonder what breaks if we had reg w/size 0.

- k

-- 
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
