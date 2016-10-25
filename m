From: Jeremy McNicoll <jmcnicol@redhat.com>
Subject: Re: [RFC V4 PATCH 1/6] arm64: dts: msm8992 SoC and LG Bullhead
 (Nexus 5X) support
Date: Tue, 25 Oct 2016 01:15:43 -0700
Message-ID: <20161025081543.GE21964@mini-rhel.redhat.com>
References: <1477048273-32451-1-git-send-email-jeremymc@redhat.com>
 <1477048273-32451-2-git-send-email-jeremymc@redhat.com>
 <20161021182004.GW7509@tuxbot>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161021182004.GW7509@tuxbot>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Jeremy McNicoll <jeremymc@redhat.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, andy.gross@linaro.org, sboyd@codeaurora.org, arnd@arndb.de, mark.rutland@arm.com, michael.scott@linaro.org
List-Id: devicetree@vger.kernel.org

On Fri, Oct 21, 2016 at 11:20:04AM -0700, Bjorn Andersson wrote:
> On Fri 21 Oct 04:11 PDT 2016, Jeremy McNicoll wrote:
> 
> > From: Jeremy McNicoll <jmcnicol@redhat.com>
> > 
> > Initial device tree support for Qualcomm MSM8992 SoC and
> > LG Bullhead / Google Nexus 5X support.
> > 
> 
> Looks reasonable, just two small nits below.
> 

Thanks for the feedback.

> > Signed-off-by: Jeremy McNicoll <jeremymc@redhat.com>
> > ---
> >  arch/arm64/boot/dts/qcom/Makefile                  |   4 +-
> >  .../boot/dts/qcom/msm8992-bullhead-rev-101.dts     |  42 ++++
> >  arch/arm64/boot/dts/qcom/msm8992-pins.dtsi         |  38 ++++
> >  arch/arm64/boot/dts/qcom/msm8992.dtsi              | 214 +++++++++++++++++++++
> >  4 files changed, 296 insertions(+), 2 deletions(-)
> >  create mode 100644 arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dts
> >  create mode 100644 arch/arm64/boot/dts/qcom/msm8992-pins.dtsi
> >  create mode 100644 arch/arm64/boot/dts/qcom/msm8992.dtsi
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> > index 5dd05de..abb366e 100644
> > --- a/arch/arm64/boot/dts/qcom/Makefile
> > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > @@ -1,6 +1,6 @@
> >  dtb-$(CONFIG_ARCH_QCOM)	+= apq8016-sbc.dtb msm8916-mtp.dtb
> > -dtb-$(CONFIG_ARCH_QCOM)	+= msm8996-mtp.dtb
> > -dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
> > +dtb-$(CONFIG_ARCH_QCOM)	+= msm8996-mtp.dtb apq8096-db820c.dtb
> 
> Don't change these, just add yours.
> 

Done, one line per entry.

> [..]
> > diff --git a/arch/arm64/boot/dts/qcom/msm8992.dtsi b/arch/arm64/boot/dts/qcom/msm8992.dtsi
> [..]
> > +
> > +	msmgpio: pinctrl@fd510000 {
> > +		compatible = "qcom,msm8994-pinctrl", "qcom,msm8974-pinctrl";
> 
> This device is not compatible with the msm8974 TLMM, so please drop the
> second compatible.

Updated to use, https://patches.linaro.org/patch/78750/

-jeremy
