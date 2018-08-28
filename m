From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 1/5] drivers: pinctrl: qcom: add wakeup capability to
 GPIO
Date: Mon, 27 Aug 2018 17:26:41 -0700
Message-ID: <20180828002641.GC2523@minitux>
References: <20180817163849.30750-1-ilina@codeaurora.org>
 <20180817163849.30750-2-ilina@codeaurora.org>
 <CACRpkdb+Opdn1eWZSRydS1Bafpqwcg83xEcT-YJC6D-kSSi1ew@mail.gmail.com>
 <20180827165644.GR5081@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180827165644.GR5081@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lina Iyer <ilina@codeaurora.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Hans Verkuil <hverkuil@xs4all.nl>, Hans Verkuil <hans.verkuil@cisco.com>, Marc Zyngier <marc.zyngier@arm.com>, Stephen Boyd <sboyd@kernel.org>, evgreen@chromium.org, rplsssn@codeaurora.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org, Rajendra Nayak <rnayak@codeaurora.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Andy Gross <andy.gross@linaro.org>, Doug Anderson <dianders@chromium.org>
List-Id: devicetree@vger.kernel.org

On Mon 27 Aug 09:56 PDT 2018, Lina Iyer wrote:

> On Sun, Aug 26 2018 at 08:33 -0600, Linus Walleij wrote:
> > On Fri, Aug 17, 2018 at 6:39 PM Lina Iyer <ilina@codeaurora.org> wrote:
> > 
> > > QCOM SoC's that have Power Domain Controller (PDC) chip in the always-on
> > > domain can wakeup the SoC, when interrupts and GPIOs are routed to the
> > > its interrupt controller. Only select GPIOs that are deemed wakeup
> > > capable are routed to specific PDC pins. During low power state, the
> > > pinmux interrupt controller may be non-functional but the PDC would be.
> > > The PDC can detect the wakeup GPIO is triggered and bring the TLMM to an
> > > operational state.
> > > 
> > > Interrupts that are level triggered will be detected at the TLMM when
> > > the controller becomes operational. Edge interrupts however need to be
> > > replayed again.
> > > 
> > > Request the corresponding PDC IRQ, when the GPIO is requested as an IRQ,
> > > but keep it disabled. During suspend, we can enable the PDC IRQ instead
> > > of the GPIO IRQ, which may or not be detected.
> > > 
> > > Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> > > ---
> > > Changes in v1:
> > >         - Trigger GPIO in h/w from PDC IRQ handler
> > >         - Avoid big tables for GPIO-PDC map, pick from DT instead
> > >         - Use handler_data
> > 
> > Just for the record this is an impressive and much needed patch
> > set, no other SoC developer has yet taken on the task of making this
> > work so I very much appreciate that Qualcomm show the way.
> > 
> > > +static int msm_gpio_pdc_pin_request(struct irq_data *d)
> > > +static int msm_gpio_pdc_pin_release(struct irq_data *d)
> > > +static int msm_gpio_irq_reqres(struct irq_data *d)
> > > +{
> > (...)
> > > +       if (gpiochip_lock_as_irq(gc, irqd_to_hwirq(d))) {
> > (...)
> > > +static void msm_gpio_irq_relres(struct irq_data *d)
> > > +{
> > > +       gpiochip_unlock_as_irq(gc, irqd_to_hwirq(d));
> > > +}
> > 
> > FYI Hans Verkuil is working on a patch set that moves the
> > lock/unlock as IRQ call to the irqchip request() and release()
> > functions so we can switch a GPIO irqchip line from IRQ
> > mode to say output at runtime without too much trouble.
> > (CEC needs this.)
> > 
> Thanks, I will look into Hans's RFCv2. But what would help me would be
> to avoid creating the IRQ for the GPIO itself (I have the latent IRQ),
> if I could just return that instead in gpio_to_irq(), it might be
> easier. I understand ->to_irq() is supposed to be a translate function
> only, I can avoid the dance of enabling and diabling the PDC IRQ on
> suspend and resume.
> 

I did implement gpio_to_irq() like this in the PMIC gpio/mpp drivers and
we've since concluded that we need to move this to some hierarchical
interrupt controller, because people like Linus expect to be able to say

  interrupts = <&gpio_controller 1 IRQ_TYPE_EDGE_RISING> 

which is something used all over the place with the TLMM driver today.

Regards,
Bjorn
