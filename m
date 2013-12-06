From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH V12 2/3] watchdog: s3c2410_wdt: use syscon regmap
 interface to configure pmu register
Date: Fri, 6 Dec 2013 11:48:22 -0800
Message-ID: <20131206194822.GB14464@roeck-us.net>
References: <1386308868-30264-1-git-send-email-l.krishna@samsung.com>
 <1386308868-30264-3-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1386308868-30264-3-git-send-email-l.krishna@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Leela Krishna Amudala <l.krishna@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, wim@iguana.be, dianders@chromium.org, kgene.kim@samsung.com, t.figa@samsung.com, devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org, cpgs@samsung.com
List-Id: devicetree@vger.kernel.org

On Fri, Dec 06, 2013 at 11:17:47AM +0530, Leela Krishna Amudala wrote:
> Add device tree support for exynos5250 and 5420 SoCs and use syscon regmap interface
> to configure AUTOMATIC_WDT_RESET_DISABLE and MASK_WDT_RESET_REQUEST registers of PMU
> to mask/unmask enable/disable of watchdog in probe and s2r scenarios.
> 
> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
> Signed-off-by: Doug Anderson <dianders@chromium.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
