Return-Path: <SRS0=Xf3c=A4=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 169CCC433E1
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jul 2020 14:33:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DD3112070E
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jul 2020 14:33:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="i1OkWVYz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726335AbgGQOdU (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 17 Jul 2020 10:33:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726079AbgGQOdT (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 17 Jul 2020 10:33:19 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B3BCC0619D2
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2020 07:33:19 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id by13so7864016edb.11
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2020 07:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=MI//z+nQVKSMCnCL0tY+ktwSFvhQ7QWboFw14FVGkkE=;
        b=i1OkWVYzB2WghwJJHDrzvX0zxv3Gcb+kO02lITUQxrrlYU4pn0VrL+v99feSDMsZdL
         1zR+MGDoCZogLyJ/B/qJcD53g5CCnC7vxSaRDqplXhPmGeSRO+TFHNh3xr2NMvYFwPs9
         TxQUG8HlPvc0KFR6ce0t+ap4LEqD+E+JRUSTk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=MI//z+nQVKSMCnCL0tY+ktwSFvhQ7QWboFw14FVGkkE=;
        b=snuIcwvTdPKFLI2CFiHu3X4opmX8Hu93SdrbYnLOIwYeWuAoVmKq8V8XtfKbvOIRbB
         3Md3RGHUWuJtPvFFInsgIYJYTSqln/KsjVc7jEfhHEvwNqlYKcTHWbR8oRUf1d2GfetS
         3RFYTVWEXJy2jtomXDTlR/3k7utQyM2san1NI8Gk2mpJX+TjMtS4DXK0Lkve46Y+MXhU
         tIG59Q3zt6VDILiY4anl608cts8FXsvegWj3USWJLbq2j/oMyN2pvcIOVKF2uULEeXWV
         5DZ94G8PSwMfG6tBJT+3foKhduSfMMTIs/awbAm1WMh2YvtQiheYgxiHYOngonyHxoEc
         j4aQ==
X-Gm-Message-State: AOAM5300B/sA3Q+MEZJhtcteL8LVOUJ+I3rJUnFJ36EjKS0O2pD1aobu
        JRBcz3+rRc7GpVCKFMRbdFQDBZi0C2I=
X-Google-Smtp-Source: ABdhPJxFIedMZqza1T8Uc0G5UhzCRXRkiL4LmUthHD80BYg+liQGsIuWk2074BPgJjk85sQcH0iPZA==
X-Received: by 2002:a50:ab52:: with SMTP id t18mr9680501edc.195.1594996397929;
        Fri, 17 Jul 2020 07:33:17 -0700 (PDT)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com. [209.85.128.43])
        by smtp.gmail.com with ESMTPSA id m6sm7908144ejq.85.2020.07.17.07.33.16
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2020 07:33:17 -0700 (PDT)
Received: by mail-wm1-f43.google.com with SMTP id 17so17373995wmo.1
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2020 07:33:16 -0700 (PDT)
X-Received: by 2002:a1c:9a81:: with SMTP id c123mr9386168wme.46.1594996396079;
 Fri, 17 Jul 2020 07:33:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200708104023.3225-1-louis.kuo@mediatek.com> <20200708104023.3225-2-louis.kuo@mediatek.com>
 <CAAOTY_-+v_t3Vv-Ms7k9jCxJ+0B9qb93tBkL=3OmpMLeyAdV-g@mail.gmail.com>
 <b7b77606aa3e476aa68b2fa116329f84@mtkmbs02n2.mediatek.inc> <CAAOTY__Jeu67-jajV5jysoTTXPoKXuXpvbGzHFYsUKG=j44sQg@mail.gmail.com>
In-Reply-To: <CAAOTY__Jeu67-jajV5jysoTTXPoKXuXpvbGzHFYsUKG=j44sQg@mail.gmail.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 17 Jul 2020 16:33:05 +0200
X-Gmail-Original-Message-ID: <CAAFQd5B=e6bcmeO5LBd7eqOWaVvbzPKEv2nJHUfpUVJ3ruFqRg@mail.gmail.com>
Message-ID: <CAAFQd5B=e6bcmeO5LBd7eqOWaVvbzPKEv2nJHUfpUVJ3ruFqRg@mail.gmail.com>
Subject: Re: [RFC PATCH V7 1/3] media: platform: mtk-isp: Add Mediatek sensor
 interface driver
