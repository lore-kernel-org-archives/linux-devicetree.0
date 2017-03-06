From: Stewart Smith <stewart-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: Re: Extending /memreserve/ to allow defining descriptions
Date: Tue, 07 Mar 2017 10:28:28 +1100
Message-ID: <87r32a6l43.fsf@linux.vnet.ibm.com>
References: <9c1cb5e8-2afd-e266-72b9-20ca6622956e@gmail.com> <20170306035856.GF12030@umbus.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170306035856.GF12030-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree@vger.kernel.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> writes:
> What you could do is to add properties within the device tree further
> annotating the reservations, with the extra structure essentially just
> acting as an easy-to-parse summary of that.  In fact I know that POWER
> systems firmware use 'reserved-ranges' and 'reserved-names' properties
> for this.  I don't know if anyone else has adopted that though.

We've also been toying with the idea of creating a binding for "named
reserved memory range that should probably show up in debugfs"

I'd also be happy with a standard binding to do it.

-- 
Stewart Smith
OPAL Architect, IBM.
