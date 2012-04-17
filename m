From: Viresh Kumar <viresh.kumar-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH V4 3/5] pinctrl: Add SPEAr pinctrl drivers
Date: Tue, 17 Apr 2012 14:02:08 +0530
Message-ID: <4F8D2A88.6060309@st.com>
References: <cover.1334548272.git.viresh.kumar@st.com>
 <f9cc539f87a9c73546fe6671d55d86838886adce.1334548272.git.viresh.kumar@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <f9cc539f87a9c73546fe6671d55d86838886adce.1334548272.git.viresh.kumar-qxv4g6HH51o@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: Viresh KUMAR <viresh.kumar-qxv4g6HH51o@public.gmane.org>, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org, viresh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 4/16/2012 9:43 AM, Viresh KUMAR wrote:
> diff --git a/drivers/pinctrl/spear/pinctrl-spear.c b/drivers/pinctrl/spear/pinctrl-spear.c
> 
> +int spear_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
> +				 struct device_node *np_config,
> +				 struct pinctrl_map **map, unsigned *num_maps)
> +{

> +
> +	*map = kzalloc(sizeof(*map) * count, GFP_KERNEL);
> +	if (!*map)
> +		return -ENOMEM;
> +

Linus,

This was the place that caused crash for me.

I would apply following change in my patch before sending pull request
to Arnd.

-       *map = kzalloc(sizeof(*map) * count, GFP_KERNEL);
+       *map = kzalloc(sizeof(**map) * count, GFP_KERNEL);

--
viresh
