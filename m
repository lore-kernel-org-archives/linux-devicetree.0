From: Przemyslaw Gaj <pgaj@cadence.com>
Subject: Re: [PATCH v2 1/5] i3c: master: detach and free device if
 pre_assign_dyn_addr() fails
Date: Tue, 3 Sep 2019 12:13:57 +0100
Message-ID: <20190903111356.GA23588@global.cadence.com>
References: <cover.1567437955.git.vitor.soares@synopsys.com>
 <105a3ac1653e9ae658056a5ec9ddc2a084a61669.1567437955.git.vitor.soares@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <105a3ac1653e9ae658056a5ec9ddc2a084a61669.1567437955.git.vitor.soares@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vitor Soares <Vitor.Soares@synopsys.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-i3c@lists.infradead.org, bbrezillon@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, Joao.Pinto@synopsys.com
List-Id: devicetree@vger.kernel.org

Hi Vitor,

I'm sorry for the delay.

The 09/03/2019 12:35, Vitor Soares wrote:
> EXTERNAL MAIL
> 
> 
> On pre_assing_dyn_addr() the devices that fail:
>   i3c_master_setdasa_locked()
>   i3c_master_reattach_i3c_dev()
>   i3c_master_retrieve_dev_info()
> 
> are kept in memory and master->bus.devs list. This makes the i3c devices
> without a dynamic address are sent on DEFSLVS CCC command. Fix this by
> detaching and freeing the devices that fail on pre_assign_dyn_addr().

What is the problem with sending devices without dynamic address in DEFSLVS?
Shouldn't we still inform rest of the devices about that? About fact that
device with SA without DA exists on the bus?

I think that this is limitation for us. Espacially we have SA and DA fields in
DEFSLVS frame so we are able to distinguish devices with and without Dynamic
Address.

> 
> Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
> ---
> Changes in v2:
>   - Move out detach/free the i3c_dev_desc from pre_assign_dyn_addr()
>   - Convert i3c_master_pre_assign_dyn_addr() to return an int
> 
>  drivers/i3c/master.c | 22 +++++++++++++++-------
>  1 file changed, 15 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 5f4bd52..586e34f 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -1426,19 +1426,19 @@ static void i3c_master_detach_i2c_dev(struct i2c_dev_desc *dev)
>  		master->ops->detach_i2c_dev(dev);
>  }
>  
> -static void i3c_master_pre_assign_dyn_addr(struct i3c_dev_desc *dev)
> +static int i3c_master_pre_assign_dyn_addr(struct i3c_dev_desc *dev)
>  {
>  	struct i3c_master_controller *master = i3c_dev_get_master(dev);
>  	int ret;
>  
>  	if (!dev->boardinfo || !dev->boardinfo->init_dyn_addr ||
>  	    !dev->boardinfo->static_addr)
> -		return;
> +		return 0;
>  
>  	ret = i3c_master_setdasa_locked(master, dev->info.static_addr,
>  					dev->boardinfo->init_dyn_addr);
>  	if (ret)
> -		return;
> +		return ret;
>  
>  	dev->info.dyn_addr = dev->boardinfo->init_dyn_addr;
>  	ret = i3c_master_reattach_i3c_dev(dev, 0);
> @@ -1449,10 +1449,12 @@ static void i3c_master_pre_assign_dyn_addr(struct i3c_dev_desc *dev)
>  	if (ret)
>  		goto err_rstdaa;
>  
> -	return;
> +	return 0;
>  
>  err_rstdaa:
>  	i3c_master_rstdaa_locked(master, dev->boardinfo->init_dyn_addr);
> +
> +	return ret;
>  }
>  
>  static void
> @@ -1647,7 +1649,7 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
>  	enum i3c_addr_slot_status status;
>  	struct i2c_dev_boardinfo *i2cboardinfo;
>  	struct i3c_dev_boardinfo *i3cboardinfo;
> -	struct i3c_dev_desc *i3cdev;
> +	struct i3c_dev_desc *i3cdev, *i3ctmp;
>  	struct i2c_dev_desc *i2cdev;
>  	int ret;
>  
> @@ -1746,8 +1748,14 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
>  	 * Pre-assign dynamic address and retrieve device information if
>  	 * needed.
>  	 */
> -	i3c_bus_for_each_i3cdev(&master->bus, i3cdev)
> -		i3c_master_pre_assign_dyn_addr(i3cdev);
> +	list_for_each_entry_safe(i3cdev, i3ctmp, &master->bus.devs.i3c,
> +				 common.node) {
> +		ret = i3c_master_pre_assign_dyn_addr(i3cdev);
> +		if (ret) {
> +			i3c_master_detach_i3c_dev(i3cdev);
> +			i3c_master_free_i3c_dev(i3cdev);
> +		}
> +	}
>  
>  	ret = i3c_master_do_daa(master);
>  	if (ret)
> -- 
> 2.7.4
> 

-- 
-- 
Przemyslaw Gaj
