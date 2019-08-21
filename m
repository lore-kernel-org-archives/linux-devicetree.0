From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 08/14] arm64: dts: meson-gxl: fix internal phy compatible
Date: Wed, 21 Aug 2019 16:07:06 +0200
Message-ID: <ba66449e-504c-2937-bc68-1d2b5b03d6b9@baylibre.com>
References: <20190814142918.11636-1-narmstrong@baylibre.com>
 <20190814142918.11636-9-narmstrong@baylibre.com>
 <CAFBinCAyhfk1wq0ejXazTWQ=eNqDROauB_Kbc80+ekPQ7oB9Ww@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAFBinCAyhfk1wq0ejXazTWQ=eNqDROauB_Kbc80+ekPQ7oB9Ww@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, jbrunet@baylibre.com
Cc: khilman@baylibre.com, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 20/08/2019 22:38, Martin Blumenstingl wrote:
> adding Jerome
> 
> On Wed, Aug 14, 2019 at 4:31 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>> This fixes the following DT schemas check errors:
>> meson-gxl-s805x-libretech-ac.dt.yaml: ethernet-phy@8: compatible: ['ethernet-phy-id0181.4400', 'ethernet-phy-ieee802.3-c22'] is not valid under any of the given schemas
>>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>  arch/arm64/boot/dts/amlogic/meson-gxl.dtsi | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
>> index ee1ecdbcc958..43eb158bee24 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
>> @@ -709,7 +709,7 @@
>>                         #size-cells = <0>;
>>
>>                         internal_phy: ethernet-phy@8 {
>> -                               compatible = "ethernet-phy-id0181.4400", "ethernet-phy-ieee802.3-c22";
>> +                               compatible = "ethernet-phy-id0181.4400";
> on G12A there was a specific reason (iirc it was because the PHY ID
> can be any arbitrary value programmed into some register) why we added
> it with a compatible string
> Jerome, do we have the same situation on GXL/GXM as well?

Yes the ID in encoded in the register, but we use the very basic mmio mux, but we should
switch to the same g12a-mdio-mux at some point..

=> infinite TODO list !

Neil

> 
> if not I prefer to drop the compatible string because it's probably
> from a time where the PHY dt-bindings stated "add the PHY ID
> compatible string if you know it" while the actual suggestion was
> "only add it if reading the ID doesn't work for some reason"
> 
> 
> Martin
> 
