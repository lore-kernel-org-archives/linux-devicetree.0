From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: reset: Add document for Broadcom STB
 reset controller
Date: Thu, 3 Jan 2019 10:53:25 -0800
Message-ID: <2a54c2cf-5595-ade5-fb29-40e8b6d3133e@gmail.com>
References: <20181221013409.14324-1-f.fainelli@gmail.com>
 <20181221013409.14324-2-f.fainelli@gmail.com> <20190103174117.GA6613@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190103174117.GA6613@bogus>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, p.zabel@pengutronix.de, linux-kernel@vger.kernel.org, "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, Gregory Fong <gregory.0xf0@gmail.com>, Brian Norris <computersforpeace@gmail.com>, "moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 1/3/19 9:41 AM, Rob Herring wrote:
> On Thu, Dec 20, 2018 at 05:34:08PM -0800, Florian Fainelli wrote:
>> Add a binding document for the Broadcom STB reset controller, also known
>> as SW_INIT-style reset controller.
>>
>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
>> ---
>>  .../devicetree/bindings/reset/brcm,reset.txt  | 27 +++++++++++++++++++
>>  1 file changed, 27 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/reset/brcm,reset.txt
>>
>> diff --git a/Documentation/devicetree/bindings/reset/brcm,reset.txt b/Documentation/devicetree/bindings/reset/brcm,reset.txt
>> new file mode 100644
>> index 000000000000..6e5341b4f891
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/reset/brcm,reset.txt
>> @@ -0,0 +1,27 @@
>> +Broadcom STB SW_INIT-style reset controller
>> +===========================================
>> +
>> +Broadcom STB SoCs have a SW_INIT-style reset controller with separate
>> +SET/CLEAR/STATUS registers and possibly multiple banks, each of 32 bit
>> +reset lines.
>> +
>> +Please also refer to reset.txt in this directory for common reset
>> +controller binding usage.
>> +
>> +Required properties:
>> +- compatible: should be brcm,brcmstb-reset
>> +- reg: register base and length
>> +- #reset-cells: must be set to 1
>> +
>> +Example:
>> +
>> +	reset: reset-controller@8404318 {
>> +		compatible = "brcm,brcmstb-reset";
>> +		reg = <0x8404318 0x30>;
> 
> Based on this address, should this be a sub-node of something else? Or 
> not even a sub-node and just make the parent be a reset provider?

The reset controller is part of a larger "sundry" node which has a
collection of functionality, from pinmux/pinctrl, reset controller,
spare bits, chicken bits, anything the designers forgot to put somewhere
else and decided to put there.

If there is one thing consistent though is that given a set of 32-bit
register groups, they have a self contained functionality such that you
can break up the larger "sundry" space into smaller sub-blocks which
have one an only one functionality. Do you think this warrants a
different representation in Device Tree?
-- 
Florian
