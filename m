From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v2 4/4] pinctrl: meson: add support of drive-strength-uA
Date: Tue, 30 Apr 2019 22:28:21 +0200
Message-ID: <CAFBinCBemJT5p7F0b3Qy+wwmaW4hTgs0jgKrLVd1ciugCGc48w@mail.gmail.com>
References: <20190418124758.24022-1-glaroque@baylibre.com> <20190418124758.24022-5-glaroque@baylibre.com>
 <CAFBinCDNz1txJ7_aQU8MwjpeVFC6BgyG_gkg-jJRnnerSjbP9A@mail.gmail.com> <163fa4df-1017-d230-b264-51ea71236df9@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <163fa4df-1017-d230-b264-51ea71236df9@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: guillaume La Roque <glaroque@baylibre.com>
Cc: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, khilman@baylibre.com, linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Guillaume,

On Tue, Apr 30, 2019 at 9:20 AM guillaume La Roque
<glaroque@baylibre.com> wrote:
>
> Hi Martin,
>
>
> thanks for your feedback.
>
>
> On 4/27/19 9:44 PM, Martin Blumenstingl wrote:
> > Hi Guillaume,
> >
> > On Thu, Apr 18, 2019 at 2:48 PM Guillaume La Roque
> > <glaroque@baylibre.com> wrote:
> >> drive-strength-uA is a new feature needed for G12A SoC.
> >> the default DS setting after boot is usually 500uA and it is not enough for
> >> many functions. We need to be able to set the drive strength to reliably
> >> enable things like MMC, I2C, etc ...
> >>
> >> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> > I gave this a go on Meson8m2 (meaning I applied all four patches from
> > this series and booted the result on my board):
> > [Meson8m2 doesn't support drive strength and still boots without any
> > crashes or obvious regressions]
> > Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> >
> >> ---
> >>  drivers/pinctrl/meson/pinctrl-meson-g12a.c |  36 ++---
> >>  drivers/pinctrl/meson/pinctrl-meson.c      | 166 ++++++++++++++++-----
> >>  drivers/pinctrl/meson/pinctrl-meson.h      |  20 ++-
> > personally I would have split this into two separate patches:
> > - one for the generic pinctrl-meson part which adds drive-strength-uA support
> > - another patch for enabling this on G12A
> >
> > if nobody else wants you to split this then it's fine for me as well
>
>
> why not if i send new series i will do.
great, thank you

[...]
> > additionally the function arguments are not consistent with
> > meson_pinconf_get_drive_strength():
> > - here you pass the pinctrl subsystem specific parameters (enum
> > pin_config_param conf)
> > - in meson_pinconf_get_drive_strength the conversion for pinctrl
> > subsystem specific values (pinconf_to_config_argument) is part of
> > meson_pinconf_set
>
>
> for param i'm not sure i understand what you want, if you talk about difference between set_bias and set_drive arg , it's difficult to align it.
>
> if it's about diff between get_bias and get_drive i think i can return drive stength value instead of using an u16 arg input param.
let me use an example to better explain what I mean.

meson_pinconf_set(struct pinctrl_dev *pcdev, unsigned int pin,
unsigned long *configs, unsigned num_configs)
-> this uses parameters from the pinctrl subsystem only (struct
pinctrl_dev, configs/pinconf_to_config_argument)

meson_pinconf_get_pull(struct meson_pinctrl *pc, unsigned int pin)
meson_pinconf_set_drive_strength(struct meson_pinctrl *pc, unsigned
int pin, u16 drive_strength_ua)
-> these use hardware-specific parameters only (struct meson_pinctrl,
[drive strength in uA])

meson_pinconf_set_bias(struct meson_pinctrl *pc, unsigned int pin,
enum pin_config_param conf)
-> this mixes hardware-specific parameters (struct meson_pinctrl) with
parameters from the pinctrl subsystem (enum pin_config_param conf)

