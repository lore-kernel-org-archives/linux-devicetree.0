From: Chris Zhong <zyw@rock-chips.com>
Subject: Re: [PATCH] ARM: dts: cros-ec-keyboard: Add support for some Japanese
 keys
Date: Wed, 06 May 2015 08:59:13 +0800
Message-ID: <55496761.7040509@rock-chips.com>
References: <1430791657-28014-1-git-send-email-zyw@rock-chips.com> <CAD=FV=VW0s=PHUvATPC_XRPFh=49RcSYxUP56B4KRXDM6F4mnQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAD=FV=VW0s=PHUvATPC_XRPFh=49RcSYxUP56B4KRXDM6F4mnQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>
Cc: Dmitry Torokhov <dtor@chromium.org>, Sonny Rao <sonnyrao@chromium.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org



On 05/06/2015 02:10 AM, Doug Anderson wrote:
> Chris,
>
> On Mon, May 4, 2015 at 7:07 PM, Chris Zhong <zyw@rock-chips.com> wrote:
>> Add support for 4 Japanese keys
>>
>> Signed-off-by: Chris Zhong <zyw@rock-chips.com>
>>
>> ---
>>
>>   arch/arm/boot/dts/cros-ec-keyboard.dtsi | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/cros-ec-keyboard.dtsi b/arch/arm/boot/dts/cros-ec-keyboard.dtsi
>> index 9c7fb0a..4e42f30c 100644
>> --- a/arch/arm/boot/dts/cros-ec-keyboard.dtsi
>> +++ b/arch/arm/boot/dts/cros-ec-keyboard.dtsi
>> @@ -22,6 +22,7 @@
>>                          MATRIX_KEY(0x00, 0x02, KEY_F1)
>>                          MATRIX_KEY(0x00, 0x03, KEY_B)
>>                          MATRIX_KEY(0x00, 0x04, KEY_F10)
>> +                       MATRIX_KEY(0x00, 0x05, KEY_RO)
>>                          MATRIX_KEY(0x00, 0x06, KEY_N)
>>                          MATRIX_KEY(0x00, 0x08, KEY_EQUAL)
>>                          MATRIX_KEY(0x00, 0x0a, KEY_RIGHTALT)
>> @@ -34,6 +35,7 @@
>>                          MATRIX_KEY(0x01, 0x08, KEY_APOSTROPHE)
>>                          MATRIX_KEY(0x01, 0x09, KEY_F9)
>>                          MATRIX_KEY(0x01, 0x0b, KEY_BACKSPACE)
>> +                       MATRIX_KEY(0x01, 0x0c, KEY_HENKAN)
>>
>>                          MATRIX_KEY(0x02, 0x00, KEY_LEFTCTRL)
>>                          MATRIX_KEY(0x02, 0x01, KEY_TAB)
>> @@ -45,6 +47,7 @@
>>                          MATRIX_KEY(0x02, 0x07, KEY_102ND)
>>                          MATRIX_KEY(0x02, 0x08, KEY_LEFTBRACE)
>>                          MATRIX_KEY(0x02, 0x09, KEY_F8)
>> +                       MATRIX_KEY(0x02, 0x0a, KEY_YEN)
>>
>>                          MATRIX_KEY(0x03, 0x01, KEY_GRAVE)
>>                          MATRIX_KEY(0x03, 0x02, KEY_F2)
>> @@ -53,6 +56,7 @@
>>                          MATRIX_KEY(0x03, 0x06, KEY_6)
>>                          MATRIX_KEY(0x03, 0x08, KEY_MINUS)
>>                          MATRIX_KEY(0x03, 0x0b, KEY_BACKSLASH)
>> +                       MATRIX_KEY(0x03, 0x0c, KEY_MUHENKAN)
>>
>>                          MATRIX_KEY(0x04, 0x00, KEY_RIGHTCTRL)
>>                          MATRIX_KEY(0x04, 0x01, KEY_A)
> Since there's no clear architecture here, I'd bet Olof would be the
> one to take this.  I added him to this email, but he might request
> that you resend the patch with him in the "To:" line.
>
> Other than that:
>
> Reviewed-by: Doug Anderson <dianders@chromium.org>
>
Thank you, I'll resend the patch with Olof.
>
