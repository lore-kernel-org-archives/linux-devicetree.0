From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 0/3] Mediatek EFUSE Support
Date: Mon, 14 Dec 2015 10:07:06 +0000
Message-ID: <566E94CA.1050700@linaro.org>
References: <1447930014-19579-1-git-send-email-andrew-ct.chen@mediatek.com> <CAGS+omA8XK6ksd7Ma8yAUbkSsHR6yQxjFrV+HGbd83UiH6T51g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGS+omA8XK6ksd7Ma8yAUbkSsHR6yQxjFrV+HGbd83UiH6T51g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Kurtz <djkurtz@chromium.org>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Matthias Brugger <matthias.bgg@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, srv_heupstream <srv_heupstream@mediatek.com>
List-Id: devicetree@vger.kernel.org

Hi Andrew,

On 14/12/15 04:27, Daniel Kurtz wrote:
> Hi Srinivas,
>
> On Thu, Nov 19, 2015 at 6:46 PM, Andrew-CT Chen
> <andrew-ct.chen@mediatek.com> wrote:
>> This patch adds EFUSE support driver which is used by other drivers
>> like thermal sensor and HDMI impedance.
>>
>> There are some efuses these fuses store things like calibration data,
>> speed bins.. etc. Drivers like thermal sensor, HDMI impedance would
>> read out this data for configuring the driver.
>>
>> Change in v2:
>> 1. Rebase to 4.4-rc1
>> 2. Modify the driver Makefile for more consistent with other drivers
>> 3. Modify the compatible string to "mediatek,mt8173-efuse" and "mediatek,efuse"
>
> Do you still plan to queue this for v4.5?
>
Sorry guys, for the long delay in replying your pings, got busy with 
regular office stuff :-)

Yes, It should go in v4.5, I did send request with my sign-off to Greg,
he should take it via char-misc tree.

Thanks,
srini
>>
>> Andrew-CT Chen (3):
>>    dt-bindings: add document of mediatek efuse driver
>>    nvmem: mediatek: Add Mediatek EFUSE driver
>>    dts: arm64: Add EFUSE device node
>>
>>   .../devicetree/bindings/nvmem/mtk-efuse.txt        | 36 +++++++++
>>   arch/arm64/boot/dts/mediatek/mt8173.dtsi           |  5 ++
>>   drivers/nvmem/Kconfig                              | 11 +++
>>   drivers/nvmem/Makefile                             |  2 +
>>   drivers/nvmem/mtk-efuse.c                          | 89 ++++++++++++++++++++++
>>   5 files changed, 143 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
>>   create mode 100644 drivers/nvmem/mtk-efuse.c
>>
>> --
>> 1.9.1
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>> Please read the FAQ at  http://www.tux.org/lkml/
