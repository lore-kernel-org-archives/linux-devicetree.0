From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v3 5/7] ARM: brcmstb: add misc. DT bindings for brcm,brcmstb-*
Date: Wed, 15 Jan 2014 09:55:18 -0800
Message-ID: <CAGVrzcapAVg7rb+vGGz_yB6fE8v=CEY-z-LFX=R0iMtrqYA3WQ@mail.gmail.com>
References: <1389743333-16741-1-git-send-email-marc.ceeeee@gmail.com>
 <1389743333-16741-6-git-send-email-marc.ceeeee@gmail.com> <20140115171155.GK25824@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140115171155.GK25824@e106331-lin.cambridge.arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Marc Carino <marc.ceeeee@gmail.com>, Christian Daudt <bcm@fixthebug.org>, Arnd Bergmann <arnd@arndb.de>, Matt Porter <matt.porter@linaro.org>, Russell King <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

2014/1/15 Mark Rutland <mark.rutland@arm.com>:
> On Tue, Jan 14, 2014 at 11:48:51PM +0000, Marc Carino wrote:
>> Document the bindings that the Broadcom STB platform needs
>> for proper bootup.
>>
>> Signed-off-by: Marc Carino <marc.ceeeee@gmail.com>
>> Acked-by: Florian Fainelli <f.fainelli@gmail.com>
>> ---
>>  .../devicetree/bindings/arm/brcm-brcmstb.txt       |   43 ++++++++++++++++++++
>>  1 files changed, 43 insertions(+), 0 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/arm/brcm-brcmstb.txt
>>
>> diff --git a/Documentation/devicetree/bindings/arm/brcm-brcmstb.txt b/Documentation/devicetree/bindings/arm/brcm-brcmstb.txt
>> new file mode 100644
>> index 0000000..5f1aba7
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/brcm-brcmstb.txt
>> @@ -0,0 +1,43 @@
>> +Broadcom STB platforms Device Tree Bindings
>> +-------------------------------------------
>> +Boards with Broadcom Brahma15 ARM-based BCM7xxx SoC shall have the following
>> +properties.
>> +
>> +Required root node properties:
>> +
>> +    - compatible = "brcm,brcmstb-<chip_id>";
>
> I'd prefer it if variants were listed explicitly (as it makes it far
> easier to grep for). Something like:
>
> - compatible: should contain one of:
>   * "brcm,brcmsrb-7445"
>   * "brcm,brcmsrb-7446"

For consistency with other Broadcom SoCs in mainline, as well as
making it easier to grep for products, I would be inclined to use:

compatible = "brcm,bcm7445", with the fallback compatible string "brcm,brcmstb".
-- 
Florian
