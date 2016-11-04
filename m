From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [REGRESSION] "console: don't prefer first registered if DT
 specifies stdout-path" breaks console on video outputs of various ARM boards
Date: Fri, 4 Nov 2016 14:22:17 +0100
Message-ID: <d3f0f1f4-d6f6-1e75-499c-789b82b5bb1b@redhat.com>
References: <20161104121135.4780-1-hdegoede@redhat.com>
 <17833033.PtOSTzKXGD@np-p-burton>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <17833033.PtOSTzKXGD@np-p-burton>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thorsten Leemhuis <regressions-rCxcAJFjeRkk+I/owrrOrA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 04-11-16 13:30, Paul Burton wrote:
> Hi Hans,
>
> On Friday, 4 November 2016 13:11:34 GMT Hans de Goede wrote:
>> Hi All,
>>
>> While booting 4.9-rc# for the first time on an Allwinner A33 tablet,
>> I noticed that after u-boot the LCD display stayed black. It turns out
>> that there was an issue which caused X to never get up, and all kernel
>> (and other startup) messages prior to that only went to ttyS0 which
>> consists of 2 tiny testpads on the PCB with this tablet.
>>
>> The same issue will also happen on any ARM boards which have a HDMI or
>> composite video output and which use a stdout-path pointing to their
>> serial console. I think this will e.g. also impact the Raspberry Pi,
>> I know for certain that this will impact the 99 different Allwinnner
>> boards currently supported by mainline u-boot + the mainline kernel.
>>
>> This is a behavior changes from previous kernels and I consider this
>> a regression. Thus I propose to revert the commit in question, for more
>> info here is a partial copy of the commit message of the proposed revert:
>>
>> The reverted commit changes existing behavior on which many ARM boards
>> rely. Many ARM small-board-computers, like e.g. the Raspberry Pi have
>> both a video output and a serial console. Depending on whether the user
>> is using the device as a more regular computer; or as a headless device
>> we need to have the console on either one or the other.
>>
>> Many users rely on the kernel behavior of the console being present on
>> both outputs, before the reverted commit the console setup with no
>> console= kernel arguments on an ARM board which sets stdout-path in dt
>> would look like this:
>>
>> [root@localhost ~]# cat /proc/consoles
>> ttyS0                -W- (EC p a)    4:64
>> tty0                 -WU (E  p  )    4:1
>>
>> Where as after the reverted commit, it looks like this:
>>
>> [root@localhost ~]# cat /proc/consoles
>> ttyS0                -W- (EC p a)    4:64
>>
>> This commit reverts commit 05fd007e4629 ("console: don't prefer first
>> registered if DT specifies stdout-path") restoring the original behavior.
>>
>> Regards,
>>
>> Hans
>
> Ugh... so the devices you're talking about rely upon set stdout-path in their
> device tree but effectively rely upon us ignoring it?

No they rely on the kernel using stdout-path as an extra console while keeping
tty0 as console, not ignoring it. This how stdout-path has always worked
(at least as long as the Allwinner boards have used it, which has been
  2 - 3 years now).

If you want only the console specified by stdout-path you can get this by
specifying it with console=... on the kernel cmdline.

> If that's the case then I guess reverting is probably the best option, but it
> does restore us to a position where we honor stdout-path for earlycon & then
> essentially ignore it for the proper kernel console. That seems pretty bust to
> me...

We do not ignore it, we use both the tty pointed to by stdout-path and tty0.

Regards,

Hans
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
