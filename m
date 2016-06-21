From: Thor Thayer <tthayer@opensource.altera.com>
Subject: Re: [PATCHv4 4/7] Documentation: dt: socfpga: Add Arria10 Ethernet
 binding
Date: Tue, 21 Jun 2016 09:46:40 -0500
Message-ID: <57695350.3050404@opensource.altera.com>
References: <1466434252-26107-1-git-send-email-tthayer@opensource.altera.com>
 <1466434252-26107-5-git-send-email-tthayer@opensource.altera.com>
 <20160621133340.GA9073@rob-hp-laptop>
Reply-To: tthayer@opensource.altera.com
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160621133340.GA9073@rob-hp-laptop>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux@arm.linux.org.uk, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, tthayer.linux@gmail.com, bp@alien8.de, dougthompson@xmission.com, grant.likely@linaro.org, dinguyen@opensource.altera.com, linux-edac@vger.kernel.org, linux-arm-kernel@lists.infradead.org, m.chehab@samsung.com
List-Id: devicetree@vger.kernel.org

Hi Rob,

On 06/21/2016 08:33 AM, Rob Herring wrote:
> On Mon, Jun 20, 2016 at 09:50:49AM -0500, tthayer@opensource.altera.com wrote:
>> From: Thor Thayer <tthayer@opensource.altera.com>
>>
>> Add the device tree bindings needed to support the Altera Ethernet
>> FIFO buffers on the Arria10 chip.
>>
>> Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
>> ---
>> v2  No Change
>> v3  Change to common compatible string based on maintainer comments
>>      Add local IRQ values.
>> v4  Add compatible string for parent node.
>> ---
>>   .../bindings/arm/altera/socfpga-eccmgr.txt         |   24 ++++++++++++++++++++
>>   1 file changed, 24 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/altera/socfpga-eccmgr.txt b/Documentation/devicetree/bindings/arm/altera/socfpga-eccmgr.txt
>> index 15eb0df..7c714ba 100644
>> --- a/Documentation/devicetree/bindings/arm/altera/socfpga-eccmgr.txt
>> +++ b/Documentation/devicetree/bindings/arm/altera/socfpga-eccmgr.txt
>> @@ -82,6 +82,14 @@ Required Properties:
>>   - interrupts : Should be single bit error interrupt, then double bit error
>>   	interrupt, in this order.
>>
>> +Ethernet FIFO ECC
>> +Required Properties:
>> +- compatible : Should be "altr,socfpga-eth-mac-ecc"
>> +- reg        : Address and size for ECC block registers.
>> +- parent     : phandle to parent (altr,socfpga-stmmac) Ethernet node.
>
> Sorry if I wasn't clear before, but I was suggesting changing 'parent'
> to 'altr,ethernet-mac':
>
> altr,ethernet-mac = <&gmac0>;
>
> Rob
>
Ahh, I see what you're saying.

I used parent as the tag because I have a generic function for 
validating that the parent status is "okay" using the "parent" string in 
my validate_parent_available() function (see below).

I will be submitting other peripheral FIFOs with EDAC protection in 
future patches (USB, DMA, etc).

static int validate_parent_available(struct device_node *np)
{
	struct device_node *parent;
	int ret = 0;

	/* Ensure parent device is enabled if parent node exists */
	parent = of_parse_phandle(np, "parent", 0);
	if (parent && !of_device_is_available(parent))
		ret = -ENODEV;
	of_node_put(parent);
	return ret;
}


I can change this to using a passed in data string but the code won't be 
as straightforward.

Thanks for reviewing,

Thor
