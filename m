From: Scott Wood <scott.wood@nxp.com>
Subject: Re: [upstream-release] [PATCH 1/2] drivers: usb: phy: Add qoriq usb
 3.0	phy driver support
Date: Wed, 16 Nov 2016 07:22:09 +0000
Message-ID: <HE1PR0401MB1931C92287A8E92BC6B52B1991BE0@HE1PR0401MB1931.eurprd04.prod.outlook.com>
References: <1479101215-26954-1-git-send-email-sriram.dash@nxp.com>
 <1479101215-26954-2-git-send-email-sriram.dash@nxp.com>
 <DB5PR0401MB1928CA058CC01243457F124791BC0@DB5PR0401MB1928.eurprd04.prod.outlook.com>
 <DB5PR0401MB1925FB1FE45C15B0671E46D1F5BF0@DB5PR0401MB1925.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
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
To: Sriram Dash <sriram.dash@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "felipe.balbi@linux.intel.com" <felipe.balbi@linux.intel.com>, "mathias.nyman@intel.com" <mathias.nyman@intel.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "kishon@ti.com" <kishon@ti.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>, Suresh Gupta <suresh.gupta@nxp.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "pku.leo@gmail.com" <pku.leo@gmail.com>
List-Id: devicetree@vger.kernel.org

On 11/15/2016 06:39 AM, Sriram Dash wrote:
>> From: Scott Wood
>> On 11/13/2016 11:27 PM, Sriram Dash wrote:
>>> diff --git a/Documentation/devicetree/bindings/phy/phy-qoriq-usb3.txt
>>> b/Documentation/devicetree/bindings/phy/phy-qoriq-usb3.txt
>>> new file mode 100644
>>> index 0000000..d934c80
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/phy/phy-qoriq-usb3.txt
>>> @@ -0,0 +1,36 @@
>>> +Driver for Freescale USB 3.0 PHY
>>> +
>>> +Required properties:
>>> +
>>> +- compatible :	fsl,qoriq-usb3-phy
>>
> 
> Hi Scott,
> 
>> This is a very vague compatible.  Are there versioning registers within this register
>> block?
>>
> 
> There are versioning registers for the phy (1.0 and 1.1). But the current erratum
> A008751 does not require the mentioning of the version numbers. Was planning
> to take care of the versioning when there is code diversity on the basis of the
> version number.

That is not how device tree bindings work.  The describe the hardware,
not the driver.

That said, is the block version sufficient to tell whether a given chip
has this erratum?  If so, you don't need a special property for the
erratum.  If not, what is different about the PHY that is not described
by the versioning?

In any case, it would be nice to mention the version register and its
offset in the binding, just so that it becomes part of the definition of
this compatible string, and if we come out with some QorIQ chip with a
USB3 PHY that is totally different and doesn't have that version
register, it'll be clear that it needs a different compatible.

>>> +static inline u32 qoriq_usb3_phy_readl(void __iomem *addr, u32
>>> +offset) {
>>> +	return __raw_readl(addr + offset);
>>> +}
>>> +
>>> +static inline void qoriq_usb3_phy_writel(void __iomem *addr, u32 offset,
>>> +	u32 data)
>>> +{
>>> +	__raw_writel(data, addr + offset);
>>> +}
>>
>> Why raw?  Besides missing barriers, this will cause the accesses to be native-endian
>> which is not correct.
>>
> 
> The only reason for __raw_writel is to make the code faster.

Does that really matter here?

> However, shall I use writel(with both barriers and byte swap) instead 

Yes, if the registers are little-endian on all chips.

> and then make appropriate changes in the value 32'h27672B2A?

Not sure what you mean here.

> In my knowledge, there are more than 5 errata in pipeline,

Then please get all of these errata described in the device tree ASAP
(unless their presence can be reliably inferred from the block version,
as discussed above).

> However, in future, if any other erratum comes up, and it has to be applied
> at any point other than during init, then the variable has to be added in
> qoriq_usb3_phy struct and the property has to be read separately.

Or if the erratum is detected by some means other than a device tree
property...

-Scott
