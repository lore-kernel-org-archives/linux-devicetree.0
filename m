From: Peng Fan <van.freenix@gmail.com>
Subject: Re: [PATCH 3/3] nvmem: imx-ocotp: handling clock
Date: Tue, 19 Apr 2016 21:39:14 +0800
Message-ID: <20160419133911.GA6823@linux-vaa1.ap.freescale.net>
References: <1461054788-339-1-git-send-email-van.freenix@gmail.com>
 <1461054788-339-3-git-send-email-van.freenix@gmail.com>
 <CAOMZO5CBeMn_m79vUzmk21nA1s+COiFoqfywXUJ2mOS38wBAdg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAOMZO5CBeMn_m79vUzmk21nA1s+COiFoqfywXUJ2mOS38wBAdg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Fabio,
On Tue, Apr 19, 2016 at 07:42:17AM -0300, Fabio Estevam wrote:
>Hi Peng,
>
>On Tue, Apr 19, 2016 at 5:33 AM, Peng Fan <van.freenix@gmail.com> wrote:
>
>> @@ -46,11 +48,15 @@ static int imx_ocotp_read(void *context, const void *reg, size_t reg_size,
>>         if (count > (priv->nregs - index))
>>                 count = priv->nregs - index;
>>
>> +       clk_prepare_enable(priv->clk);
>
>clk_prepare_enable() may fail, so you should better check its return
>value and propagate it in the case of error.

Thanks for correcting me. Will fix it in V2.

Thanks,
Peng

-- 
