From: Grant Likely <grant.likely@linaro.org>
Subject: Re: [RFC PATCH 2/2] of: add initcall with match boilerplate helpers
Date: Thu, 21 Nov 2013 12:50:07 +0000
Message-ID: <20131121125007.17A8FC40A2C@trevor.secretlab.ca>
References: <1383113571-13029-1-git-send-email-robherring2@gmail.com> < 1383113571-13029-3-git-send-email-robherring2@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1383113571-13029-3-git-send-email-robherring2@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

On Wed, 30 Oct 2013 01:12:51 -0500, Rob Herring <robherring2@gmail.com> wrote:
> From: Rob Herring <rob.herring@calxeda.com>
> 
> Add boilerplate helpers to create initcalls which are conditional on
> matching on devicetree properties.
> 
> Cc: Grant Likely <grant.likely@linaro.org>
> Signed-off-by: Rob Herring <rob.herring@calxeda.com>
> ---
>  include/linux/of.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/include/linux/of.h b/include/linux/of.h
> index f95aee3..a1327c9 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -592,6 +592,18 @@ static inline int of_property_read_u32(const struct device_node *np,
>  		s;						\
>  		s = of_prop_next_string(prop, s))
>  
> +#define of_initcall_match(__func, __lvl, __match) \
> +static int __init __func##_init(void) \
> +{ \
> +	if (of_find_matching_node(NULL, __match)) \
> +		return __func(); \
> +	else \
> +		return -ENODEV;	\
> +} \
> +__lvl(__func##_init);
> +
> +#define of_module_init_match(__func, __match) of_initcall_match(__func, module_init, __match)
> +

I'm not sure why this is necessary. I don't particularly have a problem
with it, but I wouldn't normally try to filter out device drivers when
the probe code simply won't get called.

Considering it's paired with the previous patch that creates devices in
the module init call, I'm assuming it is to support that use case. If so
then I don't think it is a good idea. If there is another use case then
maybe.

g.
