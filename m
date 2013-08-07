Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-oa0-f49.google.com ([209.85.219.49]:61075 "EHLO
	mail-oa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753323Ab3HGTrS (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Wed, 7 Aug 2013 15:47:18 -0400
Received: by mail-oa0-f49.google.com with SMTP id n10so1742264oag.8
        for <devicetree@vger.kernel.org>; Wed, 07 Aug 2013 12:47:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <b719237403781b77732bb59078ca6f1eb3d76639.1375867291.git.rubini@gnudd.com>
References: <cover.1375867291.git.rubini@gnudd.com>
	<b719237403781b77732bb59078ca6f1eb3d76639.1375867291.git.rubini@gnudd.com>
Date: Wed, 7 Aug 2013 21:47:18 +0200
Message-ID: <CACRpkdbSYzQn2U6yijnrNQ0QhnzhUmQz1W=C8NHGhsK6VzRFpA@mail.gmail.com>
Subject: Re: [PATCH 26/26] pinctrl: add support for sta2x11 (via pinctrl-nomadik)
From: Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset=ISO-8859-1
Sender: devicetree-owner@vger.kernel.org
To: Davide Ciminaghi <ciminaghi@gnudd.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alessandro Rubini <rubini@gnudd.com>, Giancarlo Asnaghi <giancarlo.asnaghi@st.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Russell King <linux@arm.linux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Wed, Aug 7, 2013 at 12:22 PM, Davide Ciminaghi <ciminaghi@gnudd.com> wrote:

> Signed-off-by: Davide Ciminaghi <ciminaghi@gnudd.com>
> Acked-by: Giancarlo Asnaghi <giancarlo.asnaghi@st.com>

Maybe you could add a commit message?

Apart from that it looks like a straight-forward plug-in to the
Nomadik pin controller, so I'd happily apply it, but I guess it
will go in through the x86 tree?

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
