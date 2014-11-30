From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCHv2 05/16] gpio: mvebu: add suspend/resume support
Date: Sun, 30 Nov 2014 11:49:11 -0500
Message-ID: <20141130164911.GS22670@titan.lakedaemon.net>
References: <1415978496-9334-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1415978496-9334-6-git-send-email-thomas.petazzoni@free-electrons.com>
 <CACRpkdb5S7Fv4+Ck2btLPTYWaWr_E-iMcQGeATB4NMwx_T-4GA@mail.gmail.com>
 <20141127194418.43e03e80@free-electrons.com>
 <CACRpkdaVaTmhRgSkJPCmsHXvkqd4b-BZBsQEbXcZrHdhyMS0WQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdaVaTmhRgSkJPCmsHXvkqd4b-BZBsQEbXcZrHdhyMS0WQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Tawfik Bayouk <tawfik@marvell.com>, Nadav Haklai <nadavh@marvell.com>, Lior Amsalem <alior@marvell.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Linus, Stephen,

On Fri, Nov 28, 2014 at 04:42:14PM +0100, Linus Walleij wrote:
> On Thu, Nov 27, 2014 at 7:44 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> > Dear Linus Walleij,
> 
> >> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> >>
> >> Do you want me to merge the patch or is it dependent on other patches?
> >
> > This patch has already been merged by you, and is already in
> > linux-next. See
> > https://git.kernel.org/cgit/linux/kernel/git/linusw/linux-gpio.git/commit/?h=for-next&id=b5b7b487431b01619f2947d91dadd7c7a233692e.
> 
> Argh, haha yeah it was the resending that confused me... too many
> patches floating around. Well then, it lands upstream.

Odd.  I've had the same patch in mvebu/for-next since the 22nd of
November...  You'd think it would have caused a merge conflict.

At any rate, I've dropped it from the mvebu/soc-suspend branch and
updated mvebu/for-next.

thx,

Jason.
