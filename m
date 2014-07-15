From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL] Mediatek basic support for v3.17
Date: Tue, 15 Jul 2014 17:17:34 +0200
Message-ID: <14060966.Jhk08lR3XI@wuerfel>
References: <CABuKBe+h0Et5_+o4_i-Eu7EQ8Xka7YFoKmO=U0B7NnVQBdQ8FA@mail.gmail.com>
 <20140715135913.GA18571@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20140715135913.GA18571@kroah.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Thierry Reding <thierry.reding@gmail.com>, Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko.stuebner@bq.com>, ak@linux.intel.com, Russell King <linux@arm.linux.org.uk>, Daniel Lezcano <daniel.lezcano@linaro.org>, "shawn.guo@freescale.com" <shawn.guo@freescale.com>, u.kleine-koenig@pengutronix.de, Grant Likely <grant.likely@linaro.org>, Florian Vaussard <florian.vaussard@epfl.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, "anders.berg@lsi.com" <anders.berg@lsi.com>, Jason Cooper <jason@lakedaemon.net>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Marc
List-Id: devicetree@vger.kernel.org

On Tuesday 15 July 2014 06:59:13 Greg KH wrote:
> On Tue, Jul 15, 2014 at 01:11:42PM +0200, Matthias Brugger wrote:
> > The following changes since commit 7171511eaec5bf23fb06078f59784a3a0626b38f:
> > 
> >   Linux 3.16-rc1 (2014-06-15 17:45:28 -1000)
> > 
> > are available in the git repository at:
> > 
> >   https://github.com/mbgg/linux-mediatek.git tags/v3.17-next-basic-support
> 
> As these are only 7 patches, why do a git pull?  And I know I can't take
> pull requests from github, I'm not sure what the rules are for the ARM
> SoC developers either...
> 
> Just send patches, it's easier that way.

We generally prefer pull requests, but patches also work for us.

However, one note about the text in the pull request: Matthias,
please always try to be explicit about who you want to pull or
merge things when you are ready and list in the pull request the
other maintainers that have agreed to merging it (or whether they
have not sent an Ack yet, which is even more important).

In this case, the clocksource driver needs an Ack from the clocksource
maintainers, and the drivers/of/address.c changes need an Ack from the
OF maintainers. I assume you have those, but I'd have to first look
at the patches to be sure.

	arnd
