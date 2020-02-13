Return-Path: <SRS0=Uhz2=4B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 041F4C2BA83
	for <linux-devicetree@archiver.kernel.org>; Thu, 13 Feb 2020 08:25:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CB0C721734
	for <linux-devicetree@archiver.kernel.org>; Thu, 13 Feb 2020 08:25:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mpc0JeM0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729418AbgBMIZL (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 13 Feb 2020 03:25:11 -0500
Received: from mail-qk1-f195.google.com ([209.85.222.195]:43538 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729401AbgBMIZL (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 13 Feb 2020 03:25:11 -0500
Received: by mail-qk1-f195.google.com with SMTP id p7so4859354qkh.10
        for <devicetree@vger.kernel.org>; Thu, 13 Feb 2020 00:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OK0wietKvUZvwARAxmAdcE7mqGpP2688mkrFendJI3c=;
        b=mpc0JeM0+dOlAf+F/vCTYHoR+PUYA7VQeKJNhPzJStLAgkkRV03DFL99y9egz3e68P
         lPCoDzkpJvdoyiVMw6PB/Dlh0Xa4d+vZUYPZE19Q2YMPwFx6GqbOhqUZsM2yIvmMYB4C
         9GRN7zW46xO+BvOUOoI84rF0S+e8+9ZGjjrVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OK0wietKvUZvwARAxmAdcE7mqGpP2688mkrFendJI3c=;
        b=cjL6DVVf87R7Q97CpZdWk4JWp20iGujfOBBdryG2HEuy5AGlLoQq/bc4QZXwQcVlv8
         GQWeIbdLF4ACVYsdYOnNCGTFcvWux0m7bx+Nq+Ce1ifPr3Px5qA2vr4In4WdBGaoe+7o
         31eOpkj7llqq3+QfveGOWfdPJhI0PfBxh8Zz94+LfkuwZYBuxXNlfaAhSvUMzrjzuer9
         I36tVYhyApJdH0VlyhcbHTgPxkx1kzD38f5XE0kqTx7+bhRlzF9gdro9wBVcEEP63B0q
         eVXxHURIBscHs5wGt7CjJu5Hkj6UyBygiJcvydMzxj0cNzhTY/qSjCTSRSCF+5Put+wi
         e51w==
X-Gm-Message-State: APjAAAXeNYaF5c0unjQO03gUxs+4wCxVET468BIaAQHBO5uiviTcDSHd
        QFqDtjCZwdIlSvIkipx1so06MoskMtmLP571Dl5cog==
X-Google-Smtp-Source: APXvYqz2tNr3c3qIVwpXL0Kiwvf19NSiJuWwJpM0OOB3yzEmPzpmBZQIrLG8zON5DYMYRdtNFRQMdyhNLsgoU/FJ9vY=
X-Received: by 2002:a37:6595:: with SMTP id z143mr11724807qkb.457.1581582310226;
 Thu, 13 Feb 2020 00:25:10 -0800 (PST)
MIME-Version: 1.0
References: <20200207052627.130118-1-drinkcat@chromium.org>
 <20200207052627.130118-8-drinkcat@chromium.org> <CANMq1KBL-S2DVKbCB2h_XNpfUro+pZ96-C5ft0p-8GX_tbXELQ@mail.gmail.com>
 <CAL_JsqLuo+2G2MjiwS9cwNhMV2pGBojXFGNqEfLv3fP-Y04mfA@mail.gmail.com> <CANMq1KCn5rrOrv2GjFh5Aau5Los4VVk=NMWAsvZiNuwoxyMVHA@mail.gmail.com>
In-Reply-To: <CANMq1KCn5rrOrv2GjFh5Aau5Los4VVk=NMWAsvZiNuwoxyMVHA@mail.gmail.com>
From:   Nicolas Boichat <drinkcat@chromium.org>
Date:   Thu, 13 Feb 2020 16:24:59 +0800
Message-ID: <CANMq1KCD-Ut3bjEmtpPCgOf+KHyi9cw7QSsxcQrWU4h2juZCUQ@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] RFC: drm/panfrost: devfreq: Add support for 2 regulators
To:     Rob Herring <robh+dt@kernel.org>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Steven Price <steven.price@arm.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Devicetree List <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Feb 13, 2020 at 3:57 PM Nicolas Boichat <drinkcat@chromium.org> wrote:
> > > [snip]
> > > But then there's a slight problem: panfrost_devfreq uses a bunch of
> > > clk_get_rate calls, and the clock PLLs (at least on MTK platform) are
> > > never fully precise, so we get back 299999955 for 300 Mhz and
> > > 799999878 for 800 Mhz. That means that the kernel is unable to keep
> > > devfreq stats as neither of these values are in the table:
> > > [ 4802.470952] devfreq devfreq1: Couldn't update frequency transition
> > > information.
> > > The kbase driver fixes this by remembering the last set frequency, and
> > > reporting that to devfreq. Should we do that as well or is there a
> > > better fix?

This one is my bad, I was missing this patch in my forklift to 4.19:
22bd4df9dadf46f drm/panfrost: devfreq: Round frequencies to OPPs

(should really try to boot that board on linux-next, but that's for
another time)
