From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: [PATCH v4 4/5] regulator: tps65912: Add regulator driver for the
 TPS65912 PMIC
Date: Fri, 2 Oct 2015 14:21:15 -0500
Message-ID: <560ED92B.30803@ti.com>
References: <1443731874-21362-1-git-send-email-afd@ti.com>
 <1443731874-21362-5-git-send-email-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1443731874-21362-5-git-send-email-afd@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Mark Brown <broonie@kernel.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 10/01/2015 03:37 PM, Andrew F. Davis wrote:
> This patch adds support for TPS65912 PMIC regulators.
>
> The regulators set consists of 4 DCDCs and 10 LDOs. The output
> voltages are configurable and are meant to supply power to the
> main processor and other components.
>
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> ---
>   drivers/regulator/Kconfig              |   6 ++
>   drivers/regulator/Makefile             |   1 +
>   drivers/regulator/tps65912-regulator.c | 171 +++++++++++++++++++++++++++++++++
>   3 files changed, 178 insertions(+)
>   create mode 100644 drivers/regulator/tps65912-regulator.c

Looks good for me:
Reviewed-by: Grygorii Strashko <grygorii.strashko@ti.com>

[...]

-- 
regards,
-grygorii
