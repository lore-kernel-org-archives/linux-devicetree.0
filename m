From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2 2/8] dt-bindings: phy: Add Amlogic G12A USB3+PCIE Combo
 PHY Bindings
Date: Thu, 7 Mar 2019 09:35:08 +0100
Message-ID: <77d8681b-d270-5928-ff67-b58b4813f100@baylibre.com>
References: <20190304103846.2060-1-narmstrong@baylibre.com>
 <20190304103846.2060-3-narmstrong@baylibre.com>
 <CAFBinCCp+bME0fnWRJx0L1E5aazUh1Hw-svsP7+D_QU4dP08nw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAFBinCCp+bME0fnWRJx0L1E5aazUh1Hw-svsP7+D_QU4dP08nw@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: gregkh@linuxfoundation.org, hminas@synopsys.com, balbi@kernel.org, kishon@ti.com, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 05/03/2019 22:42, Martin Blumenstingl wrote:
> Hi Neil,
> 
> On Mon, Mar 4, 2019 at 11:38 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>> Add the Amlogic G12A Family USB3 + PCIE Combo PHY Bindings.
>>
>> This PHY can provide exclusively USB3 or PCIE support on shared I/Os.
>>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>> ---
>>  .../bindings/phy/meson-g12a-usb3-pcie-phy.txt | 22 +++++++++++++++++++
>>  1 file changed, 22 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/phy/meson-g12a-usb3-pcie-phy.txt
>>
>> diff --git a/Documentation/devicetree/bindings/phy/meson-g12a-usb3-pcie-phy.txt b/Documentation/devicetree/bindings/phy/meson-g12a-usb3-pcie-phy.txt
>> new file mode 100644
>> index 000000000000..7cfc17e2df31
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/meson-g12a-usb3-pcie-phy.txt
>> @@ -0,0 +1,22 @@
>> +* Amlogic G12A USB3 + PCIE Combo PHY binding
>> +
>> +Required properties:
>> +- compatible:  Should be "amlogic,meson-g12a-usb3-pcie-phy"
>> +- #phys-cells: must be 1. The cell number is used to select the phy mode
>> +  as defined in <dt-bindings/phy/phy.h> between PHY_TYPE_USB3 and PHY_TYPE_PCIE
>> +- reg:         The base address and length of the registers
>> +- clocks:      a phandle to the 100MHz reference clock of this PHY
>> +- clock-names: must be "ref_clk"
>> +- resets:      phandle to the reset lines for the PHY control
>> +- reset-names: must be "phy"
> one question on the resets:
> - in v1 you had three reset lines: RESET_PCIE_CTRL_A, RESET_PCIE_PHY,
> RESET_PCIE_APB
> - in v2 you only have the "phy" reset line.
> is this because the other two are connected to the PCIe controller
> (Documentation/devicetree/bindings/pci/amlogic,meson-pcie.txt) instead
> of the PHY?

Indeed, it was wrong, only the RESET_PCIE_PHY is needed for the PHY

Neil

> 
> 
> Regards
> Martin
> 
