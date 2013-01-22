From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 2/7] ARM: sunxi: Add pinctrl driver for Allwinner SoCs
Date: Tue, 22 Jan 2013 00:09:20 -0800
Message-ID: <20130122080920.GB27384@quad.lixom.net>
References: <1358544639-14761-1-git-send-email-maxime.ripard@free-electrons.com>
 <1358544639-14761-3-git-send-email-maxime.ripard@free-electrons.com>
 <CACRpkdb8xLeP+RB+JfuEQu=MQ0yO6tVFasVrMsOE4FSfJHrOiw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdb8xLeP+RB+JfuEQu=MQ0yO6tVFasVrMsOE4FSfJHrOiw@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, arm@kernel.org, Arnd Bergmann <arnd@arndb.de>, Stefan Roese <sr@denx.de>, Alejandro Mery <amery@geeks.cl>, linux-arm-kernel@lists.infradead.org, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Jan 21, 2013 at 11:09:07PM +0100, Linus Walleij wrote:
> On Fri, Jan 18, 2013 at 10:30 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > The Allwinner SoCs have an IP module that handle both the muxing and the
> > GPIOs.
> >
> > This IP has 8 banks of 32 bits, with a number of pins actually useful
> > for each of these banks varying from one to another, and depending on
> > the SoC used on the board.
> >
> > This driver only implements the pinctrl part, the gpio part will come
> > eventually.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> 
> Patch title says "ARM: " but all changed except one line is to the pinctrl
> tree so I have applied it to the pinctrl tree on a separate allwinner
> branch for now (will merge it to devel when deemde stable).
> 
> ARM SoC boys: can I have an ACK on this oneliner?

Acked-by: Olof Johansson <olof@lixom.net>


-Olof
