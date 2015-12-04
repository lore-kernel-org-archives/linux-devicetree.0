From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v8 2/2] arm64: dts: mt8173: Add nor flash node
Date: Fri, 4 Dec 2015 17:22:39 +0100
Message-ID: <5661BDCF.9020105@gmail.com>
References: <1447817403-16631-1-git-send-email-bayi.cheng@mediatek.com>
 <1447817403-16631-3-git-send-email-bayi.cheng@mediatek.com>
 <CAGS+omBVfc=BPLoobOJSDPnbv97PnGsRxUTF1gbXEz4DeufbmQ@mail.gmail.com>
 <1448505773.9118.19.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1448505773.9118.19.camel@mhfsdcap03>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: bayi cheng <bayi.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, srv_heupstream <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, jteki-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 26/11/15 03:42, bayi cheng wrote:
> On Thu, 2015-11-26 at 09:20 +0800, Daniel Kurtz wrote:
>> Hi Bayi, Matthias,
>>
>> Sorry for the late review, one comment below...
>>
>> On Wed, Nov 18, 2015 at 11:30 AM, Bayi Cheng <bayi.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
>>> Add Mediatek nor flash node
>>>
>>> Signed-off-by: Bayi Cheng <bayi.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
>>> Acked-by: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>> ---
>>>   arch/arm64/boot/dts/mediatek/mt8173.dtsi | 18 +++++++++++++++++-
>>>   1 file changed, 17 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
>>> index 4dd5f93..7988656 100644
>>> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
>>> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
>>> @@ -387,7 +387,23 @@
>>>                          status = "disabled";
>>>                  };
>>>
>>> -               i2c3: i2c@11010000 {
>>> +               nor_flash: spi@1100d000 {
>>> +                       compatible = "mediatek,mt8173-nor";
>>> +                       reg = <0 0x1100d000 0 0xe0>;
>>> +                       clocks = <&pericfg CLK_PERI_SPI>,
>>> +                                <&topckgen CLK_TOP_SPINFI_IFR_SEL>;
>>> +                       clock-names = "spi", "sf";
>>> +                       #address-cells = <1>;
>>> +                       #size-cells = <0>;
>>> +                       status = "disabled";
>>> +
>>> +                       flash@0 {
>>> +                               compatible = "jedec,spi-nor";
>>> +                               reg = <0>;
>>> +                       };
>>
>> I think this flash@0 node represents the flash device present on the
>> board and should therefore be moved to the board-specific .dts.
>>
>> -Dan
>>

Good catch, thanks.

> Hi Daniel, Thanks for your comments, and I will fixed it in the next
> patch.

Ok, I dropped your patch in the meanwhile.

Regards,
Matthias

>>> +               };
>>> +
>>> +               i2c3: i2c3@11010000 {
>>>                          compatible = "mediatek,mt8173-i2c";
>>>                          reg = <0 0x11010000 0 0x70>,
>>>                                <0 0x11000280 0 0x80>;
>>> --
>>> 1.8.1.1.dirty
>>>
>
>
