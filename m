From: Hoan Tran <hotran-qTEPVZfXA3Y@public.gmane.org>
Subject: [PATCH v3 0/3] clk: xgene: Add PMD clock support
Date: Mon, 12 Sep 2016 11:23:22 -0700
Message-ID: <1473704605-28126-1-git-send-email-hotran@apm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, lho-qTEPVZfXA3Y@public.gmane.org, Duc Dang <dhdang-qTEPVZfXA3Y@public.gmane.org>, Hoan Tran <hotran-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add X-Gene PMD clock support.

PMD clock is implemented for a single register field.
  Output rate = parent_rate * (denominator - scale) / denominator
with
  - denominator = bitmask of register field + 1
  - scale = value of register field

For example, for bitmask is 0x7, denominator will be 8 and scale
will be computed and programmed accordingly.

v3
 * Minor changes on dt binding document.

v2
 * Imply clock shift and width by the compatible string as Rob's comments

v1
 * Initial

Hoan Tran (3):
  Documentation: dtb: xgene: Add PMD clock binding
  clk: xgene: Add PMD clock
  arm64: dts: xgene: Add DT node for APM X-Gene 2 CPU clocks

 Documentation/devicetree/bindings/clock/xgene.txt |  18 ++
 arch/arm64/boot/dts/apm/apm-shadowcat.dtsi        |  56 ++++++
 drivers/clk/clk-xgene.c                           | 221 ++++++++++++++++++++++
 3 files changed, 295 insertions(+)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
