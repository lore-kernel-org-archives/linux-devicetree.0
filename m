From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH 04/20] coresight: Cleanup platform description data
Date: Fri, 8 Jun 2018 13:41:53 -0600
Message-ID: <20180608194153.GA30587@xps15>
References: <1528235011-30691-1-git-send-email-suzuki.poulose@arm.com>
 <1528235011-30691-5-git-send-email-suzuki.poulose@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1528235011-30691-5-git-send-email-suzuki.poulose@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, robh@kernel.org, frowand.list@gmail.com, mark.rutland@arm.com, sudeep.holla@arm.com, arm@kernel.org, linux-kernel@vger.kernel.org, matt.sealey@arm.com, john.horley@arm.com, charles.garcia-tobin@arm.com, coresight@lists.linaro.org, devicetree@vger.kernel.org, mike.leach@linaro.org
List-Id: devicetree@vger.kernel.org

On Tue, Jun 05, 2018 at 10:43:15PM +0100, Suzuki K Poulose wrote:
> Nobody uses the "clk" field in struct coresight_platform_data.
> Remove it.
> 
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>  include/linux/coresight.h | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index e5421b8..69a5c9f 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -87,7 +87,6 @@ struct coresight_dev_subtype {
>   * @child_ports:child component port number the current component is
>  		connected  to.
>   * @nr_outport:	number of output ports for this component.
> - * @clk:	The clock this component is associated to.
>   */
>  struct coresight_platform_data {
>  	int cpu;
> @@ -97,7 +96,6 @@ struct coresight_platform_data {
>  	const char **child_names;
>  	int *child_ports;
>  	int nr_outport;
> -	struct clk *clk;
>  };

I'm going to queue this up for the next rc.  No need to send it as part of
another revision.

Thanks,
Mathieu

>  
>  /**
> -- 
> 2.7.4
> 
