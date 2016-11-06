From: Thorsten Leemhuis <regressions-rCxcAJFjeRkk+I/owrrOrA@public.gmane.org>
Subject: Re: [REGRESSION] "console: don't prefer first registered if DT
 specifies stdout-path" breaks console on video outputs of various ARM boards
Date: Sun, 6 Nov 2016 13:13:11 +0100
Message-ID: <3e36340a-299d-5151-a83e-ea1f337111d7@leemhuis.info>
References: <20161104121135.4780-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161104121135.4780-1-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

JFYI: I added below report to the list of regressions for Linux 4.9.
I'll watch this thread for further updates on this issue to document
progress in my weekly reports. Please let me know via
regressions-rCxcAJFjeRkk+I/owrrOrA@public.gmane.org in case the discussion moves to a different
place (bugzilla or another mail thread for example).

Current status (afaics): Revert discussed

tia! Ciao, Thorsten

P.S.: Thx for CCing me!

On 04.11.2016 13:11, Hans de Goede wrote:
> Hi All,
> 
> While booting 4.9-rc# for the first time on an Allwinner A33 tablet,
> I noticed that after u-boot the LCD display stayed black. It turns out
> that there was an issue which caused X to never get up, and all kernel
> (and other startup) messages prior to that only went to ttyS0 which
> consists of 2 tiny testpads on the PCB with this tablet.
> 
> The same issue will also happen on any ARM boards which have a HDMI or
> composite video output and which use a stdout-path pointing to their
> serial console. I think this will e.g. also impact the Raspberry Pi,
> I know for certain that this will impact the 99 different Allwinnner
> boards currently supported by mainline u-boot + the mainline kernel.
> 
> This is a behavior changes from previous kernels and I consider this
> a regression. Thus I propose to revert the commit in question, for more
> info here is a partial copy of the commit message of the proposed revert:
> 
> The reverted commit changes existing behavior on which many ARM boards
> rely. Many ARM small-board-computers, like e.g. the Raspberry Pi have
> both a video output and a serial console. Depending on whether the user
> is using the device as a more regular computer; or as a headless device
> we need to have the console on either one or the other.
> 
> Many users rely on the kernel behavior of the console being present on
> both outputs, before the reverted commit the console setup with no
> console= kernel arguments on an ARM board which sets stdout-path in dt
> would look like this:
> 
> [root@localhost ~]# cat /proc/consoles
> ttyS0                -W- (EC p a)    4:64
> tty0                 -WU (E  p  )    4:1
> 
> Where as after the reverted commit, it looks like this:
> 
> [root@localhost ~]# cat /proc/consoles
> ttyS0                -W- (EC p a)    4:64
> 
> This commit reverts commit 05fd007e4629 ("console: don't prefer first
> registered if DT specifies stdout-path") restoring the original behavior.
> 
> Regards,
> 
> Hans
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
