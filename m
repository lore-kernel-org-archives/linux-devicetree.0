From: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM64: dts: meson-gxm: Add support for Khadas VIM2
Date: Wed, 20 Sep 2017 10:29:58 +0200
Message-ID: <84171990-f5f2-d7d2-2bf6-d28390daac4a@baylibre.com>
References: <1505832820-3517-1-git-send-email-narmstrong@baylibre.com>
 <1505832820-3517-3-git-send-email-narmstrong@baylibre.com>
 <CAFBinCD0ev5kY_5BY-fZ=fEZ7ZkKi7PdvO4NGAwzVxLEfOT=Dw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAFBinCD0ev5kY_5BY-fZ=fEZ7ZkKi7PdvO4NGAwzVxLEfOT=Dw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Gouwa <gouwa-GEqbEQZgqepWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/19/2017 07:55 PM, Martin Blumenstingl wrote:
> Hi Neil,
> 
> On Tue, Sep 19, 2017 at 4:53 PM, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> wrote:
>> The Khadas VIM2 is a Single Board Computer, respin of the origin
>> Khadas VIM board, using an Amlogic S912 SoC and more server oriented.
>>
>> It provides the same external connectors and header pinout, plus a SPI
>> NOR Flash, a reprogrammable STM8S003 MCU, FPC Connector, Cooling FAN header
>> and Pogo Pads Arrays.
>>
>> Cc: Gouwa <gouwa-GEqbEQZgqepWk0Htik3J/w@public.gmane.org>
>> Signed-off-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/arm/amlogic.txt  |   1 +
>>  arch/arm64/boot/dts/amlogic/Makefile               |   1 +
>>  .../boot/dts/amlogic/meson-gxm-khadas-vim2.dts     | 401 +++++++++++++++++++++
>>  3 files changed, 403 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
>>

[...]

>> +&external_mdio {
>> +       external_phy: ethernet-phy@1 {
>> +               compatible = "ethernet-phy-id001c.c916", "ethernet-phy-ieee802.3-c22";
> could you please remove the compatible property and replace it with a
> comment as explained in [0]?
> 

Ok

>> +               reg = <0>;
>> +               max-speed = <1000>;
>> +       };
>> +};
>> +

[...]

> 
> with that and Jerome's comments fixed:
> Acked-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
> 
> 
> Regards,
> Martin
> 
> 
> [0] http://lists.infradead.org/pipermail/linux-amlogic/2017-September/004729.html
> 

Thanks Martin !

I'll send a v2 when eMMC DTS patches goes in 4.14-rc2.

Neil
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
