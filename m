From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 1/5] drivers: pinctrl: qcom: add wakeup capability to
 GPIO
Date: Mon, 27 Aug 2018 20:20:34 -0700
Message-ID: <20180828032034.GG2523@minitux>
References: <20180817163849.30750-1-ilina@codeaurora.org>
 <20180817163849.30750-2-ilina@codeaurora.org>
 <CACRpkdb+Opdn1eWZSRydS1Bafpqwcg83xEcT-YJC6D-kSSi1ew@mail.gmail.com>
 <20180827165644.GR5081@codeaurora.org>
 <20180828002641.GC2523@minitux>
 <20180828014652.GB13998@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180828014652.GB13998@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lina Iyer <ilina@codeaurora.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Hans Verkuil <hverkuil@xs4all.nl>, Hans Verkuil <hans.verkuil@cisco.com>, Marc Zyngier <marc.zyngier@arm.com>, Stephen Boyd <sboyd@kernel.org>, evgreen@chromium.org, rplsssn@codeaurora.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org, Rajendra Nayak <rnayak@codeaurora.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Andy Gross <andy.gross@linaro.org>, Doug Anderson <dianders@chromium.org>
List-Id: devicetree@vger.kernel.org

On Mon 27 Aug 18:46 PDT 2018, Lina Iyer wrote:
> On Mon, Aug 27 2018 at 18:26 -0600, Bjorn Andersson wrote:
> > On Mon 27 Aug 09:56 PDT 2018, Lina Iyer wrote:
[..]
> > > Thanks, I will look into Hans's RFCv2. But what would help me would be
> > > to avoid creating the IRQ for the GPIO itself (I have the latent IRQ),
> > > if I could just return that instead in gpio_to_irq(), it might be
> > > easier. I understand ->to_irq() is supposed to be a translate function
> > > only, I can avoid the dance of enabling and diabling the PDC IRQ on
> > > suspend and resume.
> > > 
> > 
> > I did implement gpio_to_irq() like this in the PMIC gpio/mpp drivers and
> > we've since concluded that we need to move this to some hierarchical
> > interrupt controller, because people like Linus expect to be able to say
> > 
> >  interrupts = <&gpio_controller 1 IRQ_TYPE_EDGE_RISING>
> > 
> > which is something used all over the place with the TLMM driver today.
> 
> Does it have to be &gpio_controller, can it be another interrupt controller?
> 
> Say,
> 	interrupts-extended = <&pdc 1 IRQ_TYPE_EDGE_RISING>;
> 

It would require that the GPIO interrupt number space of the PDC matches
the pin numbering of the TLMM, to be somewhat maintainable.

And it would still require DT-writers to know that if the implementation
of a compatible, that references a TLMM IRQ, wants to mark the IRQ wake
capable it needs to reference the PDC instead...while still having a
pinmux/pinconf setting for the TLMM.

And for gpio_to_irq() we would need to do the mapping that you suggest,
so the TLMM still needs to have all these references to the PDC.


So I think it would be nice if we could avoid this scenario, but I don't
have any good ideas of how to do this right now...

Regards,
Bjorn
