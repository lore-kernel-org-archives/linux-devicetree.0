From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] pinctrl: export pin_request to support parent pin
Date: Tue, 6 Sep 2016 15:55:12 +0200
Message-ID: <CACRpkdYPfBKshf1jGF85vj+bzwb1kX+2j-kUA+8+w+vSFPuGDQ@mail.gmail.com>
References: <1472213942-4815-1-git-send-email-jun.nie@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1472213942-4815-1-git-send-email-jun.nie@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Jun Nie <jun.nie@linaro.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Shawn Guo <shawn.guo@linaro.org>, Jason Liu <jason.liu@linaro.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 26, 2016 at 2:19 PM, Jun Nie <jun.nie@linaro.org> wrote:

> Some pin functions may be controlled in 2nd level multiplex.
> We need configure 1st level multiplex when request such
> functions. Export pin_request functionality so that parent
> can be configured automatically with calling it in
> pinmux_ops->request().
>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>

This looks weird as 1/3, please put the DT bindings first in the
series.

We first need to agree on how to represent this before we start
hacking around in the core to support different shortcuts.

This patch just makes me nervous, but maybe I can be convinced
otherwise if we get some details on how the hardware works and why
this is necessary.

Yours,
Linus Walleij
