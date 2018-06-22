From: Abhishek Sahu <absahu@codeaurora.org>
Subject: Re: [PATCH] arm: dts: qcom: Fix 'interrupts = <>' property to use
 proper  macros
Date: Fri, 22 Jun 2018 11:39:50 +0530
Message-ID: <e15ea4689014ff69eed0c0b93552c4da@codeaurora.org>
References: <1529486619-443-1-git-send-email-sricharan@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1529486619-443-1-git-send-email-sricharan@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sricharan R <sricharan@codeaurora.org>
Cc: andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 2018-06-20 14:53, Sricharan R wrote:
> Fix all nodes to use proper GIC_* macros for the interrupt type and the
> interrupt trigger settings to avoid the boot warnings.

  Thanks Sricharan for fixing these warnings.

  Applied over 4.18 rc1 and tested in IPQ8064 AP148 board.
  No backtraces are coming during boottime and IRQ seems OK.

  root@OpenWrt:/# cat /proc/interrupts
            CPU0       CPU1
  16:       2602       4750     GIC-0  18 Edge      gp_timer
  17:          0          0     GIC-0  26 Level     arm-pmu
  23:         19          0     GIC-0 241 Level     ahci[29000000.sata]
  24:        912          0     GIC-0 184 Level     msm_serial0
  25:        113          0     GIC-0 185 Level     i2c_qup
  26:          6          0     GIC-0 187 Level     1a280000.spi
IPI0:          0          0  CPU wakeup interrupts
IPI1:          0          0  Timer broadcast interrupts
IPI2:       2045       1713  Rescheduling interrupts
IPI3:          1          4  Function call interrupts
IPI4:          0          0  CPU stop interrupts
IPI5:          0          0  IRQ work interrupts
IPI6:          0          0  completion interrupts
Err:          0

> 
> Signed-off-by: Sricharan R <sricharan@codeaurora.org>

Tested-by: Abhishek Sahu <absahu@codeaurora.org>
