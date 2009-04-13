From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: Where in dts file one should define IORESOURCES_(IO|MEM)?
Date: Mon, 13 Apr 2009 13:59:25 -0500
Message-ID: <49E38B8D.8040105@freescale.com>
References: <003e01c9bc60$ab11c2c0$9e70150a@cisco.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <003e01c9bc60$ab11c2c0$9e70150a-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Subodh Nijsure <sunijsur-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Subodh Nijsure wrote:
> in drivers/ide/legacy/ide_platform.c there is code that looks like this.
>  
>  
>         res_base = platform_get_resource(pdev, IORESOURCE_IO, 0);
>         res_alt = platform_get_resource(pdev, IORESOURCE_IO, 1);
>  
>         if (!res_base || !res_alt) {
>                 res_base = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>                 res_alt = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> If I want to specify IORESOURCE_MEM (0) and IORESOURCE_MEM ( 1) 
> addresses in my board specific what statements do I need to include in 
> my dts file?

They would be the first and second "reg" resources of the relevant 
device node.

For IDE, you probably want drivers/ata/pata_of_platform.c rather than 
the above driver.

> I have tried including them in memory {} section of dts and that doesn't 
> work.

No, that's for *memory*, not device registers.

-Scott
