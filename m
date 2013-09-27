From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [dtc PATCH V2] Warn on node name unit-address presence/absence
 mismatch
Date: Fri, 27 Sep 2013 11:30:38 +1000
Message-ID: <1380245438.28561.86.camel@pasglop>
References: <1379613263-32080-1-git-send-email-swarren@wwwdotorg.org>
	 <3D2FE31C-A6BB-4F70-9B3B-C55012CB56B3@codeaurora.org>
	 <5244BF7A.4000100@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5244BF7A.4000100-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rohit Vaswani <rvaswani-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 2013-09-26 at 17:12 -0600, Stephen Warren wrote:
> Well, ePAPR seems pretty specific that unit address and reg are
> related,
> but says nothing about ranges in the section on node naming, nor about
> node naming in the section about ranges.
> 
> I'd claim that the existing PPC trees are nonconforming, and should be
> fixed too:-)

This is tricky, we should probably fix ePAPR here.

If you have a "soc" bus covering a given range of addresses which it
forwards to its children devices but doesn't have per-se its own
registers in that area, then it wouldn't have a "reg" property. I would
thus argue that in the absence of a "reg" property, if a "ranges" one is
present, the "parent address" entry in there is an acceptable substitute
for the "reg" property as far as unit addresses are concerned.

Also don't forget that in real OFW land, the unit address is something
that's somewhat bus specific ... for example, PCI uses "dev,fn" rather
than the full 96-bit number of the "reg" entry :-)

Another option which would more strictly conform to ePAPR and in fact to
of1275 would be to require such bus nodes to have a "reg" property with
the address value set to the beginning of the range and the size value
set to 0 :-)

Cheers,
Ben


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
