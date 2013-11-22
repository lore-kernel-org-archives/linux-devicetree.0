From: arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org (Arnaud Ebalard)
Subject: Re: [PATCH 3/4] ARM: mvebu: NETGEAR ReadyNAS 104 .dts file cleanup
Date: Fri, 22 Nov 2013 23:22:33 +0100
Message-ID: <878uwg5b6e.fsf@natisbad.org>
References: <cover.1385148929.git.arno@natisbad.org>
	<bd899cfc2b0b3d22a7442d76b3901ca81ca86f11.1385148929.git.arno@natisbad.org>
	<20131122213610.GC30358@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131122213610.GC30358-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org> (Jason Gunthorpe's
	message of "Fri, 22 Nov 2013 14:36:10 -0700")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org> writes:

> On Fri, Nov 22, 2013 at 09:07:01PM +0100, Arnaud Ebalard wrote:
>>  			mdio {
>>  				phy0: ethernet-phy@0 {
>> +					compatible = "marvell,88e1318s";
>>  					reg = <0>;
>>  				};
>>  
>>  				phy1: ethernet-phy@1 {
>> +					compatible = "marvell,88e1318s";
>>  					reg = <1>;
>>  				};
>>  			};
>
> Just an inquiry, are these compatible strings OK?
>
> Documentation/devicetree/bindings/net/phy.txt doesn't really give
> guidance.
>
> For self-discoverable busses I would expect to see a structured
> compatible string, or property, that encodes the phy-id - such as what
> the PCI binding does with vid/did:
>
> "compatible" Construct a list of names in most-specific to
>              least-specific order. The names shall be derived from
> 	     values of the Vendor ID, Device ID, Subsystem Vendor ID,
> 	     Subsystem ID, Revision ID and Class Code bytes, and shall
>              have the following form, and be placed in the list in the
>              following order:
>
>   pciVVVV,DDDD.SSSS.ssss.RR (1)
>
> So, I would think something like this:
>
> compatible = "ethernet-phy-id0141,0e90"; /* Marvell 88E1318 */

The compatible string I put is based on this discussion:

 http://www.spinics.net/lists/devicetree/msg11465.html

Now, considering the following:

arno@small:linux$ grep -R -88e1318s . | wc -l
0

and also the fact that *in my case* the kernel does its job
auto-detecting the PHY, I now also wonder how the kernel can
use that info and what I get by adding the compatible string.

Anyway, I'll wait for directions on how this should be fixed
before sending a v2 of the set.

Thanks for catching this, Jason.

Cheers,

a+
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
