From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v6] mfd: syscon: Add hardware spinlock support
Date: Fri, 15 Dec 2017 14:13:14 +0100
Message-ID: <CAK8P3a0Eu4zaVrSEMps06ZZmFs=6026WZ7ze5V2k=nu0zL0bxQ@mail.gmail.com>
References: <87ec50c846bbc7afc09ba0855aba1cdea6473308.1512048582.git.baolin.wang@linaro.org>
 <20171215104204.p7i27sen77ohbmzi@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171215104204.p7i27sen77ohbmzi@dell>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Baolin Wang <baolin.wang@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mark Brown <broonie@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, DTML <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 15, 2017 at 11:42 AM, Lee Jones <lee.jones@linaro.org> wrote:

>> @@ -87,6 +88,30 @@ static struct syscon *of_syscon_register(struct device_node *np)
>>       if (ret)
>>               reg_io_width = 4;
>>
>> +     ret = of_hwspin_lock_get_id(np, 0);
>> +     if (ret > 0) {
>> +             syscon_config.hwlock_id = ret;
>> +             syscon_config.hwlock_mode = HWLOCK_IRQSTATE;
>> +     } else {
>> +             switch (ret) {
>> +             case -ENOENT:
>> +                     /* Ignore missing hwlock, it's optional. */
>> +                     break;
>> +             case 0:
>> +                     /* In case of the HWSPINLOCK is not enabled. */
>> +                     if (!IS_ENABLED(CONFIG_HWSPINLOCK))
>> +                             break;
>> +
>> +                     ret = -EINVAL;
>> +                     /* fall-through */
>> +             default:
>> +                     pr_err("Failed to retrieve valid hwlock: %d\n", ret);
>> +                     /* fall-through */
>> +             case -EPROBE_DEFER:
>> +                     goto err_regmap;
>> +             }

The 'case 0' seems odd here, are we sure that this is always a failure?
>From the of_hwspin_lock_get_id() definition it looks like zero might
be valid, and the !CONFIG_HWSPINLOCK implementation appears
to be written so that we should consider '0' valid but unused and
silently continue with that. If that is generally not the intended
use, it should probably return -EINVAL or something like that.

       Arnd
