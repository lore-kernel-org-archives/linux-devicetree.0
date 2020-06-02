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
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAF03C433DF
	for <linux-devicetree@archiver.kernel.org>; Tue,  2 Jun 2020 12:49:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 95A15206A2
	for <linux-devicetree@archiver.kernel.org>; Tue,  2 Jun 2020 12:49:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AM+9tD6c"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725958AbgFBMti (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 2 Jun 2020 08:49:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725940AbgFBMth (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 2 Jun 2020 08:49:37 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85A31C061A0E
        for <devicetree@vger.kernel.org>; Tue,  2 Jun 2020 05:49:37 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id q2so1952361vsr.1
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2020 05:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=u2UCJQtDiG0eHQBJkG5+CdCw59UdXa7OZsIDHTFqlNI=;
        b=AM+9tD6cynbWf8zZpkOGrVG16SS8ZAJDBrCBcdZsdX5thmEf7Yww4G8MZu09ToM/1f
         6XbT6VaSn2jqfmcI/kfjlRwYBCXWMjFuYdPYNQQhVW6Poo2x/DlaKJCsNDz8ZlFNMU75
         NWK+BU/oTz0eGcPG95ZWQZtaxcwDQANzeV66VzYAwx1KWc5EBruseix8RDYgCx4qiKp/
         rNv2BK2jHuY6cltKUZoo1wtvDgUY55rtvW7lHuXPuYs/6jbJFPSyTkYSArPY5Jd3OuER
         3yEhUBImO1/iwZJDzgV9ii0+8GMHbD+57eEq2ODXwZymjiZDFS1GU2MKoWMzf5jaVrHh
         Xb2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u2UCJQtDiG0eHQBJkG5+CdCw59UdXa7OZsIDHTFqlNI=;
        b=QDbL/IOdh9kLBzEBGNiAVZCiGlWT7Dajo9RJ+K92bkg+lLjn9F08lajtzJlnqQlbkk
         dA+TAylq63YliOi8P3gs03jnyZlPvqcZ3aBbmFMdAPtgzwPd8Cfw0HO4rPJMxgVvFSM+
         48q1s4TK35zexUWxqlzmfWXuuivBNakZApB/lpiY/gcmrDlfDRYwBm0wHvJEC33pUgOI
         8P5L08Y76H+ThPsHLzv55OBmIOpbPUS5BGpnQSV2pc7ju2Rnq6uuTx2jOdizh/pf/eeA
         qV2NUZZ5IdeakjXt0wvsVXxeu5016eGSBC60GATVzl7TFxKef9hyukutXNTFwJOB4TVu
         FRyA==
X-Gm-Message-State: AOAM530wqyHwLaNu/s9G0P4cZbLtNSti//w4pvWQxqWNMc/EWovahqm6
        98AWc2Qna0DNbQZVEp5XAqdPi3Qw60KJwsPyh44=
X-Google-Smtp-Source: ABdhPJw/+z7NB2VWRLaqW6glWW9sGgKJepBqz0O7f+2nQCNT4ZvDq0MnedfrItwQYQF9aQ3NnGmW8s5bLIbEp8NUrCU=
X-Received: by 2002:a67:3291:: with SMTP id y139mr5737284vsy.37.1591102176673;
 Tue, 02 Jun 2020 05:49:36 -0700 (PDT)
MIME-Version: 1.0
References: <1590991880-24273-1-git-send-email-victor.liu@nxp.com>
In-Reply-To: <1590991880-24273-1-git-send-email-victor.liu@nxp.com>
From:   Emil Velikov <emil.l.velikov@gmail.com>
Date:   Tue, 2 Jun 2020 13:46:19 +0100
Message-ID: <CACvgo50UOby-xV_OYmM55VUXUbwLxK-q6bs2FoS_FuwB9ChYJg@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/panel: simple: Add support for KOE TX26D202VM0BWA panel
To:     Liu Ying <victor.liu@nxp.com>
Cc:     ML dri-devel <dri-devel@lists.freedesktop.org>,
        devicetree <devicetree@vger.kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        NXP Linux Team <linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, 2 Jun 2020 at 08:17, Liu Ying <victor.liu@nxp.com> wrote:
>
> This patch adds support for Kaohsiung Opto-Electronics Inc.
> 10.1" TX26D202VM0BWA WUXGA(1920x1200) TFT LCD panel with LVDS interface.
> The panel has dual LVDS channels.
>
> My panel is manufactured by US Micro Products(USMP).  There is a tag at
> the back of the panel, which indicates the panel type is 'TX26D202VM0BWA'
> and it's made by KOE in Taiwan.
>
> The panel spec from USMP can be found at:
> https://www.usmicroproducts.com/sites/default/files/datasheets/USMP-T101-192120NDU-A0.pdf
>
> The below panel spec from KOE is basically the same to the one from USMP.
> However, the panel type 'TX26D202VM0BAA' is a little bit different.
> It looks that the two types of panel are compatible with each other.
> http://www.koe.j-display.com/upload/product/TX26D202VM0BAA.pdf
>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index b6ecd15..7c222ec 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -2200,6 +2200,37 @@ static const struct panel_desc koe_tx14d24vm1bpa = {
>         },
>  };
>
> +static const struct display_timing koe_tx26d202vm0bwa_timing = {
> +       .pixelclock = { 151820000, 156720000, 159780000 },
> +       .hactive = { 1920, 1920, 1920 },
> +       .hfront_porch = { 105, 130, 142 },
> +       .hback_porch = { 45, 70, 82 },
> +       .hsync_len = { 30, 30, 30 },
> +       .vactive = { 1200, 1200, 1200},
> +       .vfront_porch = { 3, 5, 10 },
> +       .vback_porch = { 2, 5, 10 },
> +       .vsync_len = { 5, 5, 5 },
> +};
> +
> +static const struct panel_desc koe_tx26d202vm0bwa = {
> +       .timings = &koe_tx26d202vm0bwa_timing,
> +       .num_timings = 1,
> +       .bpc = 8,
> +       .size = {
> +               .width = 217,
> +               .height = 136,
> +       },
> +       .delay = {
> +               .prepare = 1000,
> +               .enable = 1000,
> +               .unprepare = 1000,
> +               .disable = 1000,
Ouch 1s for each delay is huge. Nevertheless it matches the specs so,
the series is:
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>

Sam, Thierry I assume you'll merge the series. Let me know if I should
pick it up.

-Emil
