From: "Jon Medhurst (Tixy)" <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH v3] drivers: bus: add ARM CCI support
Date: Mon, 20 May 2013 13:11:21 +0100
Message-ID: <1369051881.3511.4.camel@linaro1.home>
References: <1368095640-3675-1-git-send-email-lorenzo.pieralisi@arm.com>
 <1368095640-3675-2-git-send-email-lorenzo.pieralisi@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1368095640-3675-2-git-send-email-lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Javi Merino <javi.merino-5wv7dgnIgG8@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, Amit Kucheria <amit.kucheria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 2013-05-09 at 11:34 +0100, Lorenzo Pieralisi wrote:
[...]
> +static int __init cci_probe(void)
> +{
> +	struct cci_nb_ports const *cci_config;
> +	int ret, i, nb_ace = 0, nb_ace_lite = 0;
> +	struct device_node *np, *cp;
> +	const char *match_str;
> +	bool is_ace;
> +
> +	np = of_find_matching_node(NULL, arm_cci_matches);
> +	if (!np)
> +		return -ENODEV;
> +
> +	cci_config = of_match_node(arm_cci_matches, np)->data;
> +	if (!cci_config)
> +		return -ENODEV;
> +
> +	nb_cci_ports = cci_config->nb_ace + cci_config->nb_ace_lite;
> +
> +	ports = kcalloc(sizeof(*ports), nb_cci_ports, GFP_KERNEL);
> +	if (!ports)
> +		return -ENOMEM;
> +
> +	cci_ctrl_base = of_iomap(np, 0);
> +
> +	if (!cci_ctrl_base) {
> +		WARN(1, "unable to ioremap CCI ctrl\n");
> +		ret = -ENXIO;
> +		goto memalloc_err;
> +	}
> +
> +	for_each_child_of_node(np, cp) {
> +		i = nb_ace + nb_ace_lite;
> +
> +		if (i >= nb_cci_ports)
> +			break;

I know this is a bit late, but...

Would it not be best to check here that the node type is in fact
"slave-if", that way if we add support in later versions for other node
types (e.g. for the PMU) then we don't cause backward compatibility
issues. I'm thinking here of the same concerns that Rob raised with
"ARM: kernel: fix arm_dt_init_cpu_maps() to skip non-cpu nodes"


> +		if (of_property_read_string(cp, "interface-type",
> +					&match_str)) {
> +			WARN(1, "node %s missing interface-type property\n",
> +				  cp->full_name);
> +			continue;
> +		}
> +
[..]

-- 
Tixy
