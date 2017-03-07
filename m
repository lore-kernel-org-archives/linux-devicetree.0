From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Extending /memreserve/ to allow defining descriptions
Date: Mon, 6 Mar 2017 16:12:59 -0800
Message-ID: <fba988e1-40a0-4a7e-e680-45c7360c5aa3@gmail.com>
References: <9c1cb5e8-2afd-e266-72b9-20ca6622956e@gmail.com>
 <20170306035856.GF12030@umbus.fritz.box> <87r32a6l43.fsf@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87r32a6l43.fsf-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stewart Smith <stewart-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 03/06/2017 03:28 PM, Stewart Smith wrote:
> David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> writes:
>> What you could do is to add properties within the device tree further
>> annotating the reservations, with the extra structure essentially just
>> acting as an easy-to-parse summary of that.  In fact I know that POWER
>> systems firmware use 'reserved-ranges' and 'reserved-names' properties
>> for this.  I don't know if anyone else has adopted that though.
> 
> We've also been toying with the idea of creating a binding for "named
> reserved memory range that should probably show up in debugfs"
> 
> I'd also be happy with a standard binding to do it.

Seems like
Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
may be a good place to add descriptive properties about what these
reserved regions are? The code parsing this also seems to be easily
extensible with adding custom "name" properties.

Using "reserved-names" sounds like a good thing, I will be looking into
submitting a binding update in the next few days, but if you beat me to
it, happy to review it.

Tangential: is it me, or it's possible for /memreserve/'s address and
size cells to disagree with #address-cells and #size-cells defined by
the top-level node?
-- 
Florian
