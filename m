From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] pinctrl: remove duplicated include from pinctrl-bcm2835.c
Date: Mon, 08 Oct 2012 20:21:11 -0600
Message-ID: <50738A17.9010201@wwwdotorg.org>
References: <CAPgLHd-C5NvpG7vo68kAjY4+CxDXenYU-Po-K4Z+uuvz_vZpxg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAPgLHd-C5NvpG7vo68kAjY4+CxDXenYU-Po-K4Z+uuvz_vZpxg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: Wei Yongjun <weiyj.lk@gmail.com>, grant.likely@secretlab.ca, rob.herring@calxeda.com, yongjun_wei@trendmicro.com.cn, linux-rpi-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 10/07/2012 07:28 AM, Wei Yongjun wrote:
> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> 
> Remove duplicated include.
> 
> dpatch engine is used to auto generate this patch.
> (https://github.com/weiyj/dpatch)

Linus, I assume this will go through the pinctrl tree?
