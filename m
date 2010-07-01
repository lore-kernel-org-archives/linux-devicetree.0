From: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>
Subject: Re: [git pull] (updated) OF-related build breakage fixes
Date: Thu, 1 Jul 2010 15:16:24 +0200
Message-ID: <20100701151624.2bf6c533@wker>
References: <AANLkTikNcAvyHf1yHPweNBVSCSPNmq-JaEOgYW2FYUGJ@mail.gmail.com>
	<AANLkTimvYT9MFPzX7xmCXPZ6ScFQZxO3zSKlcqczd_GO@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <AANLkTimvYT9MFPzX7xmCXPZ6ScFQZxO3zSKlcqczd_GO-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Dan Williams <dan.j.williams-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 1 Jul 2010 02:06:35 -0700
Dan Williams <dan.j.williams-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> of/dma: fix remaining ppc4xx build breakage
> 
> From: Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> 
> Commit 05c02542 "of/dma: fix build breakage in ppc4xx adma driver"
> missed one conversion site.
> 
> Cc: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>
> Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> Signed-off-by: Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> ---
> 
>  drivers/dma/ppc4xx/adma.c |    4 +++-
>  1 files changed, 3 insertions(+), 1 deletions(-)

Acked-by: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>

Thanks for fixing!

> 
> 
> diff --git a/drivers/dma/ppc4xx/adma.c b/drivers/dma/ppc4xx/adma.c
> index 5a22ca6..7c37479 100644
> --- a/drivers/dma/ppc4xx/adma.c
> +++ b/drivers/dma/ppc4xx/adma.c
> @@ -4257,10 +4257,12 @@ static int ppc440spe_adma_setup_irqs(struct ppc440spe_adma_device *adev,
>  				     struct ppc440spe_adma_chan *chan,
>  				     int *initcode)
>  {
> +	struct of_device *ofdev;
>  	struct device_node *np;
>  	int ret;
>  
> -	np = container_of(adev->dev, struct of_device, dev)->node;
> +	ofdev = container_of(adev->dev, struct of_device, dev);
> +	np = ofdev->dev.of_node;
>  	if (adev->id != PPC440SPE_XOR_ID) {
>  		adev->err_irq = irq_of_parse_and_map(np, 1);
>  		if (adev->err_irq == NO_IRQ) {
