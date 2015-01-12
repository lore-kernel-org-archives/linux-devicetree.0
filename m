From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [Patch v5 2/2] gpio: Document GPIO hogging mechanism
Date: Mon, 12 Jan 2015 11:20:14 +0100
Message-ID: <CACRpkdb7Wq7-rBypqPkefejY5Qfq_KKx91H+DxKWv-TM2y04bg@mail.gmail.com>
References: <1419019671-25377-1-git-send-email-bparrot@ti.com>
	<1419019671-25377-3-git-send-email-bparrot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1419019671-25377-3-git-send-email-bparrot@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Benoit Parrot <bparrot@ti.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Jiri Prchal <jiri.prchal@aksignal.cz>, Pantelis Antoniou <panto@antoniou-consulting.com>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 19, 2014 at 9:07 PM, Benoit Parrot <bparrot@ti.com> wrote:

> Add GPIO hogging documentation to gpio.txt
>
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

This is starting to look good ...

> +               line_b {
> +                       gpio-hog;
> +                       gpios = <6 0>;
> +                       state = "output-low";

I don't like the state string.

Instead have boolean properties for all states.

line_b {
    gpio-hog;
    gpios = <6 0>;
    output-low;
    line-name = "foo-bar-gpio";
}

Then use of_property_read_bool() in the code to check which
state is to be selected intially. You can check that no mutually
exclusive state are selected, I don't like that an arbitrary string
select the state like that, if we do it that way an enumerator would
be better, I prefer bools.

Yours,
Linus Walleij
