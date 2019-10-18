Return-Path: <SRS0=cZLa=YL=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B04D5CA9EA0
	for <linux-devicetree@archiver.kernel.org>; Fri, 18 Oct 2019 07:49:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7D2D821897
	for <linux-devicetree@archiver.kernel.org>; Fri, 18 Oct 2019 07:49:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V+5KGG+m"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504687AbfJRHtD (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 18 Oct 2019 03:49:03 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:41263 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2504655AbfJRHtC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 18 Oct 2019 03:49:02 -0400
Received: by mail-lf1-f68.google.com with SMTP id r2so3937713lfn.8
        for <devicetree@vger.kernel.org>; Fri, 18 Oct 2019 00:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GWv2DXhpUZsQEN5stqt6YqBuhWFLoKxaG6XaaNvgSao=;
        b=V+5KGG+m5VgNboOLDq4qe8tVig5EKVF/mTSl/YcwRJMIxP2S7/jNz29jMy0YAs69V1
         SwED1tWdOHqkmGkX3gRGodJrtOe0O4yf1hddhYZ2ADP+LONtG5PYLyYQfFtQZvIe6yXc
         k96p3Rl/TizMjYRdVU6pFjR4vwXUGplH/KnmNUFannsCFWdt2A3//h/xHD22v+Y1Tj2q
         ImKtcH8c2smOdFqM5S3kkD53fQsfSshbOMWnxFmhescWC/Y/+IHOLlOqEaufOIbofHDd
         EujL9cheANF1cvpPuFRvw6EJB6MxWoPRbzSPTcLbmgut2LFq/D/pdXlb67lsOkkmiPgu
         RFcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GWv2DXhpUZsQEN5stqt6YqBuhWFLoKxaG6XaaNvgSao=;
        b=qMX/3teoL9JcDaKEPtJf4TqPAFtbhGmL6NrXxpktGPX9D9ngVpo0JVjOTGKoffE6Sn
         9cpWpiCVCorJApxuuFEkasSU2acdtE1/Ia2H2y6serS0A1ycfah+r0aEsiXY4QkSg6ns
         KidDbrE8lOn0lqt/Ms9KuiC6fNfoj6oYAOAmsmlQRYShHrzVFwg2DkFe7itNisBnz5so
         bXZ06VjuSzHCp/9ToYlE2C4PnUAyQ9iiXMUFf8wdSh7busAAyt1r9OW/vIrPZFqTFObV
         vnY0EGw1n33ei7CyK1oNYhxPLMTl5k/qVxzG8hrpp49osHM4mGoXQsBS0sU/2jEEay66
         FTxw==
X-Gm-Message-State: APjAAAWD3MJqh4RlN7yQsZki5FDGaZBJBNlwc3SlnSEW8EoANbyCa+9y
        WHxc40ofs7ivlVy6JD7Q3npH1JI8QBJrap4CDH2DoQ==
X-Google-Smtp-Source: APXvYqycIYm7gsfXjoF/75lGPYCl0UvFq4VrQ7oYhESMONziwYhWB3dOl13SRxlMjVldQZapAtess9+LraZ2pYF1e5Y=
X-Received: by 2002:ac2:4345:: with SMTP id o5mr5256449lfl.60.1571384940653;
 Fri, 18 Oct 2019 00:49:00 -0700 (PDT)
MIME-Version: 1.0
References: <20191011071805.5554-1-linus.walleij@linaro.org>
 <20191011071805.5554-6-linus.walleij@linaro.org> <20191011134449.GA12969@bogus>
 <20191017222238.673cd60b@archlinux> <20191018072959.GS4365@dell>
In-Reply-To: <20191018072959.GS4365@dell>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 18 Oct 2019 09:48:49 +0200
Message-ID: <CACRpkdZBWK5BHi7TcPVrF1j3Fg4CgeMxLisn2JB-mPPA+uKS7w@mail.gmail.com>
Subject: Re: [PATCH 5/7 v4] mfd: ab8500: augment DT bindings
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>,
        linux-iio@vger.kernel.org, Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Mboumba Cedric Madianga <cedric.madianga@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Oct 18, 2019 at 9:30 AM Lee Jones <lee.jones@linaro.org> wrote:
> On Thu, 17 Oct 2019, Jonathan Cameron wrote:

> Can you change the subject line to start with an uppercase char.
>
> Else my OCD sense will go into overdrive! ;)

Jonathan: it's fine to rebase the immutable branch for this as long as no-one
has pulled it in I suppose.

Working on a binding example cleanup.

Yours,
Linus Walleij
