From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCHv2 05/16] gpio: mvebu: add suspend/resume support
Date: Thu, 27 Nov 2014 19:44:18 +0100
Message-ID: <20141127194418.43e03e80@free-electrons.com>
References: <1415978496-9334-1-git-send-email-thomas.petazzoni@free-electrons.com>
	<1415978496-9334-6-git-send-email-thomas.petazzoni@free-electrons.com>
	<CACRpkdb5S7Fv4+Ck2btLPTYWaWr_E-iMcQGeATB4NMwx_T-4GA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdb5S7Fv4+Ck2btLPTYWaWr_E-iMcQGeATB4NMwx_T-4GA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Tawfik Bayouk <tawfik@marvell.com>, Nadav Haklai <nadavh@marvell.com>, Lior Amsalem <alior@marvell.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Dear Linus Walleij,

On Thu, 27 Nov 2014 14:29:47 +0100, Linus Walleij wrote:
> On Fri, Nov 14, 2014 at 4:21 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> 
> > This commit adds the implementation of ->suspend() and ->resume()
> > platform_driver hooks in order to save and restore the state of the
> > GPIO configuration. In order to achieve that, additional fields are
> > added to the mvebu_gpio_chip structure.
> >
> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Alexandre Courbot <gnurou@gmail.com>
> > Cc: linux-gpio@vger.kernel.org
> > Acked-by: Alexandre Courbot <acourbot@nvidia.com>
> > Reviewed-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
> 
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Do you want me to merge the patch or is it dependent on other patches?

This patch has already been merged by you, and is already in
linux-next. See
https://git.kernel.org/cgit/linux/kernel/git/linusw/linux-gpio.git/commit/?h=for-next&id=b5b7b487431b01619f2947d91dadd7c7a233692e.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
