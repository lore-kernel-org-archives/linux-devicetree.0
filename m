From: Philipp Puschmann <pp@emlix.com>
Subject: Re: [PATCH v2,2/2] usb: chipidea: imx: set power polarity
Date: Mon, 21 Jan 2019 18:57:51 +0100
Message-ID: <b95de83f-b0fe-b31f-22c9-a0dfdc2ff078@emlix.com>
References: <20190115123113.20577-1-philipp.puschmann@emlix.com>
 <20190116105103.28842-1-philipp.puschmann@emlix.com>
 <20190116105103.28842-2-philipp.puschmann@emlix.com>
 <22968f8c-0a62-7046-c46f-ce7dc8981499@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <22968f8c-0a62-7046-c46f-ce7dc8981499@cogentembedded.com>
Content-Language: de-DE
Sender: linux-kernel-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Philipp Puschmann <philipp.puschmann@emlix.com>, gregkh@linuxfoundation.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, Peter.Chen@nxp.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi!

Am 16.01.19 um 17:32 schrieb Sergei Shtylyov:
> Hello!
> 
> On 01/16/2019 01:51 PM, Philipp Puschmann wrote:
> 
>> This patch adds support to set the power line polarity for i.MX6q/dl.
>>
>> To let the USB controller control the power it may be necessary to configure
>> the polarity of the power line. So far the polarity was configured
>> by Bootloader or alternatively the power line was muxed as gpio and
>> driven by a regulator.
>>
>> Signed-off-by: Philipp Puschmann <philipp.puschmann@emlix.com>
>> ---
>>
>> V2: fixed wrong variable name ...
>>
>> ---
>>  drivers/usb/chipidea/ci_hdrc_imx.c | 3 +++
>>  drivers/usb/chipidea/ci_hdrc_imx.h | 1 +
>>  drivers/usb/chipidea/usbmisc_imx.c | 4 ++++
>>  3 files changed, 8 insertions(+)
>>
>> diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
>> index e81de9ca8729..32dc120680fa 100644
>> --- a/drivers/usb/chipidea/ci_hdrc_imx.c
>> +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
>> @@ -152,6 +152,9 @@ static struct imx_usbmisc_data *usbmisc_get_init_data(struct device *dev)
>>  		dev_warn(dev, "No over current polarity defined\n");
>>  	}
>>  
>> +	if (of_find_property(np, "power-active-high", NULL))
> 
>    How about of_property_read_bool()?

Good idea. I will send a patch v4 in next days.
> 
>> +		data->pwr_pol = 1;
>> +
>>  	if (of_find_property(np, "external-vbus-divider", NULL))
>>  		data->evdo = 1;
>>  
> [...]
> 
> MBR, Sergei
> 
