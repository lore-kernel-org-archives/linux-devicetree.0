From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: Moving ARM dts files
Date: Thu, 6 Dec 2018 15:05:31 +0100
Message-ID: <20181206140531.GX8952@piout.net>
References: <20181204183649.GA5716@bogus>
 <20181205135726.70badac7@xhacker.debian>
 <CACRpkdYs_s9m=fUuOcfqcvP5BMXity5GH17RSMyvHzdZ9aFNzA@mail.gmail.com>
 <CAL_JsqJWnB+EAoXk9a1M_D-kH8kZcwD6gTj0yVa_hBCGapB4RQ@mail.gmail.com>
 <20181206133922.4y4qnrqcjtog3ukt@pengutronix.de>
 <CAL_Jsq+PB3Pmg1RmNqj0whapbcqRBXDNWi4LpjPqqCKeLHbR=A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+PB3Pmg1RmNqj0whapbcqRBXDNWi4LpjPqqCKeLHbR=A@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>, Liviu Dudau <liviu.dudau@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Thierry Reding <thierry.reding@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Kevin Hilman <khilman@kernel.org>, Gregory CLEMENT <gregory.clement@bootlin.com>, Michal Simek <michal.simek@xilinx.com>, Krzysztof Kozlowski <krzk@kernel.org>, ARM-SoC Maintainers <arm@kernel.org>, Joel Stanley <joel@jms.id.au>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Andy Gross <andy.gross@linaro.org>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Simon Horman <horms@verge.net.au>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Jisheng Zhang <Jisheng.Zhang@synaptics.com>, Maxime Coquelin <mcoquelin.st>
List-Id: devicetree@vger.kernel.org

On 06/12/2018 07:58:24-0600, Rob Herring wrote:
> On Thu, Dec 6, 2018 at 7:39 AM Uwe Kleine-K=F6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> >
> > Hello,
> >
> > On Wed, Dec 05, 2018 at 09:01:59AM -0600, Rob Herring wrote:
> > > i.MX23 is a Sigmatel chip STMP??
> >
> > I think the Freescale i.MX23 didn't exist at Sigmatel back then. AFAIK
> > this is a new design using IP from Sigmatel after the aquisition.
> =

> It is not. I was in the i.MX group which Sigmatel was merged into at
> the time. Purely marketing rebranding.
> =


Wouldn't it be easier to name the directory to the corresponding mach-*
entry?

So, imx23 and imx28 would go to mxs/, other imx in imx/. And this also
solves the Marvell mess with the Synaptics Socs going in berlin/ and the
other ones in mvebu/.


-- =

Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
