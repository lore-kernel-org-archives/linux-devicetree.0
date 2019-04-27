From: Brian Masney <masneyb@onstation.org>
Subject: Re: [PATCH 0/8] qcom: spmi/ssbi gpio: correct gpio hogging
Date: Sat, 27 Apr 2019 06:22:06 -0400
Message-ID: <20190427102206.GA296@basecamp>
References: <20190306005316.12232-1-masneyb@onstation.org>
 <20190427053034.GH3137@builder>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190427053034.GH3137@builder>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linus.walleij@linaro.org, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Bjorn,

On Fri, Apr 26, 2019 at 10:30:34PM -0700, Bjorn Andersson wrote:
> On Tue 05 Mar 16:53 PST 2019, Brian Masney wrote:
> 
> > Here are some patches that fix gpio hogging for all boards that use
> > spmi-gpio and ssbi-gpio. These depend on the following two patches
> > that were merged in 4.20-rc1:
> > 
> > commit 149a96047237 ("pinctrl: qcom: spmi-gpio: fix gpio-hog related
> > boot issues")
> > 
> > commit 7ed078557738 ("pinctrl: qcom: ssbi-gpio: fix gpio-hog related
> > boot issues")
> > 
> > I've already fixed pm8941 for the Nexus 5 and that fix is queued to go
> > into v5.1 during this merge window:
> > 
> > https://lore.kernel.org/lkml/20181101001149.13453-7-masneyb@onstation.org/
> > 
> > Andy: You may want to consider submitting these post rc1 as a fix for
> > v5.1 and possibly marking these for stable.
> > 
> > Brian Masney (8):
> >   ARM: dts: qcom: apq8064: add gpio-ranges
> >   ARM: dts: qcom: mdm9615: add gpio-ranges
> >   ARM: dts: qcom: msm8660: add gpio-ranges
> >   ARM: dts: qcom: pma8084: add gpio-ranges
> 
> Looks like I missed the ARM patches before. All 8 picked up now, with
> Linus' r-b.

Andy already picked these 8 patches up in his tree.

https://git.kernel.org/pub/scm/linux/kernel/git/agross/linux.git/log/?h=for-next

Brian
