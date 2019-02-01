Return-Path: <SRS0=cBdN=QI=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mga18.intel.com ([134.134.136.126]:36450 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726172AbfBAQtl (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 1 Feb 2019 11:49:41 -0500
Reply-To: thor.thayer@linux.intel.com
Subject: Re: [PATCH 3/4] EDAC, altera: Skip DB IRQ for Stratix10
References: <1548799428-10541-1-git-send-email-thor.thayer@linux.intel.com>
 <1548799428-10541-4-git-send-email-thor.thayer@linux.intel.com>
 <86856ea5-815b-6c21-f54a-d5dc0373361a@kernel.org>
From: Thor Thayer <thor.thayer@linux.intel.com>
Message-ID: <4dbb757b-e44a-a0e0-d2c1-b7018f3df471@linux.intel.com>
Date: Fri, 1 Feb 2019 10:51:55 -0600
MIME-Version: 1.0
In-Reply-To: <86856ea5-815b-6c21-f54a-d5dc0373361a@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Dinh Nguyen <dinguyen@kernel.org>, bp@alien8.de, robh+dt@kernel.org, mark.rutland@arm.com, mchehab@kernel.org, james.morse@arm.com
Cc: devicetree@vger.kernel.org, linux-edac@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Dinh,

On 2/1/19 9:37 AM, Dinh Nguyen wrote:
> Hi Thor,
> 
> On 1/29/19 4:03 PM, thor.thayer@linux.intel.com wrote:
>> From: Thor Thayer <thor.thayer@linux.intel.com>
>>
>> Stratix10 Double Bit errors are configured as SErrors
>> so skip the Double Bit IRQ initialization if Stratix10.
>>
>> Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
>> ---
>>   drivers/edac/altera_edac.c | 31 ++++++++++++++++++-------------
>>   1 file changed, 18 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
>> index c89d82aa2776..6a460c742e3f 100644
>> --- a/drivers/edac/altera_edac.c
>> +++ b/drivers/edac/altera_edac.c
>> @@ -1924,20 +1924,25 @@ static int altr_edac_a10_device_add(struct altr_arria10_edac *edac,
>>   		goto err_release_group1;
>>   	}
>>   
>> -	altdev->db_irq = irq_of_parse_and_map(np, 1);
>> -	if (!altdev->db_irq) {
>> -		edac_printk(KERN_ERR, EDAC_DEVICE, "Error allocating DBIRQ\n");
>> -		rc = -ENODEV;
>> -		goto err_release_group1;
>> -	}
>> -	rc = devm_request_irq(edac->dev, altdev->db_irq, prv->ecc_irq_handler,
>> -			      IRQF_ONESHOT | IRQF_TRIGGER_HIGH,
>> -			      ecc_name, altdev);
>> -	if (rc) {
>> -		edac_printk(KERN_ERR, EDAC_DEVICE, "No DBERR IRQ resource\n");
>> -		goto err_release_group1;
>> +	/* Arria10 has double bit error IRQs. Stratix10 uses SErrors */
>> +	if (socfpga_is_a10()) {
> 
> I see that there are socfpga_is_a10() and socfpga_is_s10() sprinkled
> around the driver. Since you're adding a specific binding for s10, would
> it make sense to remove these functions? I've gotten comments in the
> past from ARM maintainers that we want to avoid looking up platforms at
> runtime and make the differentiation at load time.
> 
> Dinh
> 

If there were larger differences between the Arria10 and Stratix10 then 
I'd agree. The differences between Arria10 and Stratix10 are minor 
because the ECC blocks are similar.

Since all the different families of Altera EDACs are in the same file, I 
think the runtime allocation is warranted especially since these checks 
are in the initialization functions. The interrupt handling functions 
are clean.

If the maintainers have a strong preference for separate functions, I 
can make that change but the Stratix10 functions will be very similar to 
the Arria10 functions resulting in a much larger file.

My preference would be to keep the method in this patch but of course, 
I'll follow the consensus of the maintainers.

Thanks for the review and comment!

Thor
