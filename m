Return-Path: <SRS0=bA0P=AA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46DFCC433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 19 Jun 2020 06:45:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 124BC20707
	for <linux-devicetree@archiver.kernel.org>; Fri, 19 Jun 2020 06:45:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aQNtkGJE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728137AbgFSGpV (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 19 Jun 2020 02:45:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725778AbgFSGpV (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 19 Jun 2020 02:45:21 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB3E5C06174E;
        Thu, 18 Jun 2020 23:45:19 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id x25so6707824edr.8;
        Thu, 18 Jun 2020 23:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=DKO6CxKSoxCYH8dV1mmPYYB2j5avZgmpaYuGkq/JsPE=;
        b=aQNtkGJEpVjV/aQDTnahfDBhbrLB2Itmx+NtU7u3ON0bU2tCjh4oaCvLcWj6W9DK9J
         IYacFIeilsq5iNp2MI8dde1cKNwqX1N04lQjb1YWrN4ZG0XWiqfWZW13pobNq/RTTp3i
         iCLdqWW/oJNVdWLblcoi8gdWdyUqZb0AgtOz+JlMXg3LPgJNe8zOvoUIks5FUIdBaBQC
         g2gKIKULCFd79iBQHbcCpeu+aETc5D/yrDHF/W0tVKyjM1zlZ7RmOdUGfGJ8fKbvb8XD
         jpVKFDGZKqlbQgQMAh2wA9uJCE/TYsnRFFj669lfvBPVz5Fvy6aJmCSwpZZ748hi1na7
         01YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=DKO6CxKSoxCYH8dV1mmPYYB2j5avZgmpaYuGkq/JsPE=;
        b=H74MFfk0qmtyYDrOXcOPpwKSaQvIRHuZky41jvK6OuzILbu1m2FMjh1pqQrL74HLRx
         /HJILqNqwznJdNyugviMODTfTCbIXQ0q5/vnmlCGWRhsCKJx1wyKZ8tPk/5A4xZdQ9iN
         8L/2dyr+MEVkm0H0mUNbZRIRT3AlcvZ9QsnMgtP3T/ZVkwGKcHar5Q9c/1yjmwdWO+Ct
         VArEB0fCioamJfBWeX6Edu4TTj2OhU9UgIJiI57rMp3pxC9Ogz/9GjkmPvING4f2zSl9
         uAWBBgBHm3A+Me2B9J2jVuWJ1t3upN0LPFu553CMyp003ka5Y4sqmUkS0PGmT5n4u34u
         2X/A==
X-Gm-Message-State: AOAM5303iKq0OpiG9PVArQDRfjvjG3FLsSjYNdNQZUZHY+x1QEyrOhbQ
        Yj3TQYPGIg8ZuJkAbnpskzk=
X-Google-Smtp-Source: ABdhPJwBfUY+lIEPK7OBy8CVMqdjm3XKNsPc16s/em4oCg27KJdaFUohCME2aZRf9Y5/zs1YdSF+5w==
X-Received: by 2002:a50:9eaf:: with SMTP id a44mr1803983edf.121.1592549118368;
        Thu, 18 Jun 2020 23:45:18 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id gv18sm4119543ejb.113.2020.06.18.23.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 23:45:16 -0700 (PDT)
Date:   Fri, 19 Jun 2020 08:45:15 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org,
        linux-tegra <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 06/38] dt-bindings: display: tegra: Document display-hub
Message-ID: <20200619064515.GA3704347@ulmo>
References: <20200612141903.2391044-1-thierry.reding@gmail.com>
 <20200612141903.2391044-7-thierry.reding@gmail.com>
 <20200617225506.GC2975260@bogus>
 <20200618102736.GA3659851@ulmo>
 <CAL_JsqKgJa0iEfnJO9KfS=sB23bT0E0szB7SwShh2kxWEsxgdA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="GvXjxJ+pjyke8COw"
Content-Disposition: inline
In-Reply-To: <CAL_JsqKgJa0iEfnJO9KfS=sB23bT0E0szB7SwShh2kxWEsxgdA@mail.gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--GvXjxJ+pjyke8COw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 18, 2020 at 12:17:36PM -0600, Rob Herring wrote:
> On Thu, Jun 18, 2020 at 4:27 AM Thierry Reding <thierry.reding@gmail.com>=
 wrote:
> >
> > On Wed, Jun 17, 2020 at 04:55:06PM -0600, Rob Herring wrote:
> > > On Fri, Jun 12, 2020 at 04:18:31PM +0200, Thierry Reding wrote:
> > > > From: Thierry Reding <treding@nvidia.com>
> > > >
> > > > Tegra186 and later have an additional component in the display pipe=
line
> > > > called the display hub. Document the bindings which were missing.
> > >
> > > I'd rather this be after the conversion or I'm reviewing it twice.
> >
> > Okay, I'll reorder the patches accordingly.
> >
> > > >
> > > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > > > ---
> > > >  .../display/tegra/nvidia,tegra20-host1x.txt   | 50 +++++++++++++++=
++++
> > > >  1 file changed, 50 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia=
,tegra20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidi=
a,tegra20-host1x.txt
> > > > index 47319214b5f6..2cf3cc4893da 100644
> > > > --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra2=
0-host1x.txt
> > > > +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra2=
0-host1x.txt
> > > > @@ -297,6 +297,56 @@ of the following host1x client modules:
> > > >    - reset-names: Must include the following entries:
> > > >      - vic
> > > >
> > > > +- display-hub: display controller hub
> > > > +  Required properties:
> > > > +  - compatible: "nvidia,tegra<chip>-display"
> > > > +  - reg: Physical base address and length of the controller's regi=
sters.
> > > > +  - interrupts: The interrupt outputs from the controller.
> > > > +  - clocks: Must contain an entry for each entry in clock-names.
> > > > +    See ../clocks/clock-bindings.txt for details.
> > > > +  - clock-names: Must include the following entries:
> > > > +    - disp
> > > > +    - dsc
> > > > +    - hub
> > > > +  - resets: Must contain an entry for each entry in reset-names.
> > > > +    See ../reset/reset.txt for details.
> > > > +  - reset-names: Must include the following entries:
> > > > +    - misc
> > > > +    - wgrp0
> > > > +    - wgrp1
> > > > +    - wgrp2
> > > > +    - wgrp3
> > > > +    - wgrp4
> > > > +    - wgrp5
> > > > +  - power-domains: A list of phandle and specifiers identifying th=
e power
> > > > +    domains that the display hub is part of.
> > > > +  - ranges: Range of registers used for the display controllers.
> > > > +
> > > > +  Each subnode of the display hub represents one of the display co=
ntrollers
> > > > +  available:
> > > > +
> > > > +  - display: display controller
> > > > +    - compatible: "nvidia,tegra<chip>-dc"
> > > > +    - reg: Physical base address and length of the controller's re=
gisters.
> > > > +    - interrupts: The interrupt outputs from the controller.
> > > > +    - clocks: Must contain an entry for each entry in clock-names.
> > > > +      See ../clocks/clock-bindings.txt for details.
> > > > +    - clock-names: Must include the following entries:
> > > > +      - dc
> > > > +    - resets: Must contain an entry for each entry in reset-names.
> > > > +      See ../reset/reset.txt for details.
> > > > +    - reset-names: Must include the following entries:
> > > > +      - dc
> > > > +    - power-domains: A list of phandle and specifiers that identif=
y the power
> > > > +      domains that this display controller is part of.
> > > > +    - iommus: A phandle and specifier identifying the SMMU master =
interface of
> > > > +      this display controller.
> > > > +    - nvidia,outputs: A list of phandles of outputs that this disp=
lay
> > > > +      controller can drive.
> > >
> > > Seems like an OF graph should describe this?
> >
> > The above documents the current state of affairs. I don't recall exactly
> > why we never merged the bindings, but we've been using this
> > nvidia,outputs property for almost three years now. Changing this would
> > break ABI, although I guess you could say that since this was never
> > documented it can't be ABI. Still, changing this is going to cause old
> > device trees to fail with new kernels. Unless of course if we add some
> > backwards-compatibility mechanism in the driver. But in that case, what
> > exactly do we gain by switching to an OF graph?
>=20
> Probably nothing at this point. More I was just curious how we ended
> up with something different.

So does that mean yes or no? Do you want me to proceed with what's
currently used or should I switch to the OF graph version?

> > Historically, I think nvidia,outputs was introduced before OF graphs
> > were "a thing", at least in DRM. According to the git log, the helpers
> > for graphs were introduced a couple of years before nvidia,outputs was
> > used, but I guess they must not have been widespread enough for me to
> > have been aware of them.
>=20
> There was a period display subsystem bindings were pretty much un-reviewe=
d...
>=20
> > Anyway, irrespective of the compatibility issues, I tried to use an OF
> > graph to describe this and here's what I came up with:
> >
> > --- >8 ---
> >  arch/arm64/boot/dts/nvidia/tegra186.dtsi | 170 +++++++++++++++++++++++=
+++++++-
> >  drivers/gpu/drm/tegra/dc.c               |  15 +--
> >  drivers/gpu/drm/tegra/dc.h               |   1 -
> >  drivers/gpu/drm/tegra/output.c           |  12 +--
> >  4 files changed, 172 insertions(+), 26 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot=
/dts/nvidia/tegra186.dtsi
> > index 58100fb9cd8b..a3dcf2437976 100644
> > --- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
> > +++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
> > @@ -994,8 +994,38 @@ display@15200000 {
> >                                 power-domains =3D <&bpmp TEGRA186_POWER=
_DOMAIN_DISP>;
> >                                 iommus =3D <&smmu TEGRA186_SID_NVDISPLA=
Y>;
> >
> > -                               nvidia,outputs =3D <&dsia &dsib &sor0 &=
sor1>;
> >                                 nvidia,head =3D <0>;
> > +
> > +                               ports {
> > +                                       #address-cells =3D <1>;
> > +                                       #size-cells =3D <0>;
> > +
> > +                                       dc0_out: port@0 {
> > +                                               #address-cells =3D <1>;
> > +                                               #size-cells =3D <0>;
> > +                                               reg =3D <0>;
> > +
> > +                                               dc0_out_dsia: endpoint@=
0 {
> > +                                                       reg =3D <0>;
> > +                                                       remote-endpoint=
 =3D <&dsia_in_dc0>;
> > +                                               };
> > +
> > +                                               dc0_out_dsib: endpoint@=
1 {
> > +                                                       reg =3D <1>;
> > +                                                       remote-endpoint=
 =3D <&dsib_in_dc0>;
> > +                                               };
> > +
> > +                                               dc0_out_sor0: endpoint@=
2 {
> > +                                                       reg =3D <2>;
> > +                                                       remote-endpoint=
 =3D <&sor0_in_dc0>;
> > +                                               };
> > +
> > +                                               dc0_out_sor1: endpoint@=
3 {
> > +                                                       reg =3D <3>;
> > +                                                       remote-endpoint=
 =3D <&sor1_in_dc0>;
> > +                                               };
> > +                                       };
> > +                               };
> >                         };
> >
> >                         display@15210000 {
> > @@ -1010,8 +1040,38 @@ display@15210000 {
> >                                 power-domains =3D <&bpmp TEGRA186_POWER=
_DOMAIN_DISPB>;
> >                                 iommus =3D <&smmu TEGRA186_SID_NVDISPLA=
Y>;
> >
> > -                               nvidia,outputs =3D <&dsia &dsib &sor0 &=
sor1>;
> >                                 nvidia,head =3D <1>;
> > +
> > +                               ports {
> > +                                       #address-cells =3D <1>;
> > +                                       #size-cells =3D <0>;
> > +
> > +                                       dc1_out: port@0 {
> > +                                               #address-cells =3D <1>;
> > +                                               #size-cells =3D <0>;
> > +                                               reg =3D <0>;
> > +
> > +                                               dc1_out_dsia: endpoint@=
0 {
> > +                                                       reg =3D <0>;
> > +                                                       remote-endpoint=
 =3D <&dsia_in_dc1>;
> > +                                               };
> > +
> > +                                               dc1_out_dsib: endpoint@=
1 {
> > +                                                       reg =3D <1>;
> > +                                                       remote-endpoint=
 =3D <&dsib_in_dc1>;
> > +                                               };
> > +
> > +                                               dc1_out_sor0: endpoint@=
2 {
> > +                                                       reg =3D <2>;
> > +                                                       remote-endpoint=
 =3D <&sor0_in_dc1>;
> > +                                               };
> > +
> > +                                               dc1_out_sor1: endpoint@=
3 {
> > +                                                       reg =3D <3>;
> > +                                                       remote-endpoint=
 =3D <&sor1_in_dc1>;
> > +                                               };
> > +                                       };
> > +                               };
> >                         };
> >
> >                         display@15220000 {
> > @@ -1026,8 +1086,28 @@ display@15220000 {
> >                                 power-domains =3D <&bpmp TEGRA186_POWER=
_DOMAIN_DISPC>;
> >                                 iommus =3D <&smmu TEGRA186_SID_NVDISPLA=
Y>;
> >
> > -                               nvidia,outputs =3D <&sor0 &sor1>;
> >                                 nvidia,head =3D <2>;
> > +
> > +                               ports {
> > +                                       #address-cells =3D <1>;
> > +                                       #size-cells =3D <0>;
> > +
> > +                                       dc2_out: port@0 {
> > +                                               #address-cells =3D <1>;
> > +                                               #size-cells =3D <0>;
> > +                                               reg =3D <0>;
> > +
> > +                                               dc2_out_sor0: endpoint@=
0 {
> > +                                                       reg =3D <0>;
> > +                                                       remote-endpoint=
 =3D <&sor0_in_dc2>;
> > +                                               };
> > +
> > +                                               dc2_out_sor1: endpoint@=
1 {
> > +                                                       reg =3D <1>;
> > +                                                       remote-endpoint=
 =3D <&sor1_in_dc2>;
> > +                                               };
> > +                                       };
> > +                               };
> >                         };
> >                 };
> >
> > @@ -1044,6 +1124,25 @@ dsia: dsi@15300000 {
> >                         status =3D "disabled";
> >
> >                         power-domains =3D <&bpmp TEGRA186_POWER_DOMAIN_=
DISP>;
> > +
> > +                       ports {
> > +                               #address-cells =3D <1>;
> > +                               #size-cells =3D <0>;
> > +
> > +                               dsia_in: port@0 {
> > +                                       #address-cells =3D <1>;
> > +                                       #size-cells =3D <0>;
> > +                                       reg =3D <0>;
> > +
> > +                                       dsia_in_dc0: endpoint@0 {
> > +                                               remote-endpoint =3D <&d=
c0_out_dsia>;
> > +                                       };
> > +
> > +                                       dsia_in_dc1: endpoint@1 {
> > +                                               remote-endpoint =3D <&d=
c1_out_dsia>;
> > +                                       };
> > +                               };
> > +                       };
> >                 };
> >
> >                 vic@15340000 {
> > @@ -1072,6 +1171,25 @@ dsib: dsi@15400000 {
> >                         status =3D "disabled";
> >
> >                         power-domains =3D <&bpmp TEGRA186_POWER_DOMAIN_=
DISP>;
> > +
> > +                       ports {
> > +                               #address-cells =3D <1>;
> > +                               #size-cells =3D <0>;
> > +
> > +                               dsib_in: port@0 {
> > +                                       #address-cells =3D <1>;
> > +                                       #size-cells =3D <0>;
> > +                                       reg =3D <0>;
> > +
> > +                                       dsib_in_dc0: endpoint@0 {
> > +                                               remote-endpoint =3D <&d=
c0_out_dsib>;
> > +                                       };
> > +
> > +                                       dsib_in_dc1: endpoint@1 {
> > +                                               remote-endpoint =3D <&d=
c1_out_dsib>;
> > +                                       };
> > +                               };
> > +                       };
> >                 };
> >
> >                 sor0: sor@15540000 {
> > @@ -1096,6 +1214,29 @@ sor0: sor@15540000 {
> >
> >                         power-domains =3D <&bpmp TEGRA186_POWER_DOMAIN_=
DISP>;
> >                         nvidia,interface =3D <0>;
> > +
> > +                       ports {
> > +                               #address-cells =3D <1>;
> > +                               #size-cells =3D <0>;
> > +
> > +                               sor0_in: port@0 {
> > +                                       #address-cells =3D <1>;
> > +                                       #size-cells =3D <0>;
> > +                                       reg =3D <0>;
> > +
> > +                                       sor0_in_dc0: endpoint@0 {
> > +                                               remote-endpoint =3D <&d=
c0_out_sor0>;
> > +                                       };
> > +
> > +                                       sor0_in_dc1: endpoint@1 {
> > +                                               remote-endpoint =3D <&d=
c1_out_sor0>;
> > +                                       };
> > +
> > +                                       sor0_in_dc2: endpoint@2 {
> > +                                               remote-endpoint =3D <&d=
c2_out_sor0>;
> > +                                       };
> > +                               };
> > +                       };
> >                 };
> >
> >                 sor1: sor@15580000 {
> > @@ -1120,6 +1261,29 @@ sor1: sor@15580000 {
> >
> >                         power-domains =3D <&bpmp TEGRA186_POWER_DOMAIN_=
DISP>;
> >                         nvidia,interface =3D <1>;
> > +
> > +                       ports {
> > +                               #address-cells =3D <1>;
> > +                               #size-cells =3D <0>;
> > +
> > +                               sor1_in: port@0 {
> > +                                       #address-cells =3D <1>;
> > +                                       #size-cells =3D <0>;
> > +                                       reg =3D <0>;
> > +
> > +                                       sor1_in_dc0: endpoint@0 {
> > +                                               remote-endpoint =3D <&d=
c0_out_sor1>;
> > +                                       };
> > +
> > +                                       sor1_in_dc1: endpoint@1 {
> > +                                               remote-endpoint =3D <&d=
c1_out_sor1>;
> > +                                       };
> > +
> > +                                       sor1_in_dc2: endpoint@2 {
> > +                                               remote-endpoint =3D <&d=
c2_out_sor1>;
> > +                                       };
> > +                               };
> > +                       };
> >                 };
> >
> >                 dpaux: dpaux@155c0000 {
> > diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> > index 04d6848d19fc..4adb64c083c8 100644
> > --- a/drivers/gpu/drm/tegra/dc.c
> > +++ b/drivers/gpu/drm/tegra/dc.c
> > @@ -10,6 +10,7 @@
> >  #include <linux/iommu.h>
> >  #include <linux/module.h>
> >  #include <linux/of_device.h>
> > +#include <linux/of_graph.h>
> >  #include <linux/pm_runtime.h>
> >  #include <linux/reset.h>
> >
> > @@ -86,19 +87,6 @@ static inline void tegra_plane_writel(struct tegra_p=
lane *plane, u32 value,
> >         tegra_dc_writel(plane->dc, value, tegra_plane_offset(plane, off=
set));
> >  }
> >
> > -bool tegra_dc_has_output(struct tegra_dc *dc, struct device *dev)
> > -{
> > -       struct device_node *np =3D dc->dev->of_node;
> > -       struct of_phandle_iterator it;
> > -       int err;
> > -
> > -       of_for_each_phandle(&it, err, np, "nvidia,outputs", NULL, 0)
> > -               if (it.node =3D=3D dev->of_node)
> > -                       return true;
> > -
> > -       return false;
> > -}
> > -
> >  /*
> >   * Double-buffered registers have two copies: ASSEMBLY and ACTIVE. Whe=
n the
> >   * *_ACT_REQ bits are set the ASSEMBLY copy is latched into the ACTIVE=
 copy.
> > @@ -2061,6 +2049,7 @@ static int tegra_dc_init(struct host1x_client *cl=
ient)
> >         if (err < 0)
> >                 goto cleanup;
> >
> > +       dc->base.port =3D of_graph_get_port_by_id(dc->dev->of_node, 0);
> >         drm_crtc_helper_add(&dc->base, &tegra_crtc_helper_funcs);
> >
> >         /*
> > diff --git a/drivers/gpu/drm/tegra/dc.h b/drivers/gpu/drm/tegra/dc.h
> > index 3d8ddccd758f..9e4ae77e6270 100644
> > --- a/drivers/gpu/drm/tegra/dc.h
> > +++ b/drivers/gpu/drm/tegra/dc.h
> > @@ -144,7 +144,6 @@ struct tegra_dc_window {
> >  };
> >
> >  /* from dc.c */
> > -bool tegra_dc_has_output(struct tegra_dc *dc, struct device *dev);
> >  void tegra_dc_commit(struct tegra_dc *dc);
> >  int tegra_dc_state_setup_clock(struct tegra_dc *dc,
> >                                struct drm_crtc_state *crtc_state,
> > diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/out=
put.c
> > index e36e5e7c2f69..b09935cdf397 100644
> > --- a/drivers/gpu/drm/tegra/output.c
> > +++ b/drivers/gpu/drm/tegra/output.c
> > @@ -5,6 +5,7 @@
> >   */
> >
> >  #include <drm/drm_atomic_helper.h>
> > +#include <drm/drm_of.h>
> >  #include <drm/drm_panel.h>
> >  #include <drm/drm_simple_kms_helper.h>
> >
> > @@ -229,16 +230,9 @@ void tegra_output_find_possible_crtcs(struct tegra=
_output *output,
> >                                       struct drm_device *drm)
> >  {
> >         struct device *dev =3D output->dev;
> > -       struct drm_crtc *crtc;
> > -       unsigned int mask =3D 0;
> > -
> > -       drm_for_each_crtc(crtc, drm) {
> > -               struct tegra_dc *dc =3D to_tegra_dc(crtc);
> > -
> > -               if (tegra_dc_has_output(dc, dev))
> > -                       mask |=3D drm_crtc_mask(crtc);
> > -       }
> > +       u32 mask;
> >
> > +       mask =3D drm_of_find_possible_crtcs(drm, dev->of_node);
> >         if (mask =3D=3D 0) {
> >                 dev_warn(dev, "missing output definition for heads in D=
T\n");
> >                 mask =3D 0x3;
> > --- >8 ---
> >
> > I do see the benefit of using standard bindings where available, but in
> > this case I think that's hardly an improvement over the current binding,
> > even though it's undocumented.
> >
> > > > +    - nvidia,head: The number of the display controller head. This=
 is used to
> > > > +      setup the various types of output to receive video data from=
 the given
> > > > +      head.
> > >
> > > Not really clear what this is...
> >
> > This is the same as for the display controller in older Tegra devices.
> > The value is the index of the display controller head, or the instance
> > number of the IP, if that's any clearer. We need this in some places
> > for register programming. We can't always safely derive it in some
> > other way.
>=20
> Index, humm. I'll pretend I didn't ask...

Do you have a better suggestion? If we break ABI for the OF graph thing
maybe we should role this ABI break in at the same time. This should be
safe to do on Tegra because I'm not aware of any devices that will boot
with a DTB from a read-only location.

Thierry

--GvXjxJ+pjyke8COw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7sXvkACgkQ3SOs138+
s6GtbBAAwoJGvm6ruarbh8vuHX+dcbd91YT0kzYexkqameyImzGQyP2PW3qclUT0
krMGjqhZA1bkBrLtFVQFfbsDK+bVIA/UA7jiKp06cRW1c6dTcg9kad9zkTnqAV/7
Zjoq8JpH6plAUH1TH66RnBurUXh/YeMbp0TNHlUzeZXXywFauY6YjRN8NX/JgFBC
1LJfHubfvF0xNqk5X4g5bWEBYTYrvTlWLJqlRaQkRwhiiE7IzFdyL5uHSGWz4YZc
Nkqcp90dneekxMxqvvpry06n+hL5OiACY71lZU+4f3hCHLqNHHWFJr2GBv4B1w2H
wP3xo2pssurgGv0F2lSz3l02KId81+pqhltI4PbSg+A6y8DxRi/ubfHElvmooZ0g
RV03mhVhE+DAlDwNLwtHH9DBNpL3fKAxJtYc30gtwcJgXDqiay8BdyQeoATfJrxE
oYRV4xnYCLN+Z89EuNzZzEbsYwTsvn6hf/uU5kAlnEykpCcMwLT27tLbSWy7RgJU
TiuWZJGgKXktYZbS6wxLv2RcZU8RlL10yLAUQ4/0iuP8xFnx742KJkGPbZvb5uPX
bELAZM277j7C2vfKd5CgiLJTqrdseQUY9TS86lf2HhIXmFh9AhOOlEPlujeNo3PD
XtpkhoV9UjjkO+77IVA49rROQhUypz84hLIkcF27tKXjYwzoph4=
=n2pe
-----END PGP SIGNATURE-----

--GvXjxJ+pjyke8COw--
