From: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH 2/4] i3c: master: Check if devices have
 i3c_dev_boardinfo on i3c_master_add_i3c_dev_locked()
Date: Thu, 29 Aug 2019 18:27:47 +0200
Message-ID: <20190829182747.3a163b8c@collabora.com>
References: <cover.1567071213.git.vitor.soares@synopsys.com>
        <3e21481ddf53ea58f5899df6ec542b79b8cbcd68.1567071213.git.vitor.soares@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3e21481ddf53ea58f5899df6ec542b79b8cbcd68.1567071213.git.vitor.soares@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vitor Soares <Vitor.Soares@synopsys.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-i3c@lists.infradead.org, bbrezillon@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, Joao.Pinto@synopsys.com
List-Id: devicetree@vger.kernel.org

On Thu, 29 Aug 2019 12:19:33 +0200
Vitor Soares <Vitor.Soares@synopsys.com> wrote:

> The I3C devices described in DT might not be attached to the master which
> doesn't allow to assign a specific dynamic address.

Dynamic address assignment is not the only problem here (see my
comment about missing ->of_node info). I would simply say that
newdev->boardinfo assignment was missing in
i3c_master_add_i3c_dev_locked() which is already a bug by itself.

I would also change the subject to

"i3c: master: Make sure ->boardinfo is initialized in add_i3c_dev_locked()"

> 
> This patch check if a device has i3c_dev_boardinfo and add it to
> i3c_dev_desc structure. In this conditions, the framework will try to
> assign the i3c_dev_boardinfo->init_dyn_addr even if stactic address = 0.

I would get rid of this explanation and add Fixes/Cc-stable tags.

> 
> Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
> ---
>  drivers/i3c/master.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 4d29e1f..85fbda6 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -1795,6 +1795,23 @@ i3c_master_search_i3c_dev_duplicate(struct i3c_dev_desc *refdev)
>  	return NULL;
>  }
>  
> +static struct i3c_dev_boardinfo *
> +i3c_master_search_i3c_boardinfo(struct i3c_dev_desc *dev)
> +{
> +	struct i3c_master_controller *master = i3c_dev_get_master(dev);
> +	struct i3c_dev_boardinfo *boardinfo;
> +
> +	if (dev->boardinfo)
> +		return NULL;
> +
> +	list_for_each_entry(boardinfo, &master->boardinfo.i3c, node) {
> +		if (dev->info.pid == boardinfo->pid)
> +			return boardinfo;
> +	}
> +
> +	return NULL;
> +}

Can we instead have:

static void i3c_master_init_i3c_dev_boardinfo(struct i3c_dev_desc *dev)
{
	struct i3c_master_controller *master = i3c_dev_get_master(dev);

	list_for_each_entry(boardinfo, &master->boardinfo.i3c, node) {
		if (dev->info.pid == boardinfo->pid)
			dev->boardinfo = boardinfo;
	}
}

> +
>  /**
>   * i3c_master_add_i3c_dev_locked() - add an I3C slave to the bus
>   * @master: master used to send frames on the bus
> @@ -1816,6 +1833,7 @@ int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
>  {
>  	struct i3c_device_info info = { .dyn_addr = addr };
>  	struct i3c_dev_desc *newdev, *olddev;
> +	struct i3c_dev_boardinfo *boardinfo;
>  	u8 old_dyn_addr = addr, expected_dyn_addr;
>  	struct i3c_ibi_setup ibireq = { };
>  	bool enable_ibi = false;
> @@ -1875,6 +1893,10 @@ int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
>  	if (ret)
>  		goto err_detach_dev;
>  
> +	boardinfo = i3c_master_search_i3c_boardinfo(newdev);
> +	if (boardinfo)
> +		newdev->boardinfo = boardinfo;
> +

And here:

	i3c_master_init_i3c_dev_boardinfo(newdev);

>  	/*
>  	 * Depending on our previous state, the expected dynamic address might
>  	 * differ:
