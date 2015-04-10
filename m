From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC PATCH v2 4/4] arm64: qcom: add cpu operations
Date: Fri, 10 Apr 2015 22:57:48 +0200
Message-ID: <5280857.52XJYGkVLd@wuerfel>
References: <1428698605-13166-1-git-send-email-galak@codeaurora.org> <1428698605-13166-5-git-send-email-galak@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1428698605-13166-5-git-send-email-galak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Kumar Gala <galak@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, Abhimanyu Kapur <abhimany@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, arm@kernel.org, devicetree@vger.kernel.org, catalin.marinas@arm.com, will.deacon@arm.com
List-Id: devicetree@vger.kernel.org

On Friday 10 April 2015 15:43:25 Kumar Gala wrote:
> +static int qcom_cpu_boot(unsigned int cpu)
> +{
> +       int ret = 0;
> +
> +       if (per_cpu(cold_boot_done, cpu) == false) {
> +               ret = qcom_unclamp_secondary_arm_cpu(cpu);
> +               if (ret)
> +                       return ret;
> +               per_cpu(cold_boot_done, cpu) = true;
> +       }
> +       return secondary_pen_release(cpu);
> +}
> +

Please add a comment here to explain why you need a two-stage process here,
rather than just booting the CPU without the secondary_pen.

Are you working around a specific silicon bug here?

	Arnd
