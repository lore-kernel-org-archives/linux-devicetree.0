From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/9] dt-bindings: regulator: Add document for MediaTek
 MT6380 regulator
Date: Mon, 24 Jul 2017 13:22:42 -0500
Message-ID: <20170724182242.ejrobnjks3ehprpw@rob-hp-laptop>
References: <cover.1500368529.git.sean.wang@mediatek.com>
 <fef9412087f3961e03b77c067e227a31860a1417.1500368529.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <fef9412087f3961e03b77c067e227a31860a1417.1500368529.git.sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
Cc: matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, henryc.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, chen.zhong-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, chenglin.xu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 18, 2017 at 05:49:22PM +0800, sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org wrote:
> From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> 
> add dt-binding document for MediaTek MT6380 PMIC
> 
> Signed-off-by: Chenglin Xu <chenglin.xu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>  .../bindings/regulator/mt6380-regulator.txt        | 90 ++++++++++++++++++++++
>  1 file changed, 90 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/mt6380-regulator.txt
> 
> diff --git a/Documentation/devicetree/bindings/regulator/mt6380-regulator.txt b/Documentation/devicetree/bindings/regulator/mt6380-regulator.txt
> new file mode 100644
> index 0000000..2a559f0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/mt6380-regulator.txt
> @@ -0,0 +1,90 @@
> +MediaTek MT6380 Regulator Driver

Bindings don't describe drivers.

> +
> +All voltage regulators are defined as subnodes of the regulators node. A list

What's the regulators node a child of?

> +of regulators provided by this controller are defined as subnodes of the
> +PMIC's node. Each regulator is named according to its regulator type,
> +buck-<name> and ldo-<name>. The definition for each of these nodes is defined
> +using the standard binding for regulators at
> +Documentation/devicetree/bindings/regulator/regulator.txt.
> +
> +The valid names for regulators are:
> +BUCK:
> +  buck-core1, buck-vcore, buck-vrf
> +LDO:
> +  ldo-vm ,ldo-va , ldo-vphy, ldo-vddr, ldo-vt
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
