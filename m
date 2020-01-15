Return-Path: <SRS0=kWYo=3E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5DC0C33CB1
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jan 2020 12:41:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 86DC9222C3
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jan 2020 12:41:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="pK2KQsH0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726562AbgAOMls (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Jan 2020 07:41:48 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:45298 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726483AbgAOMls (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 15 Jan 2020 07:41:48 -0500
Received: by mail-ed1-f68.google.com with SMTP id v28so15334932edw.12;
        Wed, 15 Jan 2020 04:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VYFrUZfFIn1ih4ZXmSMoxrgE6FJJjwb6w+otiOxvkzc=;
        b=pK2KQsH0vQ8EelC3J81rzuMSl1QXiwz/YzhdEBimsT1vaLFmTbd6rhrzyJF6w7Rwd8
         oj1fc0rcth0QnkpoHlcq73rgVLIAaDyC3llMqh2Iba24SuyhlVK6CIKdF43KCkZ5gm6i
         ic54s1NSI0kqk4Sq2kzGiL8DKzOAqgM0S5fbfcKIiHaERa7k1F+4D7xIZJ66YeQla6cB
         3eDcMrsp1GkUJrQ6yGragpalYQNLJRuU9Czt2a5sErK6XpACiS3LQCDcVyh1Lejk9u3F
         +TTJMyObPAMrx0OTtcZzySwYrJI7wEUxJ0vt5vUkBrsN/KxSnWArQ6ZFTFjLVqM4fZkx
         iplA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VYFrUZfFIn1ih4ZXmSMoxrgE6FJJjwb6w+otiOxvkzc=;
        b=Vxa4hJ/p0Cyn3m9fKBvufrQyuZDvKeL6tGgTiRJ0RGF3y0EnnAQk1cXXJn/4cpPYfw
         xfBHgS3MSfC/FMNMVyqjlnfgXlsz9cKVqLUEV/IYz1TK0EQ3LVcVGjbzt9RhdNs1yDYz
         7pd9PMR/5GyjIZE1D8E0ZlbScmPs7ixZzTDiuheDypK2ZJWCchS7/cC5JCrtnj+7TebT
         pRN4CRGxT3DkgeSPbKdYjQ6PJc1LE16xMmsCr+G13cyyfmg+SAFYpFEcR8DaeijLRrAj
         0rD7oGF/PaXW4n3VEm9b8XZcxDgj5MItR5kwsdJA4ARMwTQa1s2x+beVa0hjGIG/u7+r
         SUPw==
X-Gm-Message-State: APjAAAWRi6sWm3jVMsPx9yeMoK/1IcsyZuchdELwfbc3gunVsi130HKS
        uEDedcYsCYbQbzgR1DKeZLZkN9ElxsPBoGhzjPc=
X-Google-Smtp-Source: APXvYqzJn0AHc4rPAk1+z4TbdT44aLhxu4nuRPnA4DwJwNpOXOAUvpMX9n6siNHGAePH0mzJTVYZg+aJCTMA3i24XeI=
X-Received: by 2002:a50:875c:: with SMTP id 28mr10542048edv.271.1579092106272;
 Wed, 15 Jan 2020 04:41:46 -0800 (PST)
MIME-Version: 1.0
References: <1578537045-23260-1-git-send-email-hanjie.lin@amlogic.com>
 <1578537045-23260-5-git-send-email-hanjie.lin@amlogic.com> <87pnfl6rdk.fsf@kernel.org>
In-Reply-To: <87pnfl6rdk.fsf@kernel.org>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Wed, 15 Jan 2020 13:41:35 +0100
Message-ID: <CAFBinCD0DJgYDhPRHqMQuouq+ZyF6Wg_LkuCMpHj2UG6vvvdbA@mail.gmail.com>
Subject: Re: [PATCH v4 4/6] usb: dwc3: Add Amlogic A1 DWC3 glue
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Hanjie Lin <hanjie.lin@amlogic.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Yue Wang <yue.wang@amlogic.com>,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, Carlo Caione <carlo@caione.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Liang Yang <liang.yang@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Qiufang Dai <qiufang.dai@amlogic.com>,
        Jian Hu <jian.hu@amlogic.com>,
        Victor Wan <victor.wan@amlogic.com>,
        Xingyu Chen <xingyu.chen@amlogic.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Jan 15, 2020 at 9:43 AM Felipe Balbi <balbi@kernel.org> wrote:
[...]
> > -     priv->clk = devm_clk_get(dev, NULL);
> > -     if (IS_ERR(priv->clk))
> > -             return PTR_ERR(priv->clk);
> > +     priv->soc_id = (enum meson_soc_id)of_device_get_match_data(&pdev->dev);
> > +
> > +     if (priv->soc_id == MESON_SOC_G12A) {
>
> you can use of_device_is_compatible() and get rid of the enumeration you added.
Hanjie switched to a struct (instead of an enum) that is passed as
"match data" in v5 [0] of this series
personally I prefer what Hanjie has in v5 over
of_device_is_compatible() (because that match data pattern is what we
also use on other Amlogic drivers)


Martin


[0] https://patchwork.kernel.org/patch/11326669/
