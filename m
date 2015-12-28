From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v2 2/3] cpufreq: mt8173: migrate to use
 operating-points-v2 bindings
Date: Mon, 28 Dec 2015 08:42:33 +0530
Message-ID: <20151228031233.GC3598@ubuntu>
References: <1451197318-12418-1-git-send-email-pi-cheng.chen@linaro.org>
 <1451197318-12418-3-git-send-email-pi-cheng.chen@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1451197318-12418-3-git-send-email-pi-cheng.chen@linaro.org>
Sender: linux-pm-owner@vger.kernel.org
To: Pi-Cheng Chen <pi-cheng.chen@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Daniel Kurtz <djkurtz@chromium.org>, linux-mediatek@lists.infradead.org, linaro-kernel@lists.linaro.org, linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 27-12-15, 14:21, Pi-Cheng Chen wrote:
> Modify mt8173-cpufreq driver to get OPP-sharing information and set up
> OPP table provided by operating-points-v2 bindings.
> 
> Signed-off-by: Pi-Cheng Chen <pi-cheng.chen@linaro.org>
> ---
>  drivers/cpufreq/mt8173-cpufreq.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
