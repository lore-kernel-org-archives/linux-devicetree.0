From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio: samsung: Remove OF support for s3c24xx
Date: Wed, 17 Apr 2013 18:33:40 +0200
Message-ID: <CACRpkdYPwkaW2nUBFe71Yoz=P823H24=pUH7cFgswxCmPHneqA@mail.gmail.com>
References: <1366134094-23140-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1366134094-23140-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 16, 2013 at 7:41 PM, Sylwester Nawrocki
<s.nawrocki@samsung.com> wrote:

> There is no users of this code and there is already a pinctrl
> driver written for s3c24xx which is going to be used on any
> s3c24xx DT platforms. Hence this has been effectively a dead
> code in mainline.
>
> This reverts commit 172c6a13653ac8cd6a231293b87c93821e90c1d6
> gpio: samsung: add devicetree init for s3c24xx arches
>
> Cc: Heiko St=FCbner <heiko@sntech.de>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

I guess this goes to go into the Samsung tree too.

Yours,
Linus Walleij
