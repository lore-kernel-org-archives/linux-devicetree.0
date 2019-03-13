From: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH] regulator: Use of_node_name_eq for node name comparisons
Date: Wed, 13 Mar 2019 18:21:26 +0100
Message-ID: <1552497686.2453.49.camel@pengutronix.de>
References: <20181205195050.4759-21-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181205195050.4759-21-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Rob, hi Mark,

Am Mittwoch, den 05.12.2018, 13:50 -0600 schrieb Rob Herring:
> Convert string compares of DT node names to use of_node_name_eq helper
> instead. This removes direct access to the node name pointer.
> 
> For instances using of_node_cmp, this has the side effect of now using
> case sensitive comparisons. This should not matter for any FDT based
> system which all of these are.
[...]
> diff --git a/drivers/regulator/mc13xxx-regulator-core.c b/drivers/regulator/mc13xxx-regulator-core.c
> index 65eb1e0350cf..2243138d8a58 100644
> --- a/drivers/regulator/mc13xxx-regulator-core.c
> +++ b/drivers/regulator/mc13xxx-regulator-core.c
> @@ -186,7 +186,7 @@ struct mc13xxx_regulator_init_data *mc13xxx_parse_regulators_dt(
> >  		for (i = 0; i < num_regulators; i++) {
> >  			if (!regulators[i].desc.name)
> >  				continue;
> > -			if (!of_node_cmp(child->name,
> > +			if (of_node_name_eq(child,
> >  					 regulators[i].desc.name))
> > 

Unfortunately this change causes a regression on systems with MC13xxx
regulators. The desc.name field is filled with an uppercase name of the
regulator, while the existing DTs (as far as I know) all use lowercase
node names, so the matching in the function above doesn't work anymore.

Any opinions about how to proceed here?

Regards,
Lucas
