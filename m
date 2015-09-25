From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 1/2] pinctrl: Add driver for Alphascale asm9260 pinctrl
Date: Fri, 25 Sep 2015 10:14:43 -0700
Message-ID: <CACRpkdaX2kV_W-_sdvUA7PHrApeJi05T=CMCGddzMj4ksxs4Bg@mail.gmail.com>
References: <1428306169.634.51.camel@x220>
	<1428311043-12012-1-git-send-email-linux@rempel-privat.de>
	<1428311043-12012-2-git-send-email-linux@rempel-privat.de>
	<CACRpkdakXbHL6ydeZrs4XZ9Z1odHL5bWRxiHtT_Jbg-ygTudgw@mail.gmail.com>
	<55522993.6090104@rempel-privat.de>
	<CACRpkdZn+bkDKzAD6gpnysezGZ6fzizD2o4zdBfEamFgUbzcvg@mail.gmail.com>
	<55EFC9CC.3010008@rempel-privat.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <55EFC9CC.3010008@rempel-privat.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Oleksij Rempel <linux@rempel-privat.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 8, 2015 at 10:55 PM, Oleksij Rempel <linux@rempel-privat.de> wrote:
> [Me]
>> Why is it necessary for the driver to copy one description of
>> the pin into another?
>
> If i understand it correctly, pinctrl_pin_desc is essential part of
> pinmux framework. Theoretically i should define just statical array of
> this struct, but by this number of pins and functions it hard to keep it
> readable and error free. So i decided to create asm9260_mux_table which
> contains every thing i need. The side effect is higher memory usage
> since i need to create pinctrl_pin_desc on fly.
>
> May be i miss some thing?

I don't see how having code copying data from one data container
to another makes things "more readable and error free". Go for *one*
static definition. Also the memory waste is a total no-no.

Yours,
Linus Walleij
