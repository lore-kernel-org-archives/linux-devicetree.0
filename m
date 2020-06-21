Return-Path: <SRS0=az0Z=AC=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A018C433E0
	for <linux-devicetree@archiver.kernel.org>; Sun, 21 Jun 2020 19:33:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 68D5725240
	for <linux-devicetree@archiver.kernel.org>; Sun, 21 Jun 2020 19:33:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uZ3XMOQ4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730672AbgFUTdK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 21 Jun 2020 15:33:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730669AbgFUTdK (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 21 Jun 2020 15:33:10 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3324FC061795
        for <devicetree@vger.kernel.org>; Sun, 21 Jun 2020 12:33:10 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id h22so7398142pjf.1
        for <devicetree@vger.kernel.org>; Sun, 21 Jun 2020 12:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=8V6HFmLfGm9H0h60UuqXdO7H0Hr/Mksem7jzlgy8U7w=;
        b=uZ3XMOQ4CZBG1jROGxZneTOAF/aHCdQeyVlB3ZvRPBwfRRELY87Zy/FrPPzIzbtjeh
         ZSWzeilRJ+ltWjl6Wf8XjC9YNwgPUsO+ASAyoEpi37Hdt+3QAoXCC++PIZTbJa+8GGpT
         ztxtBduTxsquEyTofbr7TcgqSWVtLd7onuIkpBAvohocO81okO6x/h7Iv1zDYrwdr0Z2
         kJ0J4Pqwssy9Ok05g+TqqC9JqKfzAcE1Dj26Qt1C8YWblqqz3/BxVrgLkk6V9ppyP0Tm
         U1HmZNDGhHKG9qiukpFLS4kOR8UXxsshrJCRpDGH0Gvo4YSruUMZxSH4zyFR1N0DauXC
         3IPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=8V6HFmLfGm9H0h60UuqXdO7H0Hr/Mksem7jzlgy8U7w=;
        b=O0O7FqmA0tCy4zji/l5zlg4CIvesv9vxRMXRe9wdO6WjNvRxm8IJ5wc2e+NOYkhur/
         5SrLavJN+w7rvPTZ4mr1DbealpegNHfdbdo1e7XGmOXnuDnq5813FhYZsA2vYOU6nXas
         503XO1HzMTGfdDyCtkwkpIO/2IvYyKUlRpqXLW6z3q6F52NuXvtNih9V+lgug4h3dDxS
         gxLsbLXWnZEJNwB5EnY6Ys+Tx3QU8YLO90QFAwusP/BrZv4MVDRmKJ9Rt4MuQovJjOH2
         v6F1ONCsFaNNTkpKgN1j7C2iM4KEwzsM/1fW3CgkP/uBqXR4W9i1YO56sdy5SCtTUd5M
         zB2w==
X-Gm-Message-State: AOAM530cmTCphvcXeNJUFpdTDUmEXLeXYKiFkclDeZdtV3SRTmhJO01Q
        vbOUpMMFkFaBGlvYncAaMuRlhw==
X-Google-Smtp-Source: ABdhPJx/yccrdZJLJQ925LbLp9rVL/mKCFCY/9xVs/BHknKusK+X01L1pvGaa2hA8nHDDt3N08i1SQ==
X-Received: by 2002:a17:90a:c250:: with SMTP id d16mr14494880pjx.60.1592767989562;
        Sun, 21 Jun 2020 12:33:09 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id q68sm11641137pjc.30.2020.06.21.12.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2020 12:33:08 -0700 (PDT)
Date:   Sun, 21 Jun 2020 12:30:22 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Suman Anna <s-anna@ti.com>, Ohad Ben-Cohen <ohad@wizery.com>,
        Arnaud Pouliquen <arnaud.pouliquen@st.com>, od@zcrc.me,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH v7 4/5] remoteproc: ingenic: Added remoteproc driver
Message-ID: <20200621193022.GA149351@builder.lan>
References: <20200515104340.10473-1-paul@crapouillou.net>
 <20200515104340.10473-4-paul@crapouillou.net>
 <8cdcf5ef-1268-89f6-b229-ac711a80b790@ti.com>
 <FR8SBQ.5WXNHNH8P2P7@crapouillou.net>
 <fc1e14e7-4551-48c3-2820-f5889c50becb@ti.com>
 <G3ATBQ.KJYAFROKKWDP1@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <G3ATBQ.KJYAFROKKWDP1@crapouillou.net>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri 12 Jun 04:47 PDT 2020, Paul Cercueil wrote:
> Le jeu. 11 juin 2020 =E0 19:21, Suman Anna <s-anna@ti.com> a =E9crit :
> > On 6/11/20 5:21 PM, Paul Cercueil wrote:
> > > Le jeu. 11 juin 2020 =E0 16:47, Suman Anna <s-anna@ti.com> a =E9crit :
> > > > On 5/15/20 5:43 AM, Paul Cercueil wrote:
[..]
> > > > > diff --git a/drivers/remoteproc/ingenic_rproc.c
> > > > > =7F=7F=7Fb/drivers/remoteproc/ingenic_rproc.c
[..]
> > > > > +    /* The clocks must be enabled for the firmware to be
> > > > > loaded in =7F=7F=7FTCSM */
> > > > > +    ret =3D clk_bulk_prepare_enable(ARRAY_SIZE(vpu->clks),
> > > > > vpu->clks);
> > > > > +    if (ret) {
> > > > > +        dev_err(dev, "Unable to start clocks\n");
> > > > > +        return ret;
> > > > > +    }
> > > >=20
> > > > You are enabling the clocks directly here and also trying to
> > > > manage =7F=7Fthem through pm_runtime callbacks again.
> > >=20
> > > Yes. The clocks need to be enabled in the probe.
> >=20
> > For the preferred non CONFIG_PM case now and lack of
> > prepare/unprepare().
>=20
> I want to make it clear that I'm not against having .prepare/.unprepare, =
but
> I want to see what maintainers have to say.
>=20

I think it's perfectly reasonable to enable all the resources here and
then if CONFIG_PM isn't set you just leave them enabled throughout.

Regards,
Bjorn
