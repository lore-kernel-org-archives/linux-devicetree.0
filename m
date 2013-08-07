Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:38748 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932726Ab3HGTtV (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Wed, 7 Aug 2013 15:49:21 -0400
Received: by mail-ob0-f170.google.com with SMTP id eh20so4465104obb.1
        for <devicetree@vger.kernel.org>; Wed, 07 Aug 2013 12:49:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <64236c96ff620d64aa46d0fc3dac159a98c64709.1375867291.git.rubini@gnudd.com>
References: <cover.1375867291.git.rubini@gnudd.com>
	<64236c96ff620d64aa46d0fc3dac159a98c64709.1375867291.git.rubini@gnudd.com>
Date: Wed, 7 Aug 2013 21:49:20 +0200
Message-ID: <CACRpkdbTYDrf=Ey1+DmgNZUhDeFD7WX_661+bwyRkJBd9ngMTQ@mail.gmail.com>
Subject: Re: [PATCH 14/26] gpio: remove sta2x11-gpio
From: Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset=ISO-8859-1
Sender: devicetree-owner@vger.kernel.org
To: Davide Ciminaghi <ciminaghi@gnudd.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alessandro Rubini <rubini@gnudd.com>, Giancarlo Asnaghi <giancarlo.asnaghi@st.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Russell King <linux@arm.linux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Wed, Aug 7, 2013 at 12:19 PM, Davide Ciminaghi <ciminaghi@gnudd.com> wrote:

> The Connext chip has 4 gpio cells looking very similar to those of the
> Nomadik, whose gpio/pinctrl driver (already featuring devicetree support)
> will be used instead of the sta2x11 specific one.
>
> Signed-off-by: Davide Ciminaghi <ciminaghi@gnudd.com>
> Acked-by: Giancarlo Asnaghi <giancarlo.asnaghi@st.com>

Seems we should have discovered this earlier ;-)

I'd be happy to apply this too.
Acked-by: Linus Walleij <linus.walleij@linaro.org>

If you want I can apply this and the pinctrl patch to my
pinctrl tree for a consistent switch-over.

Yours,
Linus Walleij
