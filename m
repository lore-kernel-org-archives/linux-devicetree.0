From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH] of: Make of_node_name_eq() case insensitive
Date: Thu, 24 Jan 2019 15:45:59 -0800
Message-ID: <1a19b5f3-1387-0e6d-2d84-1b61079b4efb@gmail.com>
References: <20190124200825.2611-1-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190124200825.2611-1-f.fainelli@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>, linux-kernel@vger.kernel.org
Cc: vivien.didelot@gmail.com, Rob Herring <robh+dt@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 1/24/19 12:08 PM, Florian Fainelli wrote:
> Since c32569e358ad ("regulator: Use of_node_name_eq for node name
> comparisons") Vivien reported the mc13892-regulator complaining about
> not being able to find regulators.
> 
> This is because prior to that commit we used of_node_cmp() to compare
> the regulator array passed from mc13892_regulators down to
> mc13xxx_parse_regulators_dt() and they are all defined in uppercase
> letters by the MC13892_*_DEFINE* macros, whereas they are defined as
> lowercase in the DTS.
> 
> Fix this by use strncasecmp() since that makes sure the comparison is
> case insensitive like what of_node_cmp() did.
> 
> Reported-by: Vivien Didelot <vivien.didelot@gmail.com>
> Fixes: c32569e358ad ("regulator: Use of_node_name_eq for node name comparisons")
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  drivers/of/base.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 5226e898476e..ff47c86277cb 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -66,7 +66,8 @@ bool of_node_name_eq(const struct device_node *np, const char *name)
>  	node_name = kbasename(np->full_name);
>  	len = strchrnul(node_name, '@') - node_name;
>  
> -	return (strlen(name) == len) && (strncmp(node_name, name, len) == 0);
> +	return (strlen(name) == len) &&
> +		(strncasecmp(node_name, name, len) == 0);
>  }
>  EXPORT_SYMBOL(of_node_name_eq);
>  
> 

Node names are case sensitive.  Please fix mc13xxx_parse_regulators_dt() to
properly handle case instead of changing of_node_name_eq().

-Frank
