From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] of: Overlay manager
Date: Fri, 9 Sep 2016 16:13:27 -0500
Message-ID: <CAL_Jsq+ED-6aKxKVjvjVxGF8wv=6vqCeHLiD5M3TLmAj+++EWA@mail.gmail.com>
References: <001a113447d4718cb9053c04f991@google.com> <57D1D344.8010306@gmail.com>
 <CAH7ZN-w2U9g4m9hDdD1kY52HLzv+TSbuNVRbmzmE3WMH0wC8Tw@mail.gmail.com>
 <CAL_JsqKe99WLoeOrRz76mUx-QruhDU+4kqCAepgZa0LhSYbgDg@mail.gmail.com>
 <CALAqxLVPdZxMy+W0VEJqX+L9CCy4cBsc0s48BwepSA8-ApUhtQ@mail.gmail.com>
 <CAL_JsqKgGFPKZR8fJ-CRQubNjWH0q_V9B9SsXoHncT9dMGdF1w@mail.gmail.com>
 <CALAqxLXLNQZMCrgLGa-=nGFbB-XVbs9FHXnGrksCO8V_mAkK0w@mail.gmail.com> <08C47A45-3704-4181-B065-B0E5975B878B@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <08C47A45-3704-4181-B065-B0E5975B878B-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Dmitry Shmidt <dimitrysh-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "<linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 9, 2016 at 2:26 PM, Pantelis Antoniou
<pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> Hi John,
>
>> On Sep 9, 2016, at 06:06 , John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>>
>> On Thu, Sep 8, 2016 at 7:27 PM, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>>> On Thu, Sep 8, 2016 at 7:39 PM, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>>>> On Thu, Sep 8, 2016 at 5:33 PM, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>>>>> If you can figure out how to change the command line, then you can
>>>>> just change the dtb. At least for how Android boot works, those aren't
>>>>> really changed separately.
>>>>
>>>> Ehh.. that's not so simple. The dtb is often appended to the kernel on
>>>> Android devices. Changing the boot arguments is much simpler to do.
>>>
>>> How? You typically make a new bootimage assembling the kernel/dtb,
>>> ramdisk and kernel command-line. If things were done differently such
>>> that the dtb is part of the bootloader (how it is supposed to be
>>> done), then I would buy the argument that we can't update the dtb and
>>> need to either have a way to add and/or select overlays. But Android
>>> folks like to update *everything*, so I don't buy that here.
>>
>> So in many cases the dtb is appended when the kernel is built, not
>> when the abootimg is assembled.
>>
>> So its much easier to use abootimg -u to update a prebuilt boot.img in
>> place and reflash. That way users don't need to regenerate the kernel
>> w/ appended dtb.
>>
>
> I understand what you’re trying to do, but it’s not going to work.
>
> It will only work for a very small subset of overlays since you can’t
> have more than a single phandle label.

labels are just shortcuts that have no bearing on the actual dtb. The
only problem here is if you take 2 standalone overlays and include or
move them into a single source, then you may have to fixup any label
collisions.

>
> For instance this will not work:
>
> overlays {
>         overlay_0 {
>                 opt: opt_0 { bar; };
>         };
>         overlay_1 {
>                 opt: opt_1 { baz; };
>         };
> };
>
>
> frob_device {
>         compatible = “frob”;
>         use = <&opt>;
> };

I'm trying to think of a real example where we would want the base dt
point to a phandle in an overlay. If that works, I think we should
make it not work.

We need to back up and decide at what stage/level do we support
combining base DT and overlays? Doing this at the source level is just
making me more worried what kind of abuses there could be if the base
dt and overlays are in the same source and the inability to enforce
what's supported/allowed. I'm thinking we should require the source be
separate and let dtc figure out how to merge them. Then we have the
same source syntax whether the overlay remains separate or combined.
Maybe it ends up merged like this or we extend the FDT format to
append overlays.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
