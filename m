Return-Path: <SRS0=9H7/=FX=gmail.com=andy.shevchenko@kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAHp75VcW_kghNKghXb=4cL4WUnwt4JPZ93aetedie4nWgQKL=w@mail.gmail.com>
References: <1519736182-3650-1-git-send-email-jassisinghbrar@gmail.com>
 <1519736330-3985-1-git-send-email-jassisinghbrar@gmail.com> <CAHp75VcW_kghNKghXb=4cL4WUnwt4JPZ93aetedie4nWgQKL=w@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 1 Mar 2018 12:04:07 +0200
Message-ID: <CAHp75VdE8yAROp0QXTw04no4Oo89g_CK0yBMbU0-DcT7ui4y6A@mail.gmail.com>
Subject: Re: [PATCHv4 2/3] spi: Add spi driver for Socionext Synquacer platform
Content-Type: text/plain; charset="UTF-8"
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-spi <linux-spi@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, tpiepho@impinj.com, Mark Brown <broonie@kernel.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>
List-ID: <devicetree@vger.kernel.org>

On Thu, Mar 1, 2018 at 12:02 PM, Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:

>> +#include <linux/delay.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/io.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/pm_runtime.h>
>> +#include <linux/scatterlist.h>
>> +#include <linux/slab.h>
>> +#include <linux/spi/spi.h>
>> +#include <linux/spinlock.h>

>> +#include <linux/clk.h>
>> +#include <linux/clk-provider.h>

Forgot to add.
Is there any clock provider? I perhaps missed it.

-- 
With Best Regards,
Andy Shevchenko
