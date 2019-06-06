From: "Shenhar, Talel" <talel@amazon.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: interrupt-controller: Amazon's
 Annapurna Labs FIC
Date: Thu, 6 Jun 2019 10:23:24 +0300
Message-ID: <19dbb9a4-2a91-fd6f-f61e-95e1e800e013@amazon.com>
References: <1559731921-14023-1-git-send-email-talel@amazon.com>
 <1559731921-14023-2-git-send-email-talel@amazon.com>
 <20190605154955.GD1534@u40b0340c692b58f6553c.ant.amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190605154955.GD1534@u40b0340c692b58f6553c.ant.amazon.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Eduardo Valentin <eduval@amazon.com>
Cc: nicolas.ferre@microchip.com, jason@lakedaemon.net, marc.zyngier@arm.com, mark.rutland@arm.com, mchehab+samsung@kernel.org, robh+dt@kernel.org, davem@davemloft.net, shawn.lin@rock-chips.com, tglx@linutronix.de, devicetree@vger.kernel.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, dwmw@amazon.co.uk, benh@kernel.crashing.org, jonnyc@amazon.com, hhhawa@amazon.com, ronenk@amazon.com, hanochu@amazon.com, barakw@amazon.com, talel@amazon.com
List-Id: devicetree@vger.kernel.org


On 6/5/2019 6:49 PM, Eduardo Valentin wrote:
> On Wed, Jun 05, 2019 at 01:52:00PM +0300, Talel Shenhar wrote:
>> +- compatible: should be "amazon,al-fic"
>> +- reg: physical base address and size of the registers
>> +- interrupt-controller: identifies the node as an interrupt controller
>> +- #interrupt-cells: must be 2.
> It would be great if you describe what the 2 numbers must represent here..

will be included in v4

Thanks,

Talel.
