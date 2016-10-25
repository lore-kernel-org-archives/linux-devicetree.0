From: Axel Haslam <ahaslam@baylibre.com>
Subject: Re: [PATCH/RFT v2 16/17] USB: ohci-da8xx: Allow probing from DT
Date: Tue, 25 Oct 2016 10:10:17 +0200
Message-ID: <CAKXjFTP-V09Rjgo_2C2u0odg3zHMzVbugaPbFqyuMYG4ndkJ-A@mail.gmail.com>
References: <20161024164634.4330-1-ahaslam@baylibre.com> <20161024164634.4330-17-ahaslam@baylibre.com>
 <a32c58db-d3f8-2a1b-53b3-ae78e342c5e7@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a32c58db-d3f8-2a1b-53b3-ae78e342c5e7@lechnology.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Lechner <david@lechnology.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Johan Hovold <johan@kernel.org>, robh+dt@kernel.org, Sekhar Nori <nsekhar@ti.com>, Alan Stern <stern@rowland.harvard.edu>, Kevin Hilman <khilman@baylibre.com>, Sergei Shtylyov <sshtylyov@ru.mvista.com>, Mark Brown <broonie@kernel.org>, Alexandre Bailon <abailon@baylibre.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Oct 25, 2016 at 2:53 AM, David Lechner <david@lechnology.com> wrote:
> On 10/24/2016 11:46 AM, ahaslam@baylibre.com wrote:
>>
>> From: Axel Haslam <ahaslam@baylibre.com>
>>
>> This adds the compatible string to the ohci driver
>> to be able to probe from DT
>>
>> Signed-off-by: Axel Haslam <ahaslam@baylibre.com>
>> ---
>>  drivers/usb/host/ohci-da8xx.c | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/usb/host/ohci-da8xx.c b/drivers/usb/host/ohci-da8xx.c
>> index bebc3f0..1a8db25 100644
>> --- a/drivers/usb/host/ohci-da8xx.c
>> +++ b/drivers/usb/host/ohci-da8xx.c
>> @@ -273,6 +273,13 @@ static int ohci_da8xx_hub_control(struct usb_hcd
>> *hcd, u16 typeReq, u16 wValue,
>>  }
>>
>>
>> /*-------------------------------------------------------------------------*/
>> +#ifdef CONFIG_OF
>
>
> #ifdef CONFIG_OF is probably not needed here...
>
>> +static const struct of_device_id da8xx_ohci_ids[] = {
>> +       { .compatible = "ti,da830-ohci" },
>> +       { }
>> +};
>> +MODULE_DEVICE_TABLE(of, da8xx_ohci_ids);
>> +#endif
>>
>>  static int ohci_da8xx_probe(struct platform_device *pdev)
>>  {
>> @@ -421,6 +428,7 @@ static int ohci_da8xx_resume(struct platform_device
>> *dev)
>>  #endif
>>         .driver         = {
>>                 .name   = "ohci",
>> +               .of_match_table = da8xx_ohci_ids,
>
>
> ...otherwise, da8xx_ohci_ids will not be defined here

this should be  .of_match_table = of_match_ptr(da8xx_ohci_ids),
will fix.

>
>>         },
>>  };
>>
>>
>
