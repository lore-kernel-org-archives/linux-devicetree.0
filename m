From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC Patch] gpio: add GPIO hogging mechanism
Date: Fri, 14 Nov 2014 10:19:47 +0100
Message-ID: <CACRpkdbO20No0A7ttS=kfMx9qE_MZoZzOtPObHefwnNbixpCeg@mail.gmail.com>
References: <1413922198-29373-1-git-send-email-bparrot@ti.com>
	<CAAVeFuK4PaFbbYjUsvA-oO78P5qmQvyGqG+Ov4GLghoC=yPAoA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CAAVeFuK4PaFbbYjUsvA-oO78P5qmQvyGqG+Ov4GLghoC=yPAoA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Benoit Parrot <bparrot@ti.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pantelis Antoniou <panto@antoniou-consulting.com>, Jiri Prchal <jiri.prchal@aksignal.cz>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 29, 2014 at 8:09 AM, Alexandre Courbot <gnurou@gmail.com> wrote:
> On Wed, Oct 22, 2014 at 5:09 AM, Benoit Parrot <bparrot@ti.com> wrote:

> +               line_b: line_b {
> +                       line_b {
> +                               gpios = <6 0>;
> +                               output-low;
> +                               line-name = "foo-bar-gpio";
> +                       };
> +               };
>
(...)
>
> I wonder if such usage of child nodes could not interfere with GPIO
> drivers (existing or to be) that need to use child nodes for other
> purposes. Right now there is no way to distinguish a hog node from a
> node that serves another purpose, and that might become a problem in
> the future.

Yes, so I have suggested a hog-something; keyword in there.

As long as the children don't have any compatible-strings we can
decide pretty much how they should be handled internally.

Are there custom drivers with child nodes inside the main chip
today?

Yours,
Linus Walleij
