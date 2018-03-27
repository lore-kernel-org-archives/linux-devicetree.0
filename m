From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 0/5] Support qcom pinctrl protected pins
Date: Tue, 27 Mar 2018 15:35:59 +0200
Message-ID: <CACRpkdbqVNT9bchB+dFwBCuvnKaZE41YYO8Y7zyr=0-ysv5iWg@mail.gmail.com>
References: <20180323163453.96495-1-swboyd@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180323163453.96495-1-swboyd@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-arm-msm@vger.kernel.org, Timur Tabi <timur@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Grant Likely <grant.likely@secretlab.ca>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 23, 2018 at 5:34 PM, Stephen Boyd <swboyd@chromium.org> wrote:

> This patchset proposes a solution to describing the valid
> pins for a pin controller in a generic way so that qcom
> platforms can expose the pins that are really available.
>
> Typically, this has been done by having drivers and firmware
> descriptions only use pins they know they have access to, and that
> still works now because we no longer read the pin direction at
> boot. But there are still some userspace drivers and debugfs facilities
> that don't know what pins are available and attempt to read everything
> they can. On qcom platforms, this may lead to a system hang, which isn't
> very nice behavior, even if root is the only user that can trigger it.
>
> The proposal is to describe the valid pins and then not allow things to
> cause problems by using the invalid pins. Obviously, the firmware may
> mess this up, so this is mostly a nice to have feature or a safety net
> so that things don't blow up easily.
>
> Changes from v3:
>  * Split out allocation of mask into subroutine
>  * Moved that allocation to kmalloc_array()
>  * Updated qcom driver to simplifiy ACPI logic and fix mem leak

As both Timur and Andy are happy with this I applied these five
patches for v4.17 and pushed to the test farm. Let's see what
happens!

Yours,
Linus Walleij
