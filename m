From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v6 2/4] dt-bindings: mediatek: Add MT8173 cpufreq driver
 bindings
Date: Thu, 9 Jul 2015 16:02:45 +0530
Message-ID: <20150709103245.GB5627@linux>
References: <1436437661-17606-1-git-send-email-pi-cheng.chen@linaro.org>
 <1436437661-17606-3-git-send-email-pi-cheng.chen@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1436437661-17606-3-git-send-email-pi-cheng.chen@linaro.org>
Sender: linux-pm-owner@vger.kernel.org
To: Pi-Cheng Chen <pi-cheng.chen@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Matthias Brugger <matthias.bgg@gmail.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linaro-kernel@lists.linaro.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 09-07-15, 18:27, Pi-Cheng Chen wrote:
> This patch adds device tree binding document for MT8173 cpufreq driver.
> The clock and regulator consumer properties are documented in
> Documentation/devicetree/bindings/clock/mt8173-cpu-dvfs.txt and
> referenced by this document.
> 
> Signed-off-by: Pi-Cheng Chen <pi-cheng.chen@linaro.org>
> ---
>  .../devicetree/bindings/cpufreq/cpufreq-mt8173.txt | 134 +++++++++++++++++++++
>  1 file changed, 134 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/cpufreq/cpufreq-mt8173.txt

NAK.

There are no new bindings in this file as you have moved them to
clock. And so this patch isn't required anymore.

-- 
viresh
