From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 0/9] CPU enable method based SMP/hotplug + MSM conversion
Date: Wed, 8 Jan 2014 22:37:36 +0100
Message-ID: <201401082237.36626.arnd@arndb.de>
References: <1387845593-10050-1-git-send-email-sboyd@codeaurora.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1387845593-10050-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Stephen Boyd <sboyd@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, linux-arm-msm@vger.kernel.org, Rohit Vaswani <rvaswani@codeaurora.org>, linux-kernel@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, David Brown <davidb@codeaurora.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
List-Id: devicetree@vger.kernel.org

On Tuesday 24 December 2013, Stephen Boyd wrote:
> This is a rework of patches sent a months back by Rohit[1].
> The goal of these patches is to add support for SMP and (basic)
> hotplug on MSM based SoCs. To get there, we add support for a
> generic way to hook in SMP/hotplug support code based on DT. To
> show how it's used, we convert the MSM8660 SMP support code over
> to the new method. After that we add support for the rest of the
> upstream MSM SoCs (note these patches are piled high on top of
> Rohit's patches to add 8074 support to MSM[2] and my follow ups[3,4],
> but this should only matter to the MSM maintainers).
> 
> This is one of the last items of code that still requires us to have
> a mach directory and a machine descriptor. We should be able to move
> the hotplug/smp code out of mach directories if this approach is
> accepted.

The implementation looks ok to me, but I wonder whether on a global
scale we want to tie it more closely to the cpuidle implementations.
We already have a drivers/cpuidle framework, and while I admit
that I'm not familiar with the code in there, I would assume that
the smp operations and the cpuidle code usually go hand in hand.

	Arnd
