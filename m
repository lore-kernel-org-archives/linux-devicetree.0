From: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 2/2] fpga manager: Add Xilinx slave serial SPI driver
Date: Tue, 21 Feb 2017 15:51:18 +0100
Message-ID: <19e0b5d1-bbf6-25ac-2698-6074ebafcf05@xilinx.com>
References: <1487600724-17607-1-git-send-email-agust@denx.de>
 <1487600724-17607-3-git-send-email-agust@denx.de>
 <2d412ae7-4163-9943-6d98-2d6387df7789@xilinx.com>
 <20170221152444.34b5d9f4@crub>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170221152444.34b5d9f4@crub>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: linux-fpga-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 21.2.2017 15:24, Anatolij Gustschin wrote:
> On Tue, 21 Feb 2017 15:01:32 +0100
> Michal Simek michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org wrote:
> ...
>>> +static struct spi_driver xilinx_slave_spi_driver = {
>>> +	.driver = {
>>> +		.name = "xlnx-slave-spi",
>>> +		.owner = THIS_MODULE,  
>>
>> This should be done by core and it is checked by testing system.
> 
> Okay, will remove it.
> 
> ...
>>> +MODULE_LICENSE("GPL");  
>>
>> Above you have GPL v2 and here v2 or later.
>>
>> include/linux/module.h
>> *      "GPL"                           [GNU Public License v2 or later]
>> *      "GPL v2"                        [GNU Public License v2]
>>
>> What's the license then?
> 
> should be "GPL v2", I'll fix it next patch version.
> 
> ...
>>> +MODULE_DESCRIPTION("Load Xilinx FPGA firmware over SPI");
>>>   
>>
>> What's the hw configuration?
> 
> I used Spartan-6 for testing. But the driver might work with other
> Xilinx FPGAs, so I didn't add exact hw description.

ok. I expect this is spartan-6 next to another SoC and you use spi for
that another SoC and you connect.

I think it will be good to extend that example and add also spi device
node to see where this should be placed.

Thanks,
Michal





--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
