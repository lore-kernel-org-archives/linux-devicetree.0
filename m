From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77995: draak: Fix backlight
 regulator name
Date: Wed, 31 Jul 2019 08:47:38 -0600
Message-ID: <CAL_JsqJWJ+o6t2Wb162h7Xz98L=WPSi4une-EC0HfoRiWLmKWA@mail.gmail.com>
References: <20190731073744.13963-1-geert+renesas@glider.be>
 <20190731074801.5706-1-geert+renesas@glider.be>
 <20190731081209.GA5080@pendragon.ideasonboard.com>
 <CAMuHMdV9MEYP97_6RFhmbGGB8uY-Pi8S9q+m+XMmHzKHcibJwQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAMuHMdV9MEYP97_6RFhmbGGB8uY-Pi8S9q+m+XMmHzKHcibJwQ@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Mark Brown <broonie@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Johan Hovold <johan@kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Marek Vasut <marek.vasut+renesas@gmail.com>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 31, 2019 at 2:32 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Laurent,
>
> On Wed, Jul 31, 2019 at 10:12 AM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> > On Wed, Jul 31, 2019 at 09:48:01AM +0200, Geert Uytterhoeven wrote:
> > > Currently there are two nodes named "regulator1" in the Draak DTS: a
> > > 3.3V regulator for the eMMC and the LVDS decoder, and a 12V regulator
> > > for the backlight.  This causes the former to be overwritten by the
> > > latter.
> > >
> > > Fix this by renaming all regulators with numerical suffixes to use named
> > > suffixes, which are less likely to conflict.
> >
> > Aren't DT node names supposed to describe the device type, not a
> > particular instance of the device ? This is something that has bothered
> > me too, but I believe the naming scheme should be decided globally, not
> > per board. Is there precedent for using this scheme that has been
> > explicitly approved by the DT maintainers ?
>
> The example in Documentation/devicetree/bindings/regulator/regulator.yaml
> uses "regulator@0", which of course works only if #address-cells = 1, which
> is usually not the case for discrete regulators.
> BTW, the example lacks a "reg" property...

Yeah, that predates our being strict about unit-addresses.

> So some other suffix has to be added to distinguish individual "regulator"
> nodes.

<nodename>-<identifier> is basically the format we've been following
for cases without an address.

As long as we have a consistent base name that we can match schema
with, then I'm happy. But for regulators, we have a lot of node names
like 'buck1', 'LDO2', etc.

Rob
