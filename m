From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH 2/2] regulator: palmas: model SMPS10 as two regulators
Date: Thu, 20 Jun 2013 16:22:27 +0530
Message-ID: <51C2DEEB.9090600@nvidia.com>
References: <1371717458-10307-1-git-send-email-kishon@ti.com> <1371717458-10307-3-git-send-email-kishon@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1371717458-10307-3-git-send-email-kishon@ti.com>
Sender: linux-doc-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: "broonie@kernel.org" <broonie@kernel.org>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "rob@landley.net" <rob@landley.net>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, Stephen Warren <swarren@nvidia.com>, "gg@slimlogic.co.uk" <gg@slimlogic.co.uk>, "sameo@linux.intel.com" <sameo@linux.intel.com>, "ian@slimlogic.co.uk" <ian@slimlogic.co.uk>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thursday 20 June 2013 02:07 PM, Kishon Vijay Abraham I wrote:
> SMPS10 has two outputs OUT1 and OUT2 and have one input IN1.
> SMPS10-OUT2 is connected to SMPS10-IN1 and can be configured either
> in BOOST mode or BYPASS mode. regulator_enable of SMPS10-OUT2 configures
> it in BOOST mode. For BYPASS mode regulator_allow_bypass() API can be
> used. SMPS10-OUT1 is connected to SMPS10-OUT2 and can be enabled using
> regulator_enable().
>
> Cc: Laxman Dewangan <ldewangan@nvidia.com>
> Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
> ---
>   drivers/regulator/palmas-regulator.c |   39 ++++++++++++++++++++++++++++++----
>   include/linux/mfd/palmas.h           |    9 ++++----
>   2 files changed, 40 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/regulator/palmas-regulator.c b/drivers/regulator/palmas-regulator.c
> index 3ae44ac..7004bab 100644
> --- a/drivers/regulator/palmas-regulator.c
> +++ b/drivers/regulator/palmas-regulator.c
> @@ -97,7 +97,12 @@ static const struct regs_info palmas_regs_info[] = {
>   		.ctrl_addr	= PALMAS_SMPS9_CTRL,
>   	},
>   	{
> -		.name		= "SMPS10",
> +		.name		= "SMPS10_OUT1",
> +		.sname		= "smps10-out2",
> +		.ctrl_addr	= PALMAS_SMPS10_CTRL,
> +	},
> +	{
> +		.name		= "SMPS10_OUT2",
>   		.sname		= "smps10-in",
>

This sequence can create regulator to be never register.
In probe, we register regulator from 0 to max_id.
Here smps10-out1 comes first and see the supply as smps10-out2 which is 
not registered yet and so will fail with PROBE_DEFER
When again it tries, the same issue.

I think we need to reverse the sequence, SMPS10-OUT2 and then SMPS10-OUT1.


