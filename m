From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77995: draak: Fix backlight
 regulator name
Date: Wed, 31 Jul 2019 10:32:42 +0200
Message-ID: <CAMuHMdV9MEYP97_6RFhmbGGB8uY-Pi8S9q+m+XMmHzKHcibJwQ@mail.gmail.com>
References: <20190731073744.13963-1-geert+renesas@glider.be>
 <20190731074801.5706-1-geert+renesas@glider.be>
 <20190731081209.GA5080@pendragon.ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190731081209.GA5080@pendragon.ideasonboard.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Johan Hovold <johan@kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Marek Vasut <marek.vasut+renesas@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Laurent,

On Wed, Jul 31, 2019 at 10:12 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Wed, Jul 31, 2019 at 09:48:01AM +0200, Geert Uytterhoeven wrote:
> > Currently there are two nodes named "regulator1" in the Draak DTS: a
> > 3.3V regulator for the eMMC and the LVDS decoder, and a 12V regulator
> > for the backlight.  This causes the former to be overwritten by the
> > latter.
> >
> > Fix this by renaming all regulators with numerical suffixes to use named
> > suffixes, which are less likely to conflict.
>
> Aren't DT node names supposed to describe the device type, not a
> particular instance of the device ? This is something that has bothered
> me too, but I believe the naming scheme should be decided globally, not
> per board. Is there precedent for using this scheme that has been
> explicitly approved by the DT maintainers ?

The example in Documentation/devicetree/bindings/regulator/regulator.yaml
uses "regulator@0", which of course works only if #address-cells = 1, which
is usually not the case for discrete regulators.
BTW, the example lacks a "reg" property...

So some other suffix has to be added to distinguish individual "regulator"
nodes.

The example in Documentation/devicetree/bindings/regulator/fixed-regulator.yaml
uses "regulator-1v8" since commit b735f41dcb06ae06 ("dt-bindings: regulator:
update fixed-regulator example"), which received a Reviewed-by from Rob
after it was committed.
https://lore.kernel.org/lkml/CAL_Jsq+rRYazOqtjNms0cTK0HpkxCkmZ4JXoLM7ZaPivATEO8A@mail.gmail.com/

Looks good enough to me ;-)

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
