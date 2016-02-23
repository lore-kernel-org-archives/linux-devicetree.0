From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/4] gpio: dt-bindings: Declare gpio-hog optional for GPIO subnodes
Date: Tue, 23 Feb 2016 14:37:45 +0100
Message-ID: <CACRpkdbePYms6btMfFR8W-OupYG9JOduG_HgBR6jHCMj1_3DAg@mail.gmail.com>
References: <1456214089-13954-1-git-send-email-mpa@pengutronix.de>
	<1456214089-13954-3-git-send-email-mpa@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1456214089-13954-3-git-send-email-mpa@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
To: Markus Pargmann <mpa@pengutronix.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Johan Hovold <johan@kernel.org>, Michael Welling <mwelling@ieee.org>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 23, 2016 at 8:54 AM, Markus Pargmann <mpa@pengutronix.de> wrote:

> Reuse the GPIO hogging DT bindings for more generic specifications of
> the GPIO. Therefore gpio-hog is declared optional.
>
> Signed-off-by: Markus Pargmann <mpa@pengutronix.de>

I like this binding for names since it reuse what we already have,
but will allow some time for others to comment.

Yours,
Linus Walleij
