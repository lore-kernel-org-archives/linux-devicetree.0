Return-Path: <SRS0=m/6z=3Q=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF6B5C3F68F
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jan 2020 07:55:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C472B214AF
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jan 2020 07:55:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kSO/uE+4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726260AbgA0Hzr (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 27 Jan 2020 02:55:47 -0500
Received: from mail-vs1-f67.google.com ([209.85.217.67]:45902 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725972AbgA0Hzr (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 27 Jan 2020 02:55:47 -0500
Received: by mail-vs1-f67.google.com with SMTP id v141so1397530vsv.12
        for <devicetree@vger.kernel.org>; Sun, 26 Jan 2020 23:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=JisW5FdHqDfpueRuACrKxki3mS2+DqkIGJ6tqvYKBYg=;
        b=kSO/uE+41usEvH7ebSjUhk6e1/GR1kdSgxZbiRxsCAhlZoPKgznwup/h/2aiurqXba
         seFxgj3oUfrgEWcKa+G614+LeCAaTNBjCdbjJPXw0HZTQ7jIJIx56MVRyj5idy2Njihw
         1lvg7u/sCsRI9lQAUgiE+1pj3eYt3mM8RKqpvOqGY4GoQ8WpnDC8loBTB3RIAdXpJd1t
         uvhGn77x1mkhssxugQBP4QZX/BGJNtXHXbfds528PcECqhauXzE+uRrC+XgHw3VmoWxm
         cfiAWEvIJOhatU7LA2qPT3/WwEw8MlcDjWSC/qZE6TC9IgUl8qSgQSK+hpv1LKGzU+vi
         04YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=JisW5FdHqDfpueRuACrKxki3mS2+DqkIGJ6tqvYKBYg=;
        b=rpiXh4gl61YD6vff+npwRpxZw3yG/4XQ/77ai+N2ramwH4Xsh+UzIKYHlf4QWql8Lg
         a19riox9Mka6QyAUXHoN1AboltCtJ90NrMWZUINpqJZgIFWFqqpRWU7I68jBdgnbJL0K
         5QjVHr+XvYRd112x5yns9MKMPCHHmhqc2L/mEZzZR484LwXyN6scK6QntJ5PKXPShMhT
         OKxCVjRhk13R4h3zhfn24d7z5J+2CvDVjDp+oNyoPMTAkgLbdEyN0GETYTFzUQ6xIGKL
         kIbEJas+PUgqkV2Fu+zFNTKvY5CgJoc51aD4U48N3cImLRItOIF1/6TPHP4KSJI3qnGh
         W9BQ==
X-Gm-Message-State: APjAAAXD2et/HGiq695l8P0WscpMj+TK9ZnDfotEbi1gWB79msoYAaVN
        cNL5BAFj8uMjAfQvf8vFT8hxzKDrc1nyXYM/e+7naA==
X-Google-Smtp-Source: APXvYqyL1TCg49AaeGX4CVUErd9kezem7knF5p9I+JWV1m4AIpmUm9yBXdiHxcp8rC0t9W4QBLYziKJLuXWuYii+iQs=
X-Received: by 2002:a67:ee02:: with SMTP id f2mr584267vsp.165.1580111746386;
 Sun, 26 Jan 2020 23:55:46 -0800 (PST)
MIME-Version: 1.0
References: <20200108052337.65916-1-drinkcat@chromium.org> <20200108052337.65916-6-drinkcat@chromium.org>
 <b58a8cf9-3275-cf89-6dff-596aceeb8000@arm.com> <CANMq1KBcNr=1_poBHrA_SDo_h-5i3e5TMqASEVaDj5LevsRcOQ@mail.gmail.com>
In-Reply-To: <CANMq1KBcNr=1_poBHrA_SDo_h-5i3e5TMqASEVaDj5LevsRcOQ@mail.gmail.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 27 Jan 2020 08:55:10 +0100
Message-ID: <CAPDyKFr4Vz1ihuFQNnhDLEnOs=BZ1n2wzw3CATgPcDXs9g54uA@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] drm/panfrost: Add support for multiple power
 domain support
To:     Nicolas Boichat <drinkcat@chromium.org>
Cc:     Steven Price <steven.price@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Devicetree List <devicetree@vger.kernel.org>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        David Airlie <airlied@linux.ie>,
        lkml <linux-kernel@vger.kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Mark Brown <broonie@kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, 10 Jan 2020 at 02:53, Nicolas Boichat <drinkcat@chromium.org> wrote=
:
>
> +Ulf to keep me honest on the power domains
>
> On Thu, Jan 9, 2020 at 10:08 PM Steven Price <steven.price@arm.com> wrote=
:
> >
> > On 08/01/2020 05:23, Nicolas Boichat wrote:
> > > When there is a single power domain per device, the core will
> > > ensure the power domains are all switched on.
> > >
> > > However, when there are multiple ones, as in MT8183 Bifrost GPU,
> > > we need to handle them in driver code.
> > >
> > >
> > > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> > > ---
> > >
> > > The downstream driver we use on chromeos-4.19 currently uses 2
> > > additional devices in device tree to accomodate for this [1], but
> > > I believe this solution is cleaner.
> >
> > I'm not sure what is best, but it seems odd to encode this into the Pan=
frost driver itself - it doesn't have any knowledge of what to do with thes=
e power domains. The naming of the domains looks suspiciously like someone =
thought that e.g. only half of the cores could be powered, but it doesn't l=
ook like that was implemented in the chromeos driver linked and anyway that=
 is *meant* to be automatic in the hardware! (I.e. if you only power up one=
 cores in one core stack then the PDC should only enable the power domain f=
or that set of cores).
>
> This is actually implemented in the Chrome OS driver [1]. IMHO power
> domains are a bit confusing [2]:
>  i. If there's only 1 power domain in the device, then the core takes
> care of power on the domain (based on pm_runtime)
>  ii. If there's more than 1 power domain, then the device needs to
> link the domains manually.
>
> So the Chrome OS [1] driver takes approach (i), by creating 3 devices,
> each with 1 power domain that is switched on/off automatically using
> pm_runtime.
>
> This patch takes approach (ii) with device links to handle the extra doma=
ins.
>
> I believe the latter is more upstream-friendly, but, as always,
> suggestions welcome.

Apologies for the late reply. A few comments below.

If the device is partitioned across multiple PM domains (it may need
several power rails), then that should be described with the "multi PM
domain" approach in the DTS. As in (ii).

Using "device links" is however optional, as it may depend on the use
case. If all multiple PM domains needs to be powered on/off together,
then it's certainly recommended to use device links.

However, if the PM domains can be powered on/off independently (one
can be on while another is off), then it's probably easier to operate
directly with runtime PM, on the returned struct *device from
dev_pm_domain_attach_by_id().

Also note, there is dev_pm_domain_attach_by_name(), which allows us to
specify a name for the PM domain in the DTS, rather than using an
index. This may be more future proof to use.

[...]

Hope this helps.

Kind regards
Uffe
