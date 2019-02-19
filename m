From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH 3/8] dt-bindings: net: bluetooth: Add rtl8723bs-bluetooth
Date: Tue, 19 Feb 2019 09:56:47 +0100
Message-ID: <6a61bca4-c458-6d98-68e6-ef49b191019c@i2se.com>
References: <20190118170232.16142-1-anarsoul@gmail.com>
 <20190118170232.16142-4-anarsoul@gmail.com> <20190218211035.GA28145@bogus>
 <CA+E=qVdq5GORg-t-vVXM3zBxy3Aq93iCE+zmcGgLFBMcnTDgfw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <CA+E=qVdq5GORg-t-vVXM3zBxy3Aq93iCE+zmcGgLFBMcnTDgfw@mail.gmail.com>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Vasily Khoruzhick <anarsoul@gmail.com>, Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Johan Hedberg <johan.hedberg@gmail.com>, Maxime Ripard <maxime.ripard@bootlin.com>, netdev@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>, linux-bluetooth@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, "David S. Miller" <davem@davemloft.net>, arm-linux <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Vasily,

Am 18.02.19 um 22:24 schrieb Vasily Khoruzhick:
> On Mon, Feb 18, 2019 at 1:10 PM Rob Herring <robh@kernel.org> wrote:
>> On Fri, Jan 18, 2019 at 09:02:27AM -0800, Vasily Khoruzhick wrote:
>>> Add binding document for bluetooth part of RTL8723BS/RTL8723CS
>>>
>>> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
>>> ---
>>>  .../bindings/net/rtl8723bs-bluetooth.txt      | 35 +++++++++++++++++++
>>>  1 file changed, 35 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/net/rtl8723bs-bluetooth.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/net/rtl8723bs-bluetooth.txt b/Documentation/devicetree/bindings/net/rtl8723bs-bluetooth.txt
>>> new file mode 100644
>>> index 000000000000..8357f242ae4c
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/net/rtl8723bs-bluetooth.txt
>>> @@ -0,0 +1,35 @@
>>> +RTL8723BS/RTL8723CS Bluetooth
>>> +---------------------
>>> +
>>> +RTL8723CS/RTL8723CS is WiFi + BT chip. WiFi part is connected over SDIO, while
>>> +BT is connected over serial. It speaks H5 protocol with few extra commands
>>> +to upload firmware and change module speed.
>>> +
>>> +Required properties:
>>> +
>>> + - compatible: should be one of the following:
>>> +   * "realtek,rtl8723bs-bt"
>>> +   * "realtek,rtl8723cs-bt"
>>> +Optional properties:
>>> +
>>> + - device-wake-gpios: GPIO specifier, used to wakeup the BT module (active high)
>>> + - enable-gpios: GPIO specifier, used to enable the BT module (active high)
>>> + - host-wake-gpios: GPIO specifier, used to wakeup the host processor (active high)
>>> + - firmware-postfix: firmware postfix to be used for firmware config
>> How is this used?
> rtl8723bs-bt needs 2 firmware binaries -- one is actual firmware,
> another is firmware config which is specific to the board. If
> firmware-postfix is specified, driver appends it to the name of config
> and requests board-specific config while loading firmware. I.e. if
> 'pine64' is specified as firmware-postfix driver will load
> rtl8723bs_config-pine64.bin.

this is a common problem (e.g. brcmfmac has the same problem [1]).

Why not using the "model" property instead of inventing a new software
specific property?

[1] - https://patchwork.kernel.org/patch/10764463/

>
>> Rob
>>
> _
