From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 1/6] dt-bindings: pci: amlogic,meson-pcie: Add G12A
 bindings
Date: Wed, 11 Sep 2019 14:30:43 +0200
Message-ID: <62994535-1617-9f71-4059-b8c4da8ecbd1@baylibre.com>
References: <1567950178-4466-1-git-send-email-narmstrong@baylibre.com>
 <1567950178-4466-2-git-send-email-narmstrong@baylibre.com>
 <20190911122250.GT9720@e119886-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190911122250.GT9720@e119886-lin.cambridge.arm.com>
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
To: Andrew Murray <andrew.murray@arm.com>
Cc: devicetree@vger.kernel.org, lorenzo.pieralisi@arm.com, khilman@baylibre.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, kishon@ti.com, repk@triplefau.lt, maz@kernel.org, bhelgaas@google.com, linux-amlogic@lists.infradead.org, yue.wang@Amlogic.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Andrew,

On 11/09/2019 14:22, Andrew Murray wrote:
> On Sun, Sep 08, 2019 at 01:42:53PM +0000, Neil Armstrong wrote:
>> Add PCIE bindings for the Amlogic G12A SoC, the support is the same
>> but the PHY is shared with USB3 to control the differential lines.
>>
>> Thus this adds a phy phandle to control the PHY, and sets invalid
>> MIPI clock as optional for G12A.
> 
> Perhaps reword to "Thus this adds a phy phandle to control the PHY,
> and only requires a MIPI clock for AXG SoC Family".

Sure, thanks,
Neil

> 
> Thanks,
> 
> Andrew Murray
> 
>>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>  .../devicetree/bindings/pci/amlogic,meson-pcie.txt   | 12 ++++++++----
>>  1 file changed, 8 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/pci/amlogic,meson-pcie.txt b/Documentation/devicetree/bindings/pci/amlogic,meson-pcie.txt
>> index efa2c8b9b85a..84fdc422792e 100644
>> --- a/Documentation/devicetree/bindings/pci/amlogic,meson-pcie.txt
>> +++ b/Documentation/devicetree/bindings/pci/amlogic,meson-pcie.txt
>> @@ -9,13 +9,16 @@ Additional properties are described here:
>>  
>>  Required properties:
>>  - compatible:
>> -	should contain "amlogic,axg-pcie" to identify the core.
>> +	should contain :
>> +	- "amlogic,axg-pcie" for AXG SoC Family
>> +	- "amlogic,g12a-pcie" for G12A SoC Family
>> +	to identify the core.
>>  - reg:
>>  	should contain the configuration address space.
>>  - reg-names: Must be
>>  	- "elbi"	External local bus interface registers
>>  	- "cfg"		Meson specific registers
>> -	- "phy"		Meson PCIE PHY registers
>> +	- "phy"		Meson PCIE PHY registers for AXG SoC Family
>>  	- "config"	PCIe configuration space
>>  - reset-gpios: The GPIO to generate PCIe PERST# assert and deassert signal.
>>  - clocks: Must contain an entry for each entry in clock-names.
>> @@ -23,12 +26,13 @@ Required properties:
>>  	- "pclk"       PCIe GEN 100M PLL clock
>>  	- "port"       PCIe_x(A or B) RC clock gate
>>  	- "general"    PCIe Phy clock
>> -	- "mipi"       PCIe_x(A or B) 100M ref clock gate
>> +	- "mipi"       PCIe_x(A or B) 100M ref clock gate for AXG SoC Family
>>  - resets: phandle to the reset lines.
>>  - reset-names: must contain "phy" "port" and "apb"
>> -       - "phy"         Share PHY reset
>> +       - "phy"         Share PHY reset for AXG SoC Family
>>         - "port"        Port A or B reset
>>         - "apb"         Share APB reset
>> +- phys: should contain a phandle to the shared phy for G12A SoC Family
>>  - device_type:
>>  	should be "pci". As specified in designware-pcie.txt
>>  
>> -- 
>> 2.17.1
>>
