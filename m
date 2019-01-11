From: Brian Masney <masneyb@onstation.org>
Subject: Re: [PATCH v3 2/6] spmi: pmic-arb: convert to v2 irq interfaces to
 support hierarchical IRQ chips
Date: Fri, 11 Jan 2019 18:00:04 -0500
Message-ID: <20190111230004.GA5805@basecamp>
References: <20190110011258.17227-1-masneyb@onstation.org>
 <20190110011258.17227-3-masneyb@onstation.org>
 <154724442941.169631.5308212449003169927@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <154724442941.169631.5308212449003169927@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: andy.gross@linaro.org, bjorn.andersson@linaro.org, linus.walleij@linaro.org, marc.zyngier@arm.com, shawnguo@kernel.org, dianders@chromium.org, linux-gpio@vger.kernel.org, nicolas.dechesne@linaro.org, niklas.cassel@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Jan 11, 2019 at 02:07:09PM -0800, Stephen Boyd wrote:
> Quoting Brian Masney (2019-01-09 17:12:54)
> > Convert the spmi-pmic-arb IRQ code to use the version 2 IRQ interface
> > in order to support hierarchical IRQ chips. This is necessary so that
> > spmi-gpio can be setup as a hierarchical IRQ chip with pmic-arb as the
> > parent. IRQ chips in device tree should be usable from the start without
> > the consumer having to make an additional call to gpio[d]_to_irq() to
> > get the proper IRQ on the parent. Driver was tested on a LG Nexus 5
> > (hammerhead) phone.
> > 
> > Signed-off-by: Brian Masney <masneyb@onstation.org>
> > ---
> > Changes since v2:
> > - None
> > 
> > Changes since v1:
> > - Add intspec variable to qpnpint_irq_domain_translate to reduce the
> >   overall diff.
> > - Remove irq_domain_disassociate hack.
> 
> I thought we would need to keep that around? And then dispose of the
> hack later on. Won't this just wreck the world almost immediately
> because the MFD is counting irqs from DT?

We won't run into the issue with the MFD counting the IRQs since the
interrupts property was removed and the interrupt-controller property
was added to device tree in the same patch. The interrupts property that
we ultimately don't need was the issue that I ran into with the MFD
subsystem.

However to be certain, I retested and we need the temporary hack since
pmic_gpio_to_irq in this series uses the new SPMI IRQ controller. It
breaks as soon as patch 4 in this series (qcom: spmi-gpio: add support
for hierarchical IRQ chip) is applied but starts working again at patch
5 (ARM: dts: qcom: pm8941: add interrupt controller).

I'll respin this series this weekend with the temporary hack and drop it
later in the series. Sorry about the noise and thanks for the
reviewed-bys.

Brian
