From: "Shenhar, Talel" <talel@amazon.com>
Subject: Re: [PATCH v2 2/2] irqchip: al-fic: Introduce Amazon's Annapurna Labs
 Fabric Interrupt Controller Driver
Date: Thu, 6 Jun 2019 10:25:55 +0300
Message-ID: <88907fea-aee1-62c8-604a-726b603ec48a@amazon.com>
References: <1559731921-14023-1-git-send-email-talel@amazon.com>
 <1559731921-14023-3-git-send-email-talel@amazon.com>
 <fa6e5a95-d9dd-19f6-43e3-3046e0898bda@arm.com>
 <553d06a4-a6b6-816f-b110-6ef7f300dde4@amazon.com>
 <0915892c-0e53-8f53-e858-b1c3298a4d35@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0915892c-0e53-8f53-e858-b1c3298a4d35@arm.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>, nicolas.ferre@microchip.com, jason@lakedaemon.net, mark.rutland@arm.com, mchehab+samsung@kernel.org, robh+dt@kernel.org, davem@davemloft.net, shawn.lin@rock-chips.com, tglx@linutronix.de, devicetree@vger.kernel.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org
Cc: dwmw@amazon.co.uk, benh@kernel.crashing.org, jonnyc@amazon.com, hhhawa@amazon.com, ronenk@amazon.com, hanochu@amazon.com, barakw@amazon.com, talel@amazon.com
List-Id: devicetree@vger.kernel.org


On 6/5/2019 6:12 PM, Marc Zyngier wrote:
> On 05/06/2019 15:38, Shenhar, Talel wrote:
>>
>> FIC only support two sensing modes, rising-edge and level.
> Yes, I can tell. Yet, this code will let EDGE_BOTH pass through, even if
> it cannot handle it.
Will handle on v4
> Indeed we use interrupt specifier that has the level type in it
>> (dt-binding: "#interrupt-cells: must be 2.") which in turns causes to
>> this irq_set_type callback.
> Well, this isn't what the example in your DT binding shows.
Will update the example in v4


Thanks,

Talel.
