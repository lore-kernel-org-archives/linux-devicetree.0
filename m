From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 2/8] dt-bindings: phy: Add Amlogic G12A USB3+PCIE Combo
 PHY Bindings
Date: Mon, 18 Feb 2019 11:33:41 +0100
Message-ID: <15bb76c8-16f0-e74d-f3cf-070ce8cf6de2@baylibre.com>
References: <20190212151413.24632-1-narmstrong@baylibre.com>
 <20190212151413.24632-3-narmstrong@baylibre.com>
 <CAFBinCA37waCTqGrMqaLmb5n8XuGJof_7iQsWkBdAYr7s2en=g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAFBinCA37waCTqGrMqaLmb5n8XuGJof_7iQsWkBdAYr7s2en=g@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: gregkh@linuxfoundation.org, hminas@synopsys.com, balbi@kernel.org, kishon@ti.com, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 17/02/2019 23:03, Martin Blumenstingl wrote:
> On Tue, Feb 12, 2019 at 4:15 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>> Add the Amlogic G12A Family USB3 + PCIE Combo PHY Bindings.
>>
>> This PHY can provide exclusively USB3 or PCIE support on shared I/Os.
>>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> one nit-pick below, but apart from that:
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> 
>> ---
>>  .../bindings/phy/meson-g12a-usb3-pcie-phy.txt | 25 +++++++++++++++++++
>>  1 file changed, 25 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/phy/meson-g12a-usb3-pcie-phy.txt
>>
>> diff --git a/Documentation/devicetree/bindings/phy/meson-g12a-usb3-pcie-phy.txt b/Documentation/devicetree/bindings/phy/meson-g12a-usb3-pcie-phy.txt
>> new file mode 100644
>> index 000000000000..714d751091f5
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/meson-g12a-usb3-pcie-phy.txt
>> @@ -0,0 +1,25 @@
>> +* Amlogic G12A USB3 + PCIE Combo PHY binding
>> +
>> +Required properties:
>> +- compatible:  Should be "amlogic,meson-g12a-usb3-pcie-phy"
>> +- #phys-cells: must be 1. The cell number is used to select the phy mode
>> +  as defined in <dt-bindings/phy/phy.h> between PHY_TYPE_USB3 and PHY_TYPE_PCIE
>> +- reg:         The base address and length of the registers
>> +- clocks:      a phandle to the 100MHz reference clock of this PHY
>> +- clock-names: must be "ref_clk"
>> +- resets:      phandle to the reset lines for:
>> +               - the PHY control
>> +               - the USB3+PCIE PHY
>> +               - the PHY registers
> no reset-names (like in the G12A USB2 PHY bindings) here?
> even if you don't use them in the driver I suggest you add them for
> consistency (and maybe to make it easier to compare the bindings with
> the datasheet. I don't have access to the datasheet so I'm not sure if
> having the reset-names is relevant for this case)

You're right, it's better to have names here !

Neil

> 
> 
> Regards
> Martin
> 
