From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 0/7] clocksource: sh_cmt: Update driver for DT binding rework
Date: Tue, 26 Sep 2017 11:26:43 +0300
Message-ID: <2100093.DY5UYTmyGT@avalon>
References: <1505742407-31576-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1505742407-31576-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <damm+renesas@opensource.se>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Geert,

Thank you for the patches.

On Monday, 18 September 2017 16:46:40 EEST Geert Uytterhoeven wrote:
> 	Hi Daniel, Thomas, Rob, Mark, Magnus,
> 
> This patch series updates the sh_cmt clocksource driver for the recent DT
> binding rework that was merged in v4.14-rc1.
> 
> This series is an evolutionary improvement of Magnus Damm's series "[PATCH
> v2 00/11] clocksource: sh_cmt: DT binding rework V2".
> It complements Magnus' series "[PATCH v3 00/06] clocksource: sh_cmt: DT
> binding rework V3" and "[PATCH v4 00/06] clocksource: sh_cmt: DT binding
> rework V4", which included DT binding updates only.
> 
>   - Patch 1 fixes wrong vendor/soc ordering in the SoC-specific compatible
>     values  (This issue was raised during review before, but was not
>     addressed in later iterations of the DT binding rework.  Oh well,
>     things like that happen when there's more than 2 years between initial
>     submission and acceptance...),
>   - Patches 2 to 6 implement the updated DT bindings, as already accepted
>     upstream, and amended in patch 1.
>   - Patch 7 is a small cleanup.
> 
> Changes compared to v2:
>   - Take over from Magnus,
>   - Drop DT binding updates that were revised and accepted upstream,
>   - Fix SoC-specific compatible values,
>   - Change channels_mask from "unsigned long" to "unsigned int,
>   - Remove support for "renesas,cmt-32*",
>   - Mark "renesas,cmt-48-gen2" deprecated,
>   - Remove unused "renesas,channels-mask" handling,
>   - Use of_device_get_match_data() helper.
> 
> Thanks!
> 
> Geert Uytterhoeven (5):
>   dt-bindings: timer: renesas,cmt: Fix SoC-specific compatible values
>   clocksource: sh_cmt: Remove support for "renesas,cmt-32*"
>   clocksource: sh_cmt: Mark "renesas,cmt-48-gen2" deprecated
>   clocksource: sh_cmt: Remove unused "renesas,channels-mask" handling
>   clocksource: sh_cmt: Use of_device_get_match_data() helper
> 
> Magnus Damm (2):
>   clocksource: sh_cmt: Use 0x3f mask for SH_CMT_48BIT case
>   clocksource: sh_cmt: Support separate R-Car Gen2 CMT0/1

For the whole series,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  .../devicetree/bindings/timer/renesas,cmt.txt      | 24 +++----
>  drivers/clocksource/sh_cmt.c                       | 76 +++++++++----------
>  2 files changed, 45 insertions(+), 55 deletions(-)

-- 
Regards,

Laurent Pinchart
