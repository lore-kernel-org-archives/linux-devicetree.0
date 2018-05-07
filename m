Return-Path: <SRS0=jssF=H2=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-db5eur01on0105.outbound.protection.outlook.com ([104.47.2.105]:19328
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751940AbeEGJHI (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 7 May 2018 05:07:08 -0400
Subject: Re: [PATCH v2 1/3] dt: bindings: i2c-mux-pca954x: add mux-locked
 property
References: <20180504130449.13730-1-bst@pengutronix.de>
 <43e5cb0f-c76b-186d-6174-73dee92aef8e@pengutronix.de>
From: Peter Rosin <peda@axentia.se>
Message-ID: <7e2ae8a2-3e6a-9c1f-5437-9e775cef719e@axentia.se>
Date: Mon, 7 May 2018 11:07:00 +0200
MIME-Version: 1.0
In-Reply-To: <43e5cb0f-c76b-186d-6174-73dee92aef8e@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Bastian Stender <bst@pengutronix.de>, Wolfram Sang <wsa@the-dreams.de>
Cc: kernel@pengutronix.de, devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, Michael Lawnick <ml.lawnick@gmx.de>
List-ID: <devicetree@vger.kernel.org>

On 2018-05-04 15:10, Bastian Stender wrote:
> On 05/04/2018 03:04 PM, Bastian Stender wrote:
>> Signed-off-by: Bastian Stender <bst@pengutronix.de>
>> ---
>>   .../devicetree/bindings/i2c/i2c-mux-pca954x.txt  | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt
>> index 34d91501342e..864ac91f8c1c 100644
>> --- a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt
>> +++ b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt
>> @@ -36,6 +36,22 @@ Optional Properties:
>>       - first cell is the pin number
>>       - second cell is used to specify flags.
>>       See also Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
>> +  - mux-locked: If present, explicitly allow unrelated I2C transactions on the
>> +    parent I2C adapter at these times:
>> +    + during setup of the multiplexer
>> +    + between setup of the multiplexer and the child bus I2C transaction
>> +    + between the child bus I2C transaction and releasing of the multiplexer
>> +    + during releasing of the multiplexer
>> +
>> +    However, I2C transactions to devices behind all I2C multiplexers connected
>> +    to the same parent adapter that this multiplexer is connected to are blocked
>> +    for the full duration of the complete multiplexed I2C transaction (i.e.
>> +    including the times covered by the above list).
>> +    If mux-locked is not present, the multiplexer is assumed to be parent-locked.
>> +    This means that no unrelated I2C transactions are allowed on the parent I2C
>> +    adapter for the complete multiplexed I2C transaction.
>> +    The properties of mux-locked and parent-locked multiplexers are discussed
>> +    in more detail in Documentation/i2c/i2c-topology.
> 
> I am not sure about this. I think it will act like the gpmux driver here
> so I copied it from
> Documentation/devicetree/bindings/i2c/i2c-mux-gpmux.txt. Is this correct?

I don't think it's wrong, but it might be a little bit too generic. The gpmux
binding cannot assume too much about the actual mux, but in this case we
know exactly how the mux operates. I.e. the initial 4-point list can drop
the points "during setup/releasing of the multiplexer" because those actions
happen as i2c transactions that are locking the parent adapter meaning that
nothing can disturb them.

However, it would be very good to know what the actual deadlock is that this
mux-locked is fixing. And a description of that deadlock would fit nicely in
the commit message. I understood it as if you could trigger it quite easily?
Any chance that you could make another attempt to pinpoint it with some
printk-debugging or something, given that lockdep wasn't helpful?

Cheers,
Peter