To:     Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc:     =?UTF-8?B?TG91aXMgS3VvICjpg63lvrflr6cp?= <louis.kuo@mediatek.com>,
        "hans.verkuil@cisco.com" <hans.verkuil@cisco.com>,
        "laurent.pinchart+renesas@ideasonboard.com" 
        <laurent.pinchart+renesas@ideasonboard.com>,
        "keiichiw@chromium.org" <keiichiw@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        =?UTF-8?B?U2VhbiBDaGVuZyAo6YSt5piH5byYKQ==?= 
        <Sean.Cheng@mediatek.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        =?UTF-8?B?SmVycnktY2ggQ2hlbiAo6Zmz5pWs5oayKQ==?= 
        <Jerry-ch.Chen@mediatek.com>,
        =?UTF-8?B?SnVuZ28gTGluICjmnpfmmI7kv4op?= <jungo.lin@mediatek.com>,
        =?UTF-8?B?U2ogSHVhbmcgKOm7g+S/oeeSiyk=?= <sj.huang@mediatek.com>,
        "yuzhao@chromium.org" <yuzhao@chromium.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "zwisler@chromium.org" <zwisler@chromium.org>,
        =?UTF-8?B?Q2hyaXN0aWUgWXUgKOa4uOmbheaDoCk=?= 
        <christie.yu@mediatek.com>,
        =?UTF-8?B?RnJlZGVyaWMgQ2hlbiAo6Zmz5L+K5YWDKQ==?= 
        <Frederic.Chen@mediatek.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Jul 17, 2020 at 4:21 PM Chun-Kuang Hu <chunkuang.hu@kernel.org> wro=
te:
>
> Hi, Louis:
>
> Louis Kuo (=E9=83=AD=E5=BE=B7=E5=AF=A7) <louis.kuo@mediatek.com> =E6=96=
=BC 2020=E5=B9=B47=E6=9C=8817=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=
=8810:56=E5=AF=AB=E9=81=93=EF=BC=9A
> >
> > Hi Chun-Kuang,
> >
> > Since phy driver is not belong to V4L2 scope
> >
> > Should I need to upsteam 8183 mipi phy driver with new a patch other th=
an this one ?
>
> Yes, I think so. Maybe different series would be better.

Since both would not be usable without each other, I believe they
should be handled by the same series, although care should be taken to
have the patches in the series clearly separated between the two
subsystems.

Best regards,
Tomasz

