From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] dma: of-dma.c: fix memory leakage
Date: Thu, 14 Feb 2013 19:12:19 +0530
Message-ID: <20130214134219.GC29960@intel.com>
References: <1358600805-20193-1-git-send-email-dinggnu@gmail.com>
 <50FC6EB1.4050704@gmail.com> <20130122101053.GA2427@gmail.com>
 <20130212174025.GB17659@intel.com>
 <20130214101610.GA29017@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130214101610.GA29017-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
To: Cong Ding <dinggnu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Feb 14, 2013 at 11:16:10AM +0100, Cong Ding wrote:
> The memory allocated to ofdma might be a leakage when error occurs.
> 
> Signed-off-by: Cong Ding <dinggnu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Applied, thanks

--
~Vinod
> ---
>  drivers/dma/of-dma.c |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/dma/of-dma.c b/drivers/dma/of-dma.c
> index 59631b2..583e50e3 100644
> --- a/drivers/dma/of-dma.c
> +++ b/drivers/dma/of-dma.c
> @@ -107,6 +107,7 @@ int of_dma_controller_register(struct device_node *np,
>  	if (!nbcells) {
>  		pr_err("%s: #dma-cells property is missing or invalid\n",
>  		       __func__);
> +		kfree(ofdma);
>  		return -EINVAL;
>  	}
>  
> -- 
> 1.7.9.5
> 
