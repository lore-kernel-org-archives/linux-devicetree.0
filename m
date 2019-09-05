From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 1/1] arm64: dts: qcom: Add Lenovo Yoga C630
Date: Thu, 5 Sep 2019 09:28:43 +0100
Message-ID: <20190905082843.GA26880@dell>
References: <20190904113917.15223-1-lee.jones@linaro.org>
 <20190904115234.GV2672@vkoul-mobl>
 <20190904204302.GD580@tuxbook-pro>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190904204302.GD580@tuxbook-pro>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, agross@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 04 Sep 2019, Bjorn Andersson wrote:

> On Wed 04 Sep 04:52 PDT 2019, Vinod Koul wrote:
> 
> > On 04-09-19, 12:39, Lee Jones wrote:
> > > --- a/arch/arm64/boot/dts/qcom/Makefile
> > > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > > @@ -12,5 +12,6 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r2.dtb
> > >  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r3.dtb
> > >  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c.dtb
> > >  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-mtp.dtb
> > > +dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-lenovo-yoga-c630.dtb
> > 
> > Can we keep this sorted, so before mtp.
> > 
> > >  dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
> > >  dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
> > > diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> > > new file mode 100644
> > > index 000000000000..ad160c718b33
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> > > @@ -0,0 +1,454 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > 
> > Are we going to make this dual? or BSD..
> 
> Sounds good, Rob wants dual license so lets flag it as such.

Done and reposted.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
