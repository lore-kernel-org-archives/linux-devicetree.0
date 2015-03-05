From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] clk: mediatek: Export CPU mux clocks for CPU frequency control
Date: Thu, 5 Mar 2015 16:32:06 +0530
Message-ID: <CAKohpo=90YH3TLfnMro0AQOM6_uMB_SPS9Q3j6Myz4RqqBdVHg@mail.gmail.com>
References: <1425466152-7867-1-git-send-email-pi-cheng.chen@linaro.org>
	<20150304112109.GB11010@pengutronix.de>
	<CALx668WKKmifhuODsV+Uaoq4ggcmB1=wbpLzXBnjEtxbuB4qig@mail.gmail.com>
	<20150305074207.GC11010@pengutronix.de>
	<CAKohponSqLPcULA9-T8y9b_b44Torti0p6W3sJfRZ1oKUWqtTw@mail.gmail.com>
	<20150305091948.GH11010@pengutronix.de>
	<CALx668X2m0hMVQumGQmhhrKnv4h1hiYp20Q4FcKuECK3mhoJiA@mail.gmail.com>
	<20150305105104.GJ11010@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150305105104.GJ11010@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Sascha Hauer <s.hauer@pengutronix.de>, Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Pi-Cheng Chen <pi-cheng.chen@linaro.org>, Mark Rutland <mark.rutland@arm.com>, James Liao <jamesjj.liao@mediatek.com>, Linaro Kernel Mailman List <linaro-kernel@lists.linaro.org>, Mike Turquette <mturquette@linaro.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Stephen Boyd <sboyd@codeaurora.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Henry Chen <henryc.chen@mediatek.com>, Chen Fan <fan.chen@mediatek.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Kumar Gala <galak@codeaurora.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Joe.C" <yingjoe.chen@mediatek.com>, Eddie Huang <eddie.huang@mediatek.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 5 March 2015 at 16:21, Sascha Hauer <s.hauer@pengutronix.de> wrote:
> Given the variance of different SoCs I don't think it makes sense
> to try to handle all these cases. Instead the cpufreq-dt driver
> should just call clk_set_rate() on the CPU clock with the desired
> target frequency. Everything else should be handled in the clock
> driver which has intimate knowledge about the SoC anyway.

I agree..

@Russell: I wanted to ask you this since sometime..

On CPU-freq changes we fire PRE/POST notifiers and they are
used for updating loops_per_jiffies which then controls delays.

Now, it is fine to do that for normal frequencies, but what should be
the approach for intermediate frequencies ?

Intermediate freqs: On some platforms changing PLL's straight away
isn't considered safe and so we switch parent to another stable clock,
change PLL rate and switch back.

The *wild* thought I earlier had was to fire these notifiers for even these
intermediate frequencies, otherwise some of the delays will end before
they should have and that *might* cause other problems.

I wanted to know what do you (and other champs) think about this..

Thanks in advance for your advice.
