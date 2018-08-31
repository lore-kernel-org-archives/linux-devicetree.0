From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 1/3] ARM: dts: qcom: Add SPMI PMIC Arbiter nodes for
 APQ8084 and MSM8974
Date: Fri, 31 Aug 2018 16:01:25 -0700
Message-ID: <20180831230125.GU2523@minitux>
References: <1422965880-11047-1-git-send-email-iivanov@mm-sol.com>
 <1422965880-11047-2-git-send-email-iivanov@mm-sol.com>
 <550311ad-8f93-3e80-9706-1321482b8c19@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <550311ad-8f93-3e80-9706-1321482b8c19@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>
Cc: "Ivan T. Ivanov" <iivanov@mm-sol.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri 31 Aug 15:46 PDT 2018, Frank Rowand wrote:
> > +		spmi_bus: spmi@fc4cf000 {
> > +			compatible = "qcom,spmi-pmic-arb";
> > +			reg-names = "core", "intr", "cnfg";
> > +			reg = <0xfc4cf000 0x1000>,
> > +			      <0xfc4cb000 0x1000>,
> > +			      <0xfc4ca000 0x1000>;
> > +			interrupt-names = "periph_irq";
> 
> > +			interrupts = <0 190 0>;
> 
> The final value in this interrupts property means IRQ_TYPE_NONE.
> 
> A WARN_ON() was added early this year to complain about use of
> IRQ_TYPE_NONE: 83a86fbb5b56 "irqchip/gic: Loudly complain about
> the use of IRQ_TYPE_NONE", resulting in many warnings spewing
> forth when I boot an APQ8074 Dragonboard.  I am trying to
> determine whether the warning is overly aggressive, or whether
> the IRQ TYPE is incorrectly specified for the spmi node.
> 
> The interrupt-parent for the spmi node is intc: interrupt-controller@f9000000,
> which has compatible = "qcom,msm-qgic2".  I do not know the architecture
> or implementation of this interrupt controller.  Is an IRQ_TYPE_NONE
> valid in this case, or should a specific type be provided?
> 

No, IRQ_TYPE_NONE isn't valid and the WARN_ON() is reasonable.

Please change it to IRQ_TYPE_LEVEL_HIGH. And while you're at it, replace
the first 0 with GIC_SPI.


If you have more of these warnings you can most likely look at e.g.
msm8916 (arm64) to find the right flags.

Regards,
Bjorn
