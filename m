From: Roger Quadros <rogerq@ti.com>
Subject: Re: [PATCH v2 1/4] phy: core: Add *release* phy_ops invoked when the
 consumer relinquishes PHY
Date: Thu, 7 Feb 2019 12:55:16 +0200
Message-ID: <5C5C0E94.4090401@ti.com>
References: <20190206110753.28738-1-kishon@ti.com>
 <20190206110753.28738-2-kishon@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190206110753.28738-2-kishon@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Kishon,

On 06/02/19 13:07, Kishon Vijay Abraham I wrote:
> Add a new phy_ops *release* invoked when the consumer relinquishes the
> PHY using phy_put/devm_phy_put. The initializations done by the PHY
> driver in of_xlate call back can be can be cleaned up here.
> 
> Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
> ---
>  drivers/phy/phy-core.c  | 5 +++++
>  include/linux/phy/phy.h | 2 ++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> index 19b05e824ee4..d4bd85afdc91 100644
> --- a/drivers/phy/phy-core.c
> +++ b/drivers/phy/phy-core.c
> @@ -564,6 +564,11 @@ void phy_put(struct phy *phy)
>  	if (!phy || IS_ERR(phy))
>  		return;
>  
> +	mutex_lock(&phy->mutex);
> +	if (phy->ops->release)
> +		phy->ops->release(phy);
> +	mutex_unlock(&phy->mutex);
> +
>  	module_put(phy->ops->owner);
>  	put_device(&phy->dev);
>  }
> diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
> index e8e118d70fd7..feb8dce54ac2 100644
> --- a/include/linux/phy/phy.h
> +++ b/include/linux/phy/phy.h
> @@ -63,6 +63,7 @@ union phy_configure_opts {
>   * @set_mode: set the mode of the phy
>   * @reset: resetting the phy
>   * @calibrate: calibrate the phy
> + * @release: ops to be performed while the consumer reliquishes the PHY

s/reliquishes/relinquishes

>   * @owner: the module owner containing the ops
>   */
>  struct phy_ops {
> @@ -104,6 +105,7 @@ struct phy_ops {
>  			    union phy_configure_opts *opts);
>  	int	(*reset)(struct phy *phy);
>  	int	(*calibrate)(struct phy *phy);
> +	void	(*release)(struct phy *phy);
>  	struct module *owner;
>  };
>  
> 

cheers,
-roger
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
