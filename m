From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH 3/5] drm: rcar-du: Add r8a77470 support
Date: Tue, 16 Oct 2018 15:19:36 +0000
Message-ID: <TY1PR01MB177079522CBA3E2B4180C923C0FE0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1537553311-8831-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1537553311-8831-4-git-send-email-fabrizio.castro@bp.renesas.com>
 <1733512.u0bX59egiB@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1733512.u0bX59egiB@avalon>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Chris Paterson <Chris.Paterson2@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Biju Das <biju.das@bp.renesas.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hello Laurent,

Thank you for your feedback.

> Subject: Re: [PATCH 3/5] drm: rcar-du: Add r8a77470 support
>
> Hi Fabrizio,
>
> Thank you for the patch.
>
> On Friday, 21 September 2018 21:08:29 EEST Fabrizio Castro wrote:
> > Add RZ/G1C (a.k.a. r8a77470) support to the R-Car DU driver.
> >
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das@bp.renesas.com>
> > ---
> >  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 26 ++++++++++++++++++++++++++
> >  1 file changed, 26 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > b/drivers/gpu/drm/rcar-du/rcar_du_drv.c index 02aee6c..c07d3f1 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > @@ -77,6 +77,31 @@ static const struct rcar_du_device_info
> > rzg1_du_r8a7745_info = { },
> >  };
> >
> > +static const struct rcar_du_device_info rzg1_du_r8a77470_info = {
> > +.gen = 2,
> > +.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
> > +  | RCAR_DU_FEATURE_EXT_CTRL_REGS,
>
> The DU driver has recently gained two new feature flags,
> RCAR_DU_FEATURE_INTERLACED and RCAR_DU_FEATURE_TVM_SYNC. I believe that both
> should be set here. Could you please confirm (and test) ?

I can confirm that both feature flags need to be set and all the test pass.
Will send a new version for this.

>
> > +.channels_mask = BIT(1) | BIT(0),
> > +.routes = {
> > +/*
> > + * R8A77470 has two RGB outputs, one LVDS output, and
> > + * one analog video output (unsupported)
>
> I'd write this "and one (currently unsupported) analog video output" to match
> the other device entries. With this fixed,

Will fix this as well.

Thanks,
Fab

>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> > + */
> > +[RCAR_DU_OUTPUT_DPAD0] = {
> > +.possible_crtcs = BIT(0),
> > +.port = 0,
> > +},
> > +[RCAR_DU_OUTPUT_DPAD1] = {
> > +.possible_crtcs = BIT(1),
> > +.port = 1,
> > +},
> > +[RCAR_DU_OUTPUT_LVDS0] = {
> > +.possible_crtcs = BIT(0) | BIT(1),
> > +.port = 2,
> > +},
> > +},
> > +};
> > +
> >  static const struct rcar_du_device_info rcar_du_r8a7779_info = {
> >  .gen = 2,
> >  .features = 0,
> > @@ -297,6 +322,7 @@ static const struct rcar_du_device_info
> > rcar_du_r8a77970_info = { static const struct of_device_id
> > rcar_du_of_table[] = {
> >  { .compatible = "renesas,du-r8a7743", .data = &rzg1_du_r8a7743_info },
> >  { .compatible = "renesas,du-r8a7745", .data = &rzg1_du_r8a7745_info },
> > +{ .compatible = "renesas,du-r8a77470", .data = &rzg1_du_r8a77470_info },
> >  { .compatible = "renesas,du-r8a7779", .data = &rcar_du_r8a7779_info },
> >  { .compatible = "renesas,du-r8a7790", .data = &rcar_du_r8a7790_info },
> >  { .compatible = "renesas,du-r8a7791", .data = &rcar_du_r8a7791_info },
>
> --
> Regards,
>
> Laurent Pinchart
>
>




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, Buckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered No. 04586709.
