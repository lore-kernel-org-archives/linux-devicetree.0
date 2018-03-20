From: Stephen Boyd <sboyd@kernel.org>
Subject: RE: [PATCH v3 09/10] DT: QCOM: Add cpufreq-dt to msm8996
Date: Tue, 20 Mar 2018 13:06:17 -0700
Message-ID: <152157637794.125118.12382168941652366593@swboyd.mtv.corp.google.com>
References: <1518616792-29028-1-git-send-email-ilialin@codeaurora.org>
 <1518616792-29028-10-git-send-email-ilialin@codeaurora.org>
 <152147812199.242365.11821734771337881765@swboyd.mtv.corp.google.com>
 <013a01d3c051$d65a9160$830fb420$@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <013a01d3c051$d65a9160$830fb420$@codeaurora.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: ilialin@codeaurora.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, sboyd@codeaurora.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, rnayak@codeaurora.org, robh@kernel.org, will.deacon@arm.com, amit.kucheria@linaro.org, tfinkel@codeaurora.org, nicolas.dechesne@linaro.org, celster@codeaurora.org
List-Id: devicetree@vger.kernel.org

Quoting ilialin@codeaurora.org (2018-03-20 06:46:19)
> > From: Stephen Boyd <sboyd@kernel.org>
> > Quoting Ilia Lin (2018-02-14 05:59:51)
> > > diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c
> > > b/drivers/cpufreq/cpufreq-dt-platdev.c
> > > index 3b585e4..b6cd0ae 100644
> > > --- a/drivers/cpufreq/cpufreq-dt-platdev.c
> > > +++ b/drivers/cpufreq/cpufreq-dt-platdev.c
> > > @@ -95,6 +95,9 @@
> > >         { .compatible = "xlnx,zynq-7000", },
> > >         { .compatible = "xlnx,zynqmp", },
> > >
> > > +       { .compatible = "qcom,msm8996", },
> > > +       { .compatible = "qcom,apq8096", },
> > > +
> > 
> > Why can't we base it on the kryocc node being present?
> This could be good idea, if I would writing a platform specific cpufreq driver, which may be a future option.

Well maybe cpufreq-dt can also look at the cpus nodes for a cpu with a
certain type (in this case kryo). Then we can add cpufreq dt based on
that CPU node being there.

> > Or even populate
> > the cpufreq-dt from the kryocc driver?
> There is a problem that during the clock probe the OPP table still doesn't exist. 

The OPP table is in DT? Why doesn't it exist?
