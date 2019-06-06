From: Harald Geyer <harald@ccbib.org>
Subject: Re: [PATCH v2 7/7] arm64: dts: allwinner: a64: enable ANX6345 bridge
 on Teres-I
Date: Thu, 06 Jun 2019 15:59:27 +0200
Message-ID: <E1hYsvP-0000PY-Pz@stardust.g4.wien.funkfeuer.at>
References: <20190604122150.29D6468B05@newverein.lst.de>
 <20190604122308.98D4868B20@newverein.lst.de>
 <CA+E=qVckHLqRngsfK=AcvstrD0ymEfRkYyhS_kBtZ3YWdE3L=g@mail.gmail.com>
 <20190605101317.GA9345@lst.de> <20190605120237.ekmytfxcwbjaqy3x@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <20190605120237.ekmytfxcwbjaqy3x@flea>
Content-ID: <1582.1559829566.1@stardust.g4.wien.funkfeuer.at>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Sean Paul <seanpaul@chromium.org>, David Airlie <airlied@linux.ie>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Andrzej Hajda <a.hajda@samsung.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Torsten Duwe <duwe@lst.de>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Daniel Vetter <daniel@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, arm-linux <linux-arm-kernel@lists.infradead.org>, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org

Guys, this discussion is getting heated for no reason. Let's put
personal frustrations aside and discuss the issue on its merits:

Maxime Ripard writes:
> On Wed, Jun 05, 2019 at 12:13:17PM +0200, Torsten Duwe wrote:
> > On Tue, Jun 04, 2019 at 08:08:40AM -0700, Vasily Khoruzhick wrote:
> > > On Tue, Jun 4, 2019 at 5:23 AM Torsten Duwe <duwe@lst.de> wrote:
> > > >
> > > > Teres-I has an anx6345 bridge connected to the RGB666 LCD output, and
> > > > the I2C controlling signals are connected to I2C0 bus. eDP output goes
> > > > to an Innolux N116BGE panel.
> > > >
> > > > Enable it in the device tree.
> > > >
> > > > Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> > > > Signed-off-by: Torsten Duwe <duwe@suse.de>
> > > > ---
> > > >  .../boot/dts/allwinner/sun50i-a64-teres-i.dts      | 65 ++++++++++++++++++++--
> > > >  1 file changed, 61 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
> > > > index 0ec46b969a75..a0ad438b037f 100644
> > > > --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
> > > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
> > > > @@ -65,6 +65,21 @@
> > > >                 };
> > > >         };
> > > >
> > > > +       panel: panel {
> > > > +               compatible ="innolux,n116bge", "simple-panel";
> > >
> > > It's still "simple-panel". I believe I already mentioned that Rob
> > > asked it to be edp-connector.

Actually just dropping the "simple-panel" compatible would be a poor
choice. Even if "edp-connector" is specified as binding and implemented in a
driver, there are older kernel versions and other operating systems to
keep in mind. If the HW works with "simple-panel" driver satisfactorily,
we should definitely keep the compatible as a fall back for cases where
the edp-connector driver is unavailable.

If think valid compatible properties would be:
compatible = "innolux,n116bge", "simple-panel";
compatible = "edp-connector", "simple-panel";
compatible = "innolux,n116bge", "edp-connector", "simple-panel";
compatible = "edp-connector", "innolux,n116bge", "simple-panel";

I can't make up my mind which one I prefere. However neither of these
variants requires actually implmenting an edp-connector driver. And each
of these variants is clearly preferable to shipping DTs without
description of the panel at all and complies with bindings after adding
a stub for "edp-connector".

> And the DT is considered an ABI, so yeah, we will witheld everything
> that doesn't fit what we would like.

I fail to see how the patch in discussion adds new ABI. While I understand
the need to pester contributors for more work, outright blocking DTs, that
properly describe the HW and comply with existing bindings, seems a
bit unreasonable. (Assuming there are no other issues of course.)

Also note that the innolux,n116bge binding suggestes using simple-panel
as fallback.

HTH,
Harald

-- 
If you want to support my work:
see http://friends.ccbib.org/harald/supporting/
or donate via CLAM to xASPBtezLNqj4cUe8MT5nZjthRSEjrRQXN
or via peercoin to P98LRdhit3gZbHDBe7ta5jtXrMJUms4p7w
