From: Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: [PATCH net-next v2 4/7] net: phy: mscc: read
 'vsc8531,edge-slowdown' as an u32 [UNSCANNED]
Date: Tue, 4 Sep 2018 10:21:51 +0100
Message-ID: <6c189a8f-7168-3861-c964-b38631833451@opensource.cirrus.com>
References: <20180903084853.18092-1-quentin.schulz@bootlin.com>
 <20180903084853.18092-4-quentin.schulz@bootlin.com>
 <20180903132756.GD4445@lunn.ch> <20180903133746.wsvezy3rbdivnjfs@qschulz>
 <20180903200554.GJ4445@lunn.ch> <20180904072630.zc6sdz2xdti5nku4@qschulz>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180904072630.zc6sdz2xdti5nku4@qschulz>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Quentin Schulz <quentin.schulz@bootlin.com>, Andrew Lunn <andrew@lunn.ch>
Cc: davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, f.fainelli@gmail.com, allan.nielsen@microchip.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com, rf@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

On 04/09/18 08:26, Quentin Schulz wrote:
> Hi Andrew,
> 
> On Mon, Sep 03, 2018 at 10:05:54PM +0200, Andrew Lunn wrote:
>>> Just to be sure, we're talking here about making sure the value stored
>>> in the DT is not bigger than the specified value (here an u8)? If so,
>>> that isn't the reason why I'm suggesting those two patches.
>>>
>>> Without /bits 8/ in the DT property, whatever were the values I put in
>>> the property, I'd always get a 0. So I need to fix it either in the DT
>>> (but Rob does not really like it) or in the driver.
>>
>> Hi Quentin
>>
>> Ah, you are fixing endian issues. That was not clear to me from the
>> commit message.
>>
>> I don't know enough about how DT stores values in the blob. Is there
>> type info? Can the DT core tell if a value in the blob is a u8 or a
>> u32?  It would be nice if it warned about reading a u8 from a u32
>> blob.
>>
> 
>  From my quick research, the lower bound checking is performed by
> of_property_read_u* functions but not the higher bound checking (the
> internal function of_find_property_value_of_size allows higher bound
> checking but it seems it's never used by those functions (see 0 in
> sz_max of of_property_read_variable_u*_array)).
> 
> sz_max is used by of_property_read_variable_u*_array to copy at a
> maximum of sz_max values in the output buffer. If sz_max is 0, it takes
> sz_min so it's an array of definite size.
> So since sz_max is 0 for all calls to of_property_read_variable_u*_array
> by of_property_read_u*_array, we basically know we'll get a buffer of
> sz_min values but we don't actually make use of the higher bound
> checking of of_find_property_value_of_size.
> 

This was the original behaviour of the of_property_read_u*_array functions.
If you look back at the of_property_read_u*_array implementations
before my patch they passed max=0 to of_find_property_value_of_size.

To avoid duplicating code I reimplemented the of_property_read_u*_array
to use the new of_property_read_variable_u*_array hence they pass
sz_max=0 to preserve the original behaviour that max=0 to
of_find_property_value_of_size, so that I didn't break any code that might
depend on that.

> We could enforce this higher bound check by, instead of setting sz_max
> to 0, setting sz_max to sz_min in calls to of_property_read_u*_array.
> 
> But I guess there is a reason for sz_max being 0. Rob, Richard (commit
> signer of this code) do you know why? Could you explain?

> 
>> Anyway, this change still removes some bounds checking. Are they
>> important? Do they need to be added back?
>>
> 
> The edge-slowdown and the vddmac values are compared against a const
> array so we´re fine with those ones.
> 
> For the led-X-mode, I added a constant for supported modes that gets
> checked when retrieving the DT property. So we´re fine here too.
> 
> Quentin
> 
