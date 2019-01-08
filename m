From: Brian Masney <masneyb@onstation.org>
Subject: Re: [PATCH v2 2/5] mfd: qcom-spmi-pmic: use devm_mfd_add_devices
 instead of devm_of_platform_populate
Date: Tue, 8 Jan 2019 05:32:03 -0500
Message-ID: <20190108103203.GA3643@basecamp>
References: <20190107021145.6370-1-masneyb@onstation.org>
 <20190107021145.6370-3-masneyb@onstation.org>
 <154689729020.15366.16314952173889307636@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <154689729020.15366.16314952173889307636@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: andy.gross@linaro.org, bjorn.andersson@linaro.org, lee.jones@linaro.org, linus.walleij@linaro.org, marc.zyngier@arm.com, shawnguo@kernel.org, dianders@chromium.org, linux-gpio@vger.kernel.org, nicolas.dechesne@linaro.org, niklas.cassel@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Jan 07, 2019 at 01:41:30PM -0800, Stephen Boyd wrote:
> Now this seems worse. We have gotten by without having to explicitly
> list all the devices that are inside the PMIC as mfd cells. But now, to
> avoid creating the irqs before the hierarchy is installed, we have to
> undo all of that and rely on the difference in behavior of
> of_platform_populate() and mfd_add_devices(). That's pretty obscure to
> figure out.
> 
> I'd prefer we drop this patch and keep disassociating virqs and
> reassociating them in the gpio driver. Then we can remove the interrupts
> properties in all the DTS files and finally remove the disassociate and
> reassociating code in the gpio driver when all the DT files are cleaned
> up. It makes things less confusing that way and doesn't require updates
> to this driver.

You are right that we can get this working without this patch. The issue
that I experienced was caused by the interrupts property on the
spmi-gpio node. I thought that I tested this with that configuration but
I obviously didn't.

qcom-pm8941.dtsi and qcom-pma8084.dtsi are the only two in-tree users of
spmi-gpio. I'll include the fix for qcom-pma8084.dtsi as well.

Brian
