From: Jassi Brar <jaswinder.singh@linaro.org>
Subject: Re: [PATCHv2 1/3] dt-bindings: net: Add DT bindings for Socionext Netsec
Date: Wed, 20 Dec 2017 13:36:03 +0530
Message-ID: <CAJe_ZhdAWp2rTjw+83J7sgzjVXZgAMb3tPjcBtfopEzDn5dBhQ@mail.gmail.com>
References: <1513098873-20977-1-git-send-email-jassisinghbrar@gmail.com>
 <1513098921-21042-1-git-send-email-jassisinghbrar@gmail.com> <20171212203752.GB1523@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20171212203752.GB1523@lunn.ch>
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, netdev@vger.kernel.org, Devicetree List <devicetree@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>, Arnd Bergmann <arnd.bergmann@linaro.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On 13 December 2017 at 02:07, Andrew Lunn <andrew@lunn.ch> wrote:
> On Tue, Dec 12, 2017 at 10:45:21PM +0530, jassisinghbrar@gmail.com wrote:
>> From: Jassi Brar <jassisinghbrar@gmail.com>
>>
>> This patch adds documentation for Device-Tree bindings for the
>> Socionext NetSec Controller driver.
>>
>> Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
>> Signed-off-by: Jassi Brar <jaswinder.singh@linaro.org>
>> ---
>>  .../devicetree/bindings/net/socionext-netsec.txt   | 43 ++++++++++++++++++++++
>>  1 file changed, 43 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/net/socionext-netsec.txt
>>
>> diff --git a/Documentation/devicetree/bindings/net/socionext-netsec.txt b/Documentation/devicetree/bindings/net/socionext-netsec.txt
>> new file mode 100644
>> index 0000000..4695969
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/net/socionext-netsec.txt
>> @@ -0,0 +1,45 @@
>> +* Socionext NetSec Ethernet Controller IP
>> +
>> +Required properties:
>> +- compatible: Should be "socionext,synquacer-netsec"
>> +- reg: Address and length of the control register area, followed by the
>> +       address and length of the EEPROM holding the MAC address and
>> +       microengine firmware
>> +- interrupts: Should contain ethernet controller interrupt
>> +- clocks: phandle to the PHY reference clock, and any other clocks to be
>> +          switched by runtime_pm
>> +- clock-names: Required only if more than a single clock is listed in 'clocks'.
>> +               The PHY reference clock must be named 'phy_refclk'
>> +- phy-mode: See ethernet.txt file in the same directory
>> +- phy-handle: phandle to select child phy
>> +
>> +Optional properties: (See ethernet.txt file in the same directory)
>> +- dma-coherent: Boolean property, must only be present if memory
>> +              accesses performed by the device are cache coherent
>> +- local-mac-address
>> +- mac-address
>> +- max-speed
>> +- max-frame-size
>> +
>> +Required properties for the child phy:
>> +- reg: phy address
>
> Hi Jassi
>
> Just reference phy.txt
>
>> +
>> +Example:
>> +     eth0: netsec@522D0000 {
>> +             compatible = "socionext,synquacer-netsec";
>> +             reg = <0 0x522D0000 0x0 0x10000>, <0 0x10000000 0x0 0x10000>;
>> +             interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
>> +             clocks = <&clk_netsec>;
>> +             phy-mode = "rgmii";
>> +             max-speed = <1000>;
>> +             max-frame-size = <9000>;
>> +             phy-handle = <&ethphy0>;
>> +
>> +             #address-cells = <1>;
>> +             #size-cells = <0>;
>> +
>
> Please add an mdio node here, and list all the phys and possibly
> Ethernet switches as children of it.
>
OK.  Though in order to avoid breaking dtbs in the wild already, the
driver falls back on using the parent node if no mdio subnode is
found.

Thank you.
