From: Jianxin Pan <jianxin.pan@amlogic.com>
Subject: Re: [PATCH 2/3] soc: amlogic: Add support for Secure power domains
 controller
Date: Fri, 20 Sep 2019 15:58:40 +0800
Message-ID: <dc57566d-81e2-5851-ff6d-e39dcf246a47@amlogic.com>
References: <1568895064-4116-1-git-send-email-jianxin.pan@amlogic.com>
 <1568895064-4116-3-git-send-email-jianxin.pan@amlogic.com>
 <CAFBinCDv2m_0tP+rdT1tgXhMs-hPE_cJ9TmO8h9ftDvJXvby+g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAFBinCDv2m_0tP+rdT1tgXhMs-hPE_cJ9TmO8h9ftDvJXvby+g@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, Zhiqiang Liang <zhiqiang.liang@amlogic.com>, Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Jian Hu <jian.hu@amlogic.com>, Hanjie Lin <hanjie.lin@amlogic.com>, Victor Wan <victor.wan@amlogic.com>, Xingyu Chen <xingyu.chen@amlogic.com>
List-Id: devicetree@vger.kernel.org

Hi Martin,

On 2019/9/20 4:03, Martin Blumenstingl wrote:
> Hi Jianxin,
> 
> I added three comments below from a quick glance at this driver (I
> didn't have time for a complete review)
> 
> On Thu, Sep 19, 2019 at 2:11 PM Jianxin Pan <jianxin.pan@amlogic.com> wrote:
> [...]
>> +               pm_genpd_init(&dom->base, NULL,
>> +                             (match->domains[i].get_power ?
>> +                             match->domains[i].get_power(dom) : true));
> .get_power is never NULL in this driver so the ": true" part is
> effectively a no-op
> 
OK, I will remove it. Thanks for your time.
> [...]
>> +static const struct of_device_id meson_secure_pwrc_match_table[] = {
>> +       {
>> +               .compatible = "amlogic,meson-a1-pwrc",
>> +               .data = &meson_secure_a1_pwrc_data,
>> +       },
>> +       { }
> many drivers use a /* sentinel */ comment inside { }
> 
OK, I will add this comment line.
> [...]
>> +arch_initcall_sync(meson_secure_pwrc_init);
> why arch_initcall_sync instead of builtin_platform_driver?
> $ grep -R arch_initcall_sync drivers/soc/
> $
> 
> 
> Martin
> 
The power-domain is depended by many other drivers, arch_initcall_sync is used to make power-domain probe earlier.
Maybe I need to switch back to builtin_platform_driver when use APIs from meson_sm.c. 
> .
> 
