From: "Shilimkar, Santosh" <santosh.shilimkar@ti.com>
Subject: Re: [PATCH 1/3] ARM: add cpufreq transiton notifier to adjust
 loops_per_jiffy for smp
Date: Fri, 20 Jul 2012 12:06:50 +0530
Message-ID: <CAMQu2gz3XXQdG3T=jSboZ8cW-gKO33k7+OUPaQpjpUcnitk_RA@mail.gmail.com>
References: <1342713281-31114-1-git-send-email-shawn.guo@linaro.org> <1342713281-31114-2-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1342713281-31114-2-git-send-email-shawn.guo@linaro.org>
Sender: cpufreq-owner@vger.kernel.org
To: Shawn Guo <shawn.guo@linaro.org>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, Kevin Hilman <khilman@ti.com>, Nishanth Menon <nm@ti.com>, Richard Zhao <richard.zhao@freescale.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Mike Turquette <mturquette@linaro.org>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, cpufreq@vger.kernel.org, Richard Zhao <richard.zhao@linaro.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 19, 2012 at 9:24 PM, Shawn Guo <shawn.guo@linaro.org> wrote:
>
> From: Richard Zhao <richard.zhao@linaro.org>
>
> If CONFIG_SMP, cpufreq skips loops_per_jiffy update, because different
> arch has different per-cpu loops_per_jiffy definition.
>
> Signed-off-by: Richard Zhao <richard.zhao@linaro.org>
> Acked-by: Russell King <rmk+kernel@arm.linux.org.uk>
> ---
Nice. Avoids other driver duplicating this code.
May be you can keep Richard's credit in commit too.

FWIW, Acked-by: Santosh Shilimkar <santosh.shilimkar@ti.com>
