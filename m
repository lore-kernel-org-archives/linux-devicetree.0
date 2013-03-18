From: Barry Song <21cnbao@gmail.com>
Subject: Re: [PATCH -next] pinctrl: sirf: using for_each_set_bit to simplify
 the code
Date: Mon, 18 Mar 2013 10:34:43 +0800
Message-ID: <CAGsJ_4za5S4YoCWDFz1uaVkTM-yghbufcEhv3g+DBTr1pn+vJA@mail.gmail.com>
References: <CAPgLHd9n7nmyhUcRgPwEyjweZKA+fgi409yEJgK6LmF2Wu6n-g@mail.gmail.com>
 <CACRpkdZ_AvahCLkPhbdB7Dk-qaxpAEN-B9qCMsJWBKi8+GtuOQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZ_AvahCLkPhbdB7Dk-qaxpAEN-B9qCMsJWBKi8+GtuOQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Wei Yongjun <weiyj.lk@gmail.com>
Cc: devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, rob.herring@calxeda.com, yongjun_wei@trendmicro.com.cn, linux-arm-kernel@lists.infradead.org, DL-SHA-WorkGroupLinux <workgroup.linux@csr.com>
List-Id: devicetree@vger.kernel.org

2013/3/14 Linus Walleij <linus.walleij@linaro.org>
>
> On Mon, Mar 11, 2013 at 3:23 PM, Wei Yongjun <weiyj.lk@gmail.com> wrote:
>
> > From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> >
> > Using for_each_set_bit() to simplify the code.
> >
> > Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
>
> Barry, can I have your ACK on this?

yes. acked. thanks Yongjun, Linus.

>
> Yours,
> Linus Walleij

-barry
