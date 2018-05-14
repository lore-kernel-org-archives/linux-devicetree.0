Return-Path: <SRS0=ePA5=IB=vger.kernel.org=devicetree-owner@kernel.org>
Received: from metis.ext.pengutronix.de ([85.220.165.71]:57443 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753232AbeENM0c (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 14 May 2018 08:26:32 -0400
Subject: Re: [PATCH v2 1/3] dt: bindings: i2c-mux-pca954x: add mux-locked
 property
References: <20180504130449.13730-1-bst@pengutronix.de>
 <43e5cb0f-c76b-186d-6174-73dee92aef8e@pengutronix.de>
 <7e2ae8a2-3e6a-9c1f-5437-9e775cef719e@axentia.se>
From: Bastian Stender <bst@pengutronix.de>
Message-ID: <a4402498-f318-2753-4220-fde6b1d372a0@pengutronix.de>
Date: Mon, 14 May 2018 14:26:29 +0200
MIME-Version: 1.0
In-Reply-To: <7e2ae8a2-3e6a-9c1f-5437-9e775cef719e@axentia.se>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@the-dreams.de>
Cc: devicetree@vger.kernel.org, Michael Lawnick <ml.lawnick@gmx.de>, linux-i2c@vger.kernel.org, kernel@pengutronix.de
List-ID: <devicetree@vger.kernel.org>

Hi Peter,

On 05/07/2018 11:07 AM, Peter Rosin wrote:
> On 2018-05-04 15:10, Bastian Stender wrote:
>> On 05/04/2018 03:04 PM, Bastian Stender wrote:
>>> Signed-off-by: Bastian Stender <bst@pengutronix.de>
>>> ---
>>>    .../devicetree/bindings/i2c/i2c-mux-pca954x.txt  | 16 ++++++++++++++++
>>>    1 file changed, 16 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt
>>> index 34d91501342e..864ac91f8c1c 100644
>>> --- a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt
>>> +++ b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt
>>> @@ -36,6 +36,22 @@ Optional Properties:
>>>        - first cell is the pin number
>>>        - second cell is used to specify flags.
>>>        See also Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
>>> +  - mux-locked: If present, explicitly allow unrelated I2C transactions on the
>>> +    parent I2C adapter at these times:
>>> +    + during setup of the multiplexer
>>> +    + between setup of the multiplexer and the child bus I2C transaction
>>> +    + between the child bus I2C transaction and releasing of the multiplexer
>>> +    + during releasing of the multiplexer
>>> +
>>> +    However, I2C transactions to devices behind all I2C multiplexers connected
>>> +    to the same parent adapter that this multiplexer is connected to are blocked
>>> +    for the full duration of the complete multiplexed I2C transaction (i.e.
>>> +    including the times covered by the above list).
>>> +    If mux-locked is not present, the multiplexer is assumed to be parent-locked.
>>> +    This means that no unrelated I2C transactions are allowed on the parent I2C
>>> +    adapter for the complete multiplexed I2C transaction.
>>> +    The properties of mux-locked and parent-locked multiplexers are discussed
>>> +    in more detail in Documentation/i2c/i2c-topology.
>>
>> I am not sure about this. I think it will act like the gpmux driver here
>> so I copied it from
>> Documentation/devicetree/bindings/i2c/i2c-mux-gpmux.txt. Is this correct?
> 
> I don't think it's wrong, but it might be a little bit too generic. The gpmux
> binding cannot assume too much about the actual mux, but in this case we
> know exactly how the mux operates. I.e. the initial 4-point list can drop
> the points "during setup/releasing of the multiplexer" because those actions
> happen as i2c transactions that are locking the parent adapter meaning that
> nothing can disturb them.
> 
> However, it would be very good to know what the actual deadlock is that this
> mux-locked is fixing. And a description of that deadlock would fit nicely in
> the commit message. I understood it as if you could trigger it quite easily?
> Any chance that you could make another attempt to pinpoint it with some
> printk-debugging or something, given that lockdep wasn't helpful?

The root cause was now identified by a colleague of mine. The following
patch set was used along with the proposed patches:

   https://www.spinics.net/lists/linux-i2c/msg32324.html

As a result __i2c_transfer() ends up without enabled clocks. The problem
is solved in our case by switching to the mainline solution:

   https://www.spinics.net/lists/linux-i2c/msg33890.html

The question remains whether the proposed patch (along with the
suggested modifications) should be applied nonetheless?

Thanks for your explanations and patience.

Regards,
Bastian

-- 
Pengutronix e.K.
Industrial Linux Solutions
http://www.pengutronix.de/
Peiner Str. 6-8, 31137 Hildesheim, Germany
Amtsgericht Hildesheim, HRA 2686
