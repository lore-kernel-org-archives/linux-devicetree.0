From: Balbir Singh <bsingharora-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/6] libnvdimm: Add nd_region_destroy()
Date: Mon, 26 Mar 2018 10:24:46 +1100
Message-ID: <20180326102446.60358bf6@gmail.com>
References: <20180323081209.31387-1-oohall@gmail.com>
 <20180323081209.31387-2-oohall@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
In-Reply-To: <20180323081209.31387-2-oohall-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.01.org/mailman/options/linux-nvdimm>,
 <mailto:linux-nvdimm-request-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.01.org/pipermail/linux-nvdimm/>
List-Post: <mailto:linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
List-Help: <mailto:linux-nvdimm-request-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org?subject=help>
List-Subscribe: <https://lists.01.org/mailman/listinfo/linux-nvdimm>,
 <mailto:linux-nvdimm-request-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org?subject=subscribe>
Errors-To: linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org
Sender: "Linux-nvdimm" <linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
To: Oliver O'Halloran <oohall-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 23 Mar 2018 19:12:05 +1100
Oliver O'Halloran <oohall-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> Currently there's no way to remove a region from and nvdimm_bus without
> tearing down the whole bus. This patch adds an API for removing a single
> region from the bus so that we can implement a sensible unbind operation
> for the of_nd_region platform driver.
> 
> Signed-off-by: Oliver O'Halloran <oohall-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/nvdimm/region_devs.c | 6 ++++++
>  include/linux/libnvdimm.h    | 1 +
>  2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/nvdimm/region_devs.c b/drivers/nvdimm/region_devs.c
> index 2f1d5771100e..76f46fd1fae0 100644
> --- a/drivers/nvdimm/region_devs.c
> +++ b/drivers/nvdimm/region_devs.c
> @@ -1039,6 +1039,12 @@ struct nd_region *nvdimm_blk_region_create(struct nvdimm_bus *nvdimm_bus,
>  }
>  EXPORT_SYMBOL_GPL(nvdimm_blk_region_create);
>  
> +void nd_region_destroy(struct nd_region *region)
> +{
> +	nd_device_unregister(&region->dev, ND_SYNC);

child_unregister seems to do the same thing, but is expected to be used
as a callback from device_for_each_child()

I'd suggest we merge the two and rename child_unregister and nd_region_unregister

Balbir Singh.
