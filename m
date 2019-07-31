From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77995: draak: Fix backlight
 regulator name
Date: Wed, 31 Jul 2019 10:40:22 -0600
Message-ID: <CAL_Jsq+qfGrrfG68WKSsHF2MoLBNi5m9w9x68dT+ZAG9fcWEjg@mail.gmail.com>
References: <20190731073744.13963-1-geert+renesas@glider.be>
 <20190731074801.5706-1-geert+renesas@glider.be>
 <20190731081209.GA5080@pendragon.ideasonboard.com>
 <CAMuHMdV9MEYP97_6RFhmbGGB8uY-Pi8S9q+m+XMmHzKHcibJwQ@mail.gmail.com>
 <CAL_JsqJWJ+o6t2Wb162h7Xz98L=WPSi4une-EC0HfoRiWLmKWA@mail.gmail.com>
 <20190731150909.GD4369@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190731150909.GD4369@sirena.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Brown <broonie@kernel.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Johan Hovold <johan@kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert@linux-m68k.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Marek Vasut <marek.vasut+renesas@gmail.com>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 31, 2019 at 9:09 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Wed, Jul 31, 2019 at 08:47:38AM -0600, Rob Herring wrote:
>
> > As long as we have a consistent base name that we can match schema
> > with, then I'm happy. But for regulators, we have a lot of node names
> > like 'buck1', 'LDO2', etc.
>
> Those are all types of regulator (LDOs and DCDCs are the main types of
> voltage regulator, and buck is another term for DCDC).

Yes, I know.

> I'm still not clear what meaningful effect any of this node name stuff
> has :(

It is primarily just what I said. Standard names or patterns allow for
applying schemas. Otherwise, we only have schema checks when we have a
device specific schema. Of course, we do have those too, but generic
ones are useful when we don't. If there are errors in the DT causing
the device specific schema to not match (say a typo in the compatible
string), we still have some checking.

Rob
