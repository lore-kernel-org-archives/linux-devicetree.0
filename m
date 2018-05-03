Return-Path: <SRS0=Rw9b=HW=cogentembedded.com=sergei.shtylyov@kernel.org>
Subject: Re: [PATCH v5 08/14] staging: typec: tcpci: register port before
 request irq
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
References: <1525307094-27402-1-git-send-email-jun.li@nxp.com>
 <1525307094-27402-9-git-send-email-jun.li@nxp.com>
 <9e9dcdba-f46d-483f-e544-d1d55cd4ed23@cogentembedded.com>
Message-ID: <3d764d7b-9829-8f49-f2c9-70e5413f76ba@cogentembedded.com>
Date: Thu, 3 May 2018 11:34:33 +0300
MIME-Version: 1.0
In-Reply-To: <9e9dcdba-f46d-483f-e544-d1d55cd4ed23@cogentembedded.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
To: Li Jun <jun.li@nxp.com>, robh+dt@kernel.org, gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com, linux@roeck-us.net
Cc: a.hajda@samsung.com, cw00.choi@samsung.com, shufan_lee@richtek.com, peter.chen@nxp.com, gsomlo@gmail.com, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

On 5/3/2018 11:29 AM, Sergei Shtylyov wrote:

>> From: Peter Chen <peter.chen@nxp.com>
>>
>> With that we can clear any pending events and the port is registered
>> so driver can be ready to handle typec events once we request irq.
>>
>> Signed-off-by: Peter Chen <peter.chen@nxp.com>
>> Signed-off-by: Li Jun <jun.li@nxp.com>
>> ---
>>   drivers/staging/typec/tcpci.c | 15 +++++++++------
>>   1 file changed, 9 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/staging/typec/tcpci.c b/drivers/staging/typec/tcpci.c
>> index a21aaf5..139c2ab 100644
>> --- a/drivers/staging/typec/tcpci.c
>> +++ b/drivers/staging/typec/tcpci.c
>> @@ -537,24 +537,27 @@ static int tcpci_probe(struct i2c_client *client,
>>       if (IS_ERR(chip->data.regmap))
>>           return PTR_ERR(chip->data.regmap);
>> +    i2c_set_clientdata(client, chip);
>> +
>>       /* Disable chip interrupts before requesting irq */
>>       err = regmap_raw_write(chip->data.regmap, TCPC_ALERT_MASK, &val,
>>                      sizeof(u16));
>>       if (err < 0)
>>           return err;
>> +    chip->tcpci = tcpci_register_port(&client->dev, &chip->data);
>> +    if (PTR_ERR_OR_ZERO(chip->tcpci))
> 
>     Is NULL an error indication too?
> 
>> +        return PTR_ERR(chip->tcpci);
> 
>     If so, you'll return a success indication here.

    ... when chip->tcpci is NULL, I mean. Seems wrong...

>> +
>>       err = devm_request_threaded_irq(&client->dev, client->irq, NULL,
>>                       _tcpci_irq,
>>                       IRQF_ONESHOT | IRQF_TRIGGER_LOW,
>>                       dev_name(&client->dev), chip);
>> -    if (err < 0)
>> +    if (err < 0) {
>> +        tcpci_unregister_port(chip->tcpci);
>>           return err;
>> +    }
>> -    chip->tcpci = tcpci_register_port(&client->dev, &chip->data);
>> -    if (PTR_ERR_OR_ZERO(chip->tcpci))
>> -        return PTR_ERR(chip->tcpci);
>> -

    Ah, you're only moving the questionable code...

>> -    i2c_set_clientdata(client, chip);
>>       return 0;
>>   }

MBR, Sergei
