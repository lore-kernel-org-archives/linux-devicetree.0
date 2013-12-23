From: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 0/3] Extend dtc with data type handling
Date: Mon, 23 Dec 2013 20:00:54 +0100
Message-ID: <2257946.KY9lGl9U4o@amdc1227>
References: <1386953352-25402-1-git-send-email-t.figa@samsung.com>
 <20131223120814.GE12407@voom.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20131223120814.GE12407-RXTfZT5YzpxwFLYp8hBm2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Benoit Cousson <bcousson-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Monday 23 of December 2013 23:08:14 David Gibson wrote:
> On Fri, Dec 13, 2013 at 05:49:09PM +0100, Tomasz Figa wrote:
> > This series intends to extend dtc with appropriate infrastructure
> > to handle property data types. First, dtc is modified to preserve
> > type information when parsing DTS. Then type guessing is implemented
> > for flat and fs trees where type data is not available. After that,
> > DTS generation code is modified to use only type information when
> > printing property data.
> 
> Hrm.  I think this is completely backwards to the right approach.
> 
> For dt checking what we want is a schema.  That can specify datatypes
> amongst other constraints, but in the end you can check the actual
> bytes of the DT against the constraints imposed by the schema,
> regardless of how those bytes are presented to the checker.

Those constraints are usually types, so you need a way to extract them
from source DTS.

> 
> By adding type information to the in-flight tree you're checking not
> the actual content of the DT, but how you've chosen to express that
> information in DTS format.
> 
> More concretely, we should be able to schema-check trees in binary
> format, not just source.  With these patches that will fail if -I dtb
> makes the wrong type guesses.

I'm not quite sure what do you want to check in binary format, where
properties are just strings of bytes. All you can check is whether there
is enough bytes or possibly some value constraints on particular parts
of it, but not types.

IMHO what we primarily need is source validation. Of course using schemas,
but that's already decided.

Best regards,
Tomasz

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
