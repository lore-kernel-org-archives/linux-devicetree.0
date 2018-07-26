From: Arun Parameswaran <arun.parameswaran@broadcom.com>
Subject: Re: [PATCH 1/7] dt-bindings: net: Fix Broadcom iProc mdio mux driver
 base address
Date: Thu, 26 Jul 2018 12:15:20 -0700
Message-ID: <35baf11b-0663-e221-5183-51c664a38e57@broadcom.com>
References: <1532630184-29450-1-git-send-email-arun.parameswaran@broadcom.com>
 <1532630184-29450-2-git-send-email-arun.parameswaran@broadcom.com>
 <20180726190103.GF10686@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180726190103.GF10686@lunn.ch>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

Hi Andrew

On 18-07-26 12:01 PM, Andrew Lunn wrote:
> On Thu, Jul 26, 2018 at 11:36:18AM -0700, Arun Parameswaran wrote:
>> Modify the base address passed to the Broadcom iProc MDIO mux driver
>> to point to the start of the block's register address space.
>>
>> Fixes: ce8d5dbfd64f ("Add DT binding doc for Broadcom MDIO bus multiplexer")
> 
> Hi Arun
> 
> Fixes generally means something explodes, throws an Opps, userspace
> does the wrong thing. Documentation/process/stable-kernel-rules.rst
> says:
> 
>  - It must fix a real bug that bothers people (not a, "This could be a
>    problem..." type thing).
> 
> Please explain how this is a real problem and what people it bothers.
> 
It is only relevant when we need to modify the registers which are not
currently accessible.

I will remove the 'fixes' and use the 'net-next' repo for the change
set.

> I also don't see any attempt to keep backwards compatibility with
> older device tree blobs. Is it intentional you will break such old
> blobs?
> 
I will modify the patch to keep backward compatibility like you
suggested in the other patch.

Thanks
Arun

> Thanks
> 	Andrew
> 
> 
>> Signed-off-by: Arun Parameswaran <arun.parameswaran@broadcom.com>
>> ---
>>  Documentation/devicetree/bindings/net/brcm,mdio-mux-iproc.txt | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/net/brcm,mdio-mux-iproc.txt b/Documentation/devicetree/bindings/net/brcm,mdio-mux-iproc.txt
>> index dfe287a..dc8aa68 100644
>> --- a/Documentation/devicetree/bindings/net/brcm,mdio-mux-iproc.txt
>> +++ b/Documentation/devicetree/bindings/net/brcm,mdio-mux-iproc.txt
>> @@ -18,9 +18,9 @@ at- Documentation/devicetree/bindings/net/mdio-mux.txt
>>  
>>  
>>  for example:
>> -		mdio_mux_iproc: mdio-mux@6602023c {
>> +		mdio_mux_iproc: mdio-mux@66020000 {
>>  			compatible = "brcm,mdio-mux-iproc";
>> -			reg = <0x6602023c 0x14>;
>> +			reg = <0x66020000 0x250>;
>>  			#address-cells = <1>;
>>  			#size-cells = <0>;
>>  
>> -- 
>> 1.9.1
>>
