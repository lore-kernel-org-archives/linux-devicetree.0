Return-Path: <SRS0=2LfR=BX=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFC0DC433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 13 Aug 2020 08:44:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A664D20781
	for <linux-devicetree@archiver.kernel.org>; Thu, 13 Aug 2020 08:44:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dbgrU/KM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726106AbgHMIoQ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 13 Aug 2020 04:44:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726100AbgHMIoP (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 13 Aug 2020 04:44:15 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 493ABC061757
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2020 01:44:15 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id v4so5327150ljd.0
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2020 01:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=MpKzKk8wGOFjAtVPa17BCRqwuTJzgLU2zdpuBahdHkQ=;
        b=dbgrU/KM6aDeln0roA20eNSMNbs20svp5M5CrJPMou5qqcaQfIJ4aesc+Xz6dS1pMQ
         DJjgZONExrMDWOIQWQif48Sv7B60WSZCHxT4JxKpLm/xepaxLPrmBDZorzowV4CunqZa
         qEnL5JMCZrXcWq9plACMPwx8lxABB8einuGfVVtg0q4WVq7jh/wfj6dcokW9oc1FL4z6
         lHednhWKbqcH0L6kH9DYiBdU6FX4AXhrxOzrbacsDlOFxft46GuFyqwRyswY82WVMv4j
         W2hMZInhkBBYRe0BSzJdr5gR/XSXS8xJbaCDISQDD/ujwnyO20ZDeK47ETuiZQiWCt7T
         GTRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=MpKzKk8wGOFjAtVPa17BCRqwuTJzgLU2zdpuBahdHkQ=;
        b=ldcsEXIMc8FWGV9s2mJErl18KntLIv7JhtZxqw3wx9POrlKcvPD0tLeJPQweJ+824n
         9gHnEBjfz4e/vtoIqrmyP1VDfX+4NqGOyrK7V2jg8w52GlaZsttteJ6PXAJ2pHTrshXa
         9QDRV9u85Ngd5YIK5A/0YPcDDzUQmFxtaxont71y9usjUpIQk3xzVPh3kuvtk5Q/N4V1
         SnNzZfq9s9zOM71sxOzB9ly5IVhw713BxSl8FRtlwPLfQUrN7ykdY87oJUUzvrmLnZ+t
         rxHb1t6fxOgtf/Xu0PallN8WLaSwFEtYxBguJDhm0vcMoywHmbHltWLVtstrKGpVfDAS
         eJRQ==
X-Gm-Message-State: AOAM530VT+eUrJUjBg8comV2gOCdn/qdcNSoCnbRE3CHNfAY23VV5e9M
        3G5CkXQ59WycPQqs3PDiNc6E41jYbTETxh8AHUyLWQ==
X-Google-Smtp-Source: ABdhPJxql5a3MUGD32ehFulTJWCwyKdiNDcsY3MR98fi6tYpCu3pQ6oJYcPd4vs8uKqQBrc/5eML6TkOvAtC6lipKPI=
X-Received: by 2002:a2e:90e:: with SMTP id 14mr1554489ljj.293.1597308253729;
 Thu, 13 Aug 2020 01:44:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200724132457.7094-1-pali@kernel.org>
In-Reply-To: <20200724132457.7094-1-pali@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 13 Aug 2020 10:44:02 +0200
Message-ID: <CACRpkdbUtG1vfqu=XViLGqirk2-yvBGsM4VOsA9Kymnauqv+QQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: armada-37xx: Add comment for pcie1_reset pin group
To:     =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc:     Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Jul 24, 2020 at 3:25 PM Pali Roh=C3=A1r <pali@kernel.org> wrote:

> Group name 'pcie1' is misleading as it controls only PCIe reset pin. Like
> other PCIe groups it should have been called 'pcie1_reset'. But due to
> backward compatibility it is not possible to change existing group name.
> So just add comment describing this PCIe reset functionality.
>
> Signed-off-by: Pali Roh=C3=A1r <pali@kernel.org>

No reaction from the maintainers and looks good to me,
so patch applied!

Yours,
Linus Walleij
