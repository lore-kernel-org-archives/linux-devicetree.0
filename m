From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/1] platform: goldfish: pipe: add devicetree bindings
Date: Fri, 27 Nov 2015 14:14:03 -0600
Message-ID: <CAL_JsqLf1hQjw=SnnF4B0jFT18DsugeTXfJ1oGio5NVsepm-ug@mail.gmail.com>
References: <1448481582-16991-1-git-send-email-jinqian@android.com>
 <20151125202416.GA4636@rob-hp-laptop> <20151126083412.GB14945@lvm> <56589E48.9000708@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56589E48.9000708-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Hackmann <ghackmann-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Christoffer Dall <christoffer.dall-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jin Qian <jinqian-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Peter Senna Tschudin <peter.senna-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 27, 2015 at 12:17 PM, Greg Hackmann <ghackmann-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org> wrote:
> On 11/26/15 12:34 AM, Christoffer Dall wrote:
>>
>> On Wed, Nov 25, 2015 at 02:24:16PM -0600, Rob Herring wrote:
>>>
>>>
>>> The binding may be trivial, but there's a bigger question of whether
>>> this is the right long term direction. For example is upstream QEMU
>>> going to take all the Android pipe stuff? Couldn't virtio be used here
>>> as the transport?
>>>
>>
>> But I wonder if that should really block this from being merged?  The
>> support may not be in QEMU but it's in the Android emulator and it would
>> be a less broken implementation with these patches in the kernel than
>> without, I think.
>>
>> -Christoffer
>>
>
> To add to Christoffer's point, we added these bindings so we don't need to
> rely on the goldfish virtual bus for probing anymore.
>
> Switching from the goldfish virtual bus to Device-Tree already eliminates
> one big piece where the Android emulator has diverged from upstream qemu.
> And on the kernel side, it means we don't need ARM and MIPS goldfish board
> code to instantiate the bus.

Okay, fair enough. That's not evident from the patch.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