>
> Regards,
> Chun-Kuang.
>
> >
> > BRs
> > Louis
> >
> > -----Original Message-----
> > From: Chun-Kuang Hu [mailto:chunkuang.hu@kernel.org]
> > Sent: Thursday, July 9, 2020 9:13 PM
> > To: Louis Kuo (=E9=83=AD=E5=BE=B7=E5=AF=A7)
> > Cc: hans.verkuil@cisco.com; laurent.pinchart+renesas@ideasonboard.com; =
Tomasz Figa; keiichiw@chromium.org; Matthias Brugger; Mauro Carvalho Chehab=
; devicetree@vger.kernel.org; Sean Cheng (=E9=84=AD=E6=98=87=E5=BC=98); srv=
_heupstream; Jerry-ch Chen (=E9=99=B3=E6=95=AC=E6=86=B2); Jungo Lin (=E6=9E=
=97=E6=98=8E=E4=BF=8A); Sj Huang (=E9=BB=83=E4=BF=A1=E7=92=8B); yuzhao@chro=
mium.org; moderated list:ARM/Mediatek SoC support; zwisler@chromium.org; Ch=
ristie Yu (=E6=B8=B8=E9=9B=85=E6=83=A0); Frederic Chen (=E9=99=B3=E4=BF=8A=
=E5=85=83); Linux ARM; linux-media@vger.kernel.org
> > Subject: Re: [RFC PATCH V7 1/3] media: platform: mtk-isp: Add Mediatek =
sensor interface driver
> >
> > Hi, Louis:
> >
> > Louis Kuo <louis.kuo@mediatek.com> =E6=96=BC 2020=E5=B9=B47=E6=9C=888=
=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=886:41=E5=AF=AB=E9=81=93=EF=BC=
=9A
> > >
> > > This patch adds Mediatek's sensor interface driver. Sensor interface
> > > driver is a MIPI-CSI2 host driver, namely, a HW camera interface cont=
roller.
> > > It support a widely adopted, simple, high-speed protocol primarily
> > > intended for point-to-point image and video transmission between
> > > cameras and host devices. The mtk-isp directory will contain drivers
> > > for multiple IP blocks found in Mediatek ISP system. It will include
> > > ISP Pass 1 driver, sensor interface driver, DIP driver and face detec=
tion driver.
> > >
> > > Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
> > > ---
> > >  drivers/media/platform/Makefile               |    1 +
> > >  drivers/media/platform/mtk-isp/Kconfig        |   18 +
> > >  drivers/media/platform/mtk-isp/Makefile       |    3 +
> > >  .../media/platform/mtk-isp/seninf/Makefile    |    7 +
> > >  .../platform/mtk-isp/seninf/mtk_seninf.c      |  974 +++++++++++
> > >  .../platform/mtk-isp/seninf/mtk_seninf_dphy.c |  353 ++++
> >
> > I think phy driver should be placed in drivers/phy/mediatek and separat=
e phy driver to an independent patch.
> >
> > >  .../platform/mtk-isp/seninf/mtk_seninf_reg.h  | 1491 +++++++++++++++=
++
> > >  .../mtk-isp/seninf/mtk_seninf_rx_reg.h        |  515 ++++++
> > >  8 files changed, 3362 insertions(+)
> > >  create mode 100644 drivers/media/platform/mtk-isp/Kconfig
> > >  create mode 100644 drivers/media/platform/mtk-isp/Makefile
> > >  create mode 100644 drivers/media/platform/mtk-isp/seninf/Makefile
> > >  create mode 100644 drivers/media/platform/mtk-isp/seninf/mtk_seninf.=
c
> > >  create mode 100644
> > > drivers/media/platform/mtk-isp/seninf/mtk_seninf_dphy.c
> > >  create mode 100644
> > > drivers/media/platform/mtk-isp/seninf/mtk_seninf_reg.h
> > >  create mode 100644
> > > drivers/media/platform/mtk-isp/seninf/mtk_seninf_rx_reg.h
> > >
> >
> > [snip]
> >
> > > +
> > > +#include <linux/clk.h>
> > > +#include <linux/delay.h>
> > > +#include <linux/interrupt.h>
> > > +#include <linux/module.h>
> > > +#include <linux/of_graph.h>
> > > +#include <linux/of_irq.h>
> >
> > No irq handler, so remove this.
> >
> > > +#include <linux/platform_device.h>
> > > +#include <linux/pm_runtime.h>
> > > +#include <linux/slab.h>
> > > +#include <linux/videodev2.h>
> > > +#include <media/v4l2-async.h>
> > > +#include <media/v4l2-ctrls.h>
> > > +#include <media/v4l2-event.h>
> > > +#include <media/v4l2-fwnode.h>
> > > +#include <media/v4l2-subdev.h>
> > > +#include <linux/phy/phy.h>
> > > +#include "mtk_seninf_reg.h"
> > > +
> >
> > [snip]
> >
> > > +
> > > +static int seninf_set_ctrl(struct v4l2_ctrl *ctrl) {
> > > +       struct mtk_seninf *priv =3D container_of(ctrl->handler,
> > > +                                            struct mtk_seninf,
> > > +ctrl_handler);
> > > +
> > > +       switch (ctrl->id) {
> > > +       case V4L2_CID_TEST_PATTERN:
> > > +               if (ctrl->val =3D=3D TEST_GEN_PATTERN)
> > > +                       return seninf_enable_test_pattern(priv);
> >
> > Without this, this driver still works, so move this to an independent p=
atch.
> >
> > > +               else if (ctrl->val =3D=3D TEST_DUMP_DEBUG_INFO)
> > > +                       return seninf_dump_debug_info(priv);
> >
> > Ditto.
> >
> > > +               else
> > > +                       return -EINVAL;
> > > +       }
> > > +
> > > +       return 0;
> > > +}
> > > +
> >
> > [snip]
> >
> > > +
> > > +#ifdef CONFIG_OF
> > > +static const struct of_device_id mtk_mipi_dphy_of_match[] =3D {
> > > +       {.compatible =3D "mediatek,mt8183-mipi_dphy"},
> >
> > Where is the definition of "mediatek,mt8183-mipi_dphy"?
> >
> > Regards,
> > Chun-Kuang.
> >
> > > +       {},
> > > +};
> > > +MODULE_DEVICE_TABLE(of, mtk_mipi_dphy_of_match); #endif
> > > +
> > > +static struct platform_driver mipi_dphy_pdrv =3D {
> > > +       .probe  =3D mipi_dphy_probe,
> > > +       .driver =3D {
> > > +               .name   =3D "mipi_dphy",
> > > +               .of_match_table =3D of_match_ptr(mtk_mipi_dphy_of_mat=
ch),
> > > +       },
> > > +};
> > > +
> > > +module_platform_driver(mipi_dphy_pdrv);
> > > +
