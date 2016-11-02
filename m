From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v3 0/4] PXA cpufreq conversion to clock API
Date: Wed, 2 Nov 2016 10:15:03 +0530
Message-ID: <20161102044503.GC10786@vireshk-i7>
References: <1477943696-23477-1-git-send-email-robert.jarzmik@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1477943696-23477-1-git-send-email-robert.jarzmik@free.fr>
Sender: linux-pm-owner@vger.kernel.org
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rafael J Wysocki <rjw@rjwysocki.net>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 31-10-16, 20:54, Robert Jarzmik wrote:
> Hi,
> 
> This serie is a preparation to shift the cpufreq of pxa2xx platforms to clocks
> API, next iteration.
> 
> The first 3 patches are review and merge material :
>  - patch 1/4 for Viresh and Rafael
>  - patches 2/4 and 3/4 for me
> 
> The 4th on is for review but not merge, as the clock changes must be fully
> reviewed and go in first as a prequisite
> 
> Since previous iteration, 2 and 3 were amended per Viresh's suggestion.
> 
> Robert Jarzmik (4):
>   cpufreq: pxa: use generic platdev driver for device-tree
>   ARM: dts: pxa: add pxa25x cpu operating points
>   ARM: dts: pxa: add pxa27x cpu operating points
>   cpufreq: pxa: convert to clock API
> 
>  arch/arm/boot/dts/pxa25x.dtsi        |  25 +++++
>  arch/arm/boot/dts/pxa27x.dtsi        |  40 ++++++++
>  drivers/cpufreq/cpufreq-dt-platdev.c |   2 +
>  drivers/cpufreq/pxa2xx-cpufreq.c     | 191 +++++++----------------------------
>  4 files changed, 106 insertions(+), 152 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
