Return-Path: <SRS0=6Sr8=4T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 974A7C3F2D1
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Mar 2020 21:40:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 68CB420842
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Mar 2020 21:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1583185251;
	bh=8PRgKjkNMdhif7FRzdbtgwVzBO9oZGAr+YxyaiFUiOg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=hUdGa2eyQbztXfclVrT4L82E4tqXKV/a/XGi5l51MrjnaUcFrJn35Nferw0h5/iC3
	 3hKhlc5l33fVpK66vu3hPGiFQEIhT2GinSH98fucxtxua3MXh2z0E6+cA+9/57xq0q
	 j2EA5Yh4LEbh9nlmrXe9rbnBfHdksIFZHtuvOOew=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726970AbgCBVku (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 2 Mar 2020 16:40:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:58234 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726700AbgCBVku (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 2 Mar 2020 16:40:50 -0500
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A069021D56;
        Mon,  2 Mar 2020 21:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583185249;
        bh=8PRgKjkNMdhif7FRzdbtgwVzBO9oZGAr+YxyaiFUiOg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=0+LBwjpF/BmWn5lcCy3AxC+d00V17BqOxhC3d4cbpIEqx/GQaY0tVH2Jt0kmGLJHF
         8btyeC1RpCgv4EIqzmOKr79ME3BtxyfyHCqG8A+LexGXd6Ed3+k3JWGWCCOAkl0Mmg
         3UWkwI4DGOe2o16B4x7fVuDSzOqvUxOPmU4h1OMk=
Received: by mail-qv1-f50.google.com with SMTP id r8so669771qvs.12;
        Mon, 02 Mar 2020 13:40:49 -0800 (PST)
X-Gm-Message-State: ANhLgQ1j0lv4hxrBZH1mwD8HNizWtp8Ut5c5RQ9v2s1RE2rI2IvEpISf
        f+TpMtgtKYclCMgoJ3YOPiHT59T1JjQVnBV3Yg==
X-Google-Smtp-Source: ADFU+vtTHuHx49e5idYInPHiAYGTirAJ8BP2JfuSQxPXsVI6gokNdhLgD1Zf5FnnJ3gTgIlSXsOyzDAJJ4zGpbzcIcM=
X-Received: by 2002:ad4:42cd:: with SMTP id f13mr1288473qvr.136.1583185248726;
 Mon, 02 Mar 2020 13:40:48 -0800 (PST)
MIME-Version: 1.0
References: <cover.1583135507.git.mchehab+huawei@kernel.org>
 <a7e0a5597ace97503c8ff67cdab2351151c7f267.1583135507.git.mchehab+huawei@kernel.org>
 <7a4d92e5-a1e2-6bd2-9a40-dcdb52e80801@gmail.com>
In-Reply-To: <7a4d92e5-a1e2-6bd2-9a40-dcdb52e80801@gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 2 Mar 2020 15:40:37 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJwKcR4UVit=VBnvOcKx0z9UuUw5aXd0Y7+2nMgk3X_zw@mail.gmail.com>
Message-ID: <CAL_JsqJwKcR4UVit=VBnvOcKx0z9UuUw5aXd0Y7+2nMgk3X_zw@mail.gmail.com>
Subject: Re: [PATCH v2 03/12] docs: dt: usage_model.rst: fix link for DT usage
To:     Frank Rowand <frowand.list@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Mar 2, 2020 at 3:11 PM Frank Rowand <frowand.list@gmail.com> wrote:
>
> On 3/2/20 1:59 AM, Mauro Carvalho Chehab wrote:
> > The devicetree.org doesn't host the Device_Tree_Usage page
> > anymore. So, fix the link to point to a new address.
> >
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > ---
> >  Documentation/devicetree/usage-model.rst | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/usage-model.rst b/Documentation/devicetree/usage-model.rst
> > index 326d7af10c5b..e1b42dc63f01 100644
> > --- a/Documentation/devicetree/usage-model.rst
> > +++ b/Documentation/devicetree/usage-model.rst
> > @@ -12,7 +12,7 @@ This article describes how Linux uses the device tree.  An overview of
> >  the device tree data format can be found on the device tree usage page
> >  at devicetree.org\ [1]_.
>
> s/devicetree.org/elinux.org/

I wonder if we should make the devicetree.org link work again instead.
Primarily just to avoid the appearance of it being Linux specific.

The website is hosted on github[1] and I'd assume there's a way to do
redirects as a start.

Rob

[1] https://github.com/devicetree-org/devicetree-website
