From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH RFC 04/14] of: irq: document properties for wakeup interrupt parent
Date: Mon, 02 Sep 2019 14:38:56 +0100
Message-ID: <5d6d1b71.1c69fb81.f86b5.3963@mx.google.com>
References: <20190829181203.2660-1-ilina@codeaurora.org> <20190829181203.2660-5-ilina@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190829181203.2660-5-ilina@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lina Iyer <ilina@codeaurora.org>
Cc: swboyd@chromium.org, evgreen@chromium.org, marc.zyngier@arm.com, linus.walleij@linaro.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, mkshah@codeaurora.org, linux-gpio@vger.kernel.org, rnayak@codeaurora.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 29 Aug 2019 12:11:53 -0600, Lina Iyer wrote:
> Some interrupt controllers in a SoC, are always powered on and have a
> select interrupts routed to them, so that they can wakeup the SoC from
> suspend. Add wakeup-parent DT property to refer to these interrupt
> controllers.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> ---
>  .../bindings/interrupt-controller/interrupts.txt    | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
