From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: single: fix error return code in pcs_parse_one_pinctrl_entry()
Date: Tue, 14 May 2013 14:05:01 +0200
Message-ID: <CACRpkdZ7i7EBuwqfGZ2Kby6DjTU3vcp89OH+wKx7YSpS4y9DdQ@mail.gmail.com>
References: <CAPgLHd-av2Yg44ARcSGr_zOajO-U611y3N4_Sn7J5Z+=OfVFcg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAPgLHd-av2Yg44ARcSGr_zOajO-U611y3N4_Sn7J5Z+=OfVFcg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, Wei Yongjun <yongjun_wei@trendmicro.com.cn>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 7, 2013 at 2:06 PM, Wei Yongjun <weiyj.lk@gmail.com> wrote:

> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
>
> Fix to return a negative error code from the error handling
> case instead of 0, as done elsewhere in this function.
>
> Introduced by commit 9dddb4df90d136429b6d6ddefceb49a9b93f6cd1
> (pinctrl: single: support generic pinconf)
>
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Thanks, patch applied to fixes with Haojians ACK.

Yours,
Linus Walleij
