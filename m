From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 4/4] dt-bindings: arm: Document Renesas R-Car M3-N-based
 Salvator-XS board
Date: Wed, 28 Feb 2018 07:52:16 +0100
Message-ID: <20180228065215.a3gzcwjsgvdcblu4@verge.net.au>
References: <1519668225-12548-1-git-send-email-geert+renesas@glider.be>
 <1519668225-12548-5-git-send-email-geert+renesas@glider.be>
 <20180227082514.h2pfc7a5qpceb2mb@verge.net.au>
 <TY1PR06MB0702A5B4087711A3EF947893B7C00@TY1PR06MB0702.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <TY1PR06MB0702A5B4087711A3EF947893B7C00@TY1PR06MB0702.apcprd06.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chris Paterson <Chris.Paterson2@renesas.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 27, 2018 at 08:41:13AM +0000, Chris Paterson wrote:
> Hello Simon,
> 
> > From: devicetree-owner@vger.kernel.org [mailto:devicetree-
> > owner@vger.kernel.org] On Behalf Of Simon Horman
> > Sent: 27 February 2018 08:25
> > 
> > On Mon, Feb 26, 2018 at 07:03:45PM +0100, Geert Uytterhoeven wrote:
> > > The Renesas Salvator-XS development board can be equipped with an
> > > R-Car H3, M3-W, or M3-N SiP, which are pin-compatible.
> > >
> > > Document board part number and compatible values for the version with
> > > R-Car M3-N.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > >  Documentation/devicetree/bindings/arm/shmobile.txt | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt
> > > b/Documentation/devicetree/bindings/arm/shmobile.txt
> > > index 51e4428856be4557..303f04e639431837 100644
> > > --- a/Documentation/devicetree/bindings/arm/shmobile.txt
> > > +++ b/Documentation/devicetree/bindings/arm/shmobile.txt
> > > @@ -114,6 +114,8 @@ Boards:
> > >      compatible = "renesas,salvator-xs", "renesas,r8a7795"
> > >    - Salvator-XS (Salvator-X 2nd version, RTP0RC7796SIPB0012S)
> > >      compatible = "renesas,salvator-xs", "renesas,r8a7796"
> > > +  - Salvator-XS (Salvator-X 2nd version, RTP0RC77965SIPB012S)
> > > +    compatible = "renesas,salvator-xs", "renesas,r8a77965"
> > 
> > I am unsure how to verify this part number, can anyone help?
> 
> This matches the label on the board.

Thanks, applied.
