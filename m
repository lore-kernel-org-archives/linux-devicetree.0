From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] pinctrl: fix return value in bcm2835_pinctrl_probe()
Date: Mon, 08 Oct 2012 20:22:57 -0600
Message-ID: <50738A81.9070308@wwwdotorg.org>
References: <CAPgLHd8F99f5LVS-wNekKA+a1369RfqCa-w_jHGV-_Wueg_cTQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAPgLHd8F99f5LVS-wNekKA+a1369RfqCa-w_jHGV-_Wueg_cTQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: Wei Yongjun <weiyj.lk@gmail.com>, grant.likely@secretlab.ca, rob.herring@calxeda.com, yongjun_wei@trendmicro.com.cn, linux-rpi-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 10/07/2012 08:01 AM, Wei Yongjun wrote:
> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> 
> In case of error, the function pinctrl_register() returns
> NULL not ERR_PTR(). The PTR_ERR() in the return value
> should be replaced with error no.
> 
> dpatch engine is used to auto generate this patch.
> (https://github.com/weiyj/dpatch)

Linus, I assume this will go through the pinctrl tree.
