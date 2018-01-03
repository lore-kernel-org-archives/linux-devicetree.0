From: Phil Elwell <phil@raspberrypi.org>
Subject: Re: [PATCH 4/4] ARM: dts: bcm2837-rpi-3-b: add GPIO expander
Date: Wed, 3 Jan 2018 20:29:08 +0000
Message-ID: <3993684b-5b99-6c38-6247-999f7564762b@raspberrypi.org>
References: <cover.1514898134.git.baruch@tkos.co.il>
 <a29df633ee568e150c150debde66c0783a57c70a.1514898134.git.baruch@tkos.co.il>
 <1524381852.182115.1514919793281@email.1und1.de>
 <804535329.243555.1515010649018@email.1und1.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <804535329.243555.1515010649018@email.1und1.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stefan Wahren <stefan.wahren@i2se.com>, Baruch Siach <baruch@tkos.co.il>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Stefan,

On 03/01/2018 20:17, Stefan Wahren wrote:
> Hi Baruch,
> 
>> Stefan Wahren <stefan.wahren@i2se.com> hat am 2. Januar 2018 um 20:03 geschrieben:
>>
>>
>> Hi Baruch,
>>
>>> Baruch Siach <baruch@tkos.co.il> hat am 2. Januar 2018 um 14:19 geschrieben:
>>
>>> +		expgpio: expgpio {
>>> +			compatible = "brcm,bcm2835-expgpio";
>>> +			gpio-controller;
>>> +			#gpio-cells = <2>;
>>> +			firmware = <&firmware>;
>>
>> Please add the gpio-line-names from Eric's patch [1].
>>
>> Thanks
>> Stefan
>>
>> [1] - https://patchwork.kernel.org/patch/9339857/
>>
> 
> sorry i missed the fact that the same GPIO expander is on the CM3. So please move the exgpio node to bcm2837.dtsi and only define the gpio-line-names in this file.

The GPIO expander is not a part of the BCM2837 SoC, and not all BCM2837-based Pis have a GPIO expander - see the Pi 2+.

Phil
