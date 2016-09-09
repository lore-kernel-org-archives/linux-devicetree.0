From: John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH] of: Overlay manager
Date: Thu, 8 Sep 2016 17:39:15 -0700
Message-ID: <CALAqxLVPdZxMy+W0VEJqX+L9CCy4cBsc0s48BwepSA8-ApUhtQ@mail.gmail.com>
References: <001a113447d4718cb9053c04f991@google.com> <57D1D344.8010306@gmail.com>
 <CAH7ZN-w2U9g4m9hDdD1kY52HLzv+TSbuNVRbmzmE3WMH0wC8Tw@mail.gmail.com> <CAL_JsqKe99WLoeOrRz76mUx-QruhDU+4kqCAepgZa0LhSYbgDg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqKe99WLoeOrRz76mUx-QruhDU+4kqCAepgZa0LhSYbgDg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Dmitry Shmidt <dimitrysh@google.com>, Frank Rowand <frowand.list@gmail.com>, "<linux-kernel@vger.kernel.org>" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Grant Likely <grant.likely@secretlab.ca>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 8, 2016 at 5:33 PM, Rob Herring <robh+dt@kernel.org> wrote:
> On Thu, Sep 8, 2016 at 4:15 PM, Dmitry Shmidt <dimitrysh@google.com> wrote:
>> On Thu, Sep 8, 2016 at 2:08 PM, Frank Rowand <frowand.list@gmail.com> wrote:
>>> What problem(s) are you trying to solve with this?
>>
>> Currently the Linux kernel doesn't provide a way for boot time
>> selection of different possible board configurations, when the board
>> peripherals are specified via Device Tree.
>
> Well, the kernel does provide a way. For different h/w you give it a
> different h/w description (i.e. dtb). The issue is having multiple
> dtbs for mostly similar h/w is a PIA.

Agreed.

> Also, it can be argued this should remain a bootloader problem. For
> the LCD case, the bootloader is going to need that information to
> support a splash screen. libfdt is learning how to apply overlays on
> flat trees.

I can imagine in many cases like devboards with various attached
shields/mezzanines the bootloader doesn't (and likely can't) have this
ability.


>>> What is the use case?
>>
>> It is usually useful for development board when you can use
>> different peripherals. For example you want to use special
>> LCD panel. Using it will go on account of other stuff like GPIOs,
>> so you don't want it all the time. And it is not convenient to
>> apply new patches and to recompile the kernel. And this code
>> allows to choose LCD panel configuration from command line.
>
> If you can figure out how to change the command line, then you can
> just change the dtb. At least for how Android boot works, those aren't
> really changed separately.

Ehh.. that's not so simple. The dtb is often appended to the kernel on
Android devices. Changing the boot arguments is much simpler to do.

thanks
-john
