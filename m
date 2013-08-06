From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] ARM: u300: fix return value check in __u300_init_boardpower()
Date: Tue, 6 Aug 2013 12:15:28 +0200
Message-ID: <CACRpkdZ9VBjPVOB9t4E6MJ80m_Mb78Fvp5sPk2Y0hOTQqu1wBA@mail.gmail.com>
References: <CAPgLHd9cUJtF7WXmY4Sy+53MxjKJRe8RVNNtbfdYLzh6OwbNzg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAPgLHd9cUJtF7WXmY4Sy+53MxjKJRe8RVNNtbfdYLzh6OwbNzg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Wei Yongjun <yongjun_wei@trendmicro.com.cn>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 4, 2013 at 3:51 PM, Wei Yongjun <weiyj.lk@gmail.com> wrote:

> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
>
> In case of error, the function syscon_node_to_regmap() returns ERR_PTR()
> and never returns NULL. The NULL test in the return value check should
> be replaced with IS_ERR().
>
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Patch applied.

Yours,
Linus Walleij
