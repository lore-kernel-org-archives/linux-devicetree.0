From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH -next] pinctrl: st: fix return value check
Date: Thu, 27 Jun 2013 12:29:46 +0200
Message-ID: <CACRpkdaOXSp_Nq68YOwUp+FoH=qA0gXwWc1VrO=BUVhVnHF=jw@mail.gmail.com>
References: <CAPgLHd8-jbXfb95x1Bp7GsMuEJ3mOudUcknRqbxNpNmcdQvg3w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAPgLHd8-jbXfb95x1Bp7GsMuEJ3mOudUcknRqbxNpNmcdQvg3w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wei Yongjun <weiyj.lk@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Wei Yongjun <yongjun_wei@trendmicro.com.cn>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Srinivas Kandagatla <srinivas.kandagatla@st.com>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 26, 2013 at 6:30 PM, Wei Yongjun <weiyj.lk@gmail.com> wrote:

> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
>
> In case of error, the function pinctrl_register() returns
> NULL not ERR_PTR(). The IS_ERR() test in the return value
> check should be replaced with NULL test.
> The function syscon_regmap_lookup_by_phandle() returns ERR_PTR()
> and never returns NULL. The NULL test in the return value check
> should be replaced with IS_ERR().
>
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

This driver is merged into Mark Brown's regmap tree and need
to be applied as a fix there.

Pls resend it if Mark has not recieved it.

Include Srinivas on patches so he can ACK them.

Yours,
Linus Walleij
