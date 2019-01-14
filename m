From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 3/7] dt-bindings: net: stmmac: Add the bindings
 documentation for delays
Date: Mon, 14 Jan 2019 15:34:57 -0800
Message-ID: <eb51e1de-5090-b441-ea33-f5e67358f53c@gmail.com>
References: <20190102091729.18582-1-vkoul@kernel.org>
 <20190102091729.18582-4-vkoul@kernel.org> <20190111150104.GA1465@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190111150104.GA1465@bogus>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, netdev@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Niklas Cassel <niklas.cassel@linaro.org>, "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 1/11/19 7:01 AM, Rob Herring wrote:
> On Wed, Jan 02, 2019 at 02:47:25PM +0530, Vinod Koul wrote:
>> Some controllers require that phy delay should be disabled. So add
> 
> If the MAC requires it, then the compatible string should imply this. If 
> it depends on the PHY, then okay.
> 
>> optional properties rx-disable-delay and tx-disable-delay for it.
>>
>> Signed-off-by: Vinod Koul <vkoul@kernel.org>
>> ---
>>  Documentation/devicetree/bindings/net/stmmac.txt | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/net/stmmac.txt b/Documentation/devicetree/bindings/net/stmmac.txt
>> index cb694062afff..ec18897e22c8 100644
>> --- a/Documentation/devicetree/bindings/net/stmmac.txt
>> +++ b/Documentation/devicetree/bindings/net/stmmac.txt
>> @@ -74,6 +74,8 @@ Optional properties:
>>  	- snps,mb: mixed-burst
>>  	- snps,rb: rebuild INCRx Burst
>>  - mdio: with compatible = "snps,dwmac-mdio", create and register mdio bus.
>> +- rx-delay-disable: bool, when present disable the rx delay
>> +- tx-delay-disable: bool, when present disable the tx delay
> 
> Needs a vendor prefix.

Indeed, and it would actually be nicer to allow specifying delays
directly in ps units, see:

Documentation/devicetree/bindings/net/dwmac-sun8i.txt
Documentation/devicetree/bindings/net/mediatek-dwmac.txt

for examples.
-- 
Florian
