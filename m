From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC][PATCH] misc: Introduce reboot_reason driver
Date: Thu, 10 Dec 2015 23:11:46 +0100
Message-ID: <1552521.IZhVsTdxHT@wuerfel>
References: <1449610162-30543-1-git-send-email-john.stultz@linaro.org> <CAL_Jsq+s1Lk9s=dvSAe-rerSc1aUO39tkBnsrkoNqJoET3VNjw@mail.gmail.com> <CALAqxLVKhQT4Ba3JFVKpV79PnAsjYDARRO8M5U5=3Jjx45h6WQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CALAqxLVKhQT4Ba3JFVKpV79PnAsjYDARRO8M5U5=3Jjx45h6WQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: John Stultz <john.stultz@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, lkml <linux-kernel@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Vinay Simha BN <simhavcs@gmail.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Android Kernel Team <kernel-team@android.com>, Andy Gross <agross@codeaurora.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thursday 10 December 2015 13:43:16 John Stultz wrote:
> On Thu, Dec 10, 2015 at 12:24 PM, Rob Herring <robh+dt@kernel.org> wrote:
> > The fact that we are using notifiers for reset reason and triggering
> > is probably some indication that some infrastructure is needed. But I
> > don't think you need to do that here as long as it is all kernel
> > internals. We'll make the 2nd guy do it. 
> 
> 
> 
> Though, just so I understand better, what is problematic w/ the reset
> notifiers? They provide the reboot command argument, which is the core
> of what is needed. It actually seemed like it was almost designed with
> this problem in mind.

Notifiers in general are a bit of a kludge. We often use them in places
that have not been abstracted well enough yet, and they make it
less obvious what is actually going on when something happens, or
in what order things are called.

I'm actually less worried about the notifier side here than about
the general problem of the communication channel. The reboot reason
is only one of a number of things that the kernel needs to communicate
to the boot loader. Other things may include:

- boot device
- location of the kernel
- command line
- properties of the /chosen DT node in general
- boot scripts
- ethernet MAC addresses
- bootloader console configuration

Every bootloader is different here regarding what can be configured
and how we do it. Often the configuration is done entirely from user
space, but some platforms have kernel support. So picking one particular
aspect and trying to unify that one with a common kernel interface
but ignoring all the others may cause problems if we later want to
add a more general abstraction.

It also looks like at least some of the interfaces require a checksum
to be updated, or are based on variable-length entries, both of which
require a proper driver.

	Arnd
