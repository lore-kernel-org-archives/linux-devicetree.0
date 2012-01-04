From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCHv3 1/3] gpio: add a driver for the Synopsys DesignWare APB
 GPIO block
Date: Wed, 4 Jan 2012 11:24:10 -0700
Message-ID: <20120104182410.GT15503@ponder.secretlab.ca>
References: <1325508798-25439-1-git-send-email-jamie@jamieiles.com>
 <1325508798-25439-2-git-send-email-jamie@jamieiles.com>
 <20120102132500.GB18443@sirena.org.uk>
 <CACRpkdYxjVG2XVb5iXPmVe5uTcpemBkOA-=AcuyNx-9cWPpaiA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdYxjVG2XVb5iXPmVe5uTcpemBkOA-=AcuyNx-9cWPpaiA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, Jamie Iles <jamie@jamieiles.com>, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linus.walleij@stericsson.com
List-Id: devicetree@vger.kernel.org

On Mon, Jan 02, 2012 at 02:48:40PM +0100, Linus Walleij wrote:
> On Mon, Jan 2, 2012 at 2:25 PM, Mark Brown
> <broonie@opensource.wolfsonmicro.com> wrote:
>=20
> > On Mon, Jan 02, 2012 at 12:53:16PM +0000, Jamie Iles wrote:
> >> The Synopsys DesignWare block is used in some ARM devices (picoxce=
ll)
> >> and can be configured to provide multiple banks of GPIO pins.
> >>
> >> v3: =A0 - depend on rather than select IRQ_DOMAIN
> >> =A0 =A0 =A0 - split IRQ support into a separate patch
> >> v2: =A0 - use Rob Herring's irqdomain in generic irq chip patches
> >> =A0 =A0 =A0 - use reg property to indicate bank index
> >> =A0 =A0 =A0 - support irqs on both edges based on LinusW's u300 dr=
iver
> >
> > Put stuff like this after the ---, it shouldn't end up in git histo=
ry.
>=20
> The other day I was being told the exact opposite by Grant
> Likely, so which one is it?

It's the preference of whatever maintainer will actually be picking up
the patch.  :-)  There is no definitive answer.
