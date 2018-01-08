From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v2 3/6] ARM: sun4i: Convert to CCU
Date: Mon, 8 Jan 2018 17:15:09 +0800
Message-ID: <CAGb2v669UVc8SC=-KUimhN5x7tLP_7yyDYXWCEuZ4qySrRj3Cg@mail.gmail.com>
References: <cover.a58841efb571d44013658505f3fa140536a89d1c.1490545262.git-series.plaes@plaes.org>
 <4357a69da97f46a324eec4c766f4bc9d9e7733ff.1490545262.git-series.plaes@plaes.org>
 <CAOi56cUjqjcZRz6VSwUWcrW=4RQyqyZHtm1vuM3HT2ypdPJ78g@mail.gmail.com>
 <20171212172635.2utwz3koyo5iwglt@plaes.org> <CAOi56cUeRrKQnJ-akJPB160-60aBzy64bDgFeoqMpHRJSCnDeQ@mail.gmail.com>
 <20171213170933.qyfn3hgnrvjpmod7@plaes.org> <20171213171358.oocp24c2mdon45o5@plaes.org>
 <CAOi56cX0Uw=jiAhNSZ8p8_1LPbd7zePkS5kTnMf+ua0v98zfVg@mail.gmail.com> <CAOi56cXTrGg+mx4aJsrMTHcwAV4KLCUZDy9bjpAq1hi1gngKAg@mail.gmail.com>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBNHNZTJAKGQEXOROXOI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAOi56cXTrGg+mx4aJsrMTHcwAV4KLCUZDy9bjpAq1hi1gngKAg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Jan 6, 2018 at 12:10 AM, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> wrote:
> On Wed, Dec 13, 2017 at 11:46 AM, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> wrote:
>> On Wed, Dec 13, 2017 at 9:13 AM, Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org> wrote:
>>> On Wed, Dec 13, 2017 at 05:09:33PM +0000, Priit Laes wrote:
>>>> On Tue, Dec 12, 2017 at 01:24:52PM -0800, Kevin Hilman wrote:
>>>> > On Tue, Dec 12, 2017 at 9:26 AM, Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org> wrote:
>>>> > > On Mon, Dec 11, 2017 at 02:22:30PM -0800, Kevin Hilman wrote:
>>>> > >> On Sun, Mar 26, 2017 at 10:20 AM, Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org> wrote:
>>>> > >> > Convert sun4i-a10.dtsi to new CCU driver.
>>>> > >> >
>>>> > >> > Signed-off-by: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
>>>> > >>
>>>> > >> I finally got around to bisecting a mainline boot failure on
>>>> > >> sun4i-a10-cubieboard that's been happening for quite a while.  Based
>>>> > >> on on kernelci.org, it showed up sometime during the v4.15 merge
>>>> > >> window[1].  It bisected down to this commit (in mainline as commit
>>>> > >> 41193869f2bdb585ce09bfdd16d9482aadd560ad).
>>>> > >>
>>>> > >> When it fails, there is no output on the serial console, so I don't
>>>> > >> know exactly how it's failing, just that it no longer boots.
>>>> > >
>>>> > > We tried out latest 4.15 with various compilers and it works:
>>>> > > - gcc version 7.1.1 20170622 (Red Hat Cross 7.1.1-3) (GCC) - A10 Gemei G9 tablet
>>>> > > - gcc 7.2.0-debian - A10 Cubieboard
>>>> >
>>>> > And you can reproduce the bug with gcc5 or gcc6?
>>>>
>>>> Tried following commits on Gemei G9 (A10 tablet):
>>>> * 4.15.0-rc3-00037-gd39a01eff9af - latest master
>>>> * 4.14.0-rc1-00002-g41193869f2bd - the exact commit, causing the issue.
>>>>
>>>> With the same Linaro toolchain:
>>>> (gcc version 5.3.1 20160412 (Linaro GCC 5.3-2016.05))
>>>
>>> And I also tried the same dtb and zImage from kernelci page [1] and it works with
>>> that too...
>>>
>>> https://storage.kernelci.org/mainline/master/v4.15-rc3/arm/sunxi_defconfig/
>>
>> Can you share a full boot-log (including all the u-boot output etc.)
>> so I can see exactly how the kernel is being loaded?    Especially the
>> u-boot version?
>>
>> As $SUBJECT patch seems to be changing clocks around, perhaps this is
>> an issue where some u-boot dependency is uncovered, and older versions
>> of u-boot don't play well with this change.
>
> Ping.
>
> This is still failing in mainline, but passing int stable <= v4.14

Just did a test with clean builds of v4.15-rc7 with sunxi_defconfig
and U-boot 2018.01-rc3 with Cubieboard_defconfig. It successfully
boots to a prompt. My previous bootloader was U-boot 2017.05 with
some local modifications.

Here is the full boot log: https://wens.tw/cb-boot-log.txt

The boot script is:

setenv bootargs console=tty0 console=ttyS0,115200n8
root=/dev/mmcblk0p1 rootwait panic=10 earlycon=uart,mmio32,0x01c28000
consoleblank=0 drm.debug=0x1e
load ${devtype} ${devnum}:${distro_bootpart} ${kernel_addr_r} boot/zImage
load ${devtype} ${devnum}:${distro_bootpart} ${fdt_addr_r} boot/${fdtfile}
bootz ${kernel_addr_r} - ${fdt_addr_r}

Regards
ChenYu
