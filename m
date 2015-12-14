From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC][PATCH] misc: Introduce reboot_reason driver
Date: Mon, 14 Dec 2015 09:22:41 -0600
Message-ID: <CAL_Jsq+Mta5z6HSx+3AatGYmyhuWG=9C-Eoq=UYA9YEhsXwDLg@mail.gmail.com>
References: <1449610162-30543-1-git-send-email-john.stultz@linaro.org>
 <CAL_Jsq+s1Lk9s=dvSAe-rerSc1aUO39tkBnsrkoNqJoET3VNjw@mail.gmail.com>
 <CALAqxLVKhQT4Ba3JFVKpV79PnAsjYDARRO8M5U5=3Jjx45h6WQ@mail.gmail.com> <1552521.IZhVsTdxHT@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1552521.IZhVsTdxHT@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Vinay Simha BN <simhavcs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Android Kernel Team <kernel-team-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 10, 2015 at 4:11 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Thursday 10 December 2015 13:43:16 John Stultz wrote:
>> On Thu, Dec 10, 2015 at 12:24 PM, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>> > The fact that we are using notifiers for reset reason and triggering
>> > is probably some indication that some infrastructure is needed. But I
>> > don't think you need to do that here as long as it is all kernel
>> > internals. We'll make the 2nd guy do it.
>>
>>
>>
>> Though, just so I understand better, what is problematic w/ the reset
>> notifiers? They provide the reboot command argument, which is the core
>> of what is needed. It actually seemed like it was almost designed with
>> this problem in mind.
>
> Notifiers in general are a bit of a kludge. We often use them in places
> that have not been abstracted well enough yet, and they make it
> less obvious what is actually going on when something happens, or
> in what order things are called.

Exactly.

> I'm actually less worried about the notifier side here than about
> the general problem of the communication channel. The reboot reason
> is only one of a number of things that the kernel needs to communicate
> to the boot loader. Other things may include:

If only there was a standard interface for firmware variable storage...

> - boot device
> - location of the kernel
> - command line
> - properties of the /chosen DT node in general
> - boot scripts
> - ethernet MAC addresses
> - bootloader console configuration

A major distinction here is many of these would be persistent (i.e. in
flash). As much of this goes into to the DT anyway, a standard way for
userspace to update the DT could solve this. That would not really
work for handling a one time case unless you supported boot with an
alternate DT.

I've also seen storing of SD tuning parameters to avoid tuning at boot
up. Although, the tuning doesn't add that much to the boot time
relative to Android boot, so I don't really see the point.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
