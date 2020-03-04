Return-Path: <SRS0=c2W6=4V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98941C3F2CE
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Mar 2020 21:24:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6B06F20828
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Mar 2020 21:24:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OajD2LPf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727528AbgCDVYi (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 4 Mar 2020 16:24:38 -0500
Received: from mail-vk1-f174.google.com ([209.85.221.174]:39305 "EHLO
        mail-vk1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726440AbgCDVYi (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 4 Mar 2020 16:24:38 -0500
Received: by mail-vk1-f174.google.com with SMTP id t129so1010122vkg.6
        for <devicetree@vger.kernel.org>; Wed, 04 Mar 2020 13:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=4t+a10DBQdipoQlomK8+kIWiVyd5bkVTFvmH69b0JCo=;
        b=OajD2LPfSTB/kFbxrXR7pZlRwA1R69Ie/OL3cLOx9TS+jZax/+6QyJhK66K7vx1wO9
         ZfeqcGwFvlSGhITyAM7QAJ0odr4n0g8FA7ZaP3lmGAUstAdqRLQkn8FIprAicqBhWF+M
         p3Mphgmrt3BmQwtZp3pZi13EzGI+zqin3kqdmhdN7VwOebwcbybeCc9oqkcMlvEdZpqk
         +d6C+2kVc8y/4xg0fN9z5EABodbNvq+BnEK8XfqkT6IHW+R6CWK3R6aJjcIM2WpY4ACD
         n+QuGzaKnW1xFTNkBeiUr2csdimG3FHLPiPlGj8cCjYUk9VJj3YzJfOgFfgeTxNP6jA8
         XFpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=4t+a10DBQdipoQlomK8+kIWiVyd5bkVTFvmH69b0JCo=;
        b=ZWN6sFoIw4eAoWl4bQxeNyvroozc61eyox9BnzFeZlLkz7hTYAT2JvMvchlVVxxJeT
         j1ElKDrIk3m2crTjaf6a3RwBb+Byd5TlRqdZUNEJ8ydeyR8UzqQ41sLnY5BbE2zcUDyL
         yTqOMlc+48zvabxxDR+BiFOV9inUvY0O4z4C1rTyp6AaGKrK1m/hoKJL2UN1ZPo8MKBJ
         a71LJHLtVDHT0QKkegTvvunaQdEAViBPGJLxpeCrW/xFNmh0RbDj0eG1PZYnpTQPbGw4
         dSduWlu73g4+UMveBHeNphxUtHXtD/uTv4d/AGZ9kmGLIJeedZe3nq6Pxc6iXSRqbYWR
         2e7Q==
X-Gm-Message-State: ANhLgQ0tPSe5a5+2fscobo566/FH/gbVSUPbptHmTJh763XUM5trmEIf
        56wO9jEkXguO3IYdobaeC7CCvJx9crSU95/EvQ4n5EAX2k0=
X-Google-Smtp-Source: ADFU+vsmBU86dviusXbtKBM0PamclS9GhpocffyaS+Nwv3v7luZK92piirfQeOmUhRl3+wry0BKBuChSsmXdndoTfoI=
X-Received: by 2002:a1f:788c:: with SMTP id t134mr2865086vkc.46.1583357076907;
 Wed, 04 Mar 2020 13:24:36 -0800 (PST)
MIME-Version: 1.0
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Thu, 5 Mar 2020 02:54:25 +0530
Message-ID: <CAHLCerPCyYMmUttfz5mPrJiu3ApzoijTERLYjdZYau=EFVNDPw@mail.gmail.com>
Subject: Permission to relicense thermal bindings to GPL-v2 + BSD-2-Clause
To:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Rob Herring <robh@kernel.org>, malat@debian.org,
        wxt@rock-chips.com, punit.agrawal@arm.com,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Eduardo Valentin <edubezval@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

Everyone on CC has contributed to the thermal bindings[1] in the
kernel. They are currently licensed under GPLv2 but we'd like to
relicense them as GPLv2 and BSD-2-Clause.

If you agree, could you please send your ack to relicense the binding
as GPLv2 + BSD-2-Clause. I will then add the BSD-2-Clause license to
the yaml bindings sent to the list.[2]

Regards,
Amit

[1] git log --no-merges
Documentation/devicetree/bindings/thermal/thermal.txt | grep Author |
uniq
Author: Amit Kucheria <amit.kucheria@linaro.org>
Author: Viresh Kumar <viresh.kumar@linaro.org>
Author: Rob Herring <robh@kernel.org>
Author: Mathieu Malaterre <malat@debian.org>
Author: Caesar Wang <wxt@rock-chips.com>
Author: Punit Agrawal <punit.agrawal@arm.com>
Author: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Author: Eduardo Valentin <eduardo.valentin@ti.com>

[2] https://lkml.org/lkml/2020/2/24/104
