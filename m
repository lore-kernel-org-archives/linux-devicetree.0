From: guillaume La Roque <glaroque@baylibre.com>
Subject: Re: [PATCH v3 5/6] pinctrl: meson: add support of
 drive-strength-microamp
Date: Thu, 9 May 2019 13:23:34 +0200
Message-ID: <4e44984f-eb76-87d1-e458-506bcccf1500@baylibre.com>
References: <20190507115726.23714-1-glaroque@baylibre.com>
 <20190507115726.23714-6-glaroque@baylibre.com>
 <CAFBinCC-wYD1ZJ8Dd6mwd=qAqi8YX0=VacjbEc-bxKrQnZvwDA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAFBinCC-wYD1ZJ8Dd6mwd=qAqi8YX0=VacjbEc-bxKrQnZvwDA@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, khilman@baylibre.com, linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

hi martin,


thanks for review, i will do a new series to remove err log on get_drive_strength

and integrate your comment


On 5/7/19 8:18 PM, Martin Blumenstingl wrote:
> On Tue, May 7, 2019 at 1:57 PM Guillaume La Roque <glaroque@baylibre.com> wrote:
>> drive-strength-microamp is a new feature needed for G12A SoC.
>> the default DS setting after boot is usually 500uA and it is not enough for
>> many functions. We need to be able to set the drive strength to reliably
>> enable things like MMC, I2C, etc ...
>>
>> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> with the comments below addressed:
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>
>> ---
>>  drivers/pinctrl/meson/pinctrl-meson.c | 102 ++++++++++++++++++++++++++
>>  drivers/pinctrl/meson/pinctrl-meson.h |  18 ++++-
>>  2 files changed, 119 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
>> index a216a7537564..3da867c13f47 100644
>> --- a/drivers/pinctrl/meson/pinctrl-meson.c
>> +++ b/drivers/pinctrl/meson/pinctrl-meson.c
>> @@ -219,12 +219,56 @@ static int meson_pinconf_enable_bias(struct meson_pinctrl *pc, unsigned int pin,
>>         return 0;
>>  }
>>
>> +static int meson_pinconf_set_drive_strength(struct meson_pinctrl *pc,
>> +                                           unsigned int pin,
>> +                                           u16 drive_strength_ua)
>> +{
>> +       struct meson_bank *bank;
>> +       unsigned int reg, bit;
>> +       unsigned int ds_val;
> you can move ds_val to the line above
>
> [...]
>> +       if (!pc->reg_ds) {
>> +               dev_err(pc->dev, "drive-strength not supported\n");
> I'm getting this on one of my Meson8m2 boards:
> $ # cat /sys/kernel/debug/pinctrl/c1109880.pinctrl-pinctrl-meson/pinconf-pins
> ...
> [  874.748531] meson8-pinctrl c1109880.pinctrl: drive-strength not supported
> [  874.755278] meson8-pinctrl c1109880.pinctrl: drive-strength not supported
> [  874.762086] meson8-pinctrl c1109880.pinctrl: drive-strength not supported
> Pin config settings per pin
> Format: pin (name): configs
> pin 0 (GPIOX_0): input bias disabled
> pin 1 (GPIOX_1): input bias disabled
> pin 2 (GPIOX_2): input bias disabled
> ...
>
> I believe we are not supposed to complain when getting the
> drive-strength when reg_ds is absent.
> all pre-G12A SoCs don't have reg_ds, so we don't need to error-out in
> that case (because that's perfectly valid)
>
> [...]
>> +static int meson_pinconf_get_drive_strength(struct meson_pinctrl *pc,
>> +                                           unsigned int pin,
>> +                                           u16 *drive_strength_ua)
>> +{
>> +       struct meson_bank *bank;
>> +       unsigned int reg, bit;
>> +       unsigned int val;
>> +       int ret;
>> +
>> +       if (!pc->reg_ds) {
>> +               dev_err(pc->dev, "drive-strength not supported\n");
> based on your previous explanation (that you want to inform the .dts
> author that he's doing something wrong) I'm happy with this error if
> Linus W. doesn't veto this.
>
>
> Regards
> Martin


Guillaume
