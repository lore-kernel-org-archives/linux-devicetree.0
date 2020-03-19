Return-Path: <SRS0=Rh3i=5E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57B0AC4332B
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Mar 2020 10:36:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2AF4420722
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Mar 2020 10:36:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="LrhUCrty"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726802AbgCSKgm (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 19 Mar 2020 06:36:42 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:45654 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725768AbgCSKgm (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 19 Mar 2020 06:36:42 -0400
Received: by mail-il1-f194.google.com with SMTP id m9so1693694ilq.12
        for <devicetree@vger.kernel.org>; Thu, 19 Mar 2020 03:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jByhry3gs2H5qXvZC0UkGfNm9a2QynZUOXNZT5iWXPU=;
        b=LrhUCrty6VTjteyrFkLT7oftaJdH0uJD6Q0eFmNpFZhLmrcMUjPIENPiH/VahRSJWE
         gyY7COYRnuM+V0sVs2XAi7UpAOkwh7RI/2fzxeAfteP2aK4lKMp/PBGmtEIuaBwy67n7
         2ko6h3Owylut1BfFwiR+NmZB+QvKBGExgfATY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jByhry3gs2H5qXvZC0UkGfNm9a2QynZUOXNZT5iWXPU=;
        b=hWRnCZok2SsyJmwiDn/hoAd49YSg2bV1Og0mfObKc63yCCAF52TV+cGHWXmZ97Ut4T
         fCTSBHeRQXBJOMklWpUzLQpPtVjBOb+xK95WEVQgimmLxNhKD8F/HC5vgGjLlHvYBLHi
         4pXK3RKDyPaYZoF5J89f3GsRzjxf7S1rFLBC0OhsPjwvGrne4o2pKlDKIawR3MW0UH9r
         V+fj34ZiliEwoVZBMT/BHee0ZhzBML+J8OxiPPTYXSMuxncpijg2pdu1bXIrEZuL+FT2
         XjpDXKREteJUpq7JARHSS6+BxXu8UBfkjF+EdFeLezOIrNFmbBH5t4hIfg2039ANipbz
         n4ww==
X-Gm-Message-State: ANhLgQ0rzQKfg3y4IoWzZaX3Tl4S1DDXBMQkbJoxKXtsdUdVz8/FnQZs
        hgoEw5p5fgZatsrxhhJ2pGLG/Hg8KFnWDVHCiwp83A==
X-Google-Smtp-Source: ADFU+vtUIa7Up2vK9a1UDtKtiFK1yVGwE7V/lc6dlLy2fPPUu+x6KfsLr3DI3JqtxeKHg9FokDpkfS2gY2/i2Lc5+pk=
X-Received: by 2002:a92:77c2:: with SMTP id s185mr1238038ilc.297.1584614201515;
 Thu, 19 Mar 2020 03:36:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200318171003.5179-1-jagan@amarulasolutions.com> <20200318185713.GA28092@ravnborg.org>
In-Reply-To: <20200318185713.GA28092@ravnborg.org>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Thu, 19 Mar 2020 16:06:30 +0530
Message-ID: <CAMty3ZAjmu+h7XTyTUfge3kXFE=a=1iFm7MjR6DYnQnZ615fOg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: display: panel: Convert feiyang,
 fy07024di26a30d to DT schema
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree <devicetree@vger.kernel.org>,
        David Airlie <airlied@linux.ie>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-amarula <linux-amarula@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Sam,

On Thu, Mar 19, 2020 at 12:27 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Jagan.
>
> On Wed, Mar 18, 2020 at 10:40:01PM +0530, Jagan Teki wrote:
> > Convert the feiyang,fy07024di26a30d panel bindings to DT schema.
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>
> Thanks for the resend.
>
> Please fix so the two bindings uses panel-common.yaml.

Is is because few of the bindings in this panel are similar to
panel-common.yaml?

>
> And then only properties specific for this binding shall have a
> description.
>
> See below - please fix both bindings and resend.
>
>         Sam
>
> > ---
> > Changes for v2:
> > - fix dt_binding_check
> >
> >  .../display/panel/feiyang,fy07024di26a30d.txt | 20 -------
> >  .../panel/feiyang,fy07024di26a30d.yaml        | 57 +++++++++++++++++++
> >  2 files changed, 57 insertions(+), 20 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.txt
> >  create mode 100644 Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.txt b/Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.txt
> > deleted file mode 100644
> > index 82caa7b65ae8..000000000000
> > --- a/Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.txt
> > +++ /dev/null
> > @@ -1,20 +0,0 @@
> > -Feiyang FY07024DI26A30-D 7" MIPI-DSI LCD Panel
> > -
> > -Required properties:
> > -- compatible: must be "feiyang,fy07024di26a30d"
> > -- reg: DSI virtual channel used by that screen
> > -- avdd-supply: analog regulator dc1 switch
> > -- dvdd-supply: 3v3 digital regulator
> > -- reset-gpios: a GPIO phandle for the reset pin
> > -
> > -Optional properties:
> > -- backlight: phandle for the backlight control.
> > -
> > -panel@0 {
> > -     compatible = "feiyang,fy07024di26a30d";
> > -     reg = <0>;
> > -     avdd-supply = <&reg_dc1sw>;
> > -     dvdd-supply = <&reg_dldo2>;
> > -     reset-gpios = <&pio 3 24 GPIO_ACTIVE_HIGH>; /* LCD-RST: PD24 */
> > -     backlight = <&backlight>;
> > -};
> > diff --git a/Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.yaml b/Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.yaml
> > new file mode 100644
> > index 000000000000..f292c57a5bd6
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.yaml
> > @@ -0,0 +1,57 @@
> > +# SPDX-License-Identifier: (GPL-2.0+ OR X11)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/panel/feiyang,fy07024di26a30d.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Feiyang FY07024DI26A30-D 7" MIPI-DSI LCD Panel
> > +
> > +maintainers:
> > +  - Jagan Teki <jagan@amarulasolutions.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: feiyang,fy07024di26a30d
> > +
> > +  reg:
> > +    description: DSI virtual channel used by that screen
> reg is already described elsewhere so no description.
> Thus is becomes:
>
>     reg: true

Look like reg didn't describe in panel-common.yaml

Jagan.
