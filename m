Return-Path: <SRS0=uboK=3Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76375C352A2
	for <linux-devicetree@archiver.kernel.org>; Wed,  5 Feb 2020 19:20:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 42C8B21741
	for <linux-devicetree@archiver.kernel.org>; Wed,  5 Feb 2020 19:20:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GuNlVw9B"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727440AbgBETUh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 5 Feb 2020 14:20:37 -0500
Received: from mail-ua1-f65.google.com ([209.85.222.65]:39614 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727415AbgBETUg (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 5 Feb 2020 14:20:36 -0500
Received: by mail-ua1-f65.google.com with SMTP id 73so1293529uac.6
        for <devicetree@vger.kernel.org>; Wed, 05 Feb 2020 11:20:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5YaLuYG6Iy8QwcRaBytxQgkWb5GSrDhgxvX793l25Mo=;
        b=GuNlVw9BGjVfmhTOpV2VTeLQx5fb7PKdprf2XR10o8G5FgixUq0JmY+Z6cyD+kx95/
         5YEYPMNOQ2HaOFmXohheuf6yU7ENKL+x9hT+6uAnCPS2kPLJN5v1nYtcuPh1UbkNEo++
         J8++OrPT4HiHnTqOvvoifx1YVBfMdbqv1HAW8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5YaLuYG6Iy8QwcRaBytxQgkWb5GSrDhgxvX793l25Mo=;
        b=pke40GW+9HOswyWwPZXD9bYys8oHkM7eZlKfF6xEVH/An6CzKNxIU6xijAX3TpML2V
         QPPLmX69oOfYWkClIe92o+HqE4EelG0QYMmpAuIVbdHO0z6lESzNkmAFh05x/+muPiZP
         zx2dqAr1N7iftzJI8UKy/Qf95EcJg31qe37p+VMqGPnJMLzN0osnSEC8BMKfJ5B8io8u
         JvnA6B7trashs8p9mWNtvYuzlZVaLeqCN6sBaWAqQZEh4e27K2K3cz9aKPduaKHv/z4S
         SnrrbVF58Mhw0camEjMI1VeSBCLQNz276jw9fUwrRit2L74yHAyTdVCdvhbDh8F0Pzzm
         M9QA==
X-Gm-Message-State: APjAAAUV8MgCVb+v9LoG85wbaBnOzc0iQJyNzhFUpZFuRydaSv4wXHk2
        NChuf0/VdlegVwT3PDi6avaUr2CjGSA=
X-Google-Smtp-Source: APXvYqzL7NoilN0n9Exh2p3drKw/V0ZAdSqykBh4NMWgWBrg6b473HzxBoYoqG8JpJ5y1oaxNifkmQ==
X-Received: by 2002:ab0:4e0e:: with SMTP id g14mr20142655uah.20.1580930434620;
        Wed, 05 Feb 2020 11:20:34 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id a196sm255561vke.14.2020.02.05.11.20.33
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2020 11:20:33 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id 59so1276963uap.12
        for <devicetree@vger.kernel.org>; Wed, 05 Feb 2020 11:20:33 -0800 (PST)
X-Received: by 2002:ab0:2006:: with SMTP id v6mr20493719uak.22.1580930433242;
 Wed, 05 Feb 2020 11:20:33 -0800 (PST)
MIME-Version: 1.0
References: <1580886097-6312-1-git-send-email-smasetty@codeaurora.org> <1580886097-6312-3-git-send-email-smasetty@codeaurora.org>
In-Reply-To: <1580886097-6312-3-git-send-email-smasetty@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 5 Feb 2020 11:20:22 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V6yM7UJwu0ZLPCqmDgV9FS4=g+wcLg0TV51b72zvWT9Q@mail.gmail.com>
Message-ID: <CAD=FV=V6yM7UJwu0ZLPCqmDgV9FS4=g+wcLg0TV51b72zvWT9Q@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] clk: qcom: gpucc: Add support for GX GDSC for SC7180
To:     Sharat Masetty <smasetty@codeaurora.org>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, dri-devel@freedesktop.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Taniya Das <tdas@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Tue, Feb 4, 2020 at 11:02 PM Sharat Masetty <smasetty@codeaurora.org> wrote:
>
> From: Taniya Das <tdas@codeaurora.org>
>
>  Most of the time the CPU should not be touching the GX domain on the
>  GPU
>  except for a very special use case when the CPU needs to force the GX

Really weird word-wrapping?  You've also indented your whole commit message?


>  headswitch off. Add a dummy enable function for the GX gdsc to simulate
>  success so that the pm_runtime reference counting is correct.

Overall the commit message sounds a lot like the message in commit
85a3d920d30a ("clk: qcom: Add a dummy enable function for GX gdsc").
That's fine for the most part, but it makes it sound like you're
_only_ adding the dummy enable.  In this case you're adding support
for the GX domain and _also_ adding a dummy enable.  Maybe try:

Most of the time the CPU should not be touching the GX domain on the
GPU except for a very special use case when the CPU needs to force the
GX headswitch off. Add the GX domain for that use case.  As part of
this add a dummy enable function for the GX gdsc to simulate success
so that the pm_runtime reference counting is correct.  This matches
what was done in sdm845 in commit 85a3d920d30a ("clk: qcom: Add a
dummy enable function for GX gdsc").


> Signed-off-by: Taniya Das <tdas@codeaurora.org>

Since you are re-posting Taniya's patch you need to add your own
Signed-off-by as per kernel policy.


> ---
>  drivers/clk/qcom/gpucc-sc7180.c | 37 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>
> diff --git a/drivers/clk/qcom/gpucc-sc7180.c b/drivers/clk/qcom/gpucc-sc7180.c
> index ec61194..3b29f19 100644
> --- a/drivers/clk/qcom/gpucc-sc7180.c
> +++ b/drivers/clk/qcom/gpucc-sc7180.c
> @@ -172,8 +172,45 @@ enum {
>         .flags = VOTABLE,
>  };
>
> +/*
> + * On SC7180 the GPU GX domain is *almost* entirely controlled by the GMU
> + * running in the CX domain so the CPU doesn't need to know anything about the
> + * GX domain EXCEPT....
> + *
> + * Hardware constraints dictate that the GX be powered down before the CX. If
> + * the GMU crashes it could leave the GX on. In order to successfully bring back
> + * the device the CPU needs to disable the GX headswitch. There being no sane
> + * way to reach in and touch that register from deep inside the GPU driver we
> + * need to set up the infrastructure to be able to ensure that the GPU can
> + * ensure that the GX is off during this super special case. We do this by
> + * defining a GX gdsc with a dummy enable function and a "default" disable
> + * function.
> + *
> + * This allows us to attach with genpd_dev_pm_attach_by_name() in the GPU
> + * driver. During power up, nothing will happen from the CPU (and the GMU will
> + * power up normally but during power down this will ensure that the GX domain
> + * is *really* off - this gives us a semi standard way of doing what we need.
> + */
> +static int gx_gdsc_enable(struct generic_pm_domain *domain)
> +{
> +       /* Do nothing but give genpd the impression that we were successful */
> +       return 0;
> +}
> +
> +static struct gdsc gx_gdsc = {
> +       .gdscr = 0x100c,
> +       .clamp_io_ctrl = 0x1508,
> +       .pd = {
> +               .name = "gpu_gx_gdsc",

nit: technically name could be "gx_gdsc" to match the name of the
struct and #define.  Your name is copied from sdm845 and matches the
name of the struct and #define from there.


> +               .power_on = gx_gdsc_enable,
> +       },
> +       .pwrsts = PWRSTS_OFF_ON,
> +       .flags = CLAMP_IO,

Compared to sdm845, you have different flags.  There we have:

.flags = CLAMP_IO | AON_RESET | POLL_CFG_GDSCR,

I'm not sure I have enough background knowledge about the hardare to
figure this out.  Can you confirm that you're different than sdm845 on
purpose?  Bonus points if you can confirm whether sdm845 is also
correct as it is today or should be changed to match what you have?


> +};
> +
>  static struct gdsc *gpu_cc_sc7180_gdscs[] = {
>         [CX_GDSC] = &cx_gdsc,
> +       [GX_GDSC] = &gx_gdsc,
>  };

Assuming that the question on flags is resolved and the commit message
updated, feel free to add my Reviewed-by tag.




-Doug
