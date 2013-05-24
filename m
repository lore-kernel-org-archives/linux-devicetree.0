From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH -next] pinctrl: sunxi: fix error return code in
 sunxi_pinctrl_probe()
Date: Fri, 24 May 2013 11:34:44 +0200
Message-ID: <20130524093444.GA8785@lukather>
References: <CAPgLHd_v3oNBP5DcqJ9bkGKkCDqwr1UzJNnVT6uz8V--FWEQ0Q@mail.gmail.com>
 <CACRpkdbAhSRLpvLt8K8suL57cs7ts7rH-SqHJgQc1LA96=JO8Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdbAhSRLpvLt8K8suL57cs7ts7rH-SqHJgQc1LA96=JO8Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Wei Yongjun <weiyj.lk@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Emilio Lopez <emilio@elopez.com.ar>, Wei Yongjun <yongjun_wei@trendmicro.com.cn>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

On Fri, May 24, 2013 at 11:23:04AM +0200, Linus Walleij wrote:
> On Thu, May 23, 2013 at 11:32 AM, Wei Yongjun <weiyj.lk@gmail.com> wrote:
> 
> > From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> >
> > Fix to return a negative error code from the devm_clk_get() error
> > handling case instead of 0, as done elsewhere in this function.
> >
> > Introduced by commit 950707c0eb5c7aeaa2c446a04c824f4be686d2f6
> > (pinctrl: sunxi: add clock support)
> >
> > Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> 
> Patch applied for fixes, thanks!
> 
> Maxime: OK?

Yes, everything's fine for me.

Thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
