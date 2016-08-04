From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [RFC][PATCH 3/4] power: reset: Add sram-reboot-mode driver
Date: Wed, 3 Aug 2016 22:29:53 -0700
Message-ID: <20160804052953.GI13516@tuxbot>
References: <1470265523-27557-1-git-send-email-john.stultz@linaro.org>
 <1470265523-27557-4-git-send-email-john.stultz@linaro.org>
 <20160804010341.GH13516@tuxbot>
 <CALAqxLXL2aTe3DsEngCRuV76svnN-2LkDDuDna+289NWzjRYXg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CALAqxLXL2aTe3DsEngCRuV76svnN-2LkDDuDna+289NWzjRYXg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: John Stultz <john.stultz@linaro.org>
Cc: lkml <linux-kernel@vger.kernel.org>, Andy Yan <andy.yan@rock-chips.com>, Rob Herring <robh@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Thierry Reding <treding@nvidia.com>, Heiko St?bner <heiko@sntech.de>, Caesar Wang <wxt@rock-chips.com>, Kees Cook <keescook@chromium.org>, Guodong Xu <guodong.xu@linaro.org>, Haojian Zhuang <haojian.zhuang@linaro.org>, Vishal Bhoj <vishal.bhoj@linaro.org>, devicetree@vger.kernel.org, Android Kernel Team <kernel-team@android.com>
List-Id: devicetree@vger.kernel.org

On Wed 03 Aug 20:08 PDT 2016, John Stultz wrote:

> On Wed, Aug 3, 2016 at 6:03 PM, Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> > On Wed 03 Aug 16:05 PDT 2016, John Stultz wrote:
> >
> > [..]
> >> diff --git a/drivers/power/reset/sram-reboot-mode.c b/drivers/power/reset/sram-reboot-mode.c
[..]
> >> +     ret = reboot_mode_register(&sram_rbm->reboot);
> >
> > I think you should take the time to throw in a
> > devm_reboot_mode_register(), it would save you from the
> > dev_set_drvdata() and you can drop the remove function.
> 
> So I've only got a vague sense of what your suggesting here. Do you
> have a pointer to a good example?
> 

https://patchwork.kernel.org/patch/9262691/
https://patchwork.kernel.org/patch/9262693/

Regards,
Bjorn
