Return-Path: <SRS0=mVKz=7P=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DA6AC433E3
	for <linux-devicetree@archiver.kernel.org>; Tue,  2 Jun 2020 14:58:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1EB2A2074B
	for <linux-devicetree@archiver.kernel.org>; Tue,  2 Jun 2020 14:58:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QtyDH/oC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725958AbgFBO6u (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 2 Jun 2020 10:58:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726429AbgFBO6t (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 2 Jun 2020 10:58:49 -0400
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FCC1C08C5C0
        for <devicetree@vger.kernel.org>; Tue,  2 Jun 2020 07:58:48 -0700 (PDT)
Received: by mail-vs1-xe43.google.com with SMTP id z13so2174611vsn.10
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2020 07:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=R19nSqfwFjKMbuCUuu45u3kNS6yK2MxJbjwL6/Xuo9k=;
        b=QtyDH/oCp6chj8kOasNywBh1tJ4Q7G9pC+F167iYrTPdp1ztf7nbls3DqELN0+00Xo
         IsFgDlS0nAqz+u2di0I2mUjHunwzdNubX0VyAVhYNfWjmHFSXAYLWqyMvPUC1S+Rj2sN
         NOBlljkssJ79TXC2eKmB7fGve+Y186MvRe50O4NwXum67P0KSCWiOrgNz9LE1AmcghMl
         HynI5UNYyUrWiZkLi2rlEPBOlQQVw5YjIjG6bsNWAKsZ5yoAlxFj2Y7J2/VdYHnynN6L
         PvP+k3NgvyaDq9Y90LprGcYw06eMkb/5XKJgVCXRmvV0SjBtLLyM9N1EQnNswRgiVyun
         TlUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=R19nSqfwFjKMbuCUuu45u3kNS6yK2MxJbjwL6/Xuo9k=;
        b=WJFLSs0EXc2+7ogemK5appKnHbeV+ptfnENSpp2GDFmRna2HuKa+BSnim1m3u/L32s
         o9FQXi8ybGpPgA/44PNS9EHu214qZ9izCc62DsyQbWwqgxnpalF+q1Cr4DXbfFAf/0LX
         yfuCyGgBK65DYgYCZOLST0Vh9gC08MSI+wkkWBI4Hkc4W9uGBRcFiCnwG42zLUwM4ZvS
         eC4rl1JUF8CjrmipSI2hJKjgSgJm0G2utArryobJ8gxaWjAWLlU4TSgAEQtPFtQjIGpk
         ed8Mnh2lgblSNhC4Z3ESPWK+/T8tID6CYvK8+xgwmyypUeqENh4MyUGZT8IAoi2XxZds
         +xJw==
X-Gm-Message-State: AOAM532Wg1oNmOkMFc+jWvu+0SfJiCua7aclORXlc96FLwu8Tbq0Vsbc
        /O3DN/5BY9yP9xbdiNPeEuuSu4cPqlYm03YSLLc=
X-Google-Smtp-Source: ABdhPJxBsPOjIwVhzgw6ohk6Ca8GFwuXLv/XpCGa7jqnU+naJk9H8cjHrKmn3MpnPlo+JlpG14YvfUu+P80O0TyV+08=
X-Received: by 2002:a67:3291:: with SMTP id y139mr6277739vsy.37.1591109927542;
 Tue, 02 Jun 2020 07:58:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200601083309.712606-1-sam@ravnborg.org> <20200601083309.712606-3-sam@ravnborg.org>
 <CAD=FV=VSyODjtVtEe6H46U6xNraD2LUUi+xt8cxraaqXom=64g@mail.gmail.com>
In-Reply-To: <CAD=FV=VSyODjtVtEe6H46U6xNraD2LUUi+xt8cxraaqXom=64g@mail.gmail.com>
From:   Emil Velikov <emil.l.velikov@gmail.com>
Date:   Tue, 2 Jun 2020 15:55:29 +0100
Message-ID: <CACvgo52e_VE=oPz=A_rc=gkiSx+TqgPUm7smfe8yG6YYLHn+pA@mail.gmail.com>
Subject: Re: [PATCH v1 2/6] drm: panel-simple: add Seiko 70WVW2T 7" simple panel
To:     Doug Anderson <dianders@chromium.org>
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?S=C3=B8ren_Andersen?= <san@skov.dk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, 2 Jun 2020 at 01:31, Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Mon, Jun 1, 2020 at 1:33 AM Sam Ravnborg <sam@ravnborg.org> wrote:
> >
> > The Seiko 70WVW2T is a discontinued product, but may be used somewhere.
> > Tested on a proprietary product.
> >
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Cc: S=C3=B8ren Andersen <san@skov.dk>
> > Cc: Thierry Reding <thierry.reding@gmail.com>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > ---
> >  drivers/gpu/drm/panel/panel-simple.c | 28 ++++++++++++++++++++++++++++
> >  1 file changed, 28 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/pan=
el/panel-simple.c
> > index b067f66cea0e..8624bb80108c 100644
> > --- a/drivers/gpu/drm/panel/panel-simple.c
> > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > @@ -3194,6 +3194,31 @@ static const struct panel_desc shelly_sca07010_b=
fn_lnn =3D {
> >         .bus_format =3D MEDIA_BUS_FMT_RGB666_1X18,
> >  };
> >
> > +static const struct drm_display_mode sii_70wvw2t_mode =3D {
> > +       .clock =3D 33000,
> > +       .hdisplay =3D 800,
> > +       .hsync_start =3D 800 + 256,
> > +       .hsync_end =3D 800 + 256 + 0,
> > +       .htotal =3D 800 + 256 + 0 + 0,
> > +       .vdisplay =3D 480,
> > +       .vsync_start =3D 480 + 0,
> > +       .vsync_end =3D 480 + 0 + 0,
> > +       .vtotal =3D 480 + 0 + 0 + 45,
>
> Important to have a "vrefresh"?
>
Ville posted a series (most of which already landed) getting removing
vrefresh all together. The overall idea is to compute it, in the rare
case it's needed.


>
> > +       .flags =3D DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
> > +};
> > +
> > +static const struct panel_desc sii_70wvw2t =3D {
> > +       .modes =3D &sii_70wvw2t_mode,
> > +       .num_modes =3D 1,
>
> Do we want "bpc =3D 6"?
>
The largest user of bpc is userspace - the data gets copied via the ioctls.

A secondary, and quite limited, user are drivers exposing the "max
bpc" connector property. From a quick look: amdgpu, the synopsys
dw-hdmi bridge and i915 do so. In case the data missing, atomics
assume a max 8 bpc.

>
> > +       .size =3D {
> > +               .width =3D 152,
> > +               .height =3D 91,
> > +       },
> > +       .bus_format =3D MEDIA_BUS_FMT_RGB888_1X24,
>
> Should this be a 666 format?  Random internet-found data sheet says
> 262K colors...

Good catch. Would be nice to have a spec sheet link (even if random)
in the commit message.

HTH
-Emil