> > I'm wondering whether two separate functions
> > (meson_pinconf_disable_bias and meson_pinconf_enable_bias) would make
> > things easier to read. I haven't tried whether this would really make
> > things better, so I'd like to hear your opinion on this Guillaume!
>
>
> no special opinion on this, if you think it's better for understanding i can separate  set_bias function.
this goes with the mixed parameters from my previous comment: if we
stick to the way these "private" functions are defined the "set bias"
function parameters should be hardware/driver specific (in other
words: don't use enum pin_config_param conf)
so my initial idea was to keep the switch/case for enum
pin_config_param in meson_pinconf_set and to have these function
declarations:
- meson_pinconf_disable_bias(struct meson_pinctrl *pc, unsigned int pin)
- meson_pinconf_enable_bias(struct meson_pinctrl *pc, unsigned int
pin, bool pull_up)

and to make it clear: I haven't tested whether this *really* looks
better when fully implemented.
let me know what you think - I'm happy with anything that others will
understand in the end (to make easy to catch potential breakage in a
code-review ;))

>
> >
> > [...]
> >> +static int meson_pinconf_set_drive_strength(struct meson_pinctrl *pc,
> >> +                                           unsigned int pin, u16 arg)
> >>  {
> >> -       struct meson_pinctrl *pc = pinctrl_dev_get_drvdata(pcdev);
> >>         struct meson_bank *bank;
> >> -       enum pin_config_param param;
> >>         unsigned int reg, bit;
> >> -       int i, ret;
> >> +       unsigned int ds_val;
> >> +       int ret;
> >> +
> >> +       if (!pc->reg_ds) {
> >> +               dev_err(pc->dev, "drive-strength not supported\n");
> >> +               return -ENOTSUPP;
> > in meson_pinconf_set() we don't complain (with a dev_err) for this case.
> > I'm not sure what the best-practice is for the pinctrl subsystem,
> > maybe Linus can comment on this
> >
>
> this check is to be sure it's possible to set drive stength,
>
> if no register bank is setting in DT but drive-stength properties are setting on pins i need to generate an error
>
> because something is wrong.
OK, I see, there are two different use-cases:
- meson_pinconf_set returns -ENOTSUPP in the "default" case if the
pin_config_param is not supported but no error message
- we don't differentiate between SoCs PIN_CONFIG_DRIVE_STRENGTH_UA is
always delegated from meson_pinconf_set() to
meson_pinconf_set_drive_strength(). you also return -ENOTSUPP and
print an error message

what I meant with my original comment is that there are two different
"-ENOTSUPP" cases but only one prints an error.
I don't know if there are any rules in the pinctrl subsystem how these
cases should be implemented, maybe Linus W. can give his feedback on
this topic.

>
> >> +       }
> >>
> >>         ret = meson_get_bank(pc, pin, &bank);
> >>         if (ret)
> >>                 return ret;
> >>
> >> +       meson_calc_reg_and_bit(bank, pin, REG_DS, &reg, &bit);
> >> +       bit = bit << 1;
> >> +
> >> +       if (arg <= 500) {
> >> +               ds_val = MESON_PINCONF_DRV_500UA;
> >> +       } else if (arg <= 2500) {
> >> +               ds_val = MESON_PINCONF_DRV_2500UA;
> >> +       } else if (arg <= 3000) {
> >> +               ds_val = MESON_PINCONF_DRV_3000UA;
> >> +       } else if (arg <= 4000) {
> >> +               ds_val = MESON_PINCONF_DRV_4000UA;
> >> +       } else {
> >> +               dev_warn_once(pc->dev,
> >> +                             "pin %u: invalid drive-strength : %d , default to 4mA\n",
> >> +                             pin, arg);
> >> +               ds_val = MESON_PINCONF_DRV_4000UA;
> > why not return -EINVAL here? (my assumption is that the pinctrl
> > subsystem would like to have -EINVAL instead of drivers doing
> > fallbacks if the values are out-of-range, but I'm not 100% sure about
> > this)
> >
> > [...]
>
>
> i choose to set a default value instead of generating an error,
>
> in this case it's only if you ask a value upper than 4000uA so it's not really a risk to set 4000uA by default.
in that case I'm fine with it if Linus W. is happy as well (I'm not
sure if there are any rules about "fallback values" in the pinctrl
subsystem)

>
> >> +static int meson_pinconf_get_drive_strength(struct meson_pinctrl *pc,
> >> +                                           unsigned int pin, u16 *arg)
> >> +{
> >> +       struct meson_bank *bank;
> >> +       unsigned int reg, bit;
> >> +       unsigned int val;
> >> +       int ret;
> >> +
> > do you need to return -ENOTSUPP here if pc->reg_ds is NULL, similar to
> > what you already have in meson_pinconf_set_drive_strength()?
>
> depending of linux comment on your feedback on meson_pinconf_set_drive_strength
great, thank you!


Martin
