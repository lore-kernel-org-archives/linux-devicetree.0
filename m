From: Georgi Djakov <georgi.djakov@linaro.org>
Subject: Re: [PATCH v3 6/6] interconnect: Add OPP table support for
 interconnects
Date: Fri, 26 Jul 2019 19:25:06 +0300
Message-ID: <fde02417-dc72-acad-727d-452a3ae3cbd0@linaro.org>
References: <20190703011020.151615-1-saravanak@google.com>
 <20190703011020.151615-7-saravanak@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190703011020.151615-7-saravanak@google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Saravana Kannan <saravanak@google.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: vincent.guittot@linaro.org, seansw@qti.qualcomm.com, daidavid1@codeaurora.org, Rajendra Nayak <rnayak@codeaurora.org>, sibis@codeaurora.org, bjorn.andersson@linaro.org, evgreen@chromium.org, kernel-team@android.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Saravana,

On 7/3/19 04:10, Saravana Kannan wrote:
> Interconnect paths can have different performance points. Now that OPP
> framework supports bandwidth OPP tables, add OPP table support for
> interconnects.
> 
> Devices can use the interconnect-opp-table DT property to specify OPP
> tables for interconnect paths. And the driver can obtain the OPP table for
> an interconnect path by calling icc_get_opp_table().
> 
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> ---
>  drivers/interconnect/core.c  | 27 ++++++++++++++++++++++++++-
>  include/linux/interconnect.h |  7 +++++++
>  2 files changed, 33 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/interconnect/core.c b/drivers/interconnect/core.c
> index 871eb4bc4efc..881bac80bc1e 100644
> --- a/drivers/interconnect/core.c
> +++ b/drivers/interconnect/core.c
> @@ -47,6 +47,7 @@ struct icc_req {
>   */
>  struct icc_path {
>  	size_t num_nodes;
> +	struct opp_table *opp_table;

I am a bit worried that these tables might be abused and size of the DT will
grow with many OPP tables of all existing paths.

>  	struct icc_req reqs[];
>  };
>  
> @@ -313,7 +314,7 @@ struct icc_path *of_icc_get(struct device *dev, const char *name)
>  {
>  	struct icc_path *path = ERR_PTR(-EPROBE_DEFER);
>  	struct icc_node *src_node, *dst_node;
> -	struct device_node *np = NULL;
> +	struct device_node *np = NULL, *opp_node;
>  	struct of_phandle_args src_args, dst_args;
>  	int idx = 0;
>  	int ret;
> @@ -381,10 +382,34 @@ struct icc_path *of_icc_get(struct device *dev, const char *name)
>  		dev_err(dev, "%s: invalid path=%ld\n", __func__, PTR_ERR(path));
>  	mutex_unlock(&icc_lock);
>  
> +	opp_node = of_parse_phandle(np, "interconnect-opp-table", idx);

Can't we figure out if the device OPP table contains bandwidth even without this
property?

Thanks,
Georgi

> +	if (opp_node) {
> +		path->opp_table = dev_pm_opp_of_find_table_from_node(opp_node);
> +		of_node_put(opp_node);
> +	}
> +
> +
>  	return path;
>  }
>  EXPORT_SYMBOL_GPL(of_icc_get);
>  
> +/**
> + * icc_get_opp_table() - Get the OPP table that corresponds to a path
> + * @path: reference to the path returned by icc_get()
> + *
> + * This function will return the OPP table that corresponds to a path handle.
> + * If the interconnect API is disabled, NULL is returned and the consumer
> + * drivers will still build. Drivers are free to handle this specifically, but
> + * they don't have to.
> + *
> + * Return: opp_table pointer on success. NULL is returned when the API is
> + * disabled or the OPP table is missing.
> + */
> +struct opp_table *icc_get_opp_table(struct icc_path *path)
> +{
> +	return path->opp_table;
> +}
> +
>  /**
>   * icc_set_bw() - set bandwidth constraints on an interconnect path
>   * @path: reference to the path returned by icc_get()
> diff --git a/include/linux/interconnect.h b/include/linux/interconnect.h
> index dc25864755ba..0c0bc55f0e89 100644
> --- a/include/linux/interconnect.h
> +++ b/include/linux/interconnect.h
> @@ -9,6 +9,7 @@
>  
>  #include <linux/mutex.h>
>  #include <linux/types.h>
> +#include <linux/pm_opp.h>
>  
>  /* macros for converting to icc units */
>  #define Bps_to_icc(x)	((x) / 1000)
> @@ -28,6 +29,7 @@ struct device;
>  struct icc_path *icc_get(struct device *dev, const int src_id,
>  			 const int dst_id);
>  struct icc_path *of_icc_get(struct device *dev, const char *name);
> +struct opp_table *icc_get_opp_table(struct icc_path *path);
>  void icc_put(struct icc_path *path);
>  int icc_set_bw(struct icc_path *path, u32 avg_bw, u32 peak_bw);
>  
> @@ -49,6 +51,11 @@ static inline void icc_put(struct icc_path *path)
>  {
>  }
>  
> +static inline struct opp_table *icc_get_opp_table(struct icc_path *path)
> +{
> +	return NULL;
> +}
> +
>  static inline int icc_set_bw(struct icc_path *path, u32 avg_bw, u32 peak_bw)
>  {
>  	return 0;
> 
