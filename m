From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH 4/5] drm: rcar-du: Add R8A7744 support
Date: Fri, 23 Nov 2018 12:32:09 +0000
Message-ID: <TY1PR01MB17703AC2B9D5D9E86D172769C0D40@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1537553311-8831-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <5135719.5JoeYGyzrK@avalon>
 <TY1PR01MB17707049DE6A8FD71E032157C0DB0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <2739044.1unFEStFin@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <2739044.1unFEStFin@avalon>
Content-Language: en-US
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
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, David Airlie <airlied@linux.ie>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Biju Das <biju.das@bp.renesas.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Thank you Laurent.

Cheers,
Fab

> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Sent: 23 November 2018 12:05
> Subject: Re: [PATCH 4/5] drm: rcar-du: Add R8A7744 support
>
> Hi Fabrizio,
>
> On Thursday, 22 November 2018 17:59:32 EET Fabrizio Castro wrote:
> > On 15 October 2018 23:25 Laurent Pinchart wrote:
> > > On Friday, 21 September 2018 21:08:30 EEST Fabrizio Castro wrote:
> > >> From: Biju Das <biju.das@bp.renesas.com>
> > >>
> > >> Add support for the R8A7744 DU (which is very similar to the R8A7743
> > >> DU);
> > >> it has 1 DPAD (RGB) output and 1 LVDS output.
> > >>
> > >> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > >> Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > >> ---
> > >>
> > >>  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 1 +
> > >>  1 file changed, 1 insertion(+)
> > >>
> > >> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > >> b/drivers/gpu/drm/rcar-du/rcar_du_drv.c index c07d3f1..2c3d0e5 100644
> > >> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > >> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > >> @@ -321,6 +321,7 @@ static const struct rcar_du_device_info
> > >> rcar_du_r8a77970_info = {
> > >>  static const struct of_device_id rcar_du_of_table[] = {
> > >>  { .compatible = "renesas,du-r8a7743", .data = &rzg1_du_r8a7743_info },
> > >> +{ .compatible = "renesas,du-r8a7744", .data = &rzg1_du_r8a7743_info },
> > >>  { .compatible = "renesas,du-r8a7745", .data = &rzg1_du_r8a7745_info },
> > >>  { .compatible = "renesas,du-r8a77470", .data = &rzg1_du_r8a77470_info
> > >>  },
> > >>  { .compatible = "renesas,du-r8a7779", .data = &rcar_du_r8a7779_info },
> > >
> > > This looks good to me. I would also apply this change:
> > >
> > > @@ -41,7 +41,7 @@ static const struct rcar_du_device_info
> > > rzg1_du_r8a7743_info = {
> > >         .channels_mask = BIT(1) | BIT(0),
> > >         .routes = {
> > >                 /*
> > > -                * R8A7743 has one RGB output and one LVDS output
> > > +                * R8A774[34] has one RGB output and one LVDS output
> > >                  */
> > >                 [RCAR_DU_OUTPUT_DPAD0] = {
> > >                         .possible_crtcs = BIT(1) | BIT(0),
> > >
> > > With this,
> > >
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > >
> > > There's no need to resubmit, I've applied the patch to my tree with the
> > > above change.
> >
> > I was expecting to see this patch at least on linux-next by now but it looks
> > like it's not in there, could you please double check what happened to it?
>
> I've sent the R-Car DU v4.21 pull request today, it should end up in linux-
> next in the near future.
>
> --
> Regards,
>
> Laurent Pinchart
>
>




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, Buckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered No. 04586709.
