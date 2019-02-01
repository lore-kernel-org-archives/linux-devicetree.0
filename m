Return-Path: <dinguyen@kernel.org>
Subject: Re: [PATCH 3/4] EDAC, altera: Skip DB IRQ for Stratix10
References: <1548799428-10541-1-git-send-email-thor.thayer@linux.intel.com>
 <1548799428-10541-4-git-send-email-thor.thayer@linux.intel.com>
From: Dinh Nguyen <dinguyen@kernel.org>
Message-ID: <86856ea5-815b-6c21-f54a-d5dc0373361a@kernel.org>
Date: Fri, 1 Feb 2019 09:37:32 -0600
MIME-Version: 1.0
In-Reply-To: <1548799428-10541-4-git-send-email-thor.thayer@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: thor.thayer@linux.intel.com, bp@alien8.de, robh+dt@kernel.org, mark.rutland@arm.com, mchehab@kernel.org, james.morse@arm.com
Cc: devicetree@vger.kernel.org, linux-edac@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Thor,

On 1/29/19 4:03 PM, thor.thayer@linux.intel.com wrote:
> From: Thor Thayer <thor.thayer@linux.intel.com>
> 
> Stratix10 Double Bit errors are configured as SErrors
> so skip the Double Bit IRQ initialization if Stratix10.
> 
> Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
> ---
>  drivers/edac/altera_edac.c | 31 ++++++++++++++++++-------------
>  1 file changed, 18 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
> index c89d82aa2776..6a460c742e3f 100644
> --- a/drivers/edac/altera_edac.c
> +++ b/drivers/edac/altera_edac.c
> @@ -1924,20 +1924,25 @@ static int altr_edac_a10_device_add(struct altr_arria10_edac *edac,
>  		goto err_release_group1;
>  	}
>  
> -	altdev->db_irq = irq_of_parse_and_map(np, 1);
> -	if (!altdev->db_irq) {
> -		edac_printk(KERN_ERR, EDAC_DEVICE, "Error allocating DBIRQ\n");
> -		rc = -ENODEV;
> -		goto err_release_group1;
> -	}
> -	rc = devm_request_irq(edac->dev, altdev->db_irq, prv->ecc_irq_handler,
> -			      IRQF_ONESHOT | IRQF_TRIGGER_HIGH,
> -			      ecc_name, altdev);
> -	if (rc) {
> -		edac_printk(KERN_ERR, EDAC_DEVICE, "No DBERR IRQ resource\n");
> -		goto err_release_group1;
> +	/* Arria10 has double bit error IRQs. Stratix10 uses SErrors */
> +	if (socfpga_is_a10()) {

I see that there are socfpga_is_a10() and socfpga_is_s10() sprinkled
around the driver. Since you're adding a specific binding for s10, would
it make sense to remove these functions? I've gotten comments in the
past from ARM maintainers that we want to avoid looking up platforms at
runtime and make the differentiation at load time.

Dinh
