From: Tirupathi Reddy T <tirupath-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH V7 0/2] clk: qcom: spmi_pmic clock divider support
Date: Mon, 4 Dec 2017 16:18:47 +0530
Message-ID: <5f23c889-da66-65da-a9ad-7d667e18e519@codeaurora.org>
References: <1511255465-3984-1-git-send-email-tirupath@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1511255465-3984-1-git-send-email-tirupath-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Stephen,

I have addressed the comments given on previous patch versions. Could 
you please review the patch series ?

Thanks

Tirupathi


On 11/21/2017 2:41 PM, Tirupathi Reddy wrote:
> The SPMI_PMIC clock divider driver configures the clkdiv modules present
> on Qualcomm Technologies, Inc. SPMI PMIC. This driver provides a clock
> interface for each clkdiv module and allows clock operations such as enable,
> disable, set_rate, recalc_rate and round_rate.
>
> Tirupathi Reddy (2):
>    clk: qcom: Add spmi_pmic clock divider support
>    dt-bindings: Add qcom spmi_pmic clock divider bindings
>
>   .../bindings/clock/qcom,spmi-pmic-div.txt          |  59 ++++
>   drivers/clk/qcom/Kconfig                           |   9 +
>   drivers/clk/qcom/Makefile                          |   1 +
>   drivers/clk/qcom/clk-spmi-pmic-div.c               | 302 +++++++++++++++++++++
>   4 files changed, 371 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/clock/qcom,spmi-pmic-div.txt
>   create mode 100644 drivers/clk/qcom/clk-spmi-pmic-div.c
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
