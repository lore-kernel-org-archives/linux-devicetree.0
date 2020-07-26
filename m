Return-Path: <SRS0=vke8=BF=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB457C433DF
	for <linux-devicetree@archiver.kernel.org>; Sun, 26 Jul 2020 14:29:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 86E9F207BB
	for <linux-devicetree@archiver.kernel.org>; Sun, 26 Jul 2020 14:29:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=vanguardiasur-com-ar.20150623.gappssmtp.com header.i=@vanguardiasur-com-ar.20150623.gappssmtp.com header.b="cPtQupmk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726781AbgGZO3O (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 26 Jul 2020 10:29:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725949AbgGZO3O (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 26 Jul 2020 10:29:14 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D30D6C0619D4
        for <devicetree@vger.kernel.org>; Sun, 26 Jul 2020 07:29:12 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id d6so662059ejr.5
        for <devicetree@vger.kernel.org>; Sun, 26 Jul 2020 07:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7NgctBmCqLgQBnHYafy5r5rDsgw6j6oRlbINnPPqer0=;
        b=cPtQupmk1fewrsDSJE9eb5vshcj32eD6Ersn4gDO9eNd6Ue1J8TTT513AbOaU188zs
         AFhrKzbGgOthhgLIv7kksB+ClxWzSueRE1uglOlaoNsTsZyf9B+bzJiS+tpChshZNnBx
         jG7QPFt44f1VS8a/+nZT2WeMe/G9NCBDPPm4HUnwcT9dy/zwJ5SzHwOmd7CTs+gwiBqj
         bzjRkzNxOgk/XBF69w5CuAJhiGIlAC4SmYNINF4Buj0bhy9eQvwlc8yYeeo6BUAlSJfO
         rCpj9D4E/yEXL1JlRHqSpG0lcFfNFaw3IXioKQHV91iwjY8z8na9xqtHPwMYUOlv9L+k
         +zCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7NgctBmCqLgQBnHYafy5r5rDsgw6j6oRlbINnPPqer0=;
        b=ZqbEdGwndnyncCyj/u7RoMu09+7dg1rs8Zux0E9uKdTqGuly45Rd3J7MI+BocSxQK1
         81/xSQpUUZSUvoRM6jMFfzNj0ek2CTa3bInaoVc232+JdLt11ZSLM8JVfSvKV3DznW4I
         ltFjeOkJhmgskOu5k8OmqwEX9GnLbrsxEtjiQiesM6lweQfgi51YExBjKDN/uzUjJlFJ
         mHmODfheqnGUIrUVYrUFLz8UCZcJ0wem1Ow1L/tEHDRIVKisAdkOMEqW3ib99AP9EzCB
         Xc+CywQRSDIk3lwhU8TistyTLpqncY8ogycqMEgV43REonfYKGNA1805cKUljofd6Nr2
         +R+A==
X-Gm-Message-State: AOAM531vzIE/MvMrSje8oflGxRNaoSrVOwmgxs/k0YoRRrYKFziUc8gz
        /w9pPGHPvGXN+8HQXiY/nF7YjkorQh98OyVDbiB66g==
X-Google-Smtp-Source: ABdhPJzBeuYaugwjE9rJF2v3mAtHaNmHcXv/fPnmdymnSEvfi/ZfOBepfh/WGmh6X9cuHm1Lqxfnl3IKozqO1B3ATn0=
X-Received: by 2002:a17:906:1e43:: with SMTP id i3mr16626277ejj.92.1595773751471;
 Sun, 26 Jul 2020 07:29:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200713060842.471356-1-acourbot@chromium.org> <20200713060842.471356-8-acourbot@chromium.org>
In-Reply-To: <20200713060842.471356-8-acourbot@chromium.org>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Sun, 26 Jul 2020 11:29:00 -0300
Message-ID: <CAAEAJfA4Po9R25CzBxiFAV=7-7rPujLc79zLnXyXWk7xNbBtYA@mail.gmail.com>
Subject: Re: [PATCH v3 07/16] media: mtk-vcodec: venc: specify supported
 formats per-chip
To:     Alexandre Courbot <acourbot@chromium.org>
Cc:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        linux-media <linux-media@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Alexandre,

Last review on my side, this series looks mostly good.

On Mon, 13 Jul 2020 at 03:09, Alexandre Courbot <acourbot@chromium.org> wrote:
>
> Different chips have different supported bitrate ranges. Move the list

s/bitrate ranges/formats

> of supported formats to the platform data, and split the output and
> capture formats into two lists to make it easier to find the default
> format for each queue.
>
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>
> ---
>  .../platform/mtk-vcodec/mtk_vcodec_drv.h      |   8 ++
>  .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 122 +++++++-----------
>  .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |  40 ++++++
>  3 files changed, 95 insertions(+), 75 deletions(-)
>
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> index b8f913de8d80..59b4b750666b 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> @@ -313,6 +313,10 @@ enum mtk_chip {
>   * @has_lt_irq: whether the encoder uses the LT irq
>   * @min_birate: minimum supported encoding bitrate
>   * @max_bitrate: maximum supported encoding bitrate
> + * @capture_formats: array of supported capture formats
> + * @num_capture_formats: number of entries in capture_formats
> + * @output_formats: array of supported output formats
> + * @num_output_formats: number of entries in output_formats
>   */
>  struct mtk_vcodec_enc_pdata {
>         enum mtk_chip chip;
> @@ -321,6 +325,10 @@ struct mtk_vcodec_enc_pdata {
>         bool has_lt_irq;
>         unsigned long min_bitrate;
>         unsigned long max_bitrate;
> +       const struct mtk_video_fmt *capture_formats;
> +       size_t num_capture_formats;
> +       const struct mtk_video_fmt *output_formats;
> +       size_t num_output_formats;
>  };
>
>  /**
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> index 50ba9da59153..05743a745a11 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> @@ -23,47 +23,9 @@
>  #define DFT_CFG_WIDTH  MTK_VENC_MIN_W
>  #define DFT_CFG_HEIGHT MTK_VENC_MIN_H
>  #define MTK_MAX_CTRLS_HINT     20
> -#define OUT_FMT_IDX            0
> -#define CAP_FMT_IDX            4
> -
>
>  static void mtk_venc_worker(struct work_struct *work);
>
> -static const struct mtk_video_fmt mtk_video_formats[] = {
> -       {
> -               .fourcc = V4L2_PIX_FMT_NV12M,
> -               .type = MTK_FMT_FRAME,
> -               .num_planes = 2,

Again, not an issue with your patch, so feel free to ignore this.

You may avoid keeping track of num_planes (or any other
property of the pixel format) and use v4l2_fill_pixfmt_mp
to get all the information you need.

Thanks,
Ezequiel
