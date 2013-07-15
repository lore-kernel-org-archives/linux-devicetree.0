From: Rohit Vaswani <rvaswani@codeaurora.org>
Subject: Re: [PATCH 0/4] Add SMP support for MSM8660, MSM8960 and MSM8974
Date: Mon, 15 Jul 2013 13:37:11 -0700
Message-ID: <51E45D77.3060500@codeaurora.org>
References: <1372461962-17197-1-git-send-email-rvaswani@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1372461962-17197-1-git-send-email-rvaswani@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Rohit Vaswani <rvaswani@codeaurora.org>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, David Brown <davidb@codeaurora.org>, Daniel Walker <dwalker@fifo99.com>, Bryan Huntsman <bryanh@codeaurora.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

ping ?

On 6/28/2013 4:25 PM, Rohit Vaswani wrote:
> This series re-organizes the platsmp.c and adds SMP support for
> MSM8660, MSM8960 and MSM8974.
> We convert to using the cpus property in device tree and
> add a "enable-method" property for arm32.
> This helps select the appropriate release sequence for the
> secondary cores based on the cpu.
>
> Rohit Vaswani (4):
>    ARM: msm: Remove pen_release usage
>    ARM: msm: Re-organize platsmp to make it extensible
>    ARM: msm: Add SMP support for 8960
>    ARM: msm: Add support for 8974 SMP
>
>   Documentation/devicetree/bindings/arm/cpus.txt     |   9 +
>   Documentation/devicetree/bindings/arm/msm/kpss.txt |  16 ++
>   Documentation/devicetree/bindings/arm/msm/scss.txt |  15 ++
>   arch/arm/boot/dts/msm8660-surf.dts                 |  23 +-
>   arch/arm/boot/dts/msm8960-cdp.dts                  |  22 ++
>   arch/arm/boot/dts/msm8974.dts                      |  23 ++
>   arch/arm/mach-msm/board-dt-8974.c                  |   3 +
>   arch/arm/mach-msm/headsmp.S                        |  41 ----
>   arch/arm/mach-msm/hotplug.c                        |  31 +--
>   arch/arm/mach-msm/platsmp.c                        | 265 ++++++++++++++++-----
>   arch/arm/mach-msm/scm-boot.h                       |   8 +-
>   11 files changed, 330 insertions(+), 126 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/arm/msm/kpss.txt
>   create mode 100644 Documentation/devicetree/bindings/arm/msm/scss.txt
>   delete mode 100644 arch/arm/mach-msm/headsmp.S
>


Thanks,
Rohit Vaswani

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, hosted by The Linux Foundation
