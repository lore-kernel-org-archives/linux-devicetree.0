From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 0/6] mfd/regulator/clk: bd71837: ROHM BD71837 PMIC
 driver
Date: Tue, 29 May 2018 08:39:58 +0100
Message-ID: <20180529073958.GB4790@dell>
References: <20180528090003.GA8778@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180528090003.GA8778@localhost.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, lgirdwood@gmail.com, broonie@kernel.org, mazziesaccount@gmail.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mikko.mutanen@fi.rohmeurope.com, heikki.haikola@fi.rohmeurope.com
List-Id: devicetree@vger.kernel.org

On Mon, 28 May 2018, Matti Vaittinen wrote:

> Patch series adding support for ROHM BD71837 PMIC.
> 
> BD71837 is a programmable Power Management IC for powering single-core,
> dual-core, and quad-core SoC’s such as NXP-i.MX 8M. It is optimized for
> low BOM cost and compact solution footprint. It integrates 8 buck
> regulators and 7 LDO’s to provide all the power rails required by the
> SoC and the commonly used peripherals.
> 
> The driver aims to not limit the usage of PMIC. Thus the buck and LDO
> naming is generic and not tied to any specific purposes. However there
> is following limitations which make it mostly suitable for use cases
> where the processor where PMIC driver is running is powered by the PMIC:
> 
> - The PMIC is not re-initialized if it resets. PMIC may reset as a
>   result of voltage monitoring (over/under voltage) or due to reset
>   request. Driver is only initializing PMIC at probe. This is not
>   problem as long as processor controlling PMIC is powered by PMIC.
> 
> - The PMIC internal state machine is ignored by driver. Driver assumes
>   the PMIC is wired so that it is always in "run" state when controlled
>   by the driver.

FYI, this patch-set is going to be difficult to manage since it was
not sent 'threaded'.  As people start replying to different patches,
they are going to scatter-bomb throughout all of the recipient's
inboxes.

If/when you send a subsequent version, could you please ensure you
send the set threaded so the patches keep in relation to one another
as they are reviewed?

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
