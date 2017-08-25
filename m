From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH] dmaengine: usb-dmac: Add soctype for R-Car M3-W
Date: Fri, 25 Aug 2017 06:42:19 +0000
Message-ID: <TY1PR06MB0992C8FC508BCC46EBD3DA14D89B0@TY1PR06MB0992.apcprd06.prod.outlook.com>
References: <1501673614-6633-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20170810162538.j5whbtnucs3jkojh@rob-hp-laptop>
 <TY1PR06MB09923952ABA99387E9A27A8AD89B0@TY1PR06MB0992.apcprd06.prod.outlook.com>
 <20170825063315.GP3053@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20170825063315.GP3053@localhost>
Content-Language: ja-JP
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: Rob Herring <robh@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi, Vinod,

Thank you for reply!

> From: Vinod Koul
> Sent: Friday, August 25, 2017 3:33 PM
>=20
> On Fri, Aug 25, 2017 at 05:47:22AM +0000, Yoshihiro Shimoda wrote:
> > Hi Rob,
> >
> > > From: Rob Herring
> > > Sent: Friday, August 11, 2017 1:26 AM
> > >
> > > On Wed, Aug 02, 2017 at 08:33:34PM +0900, Yoshihiro Shimoda wrote:
> > > > This patch adds R-Car M3-W device tree bindings for usb-dmac driver=
.
> > > >
> > > > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > > > ---
> > > >  Documentation/devicetree/bindings/dma/renesas,usb-dmac.txt | 1 +
> > > >  1 file changed, 1 insertion(+)
> > >
> > > Acked-by: Rob Herring <robh@kernel.org>
> >
> > Thank you for your Acked-by!
> >
> > Hi, Vinod,
> >
> > I checked your next branch today, but it doesn't have this patch.
> > So, would you apply this patch into your repo?
>=20
> Can you check again, i can see it and also on Web UI
>=20
> http://git.infradead.org/users/vkoul/slave-dma.git/commit/2d166e66aca3e83=
2cb0851da7d0183090dd699d4

Oops! I looked at other repo (https://git.kernel.org/pub/scm/linux/kernel/g=
it/vkoul/slave-dma.git/).
I forgot the repo was changed.

Thank you for applying this patch!

Best regards,
Yoshihiro Shimoda

> --
> ~Vinod
> --
> To unsubscribe from this list: send the line "unsubscribe dmaengine" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
