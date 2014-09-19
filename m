From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 2/4] ARM: mediatek: Add Pinctrl/GPIO driver for mt8135.
Date: Fri, 19 Sep 2014 16:33:28 +0200
Message-ID: <CABuKBeLF5gA7R5qVWEUdAWTxKA1feY7mSy5g98gpL18HWnvp0A@mail.gmail.com>
References: <1411127306-13677-1-git-send-email-srv_hongzhou.yang@mediatek.com>
 <1411127306-13677-3-git-send-email-srv_hongzhou.yang@mediatek.com>
 <1411134460.27173.8.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1411134460.27173.8.camel@mtksdaap41>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "Joe.C" <yingjoe.chen@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Ashwin Chaugule <ashwin.chaugule@linaro.org>, srv_hongzhou.yang@mediatek.com, Vladimir Murzin <vladimir.murzin@arm.com>, Russell King <linux@arm.linux.org.uk>, srv_heupstream <srv_heupstream@mediatek.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>Hongzhou Yang <hongzhou.yang@mediatek.com>, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, =Sascha Hauer <kernel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

2014-09-19 15:47 GMT+02:00 Joe.C <yingjoe.chen@mediatek.com>:
> On Fri, 2014-09-19 at 19:48 +0800, srv_hongzhou.yang@mediatek.com wrote:
>> +
>> +static const struct pinmux_ops mt_pmx_ops = {
>> +     .get_functions_count    = mt_pmx_get_funcs_cnt,
>> +     .get_function_name      = mt_pmx_get_func_name,
>> +     .get_function_groups    = mt_pmx_get_func_groups,
>> +     .enable                 = mt_pmx_enable,
>> +     .disable                = mt_pmx_disable,
>> +     .gpio_set_direction     = mt_pmx_gpio_set_direction,
>> +};
>> +
>
> It seems pinmux_ops.disable is removed in commit commit
> 2243a87d90b42eb38bc281957df3e57c712b5e56. So this will cause build
> error. This should be fixed in next version.

For this cases and in general it would be good to put in the patch set
description against which tree/tag the patches are build.

Thanks,
Matthias

>
> ../drivers/pinctrl/mediatek/pinctrl-mtk-common.c:566:2: error: unknown
> field 'disable' specified in initializer
> ../drivers/pinctrl/mediatek/pinctrl-mtk-common.c:566:2: warning:
> initialization from incompatible pointer type [enabled by default]
> ../drivers/pinctrl/mediatek/pinctrl-mtk-common.c:566:2: warning: (near
> initialization for 'mt_pmx_ops.gpio_request_enable') [enabled by
> default]
>
> Joe.C
>
>



-- 
motzblog.wordpress.com
