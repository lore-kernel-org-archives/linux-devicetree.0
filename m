From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [PATCH 3/4] power: Add support for DA9150 Fuel-Gauge
Date: Fri, 19 Jun 2015 18:51:56 +0200
Message-ID: <1434732716.2385.166.camel@x220>
References: <cover.1434643491.git.Adam.Thomson.Opensource@diasemi.com>
	 <b1f1574e717d393b036bd7d01933d4d0b0ade408.1434643491.git.Adam.Thomson.Opensource@diasemi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <b1f1574e717d393b036bd7d01933d4d0b0ade408.1434643491.git.Adam.Thomson.Opensource@diasemi.com>
Sender: linux-pm-owner@vger.kernel.org
To: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Cc: Lee Jones <lee.jones@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, Sebastian Reichel <sre@kernel.org>, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Support Opensource <support.opensource@diasemi.com>
List-Id: devicetree@vger.kernel.org

On Thu, 2015-06-18 at 17:06 +0100, Adam Thomson wrote:
> --- /dev/null
> +++ b/drivers/power/da9150-fg.c

> +/* Register external function to give battery temperature */
> +void da9150_fg_register_temp_cb(struct power_supply *psy, da9150_read_temp_t cb,
> +				void *cb_context)
> +{
> +	struct da9150_fg *fg = dev_get_drvdata(psy->dev.parent);
> +
> +	fg->read_bat_temp = cb;
> +	fg->bat_temp_context = cb_context;
> +}
> +EXPORT_SYMBOL_GPL(da9150_fg_register_temp_cb);

This series doesn't add a user of this export. Actually, it doesn't even
add a local caller of this function. Is a patch that adds a user of this
function queued somewhere?


Paul Bolle

--
To unsubscribe from this list: send the line "unsubscribe linux-pm" in
