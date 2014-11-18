From: Lina Iyer <lina.iyer@linaro.org>
Subject: Re: [PATCH v9 2/9] qcom: spm: Add Subsystem Power Manager driver
Date: Tue, 18 Nov 2014 11:00:49 -0700
Message-ID: <20141118180049.GC770@linaro.org>
References: <1414194024-55547-1-git-send-email-lina.iyer@linaro.org>
 <1414194024-55547-3-git-send-email-lina.iyer@linaro.org>
 <546A6962.9090801@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <546A6962.9090801@linaro.org>
Sender: linux-pm-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: khilman@linaro.org, sboyd@codeaurora.org, galak@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, lorenzo.pieralisi@arm.com, msivasub@codeaurora.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 17 2014 at 14:32 -0700, Daniel Lezcano wrote:
>On 10/25/2014 01:40 AM, Lina Iyer wrote:
>
>Hi Lina,
>
>[ ... ]
>
>>+static inline void spm_register_write(struct spm_driver_data *drv,
>>+					enum spm_reg reg, u32 val)
>>+{
>>+	if (drv->reg_data->reg_offset[reg])
>>+		writel_relaxed(val, drv->reg_base +
>>+				drv->reg_data->reg_offset[reg]);
>
>Why not use writel and don't use 'wmb' below ?
>
>>+}
>>+
>
>[ ... ]
>
Took the opportunity for optimization here, since I am writing to
essentially the same page. I dont have to barrier after every write.

>>+	spm_register_write(drv, SPM_REG_SPM_CTL, ctl_val);
>>+
>>+	/* Ensure we have written the start address */
>>+	wmb();
>
>
>
>--=20
> <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs
>
>Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
><http://twitter.com/#!/linaroorg> Twitter |
><http://www.linaro.org/linaro-blog/> Blog
>
