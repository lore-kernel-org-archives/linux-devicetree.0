From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC 3/3] checks: Add unit-address checks for PCI buses
Date: Fri, 1 Apr 2016 14:52:44 -0500
Message-ID: <CAL_JsqK5Ze4P8ofykfebV30TrMzur0cvhZi_RQMkW-kUbsvTpw@mail.gmail.com>
References: <1458780021-5052-1-git-send-email-robh@kernel.org>
 <1458780021-5052-3-git-send-email-robh@kernel.org> <20160331053220.GF416@voom.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160331053220.GF416-1s0os16eZneny3qCrzbmXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 31, 2016 at 12:32 AM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Wed, Mar 23, 2016 at 07:40:21PM -0500, Rob Herring wrote:
>> PCI device unit addresses are in the form DD or DD,F where DD is the
>> device 0-0x1f and F is the function 0-7. Add checks that the unit
>> address matches this form.
>
> Hmm.. we ought to be able to do a bit better than this, again by
> constructing the expected unit address from reg.

If I do that, I can't check the dev and function values are within range.

> While we're at it,
> it probably makes sense to have that dependent on a check which makes
> sure the first entry in a pci device's 'reg' is the config address.

You mean just check the first cell masked with 0x1f000000 is 0, right?

Really, I'm not so worried about checking PCI devices. DT's with PCI
devices described are rare. All I really want to check first are
leading 0s, leading 0x and uppercase hex. That's 90% of what I find in
reviews and am tired of commenting on. I do think bus specific checks
are useful, but don't think we need to fill them all in right now.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
