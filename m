From: Walter Goossens <waltergoossens-CmkmPbn3yAE@public.gmane.org>
Subject: Re: [PATCH] Add devicetree support to altera_jtaguart
Date: Thu, 13 Jan 2011 02:25:47 +0100
Message-ID: <4D2E549B.5080304@home.nl>
References: <4D2E287B.7000005@home.nl>
	<20110112230607.GA31712@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110112230607.GA31712-MrY2KI0G/OVr83L8+7iqerDks+cytr/Z@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, nios2-dev-1eJk0qcHJCcaeqlQEoCUNoJY59XmG8rH@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 1/13/11 12:06 AM, Grant Likely wrote:
> On Wed, Jan 12, 2011 at 11:17:31PM +0100, Walter Goossens wrote:
>> This patch adds devicetree support to the altera_jtaguart driver.
>> Tested on hardware on the nios2 architecture.
[...]
> These two blocks are largely identical.  You should be able to
> implement this with considerably less duplicated code between the two
> drivers.  Since the scope of instantiating this particular device, I
> recommend splitting it up so that there is only ever one device per
> port, with the irq and register addresses stored in the resource table.
> By making that change, exactly the same code would drive both OF and
> non-OF use-cases.
>
> Also, the way this is implemented precludes having more than
> one instance of the device.  It would be better if the port structure
> was dynamically allocated (but I do understand that the current driver
> only handles one instance anyway, so it would make sense for that to
> be a separate patch).
Yes it's actually quite hard to see a system with more then one 
jtag_uart. It has to be a system with multiple interconnected FPGA's 
since each FPGA has one jtag interface and you can run just one 
jtag_uart per jtag interface.
But it's impossible so...
Not quite sure what the final solution should look like...
> The rest of this patch look fine.
>
>>   	}
>>
>>   	return 0;
>> @@ -464,6 +487,15 @@ static int __devexit altera_jtaguart_remove(struct platform_device *pdev)
>>
>>   	return 0;
>>   }
>> +#ifdef CONFIG_OF
>> +static struct of_device_id altera_jtaguart_match[] = {
>> +	{
>> +		.compatible = "altera,altera_juart",
>> +	},
>> +	{},
>> +}
>> +MODULE_DEVICE_TABLE(of, altera_jtaguart_match);
>> +#endif /* CONFIG_OF */
>>
>>   static struct platform_driver altera_jtaguart_platform_driver = {
>>   	.probe	= altera_jtaguart_probe,
>> @@ -471,6 +503,9 @@ static struct platform_driver altera_jtaguart_platform_driver = {
>>   	.driver	= {
>>   		.name	= DRV_NAME,
>>   		.owner	= THIS_MODULE,
>> +#ifdef CONFIG_OF
>> +		.of_match_table = altera_jtaguart_match,
>> +#endif
>>   	},
>>   };
>>
>> _______________________________________________
>> devicetree-discuss mailing list
>> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
>> https://lists.ozlabs.org/listinfo/devicetree-discuss
>
