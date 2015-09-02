From: santosh shilimkar <santosh.shilimkar@oracle.com>
Subject: Re: [PATCH] ARM: dts: keystone: use one to one address translations
 under netcp
Date: Wed, 2 Sep 2015 08:50:11 -0700
Message-ID: <55E71AB3.7070406@oracle.com>
References: <1441139324-29296-1-git-send-email-w-kwok2@ti.com>
 <55E61658.9010207@oracle.com>
 <230CBA6E4B6B6B418E8730AC28E6FC7E04221776@DFLE11.ent.ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <230CBA6E4B6B6B418E8730AC28E6FC7E04221776@DFLE11.ent.ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Kwok, WingMan" <w-kwok2@ti.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "ssantosh@kernel.org" <ssantosh@kernel.org>
Cc: "Karicheri, Muralidharan" <m-karicheri2@ti.com>
List-Id: devicetree@vger.kernel.org

On 9/2/2015 8:31 AM, Kwok, WingMan wrote:
>
>
>> -----Original Message-----
>> From: santosh.shilimkar@oracle.com [mailto:santosh.shilimkar@oracle.com]
>> Sent: Tuesday, September 01, 2015 5:19 PM
>> To: Kwok, WingMan; robh+dt@kernel.org; pawel.moll@arm.com;
>> mark.rutland@arm.com; ijc+devicetree@hellion.org.uk; galak@codeaurora.org;
>> linux@arm.linux.org.uk; devicetree@vger.kernel.org; linux-arm-
>> kernel@lists.infradead.org; linux-kernel@vger.kernel.org; ssantosh@kernel.org
>> Cc: Karicheri, Muralidharan
>> Subject: Re: [PATCH] ARM: dts: keystone: use one to one address translations
>> under netcp
>>
>> On 9/1/15 1:28 PM, WingMan Kwok wrote:
>>> Network subsystem NetCP in Keystone-2 devices includes some HW blocks
>>> that are memory mapped to ranges outside that of the NetCP itself.
>>> Thus address space of a child node of the NetCP node needs to be
>>> mapped 1:1 onto the parent address space.  Hence empty ranges
>>> should be used under the NetCP node.
>>>
>>> Signed-off-by: WingMan Kwok <w-kwok2@ti.com>
>>> ---
>>>    arch/arm/boot/dts/k2e-netcp.dtsi  |    8 +++-----
>>>    arch/arm/boot/dts/k2hk-netcp.dtsi |   14 ++++++--------
>>>    arch/arm/boot/dts/k2l-netcp.dtsi  |    8 +++-----
>>>    3 files changed, 12 insertions(+), 18 deletions(-)
>>>
>>> diff --git a/arch/arm/boot/dts/k2e-netcp.dtsi b/arch/arm/boot/dts/k2e-
>> netcp.dtsi
>>> index b13b3c9..e103ed9 100644
>>> --- a/arch/arm/boot/dts/k2e-netcp.dtsi
>>> +++ b/arch/arm/boot/dts/k2e-netcp.dtsi
>>> @@ -111,9 +111,7 @@ netcp: netcp@24000000 {
>>>    	compatible = "ti,netcp-1.0";
>>>    	#address-cells = <1>;
>>>    	#size-cells = <1>;
>>> -
>>> -	/* NetCP address range */
>>> -	ranges = <0 0x24000000 0x1000000>;
>>> +	ranges;
>>>
>> What blocks are we talking here. We need to increase the
>> range if the current range isn't covering entire NETCP
>> address space. Removing range isn't a solution.
>>
>
> The Serdes.  It is a HW block inside the NetCP but its address
> space starts from 0x0232a000.  We can change the base in the
> ranges property to include the serdes.  But then offsets of
> other HW blocks that are within the NetCP address range will be
> relative to this new base and are not as documented in the HW
> user guides.
>
I suspected the same. I know back then we started with SERDES code
with NETCP but as you already know, its a separate block which
is needed for NIC card to work. Its more of phy and hence its
having different address space is not surprising.

IIRC, there was a plan to consolidate the serdes code together
since the PCIE also needs it. Irrespective of that, I suggest
you model the serdes address space in another node and fetch
it from there if that works for you. Please also add DTS
documentation if you are going ahead with that approach.

Regards,
Santosh
