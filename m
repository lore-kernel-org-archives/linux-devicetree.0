Return-Path: <SRS0=Z3Sa=WS=nvidia.com=nkristam@kernel.org>
Subject: Re: [Patch V6 7/8] usb: gadget: Add UDC driver for tegra XUSB device
 mode controller
References: <1565257046-9890-1-git-send-email-nkristam@nvidia.com>
 <1565257046-9890-8-git-send-email-nkristam@nvidia.com>
 <87tvaqtuk9.fsf@gmail.com>
From: Nagarjuna Kristam <nkristam@nvidia.com>
Message-ID: <a8f5fb17-559d-f3c3-915d-bca6632fe848@nvidia.com>
Date: Thu, 22 Aug 2019 15:59:05 +0530
MIME-Version: 1.0
In-Reply-To: <87tvaqtuk9.fsf@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Felipe Balbi <balbi@kernel.org>, gregkh@linuxfoundation.org, thierry.reding@gmail.com, jonathanh@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>



On 09-08-2019 17:33, Felipe Balbi wrote:
> 
> Hi,
> 
> Nagarjuna Kristam <nkristam@nvidia.com> writes:
>> This patch adds UDC driver for tegra XUSB 3.0 device mode controller.
>> XUSB device mode controller supports SS, HS and FS modes
>>
>> Based on work by:
>>   Mark Kuo <mkuo@nvidia.com>
>>   Hui Fu <hfu@nvidia.com>
>>   Andrew Bresticker <abrestic@chromium.org>
>>
>> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
>> Acked-by: Thierry Reding <treding@nvidia.com>
>> ---
>>  drivers/usb/gadget/udc/Kconfig      |   11 +
>>  drivers/usb/gadget/udc/Makefile     |    1 +
>>  drivers/usb/gadget/udc/tegra_xudc.c | 3808 +++++++++++++++++++++++++++++++++++
>>  3 files changed, 3820 insertions(+)
>>  create mode 100644 drivers/usb/gadget/udc/tegra_xudc.c
>>
>> diff --git a/drivers/usb/gadget/udc/Kconfig b/drivers/usb/gadget/udc/Kconfig
>> index ef0259a..fe6028e 100644
>> --- a/drivers/usb/gadget/udc/Kconfig
>> +++ b/drivers/usb/gadget/udc/Kconfig
>> @@ -440,6 +440,17 @@ config USB_GADGET_XILINX
>>  	  dynamically linked module called "udc-xilinx" and force all
>>  	  gadget drivers to also be dynamically linked.
>>  
>> +config USB_TEGRA_XUDC
>> +	tristate "NVIDIA Tegra Superspeed USB 3.0 Device Controller"
>> +	depends on ARCH_TEGRA
> 
> I need at least a COMPILE_TEST here.
> 
Sure will add the same in next series.

-Nagarjuna
