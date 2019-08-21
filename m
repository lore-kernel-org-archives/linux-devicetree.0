From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 12/14] arm64: dts: meson-gxbb-nanopi-k2: add missing model
Date: Wed, 21 Aug 2019 16:08:23 +0200
Message-ID: <48de2cf6-2bce-1a55-b08b-8f95bb8e9b3f@baylibre.com>
References: <20190814142918.11636-1-narmstrong@baylibre.com>
 <20190814142918.11636-13-narmstrong@baylibre.com>
 <CAFBinCCJPm+FjMTK+-Qik4x-UtLibH3FTozHG8gMet0e5Rf9bg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAFBinCCJPm+FjMTK+-Qik4x-UtLibH3FTozHG8gMet0e5Rf9bg@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: khilman@baylibre.com, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 20/08/2019 22:25, Martin Blumenstingl wrote:
> On Wed, Aug 14, 2019 at 4:33 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>> This fixes the following DT schemas check errors:
>> meson-gxbb-nanopi-k2.dt.yaml: /: 'model' is a required property
>>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>  arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
>> index c34c1c90ccb6..1a36d2bd2d21 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
>> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
>> @@ -10,6 +10,7 @@
>>
>>  / {
>>         compatible = "friendlyarm,nanopi-k2", "amlogic,meson-gxbb";
>> +       model = "Nanopi K2";
> this should be "FriendlyARM NanoPi K2" to be consistent with other
> boards (for example meson-gxbb-odroidc2.dts)
> 

Exact, I'll fix it
