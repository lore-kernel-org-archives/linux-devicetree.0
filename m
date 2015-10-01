From: "Andrew F. Davis" <afd@ti.com>
Subject: Re: [PATCH v4 3/5] mfd: tps65912: Add driver for the TPS65912 PMIC
Date: Thu, 1 Oct 2015 18:49:19 -0500
Message-ID: <560DC67F.7090408@ti.com>
References: <1443731874-21362-1-git-send-email-afd@ti.com>
 <1443731874-21362-4-git-send-email-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1443731874-21362-4-git-send-email-afd@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Mark Brown <broonie@kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Grygorii Strashko <grygorii.strashko@ti.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 10/01/2015 03:37 PM, Andrew F. Davis wrote:
> This patch adds support for TPS65912 mfd device. It provides
> communication through the I2C and SPI interfaces. It contains
> the following components:
>
>   - Regulators
>   - GPIO controller
>
> Signed-off-by: Andrew F. Davis <afd@ti.com>

Forgot to mention, as the kbuild bot figured out, this patch needs
b4fe8ba ("regmap: Add generic macro to define regmap_irq")
from Lee Jones' tree to build.
