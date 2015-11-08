From: "Daniel K." <dk@syse.no>
Subject: Re: [PATCH] dma: fix returnvar.cocci warnings
Date: Sun, 08 Nov 2015 21:39:29 +0000
Message-ID: <563FC111.4060308@syse.no>
References: <alpine.DEB.2.10.1511080843100.2637@hadrien>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <alpine.DEB.2.10.1511080843100.2637@hadrien>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Julia Lawall <julia.lawall@lip6.fr>, Sinan Kaya <okaya@codeaurora.org>
Cc: linux-arm-kernel@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Vinod Koul <vinod.koul@intel.com>, jcm@redhat.com, timur@codeaurora.org, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, cov@codeaurora.org, agross@codeaurora.org, dmaengine@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, linux-arm-msm@vger.kernel.org, kbuild-all@01.org
List-Id: devicetree@vger.kernel.org

On 11/08/2015 07:45 AM, Julia Lawall wrote:
>  Remove unneeded variable used to store return value.
> 
> --- a/drivers/dma/qcom/hidma_ll.c
> +++ b/drivers/dma/qcom/hidma_ll.c
> @@ -567,14 +567,13 @@ int hidma_ll_resume(struct hidma_lldev *
> 
>  static int hidma_ll_hw_start(struct hidma_lldev *lldev)
>  {
> -	int rc = 0;
>  	unsigned long irqflags;
> 
>  	spin_lock_irqsave(&lldev->lock, irqflags);
>  	writel(lldev->tre_write_offset, lldev->trca + TRCA_DOORBELL_OFFSET);
>  	spin_unlock_irqrestore(&lldev->lock, irqflags);
> 
> -	return rc;
> +	return 0;
>  }
> 
>  bool hidma_ll_isenabled(struct hidma_lldev *lldev)

Seems rather pointless, what about 'static void ...' and dropping the
return statement?


Daniel K.
