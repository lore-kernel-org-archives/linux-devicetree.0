From: Jianxin Pan <jianxin.pan@amlogic.com>
Subject: Re: [PATCH RESEND v7 1/4] clk: meson: add emmc sub clock phase delay
 driver
Date: Thu, 13 Dec 2018 12:42:02 +0800
Message-ID: <33721ac4-3564-1347-3b7b-2c795db63851@amlogic.com>
References: <1544457877-51301-1-git-send-email-jianxin.pan@amlogic.com>
 <1544457877-51301-2-git-send-email-jianxin.pan@amlogic.com>
 <8e1c711b477eeee60809f33926cf9c6a52f530cd.camel@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8e1c711b477eeee60809f33926cf9c6a52f530cd.camel@baylibre.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>
Cc: Yixun Lan <yixun.lan@amlogic.com>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Boris Brezillon <boris.brezillon@bootlin.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Liang Yang <liang.yang@amlogic.com>, Jian Hu <jian.hu@amlogic.com>, Qiufang Dai <qiufang.dai@amlogic.com>, Hanjie Lin <hanjie.lin@amlogic.com>, Victor Wan <victor.wan@amlogic.com>, linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

HI Jerome,

On 2018/12/12 0:28, Jerome Brunet wrote:
> On Tue, 2018-12-11 at 00:04 +0800, Jianxin Pan wrote:
>> From: Yixun Lan <yixun.lan@amlogic.com>
>>
[...]
>> +
>> +static inline struct meson_clk_phase_delay_data *
>> +meson_clk_get_phase_delay_data(struct clk_regmap *clk)
>> +{
>> +	return clk->data;
>> +}
> 
> This is only usefull in the related clock driver, no need to export it
OK, I will move it to clk-phase-delay.c.
Thanks for the review.
> 
>> +
>>  /* clk_ops */
>>  extern const struct clk_ops meson_clk_pll_ro_ops;
>>  extern const struct clk_ops meson_clk_pll_ops;
>> @@ -112,5 +124,6 @@ struct clk_regmap _name = {				
>> 		\
>>  extern const struct clk_ops meson_clk_mpll_ro_ops;
>>  extern const struct clk_ops meson_clk_mpll_ops;
>>  extern const struct clk_ops meson_clk_phase_ops;
>> +extern const struct clk_ops meson_clk_phase_delay_ops;
>>  
>>  #endif /* __CLKC_H */
> 
> 
> .
> 
