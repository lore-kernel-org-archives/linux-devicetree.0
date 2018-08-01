From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH RESEND RFC 1/4] drivers: pinctrl: qcom: add wakeup
 capability to GPIO
Date: Wed, 1 Aug 2018 15:36:35 -0700
Message-ID: <20180801223635.GO30024@minitux>
References: <20180801020021.9782-1-ilina@codeaurora.org>
 <20180801020021.9782-2-ilina@codeaurora.org>
 <86600uy4vh.wl-marc.zyngier@arm.com>
 <20180801194538.GA6422@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180801194538.GA6422@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lina Iyer <ilina@codeaurora.org>
Cc: Marc Zyngier <marc.zyngier@arm.com>, swboyd@chromium.org, evgreen@chromium.org, linus.walleij@linaro.org, rplsssn@codeaurora.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, rnayak@codeaurora.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed 01 Aug 12:45 PDT 2018, Lina Iyer wrote:

> Thanks for the feedback, Marc.
> 
> On Wed, Aug 01 2018 at 00:31 -0600, Marc Zyngier wrote:
> > On Wed, 01 Aug 2018 03:00:18 +0100,
> > Lina Iyer <ilina@codeaurora.org> wrote:
[..]
> > Why isn't that the case? And if that's because the HW is broken and
> > doesn't buffer edge interrupts, why can't you use the resend mechanism
> > instead?
> > 
> The PDC hardware can replay the interrupts accurately. However, it will
> replay only the pin and its not the TLMM summary IRQ. The handler here,
> needs to notify the driver that the wakeup interrupt happened and needs
> to take action. If I could trip the summary IRQ in this handler that
> would work too. Can it be done?
> 

Does this means that the intr_status_reg will not hold the information
about the interrupt events that occurred before we powered on the TLMM
again? Or is the problem limited to it not triggering the TLMM IRQ?

Can the PDC (and MPM) be used in the non-sleep use cases as well?

Regards,
Bjorn
