From: Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
Subject: Re: [PATCH] regulator: Add LTC3676 support
Date: Wed, 10 Aug 2016 17:44:55 -0700
Message-ID: <CAJ+vNU3s=qxJr8x=ScnyEV0UKkD_gTOnMyY8oGuzVs14hTW0Ng@mail.gmail.com>
References: <1470785767-4426-1-git-send-email-tharvey@gateworks.com> <20160810114140.GJ9347@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160810114140.GJ9347-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jaffer Kapasi <jkapasi-td5IlybW20HQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 10, 2016 at 4:41 AM, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Tue, Aug 09, 2016 at 04:36:07PM -0700, Tim Harvey wrote:
>
> Mostly looks good but quite a few issues with not using framework
> features here, a lot of the code can be factored out into the core:
>

Mark,

thanks for the review!

>> +     /* DVB reference select is bit5 of DVBA reg */
>> +     mask = 1 << 5;
>> +
>> +     if (mode != REGULATOR_MODE_STANDBY)
>> +             bit = mask;     /* Select DVBB */
>
> This will silently treat any mode other than standby identically which
> is buggy, it should reject any mode not supported.
>
>> +/* LDO1 always on fixed 0.8V-3.3V via scalar via R1/R2 feeback res */
>> +static struct regulator_ops ltc3676_fixed_standby_regulator_ops = {
>> +};
>
> Remove this, it's pointless.
>

as I'm using macro's to define the ops, removing this ends up breaking
compilation:

drivers/regulator/ltc3676.c:198:11: error:
'ltc3676_fixed_standby_regulator_ops' undeclared here (not in a
function)
   .ops = &ltc3676_ ## _ops ## _regulator_ops,    \
           ^
drivers/regulator/ltc3676.c:221:2: note: in expansion of macro 'LTC3676_REG'
  LTC3676_REG(LDO1, ldo1, fixed_standby, 0, 0, 0, 0),
  ^

This is because of:
#define LTC3676_REG(_id, _name, _ops, en_reg, en_bit, dvba_reg, dvb_mask)   \
        [LTC3676_ ## _id] = {                                        \
                .name = #_name,                                \
                .of_match = of_match_ptr(#_name),              \
                .regulators_node = of_match_ptr("regulators"), \
                .of_parse_cb = ltc3676_of_parse_cb,            \
                .n_voltages = (dvb_mask) + 1,                  \
                .min_uV = (dvba_reg) ? 412500 : 0,             \
                .uV_step = (dvba_reg) ? 12500 : 0,             \
                .ramp_delay = (dvba_reg) ? 800 : 0,            \
                .fixed_uV = (dvb_mask) ? 0 : 725000,           \
                .ops = &ltc3676_ ## _ops ## _regulator_ops,    \
                .type = REGULATOR_VOLTAGE,                     \
                .id = LTC3676_ ## _id,                         \
                .owner = THIS_MODULE,                          \
                .vsel_reg = (dvba_reg),                        \
                .vsel_mask = (dvb_mask),                       \
                .enable_reg = (en_reg),                        \
                .enable_mask = (1 << en_bit),                  \
        }

        LTC3676_REG(LDO1, ldo1, fixed_standby, 0, 0, 0, 0),

do you know of some macro foo to best handle this? Part of me wants to
ditch the macro's and just simply declare the array of regulators
directly as its much easier to read/follow.

>> +     node = of_get_child_by_name(dev->of_node, "regulators");
>> +     if (!node) {
>> +             dev_err(dev, "regulators node not found\n");
>> +             return -EINVAL;
>> +     }
>> +
>> +     ret = of_regulator_match(dev, node, ltc3676_matches,
>> +                              ARRAY_SIZE(ltc3676_matches));
>
> Use the core support for parsing regulators from OF, don't open code it.
>
>> +     /* parse feedback voltage deviders: LDO3 doesn't have them */
>> +     for (i = 0; i < LTC3676_NUM_REGULATORS; i++) {
>> +             struct ltc3676_regulator *desc = &ltc3676->regulator_descs[i];
>> +             struct device_node *np = ltc3676_matches[i].of_node;
>> +             u32 vdiv[2];
>
> There's a callback for parsing additional properties out of the
> subnodes, of_parse_cb.
>

ok, I think I have that part figured out now using of_match,
regulator_node, and of_parse_cb - it cleans up the code quite a bit
thanks!

>> +static bool ltc3676_readable_reg(struct device *dev, unsigned int reg)
>> +{
>> +     switch (reg) {
>> +             case LTC3676_IRQSTAT:
>> +             case LTC3676_BUCK1:
>
> Please follow the kernel coding style.
>
>> +     dev_dbg(dev, "irq%d irqstat=0x%02x\n", irq, irqstat);
>> +     if (irqstat & LTC3676_IRQSTAT_THERMAL_WARN) {
>> +             dev_info(dev, "Over-temperature Warning\n");
>
> dev_warn()
>
>> +static void ltc3676_apply_fb_voltage_divider(struct ltc3676_regulator *rdesc)
>> +{
>> +     struct regulator_desc *desc = &rdesc->desc;
>> +
>> +     if (!rdesc->r1 || !rdesc->r2)
>> +             return;
>
> This is a bug if we ever get here, we should be complaining loudly.

This is now refactored due to using the core code for of parsing, but
is it ok/standard to allow unused regulators to be not-defined in the
dt and if so how do I handle that? Currently my test board uses 7 of
the 8 regulators but the unused one is still registered with linux.

Regards,

Tim
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
