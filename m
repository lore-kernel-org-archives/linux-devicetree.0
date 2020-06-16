Return-Path: <SRS0=Wk2R=75=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79963C433E0
	for <linux-devicetree@archiver.kernel.org>; Tue, 16 Jun 2020 14:35:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5B20120776
	for <linux-devicetree@archiver.kernel.org>; Tue, 16 Jun 2020 14:35:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SHyCeOS2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729018AbgFPOfa (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 16 Jun 2020 10:35:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727804AbgFPOfa (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 16 Jun 2020 10:35:30 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10F55C061573;
        Tue, 16 Jun 2020 07:35:30 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id y20so3341687wmi.2;
        Tue, 16 Jun 2020 07:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Fl6OuHf2JqTI1ta3E0cDGqilLd8TzJqbN0a4SH77N0g=;
        b=SHyCeOS23onj86MIssP1R+CZlMhj0uTw8+aCtlQIN5aeBH4ET4sJYelLHI32P4CpR/
         kS6Pocx64A70EmRFRVvvaolaBsAais0jEw/j1iqcWNwUQaf2AnK0B7wYqRCu0C1S8BBR
         IA5Cnum58BRN2pjtqTo4lLme284DjWyDi4A+l2Nlz4qmUTm5f3PBK2qYO3MMGHQgtrXn
         YOm0GZMKRraFN3XROIrg2mTv35fS9mg3XVZKWwot+elS5vqFk81Zcj2MPZ5rqZ4eRs4l
         TnukKDyzksJujDWX6EX4pW/Bd2xald1BoNAFbwbnAGfXxVNy5UbROu+vOkDL9ldZiaKC
         AwmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Fl6OuHf2JqTI1ta3E0cDGqilLd8TzJqbN0a4SH77N0g=;
        b=taMzWVw7yf4stZkqAr5lhR1R18Eq/aSf9K8WHCdjQ6A/l/+7qyv7sXIDAdYPoO0bVJ
         gmo4GvqSkFXntzHWYPlEspwvdFNAMcPgec9rvrk4SQnzn9US6JXtROybPfQ+eE6KyrRg
         +aY/vm9f4WKmagdJMKUp7257y5uXDTTosf6z+SZlbPZ3giN981E9+YFy3onwN/4Waobw
         KGgGrlTmvO1XpF4G/yGNPsgcBpZdb4RlEpzbtr63TTuJiPRZ0jMkDTBpQy1ow20t6hs3
         LqgplmdL2bTGo0uelkJ1flMy4YzZv1WMuayqXrDp/Rzr3XvQ5s2tMtwVrOF79B6WuHt1
         qc2A==
X-Gm-Message-State: AOAM533BsfaisQ4gbp9+3fHSubWV1pAhYNj4y9r4tCP0NZJwBQfUwLNH
        9Hz9L+YtVE9z2wRpFsJw1Tk=
X-Google-Smtp-Source: ABdhPJwahV6qdm8TGCg6uC66Tox+B5fnggxMQW9Z9wn+JVm4rEdJ/Ve9cwiiyfEyM6JfrfKh7AoaKA==
X-Received: by 2002:a7b:c0d9:: with SMTP id s25mr3745189wmh.175.1592318128766;
        Tue, 16 Jun 2020 07:35:28 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id b18sm28775073wrn.88.2020.06.16.07.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 07:35:25 -0700 (PDT)
Date:   Tue, 16 Jun 2020 16:35:24 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org,
        linux-tegra <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 30/38] dt-bindings: panel: Allow reg property for DSI
 panels
Message-ID: <20200616143524.GB3000485@ulmo>
References: <20200612141903.2391044-1-thierry.reding@gmail.com>
 <20200612141903.2391044-31-thierry.reding@gmail.com>
 <CAL_JsqL4wMN3+cd=WEUegGU9xwpj9DTXeKT6EwTRfqiS+y6fMw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="s2ZSL+KKDSLx8OML"
Content-Disposition: inline
In-Reply-To: <CAL_JsqL4wMN3+cd=WEUegGU9xwpj9DTXeKT6EwTRfqiS+y6fMw@mail.gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--s2ZSL+KKDSLx8OML
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 12, 2020 at 08:29:35AM -0600, Rob Herring wrote:
> On Fri, Jun 12, 2020 at 8:20 AM Thierry Reding <thierry.reding@gmail.com>=
 wrote:
> >
> > From: Thierry Reding <treding@nvidia.com>
> >
> > For DSI panels the "reg" property is needed to represent the virtual
> > channel of the given panel.
> >
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  .../devicetree/bindings/display/panel/panel-simple.yaml        | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/panel/panel-simp=
le.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> > index d6cca1479633..34fe3d42b829 100644
> > --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> > +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> > @@ -267,6 +267,9 @@ properties:
> >          # Winstar Display Corporation 3.5" QVGA (320x240) TFT LCD panel
> >        - winstar,wf35ltiacd
> >
> > +  reg:
> > +    description: virtual channel for DSI panels
> > +
>=20
> panel-simple-dsi.yaml?

Heh... I had completely missed that. I've now replaced this patch with
one that moves the lg,lh500wx1-sd03 compatible string to the DSI schema.

Thierry

--s2ZSL+KKDSLx8OML
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7o2KwACgkQ3SOs138+
s6HG9g/+PX0Xjkon9vFxMTkYjjJ7yg1KDrHTwi6omDpt7goanb39WXqanIC8rrDi
VxB3rcws6TcsgLzMkjY/mxtEu2eG/71ERDkiLKmGbbzQ6/sE80iqc5FUD9EGjeyU
u37A1yWgeby3wyDdCmi9aGO+IXBGMF6MtX7Fjl5MG67HLJL6+NeN7uPOybNS1ege
x/YuaQCX4DkL+GTTCXyqwoPA3kbK3o+JBDdwoHt29ECWk9FeMWKiBQJnDP4TA3zN
SKj/zhlEfckOHyTqBR52bI3j9gUznzFXHC7ToOZy7kxjxIkYLEXdYDo4/OKs2GkE
7eJ9xZs5PSEP6jjmItKlMAkhE4kivZPJGhTWquVPOkGA6Trq5m98ZY0XgVGqywLo
zuHZV45GWkJNjw8ULu0grhszYjSGEMNp3rfoeW1CVcwzwa9641PQ1ljW3Kl2tOSh
syRskBn8vRDjvt91wficpHNa+tv+5XGs2FtE/axID0LNGm/Z9x1MgvI86KMhL4eV
GzraTWwYks5itO9iLE3f9LaROy2NvGzS7Z0pMp/XF7dVx3Lx+8O9Ebaz3SZn3Pzc
zcceED4jzTOgfCPR+uHOY3aqcRmqVPe6CDd/2xDRs+gOxbLpQa0Y4huKidlklVYc
zy9IRXmJGKdQEBA1vyIKIrZCDO61EpAM9sax/aTF1QdjyRzDGYE=
=2xCw
-----END PGP SIGNATURE-----

--s2ZSL+KKDSLx8OML--
