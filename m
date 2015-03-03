From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH 1/5] arm-cci: Rearrange code for splitting PMU vs driver
 code
Date: Tue, 03 Mar 2015 15:35:18 +0000
Message-ID: <54F5D4B6.40409@arm.com>
References: <1425295754-13376-1-git-send-email-suzuki.poulose@arm.com> <1425295754-13376-2-git-send-email-suzuki.poulose@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1425295754-13376-2-git-send-email-suzuki.poulose@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Suzuki K. Poulose" <suzuki.poulose@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, "nico@linaro.org" <nico@linaro.org>, "b.zolnierkie@samsung.com" <b.zolnierkie@samsung.com>, "kgene@kernel.org" <kgene@kernel.org>, "a.kesavan@samsung.com" <a.kesavan@samsung.com>, "arnd@arndb.de" <arnd@arndb.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Liviu Dudau <Liviu.Dudau@arm.com>, Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>, Pawel Moll <Pawel.Moll@arm.com>, "olof@lixom.net" <olof@lixom.net>, Punit Agrawal <Punit.Agrawal@arm.com>, Will Deacon <Will.Deacon@arm.com>, Catalin Marinas <Catalin.Marinas@arm.com>
List-Id: devicetree@vger.kernel.org



On 02/03/15 11:29, Suzuki K. Poulose wrote:
> From: "Suzuki K. Poulose" <suzuki.poulose@arm.com>
>
> No functional changes, only code re-arrangements for easier split of the
> PMU code vs low level driver code. Extracts the port handling code
> to cci_probe_ports().
>
> Signed-off-by: Suzuki K. Poulose <suzuki.poulose@arm.com>
> ---
>   drivers/bus/arm-cci.c |  330 +++++++++++++++++++++++++------------------------
>   1 file changed, 168 insertions(+), 162 deletions(-)
>
> diff --git a/drivers/bus/arm-cci.c b/drivers/bus/arm-cci.c
> index 84fd660..f27cf56 100644
> --- a/drivers/bus/arm-cci.c
> +++ b/drivers/bus/arm-cci.c

[...]

> @@ -1395,11 +1412,36 @@ static int cci_probe(void)
>   	sync_cache_w(&cpu_port);
>   	__sync_cache_range_w(ports, sizeof(*ports) * nb_cci_ports);
>   	pr_info("ARM CCI driver probed\n");
> +
>   	return 0;
> +}
> +
> +static int cci_probe(void)
> +{
> +	int ret;
> +	struct device_node *np;
> +	struct resource res;
> +
> +	np = of_find_matching_node(NULL, arm_cci_matches);
> +	if (!np)
> +		return -ENODEV;
>
> -memalloc_err:
> +	if (!of_device_is_available(np))
> +		return -ENODEV;
> +
> +	ret = of_address_to_resource(np, 0, &res);
> +	if (!ret) {
> +		cci_ctrl_base = ioremap(res.start, resource_size(&res));
> +		cci_ctrl_phys =	res.start;
> +	}
> +	if (ret || !cci_ctrl_base) {
> +		WARN(1, "unable to ioremap CCI ctrl\n");
> +		ret = -ENXIO;
> +		goto out;

IMO you can return directly here and get rid of this goto as nothing is
done there.

Regards,
Sudeep
