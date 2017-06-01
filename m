From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 1/5 v2] clk: qcom: Update DT bindings for the
 MSM8660/APQ8060 RPMCC
Date: Thu, 1 Jun 2017 00:38:58 -0700
Message-ID: <20170601073858.GU20170@codeaurora.org>
References: <20170419091326.11226-1-linus.walleij@linaro.org>
 <CACRpkdbXEFeVkD8rETyrnuoAxUvnFt2BL07UsXuXfSnq3Qdyfw@mail.gmail.com>
 <CACRpkdYvwwJcxKPtKUyZBLWsmjXji7pHDKNz9NRTETqj2P3drQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdYvwwJcxKPtKUyZBLWsmjXji7pHDKNz9NRTETqj2P3drQ@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, linux-clk <linux-clk@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
List-Id: devicetree@vger.kernel.org

On 05/24, Linus Walleij wrote:
> On Wed, May 17, 2017 at 9:23 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> > On Wed, Apr 19, 2017 at 11:13 AM, Linus Walleij
> > <linus.walleij@linaro.org> wrote:
> >
> >> These compatible strings need to be added to extend support
> >> for the RPM CC to cover MSM8660/APQ8060. We also need to add
> >> enumberators to the include file for a few clocks that were
> >> missing.
> >>
> >> Cc: devicetree@vger.kernel.org
> >> Acked-by: Rob Herring <robh@kernel.org>
> >> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> >> ---
> >> ChangeLog v1->v2:
> >> - Collect Rob's ACK
> >
> > Ping on this patch set. It's been sitting for a month and was
> > not changed from v1 either, if you want me to change something
> > it'd be good to know.
> 
> Ping on this again.
> 
> I am sorry if you guys are swamped, I just don't know what to do,
> clock drivers are starting to become the bottleneck for everything
> I do. I bet the ARM SoC maintainers must be noticing it too.
> 
> Unfortunately I am already managing two subsystems and cannot
> volunteer to help out with a third, I would blow a fuse.
> 
> But it seems the CLK subsystem could use some co-maintainers?
> 
> Peter de Schrijver is a big authority in all things clocking (I clearly
> remember him discussing the subject a lot at conferences with lots
> of good points) so I would ask him to help, but I don't know how busy
> Peter may be with nVidia business etc these days...

Meh. Life happens and msm8660 is about a decade old now and not
something that I can easily review without digging through old
websites to find documentation on the code I worked on 7 years
ago. So sorry, but these sorts of patches are basically
approaching priority none for me and I have to steal time to
review them.

I'm getting back up to speed though on my mails, so things should
be good. Let me know if things seem broken next week please.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
