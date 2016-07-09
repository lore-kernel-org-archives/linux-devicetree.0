From: John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH] device-tree: nexus7: Set phy mode to otg instead of host
Date: Fri, 8 Jul 2016 17:11:14 -0700
Message-ID: <CALAqxLUGLoMkmNvhrjZAV14a_87oQDNhGsWgFLUkOUOEgEea8w@mail.gmail.com>
References: <1467437605-11691-1-git-send-email-john.stultz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1467437605-11691-1-git-send-email-john.stultz@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lkml <linux-kernel@vger.kernel.org>
Cc: John Stultz <john.stultz@linaro.org>, Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Stephen Boyd <stephen.boyd@linaro.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Jul 1, 2016 at 10:33 PM, John Stultz <john.stultz@linaro.org> wrote:
> In order to have the usb phy work in gadget mode, override
> the default host mode with otg mode.
>
> This allows gadget mode to work w/o any hacks to the dtsi file.

Ping?

thanks
-john
