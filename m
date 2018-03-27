From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v5 07/13] ARM: dts: ipq4019: Add
 qcom-ipq4019-ap.dk04.1-c3 board file
Date: Tue, 27 Mar 2018 10:14:14 -0700
Message-ID: <20180327171414.GJ1403@tuxbook-pro>
References: <1521800336-19266-1-git-send-email-sricharan@codeaurora.org>
 <1521800336-19266-8-git-send-email-sricharan@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1521800336-19266-8-git-send-email-sricharan@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sricharan R <sricharan@codeaurora.org>
Cc: robh+dt@kernel.org, robh@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, andy.gross@linaro.org, david.brown@linaro.org, catalin.marinas@arm.com, will.deacon@arm.com, sboyd@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, absahu@codeaurora.org, marc.zyngier@arm.com, richardcochran@gmail.com
List-Id: devicetree@vger.kernel.org

On Fri 23 Mar 03:18 PDT 2018, Sricharan R wrote:
> +#include "qcom-ipq4019-ap.dk04.1.dtsi"
> +
> +/ {
> +	model = "Qualcomm Technologies, Inc. IPQ4019/AP-DK04.1-C3";

Add a compatible to the board file.

Also, things like alias would make sense to put in the board unless
there's some restriction making every board having the same layout.

> +};

Regards,
Bjorn
