From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] [RFC] OF: probe order dependency aware of_platform_populate
Date: Fri, 20 Mar 2015 11:56:14 +0000
Message-ID: <CACxGe6tBX2XzfKOT+vs9v2wAJLYUL3-zaMXeH99T_46Y+sxhog@mail.gmail.com>
References: <1418731891-24768-1-git-send-email-pantelis.antoniou@konsulko.com>
 <20150319191834.5346CC40A35@trevor.secretlab.ca> <8E250936-B06C-40B4-8C34-557D2361CAF6@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8E250936-B06C-40B4-8C34-557D2361CAF6-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 20, 2015 at 11:39 AM, Pantelis Antoniou
<pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> Hi Grant,
>
>> On Mar 19, 2015, at 21:18 , Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
>>
>> On Tue, 16 Dec 2014 14:11:31 +0200
>> , Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
>> wrote:
>>> A nice side-effect of the changes in DTC for supporting overlays
>>> is that it is now possible to do dependency tracking of platform
>>> devices automatically.
>>>
>>> This patch implements dependency aware probe order for users
>>> of of_platform_populate.
>>>
>>> There are no changes in the syntax of the DTS bindings, the
>>> dependency is generated automatically by the use of phandle
>>> references.
>>
>> Do you have measurements showing improvement? Conceptually, I don't have
>> a problem with having a small scale solution like this, but I want proof
>> that it actively makes things better, and is worth the extra complexity.
>> It's not an easy block of code to understand.
>>
>
> I will be the first to admit that the code it's a bit hard to follow, but
> that's the nature of trees and recursion.
>
> FWIW I've been booting with this applied for a month with no adverse effects,
> besides the fact that there dependency cycles which I would file as a bug.
>
>
>> However, this only papers over a fundamental limitation of the device
>> model, and only works within the context of a single
>> platform_device_populate() call. It doesn't help for subsequent calls,
>> and it does nothing for dependecies with i2c/spi/whatever. It also
>> doesn't help much when drivers are in modules that won't get loaded
>> until after userspace starts. (although changing device registration
>> order may mostly get userspace to load drivers in the right order).
>>
>
> True, it only works within that single context. The logic however does
> recurse into the children nodes and does rearrange the order of even
> i2c/spi phandle references. So while it does nothing for the subsequent
> populate() calls it does the 'right thing' for the probe order at that level.
>
> The block of code that does the 're-arranging' can trivially be factored out
> into a general purpose of-helper so that would work for all other users besides
> platform devices.
>
>> g.
>>
>
> Admittedly this is all a bit rough and a proof of concept, but that's why it's an
> RFC, no?
>
> I would be happy to discuss the details of this at ELC. Think you can arrange for another
> DT BoF?

I'd be happy to chat at ELC. Unfortunately, I will only be there on
Wednesday, so my time is limited.

g.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
