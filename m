From: "Shenhar, Talel" <talel@amazon.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: interrupt-controller: Amazon's
 Annapurna Labs FIC
Date: Tue, 9 Jul 2019 08:59:40 +0300
Message-ID: <f1fd393d-0b8c-16f1-9ac2-0589e9cb9ea7@amazon.com>
References: <1560155683-29584-1-git-send-email-talel@amazon.com>
 <1560155683-29584-2-git-send-email-talel@amazon.com>
 <20190709022301.GA8734@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190709022301.GA8734@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: nicolas.ferre@microchip.com, jason@lakedaemon.net, marc.zyngier@arm.com, mark.rutland@arm.com, mchehab+samsung@kernel.org, davem@davemloft.net, shawn.lin@rock-chips.com, tglx@linutronix.de, devicetree@vger.kernel.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, dwmw@amazon.co.uk, benh@kernel.crashing.org, jonnyc@amazon.com, hhhawa@amazon.com, ronenk@amazon.com, hanochu@amazon.com, barakw@amazon.com
List-Id: devicetree@vger.kernel.org

Marc, should I publish those fixes as new patch that updates the 
dt-bindings or new patchset to this list?

On 7/9/2019 5:23 AM, Rob Herring wrote:
> On Mon, Jun 10, 2019 at 11:34:42AM +0300, Talel Shenhar wrote:
>> +- #interrupt-cells: must be 2.
>> +  First cell defines the index of the interrupt within the controller.
>> +  Second cell is used to specify the trigger type and must be one of the
>> +  following:
>> +    - bits[3:0] trigger type and level flags
>> +	1 = low-to-high edge triggered
>> +	4 = active high level-sensitive
> No need to define this here. Reference the standard definition.

This device only support those two modes.

This definition tries to capture the supported modes.

Should I just state that those two modes are supported and then avoid 
the actual bits and values?

>
>> +- interrupt-parent: specifies the parent interrupt controller.
> Drop this. It is implied and could be in the parent.
ack
>
>> +- interrupts: describes which input line in the interrupt parent, this
>> +  fic's output is connected to. This field property depends on the parent's
>> +  binding
>> +
>> +Example:
>> +
>> +amazon_fic: interrupt-controller@0xfd8a8500 {
> Drop the '0x'
ack
