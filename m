From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] of: Make of_node_name_eq() case insensitive
Date: Thu, 24 Jan 2019 12:14:01 -0800
Message-ID: <6ae5c389b98150341eceb4a2b9a457629e49edbc.camel@perches.com>
References: <20190124200825.2611-1-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190124200825.2611-1-f.fainelli@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>, linux-kernel@vger.kernel.org
Cc: vivien.didelot@gmail.com, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, 2019-01-24 at 12:08 -0800, Florian Fainelli wrote:
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

Then likely of_node_name_prefix should also use
case insensitive matching.

---
diff --git a/drivers/of/base.c b/drivers/of/base.c
index 5226e898476e..87a0bd7ef45e 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -75,7 +75,8 @@ bool of_node_name_prefix(const struct device_node *np, const char *prefix)
 	if (!np)
 		return false;
 
-	return strncmp(kbasename(np->full_name), prefix, strlen(prefix)) == 0;
+	return strncasecmp(kbasename(np->full_name),
+			   prefix, strlen(prefix)) == 0;
 }
 EXPORT_SYMBOL(of_node_name_prefix);
 
