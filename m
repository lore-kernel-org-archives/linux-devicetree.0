From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH V2 3/3] ARM: dts: db8500: add node property "regulator-compatible"
 regulator node
Date: Tue, 19 Jun 2012 11:32:13 -0600
Message-ID: <4FE0B79D.4090201@wwwdotorg.org>
References: <1340116099-17629-1-git-send-email-ldewangan@nvidia.com> <1340116099-17629-4-git-send-email-ldewangan@nvidia.com> <4FE0A546.1010707@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <4FE0A546.1010707@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Laxman Dewangan <ldewangan@nvidia.com>
Cc: broonie@opensource.wolfsonmicro.com, grant.likely@secretlab.ca, rob.herring@calxeda.com, arnd@arndb.de, linus.walleij@linaro.org, lrg@ti.com, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 06/19/2012 10:13 AM, Lee Jones wrote:
> On 19/06/12 15:28, Laxman Dewangan wrote:
>> Device's regulator matches their hardware counterparts with the
>> property "regulator-compatible" of each child regulator node in
>> place of the child node.
>> Add the property "regulator-compatible" for each regulator with
>> their name.
>>
>> Signed-off-by: Laxman Dewangan<ldewangan@nvidia.com>
>> ---
>> Changes from V1:
>>   - This is new change in V2.
>>
>>   arch/arm/boot/dts/db8500.dtsi |  128
>> +++++++++++++++++++++++++++++++----------
>>   1 files changed, 97 insertions(+), 31 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/db8500.dtsi
>> b/arch/arm/boot/dts/db8500.dtsi
>> index 4ad5160..9548f80 100644
>> --- a/arch/arm/boot/dts/db8500.dtsi
>> +++ b/arch/arm/boot/dts/db8500.dtsi
>> @@ -203,107 +203,149 @@
>>
>>               db8500-prcmu-regulators {
>>                   compatible = "stericsson,db8500-prcmu-regulator";
>> +                #address-cells =<1>;
>> +                #size-cells =<0>;
> 
> Why are these and the reg properties required?

DT nodes should be named after the type of object they describe (e.g.
"regulator") rather than the name of the object they're describing (e.g.
"vape").

Once you've made that change, you end up with many nodes with the same
name in the same parent, so you need to make their names unique. You do
this by adding a "unit address" to each of them - "@0", "@1", ... But,
in order to be "allowed" to use such a unit address, you need a reg
property that matches the unit address, and #address-cells/#size-cells
in the parent node.

>>                   // DB8500_REGULATOR_VAPE
>> -                db8500_vape_reg: db8500_vape {
>> +                db8500_vape_reg: regulator@0 {
>> +                    reg =<0>;

Laxman, you need a space after the = sign for all these added reg
properties, and #address-cells/#size-cells above.

>> +                    regulator-compatible = "db8500_vape";
>>                       regulator-name = "db8500-vape";
>>                       regulator-always-on;
>>                   };
