Return-Path: <SRS0=aDgx=ZR=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 155A6C432C0
	for <linux-devicetree@archiver.kernel.org>; Mon, 25 Nov 2019 15:37:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D1CE0207FD
	for <linux-devicetree@archiver.kernel.org>; Mon, 25 Nov 2019 15:37:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bCYcQ+Kl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728297AbfKYPhi (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 25 Nov 2019 10:37:38 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:37974 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728036AbfKYPhi (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 25 Nov 2019 10:37:38 -0500
Received: by mail-lf1-f68.google.com with SMTP id q28so11383663lfa.5
        for <devicetree@vger.kernel.org>; Mon, 25 Nov 2019 07:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tzbbtJJtTXoMbOzUSaKDgvfNOfFeZh50+ac8yg9V7n0=;
        b=bCYcQ+KlvTr9IKnKYuT0eTVP2EIWM613mtRB9VkredrydGTnCjMkbh7IIb/PpLRV//
         0yJL66wan5LVJW79MRsjourVKZjLFE6g/Qkeyfc/Y1QwxnZ4I4Zf4r1lLfEMKNxVfTis
         llQU2bwxnN6eegmqd21fJZIM2m09TblCv0QD5n7rAu73nOPMXbPQVeuyZDqCatiA2Iy2
         hs3ZCDKxF7rIogpktIOBlV7Q0a2imdryR07AwIbOwiGOLBOxxW8ywV94H5k0WweIT8ij
         zxKY2GYJ3g+Gw7RDigIlIaaWz7xdj0Vb9k0NGrv413OKarvvDMjwNPqIPLu9Yz9HuSrl
         RjTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tzbbtJJtTXoMbOzUSaKDgvfNOfFeZh50+ac8yg9V7n0=;
        b=VpLYdV/JC+7vFiII13TZTYIcCPJX969Fhtku4KXCAGtBrOfxqEOLLB4GOjrYLn0wWO
         9gGujGIXUOWJsdMs3CxAey8PSAv0WVvQyoBH7hlelhYL7bM4asugmHvZG6Tu91JtbWUi
         F4e6APc+lbXzOkRA1QfSBhKuu429Hh/K0KVUQbrBoHGG2M++P5Ov3gCn/FDPROvaSTqe
         bIOhgp0XWieBLR2zDGSjgVPJ4eud23k12+kSQeZBBxodizDWzMkS3d1zQ0M/b/YxnGLW
         QWZnrempMpRJNSqu9Y25ey0tDTLIWSB2muQW4OohOj0rJRWOXz3FXqg5JBpaaJYb5A4X
         3Mbg==
X-Gm-Message-State: APjAAAWRU9g6Dhr6L7cPzAjqZXwMFUk1Wbr2U7+YgT535MVrKsczd7Ln
        11ZeEJfw8n4AurxvJ7ZflgZ3i9zmQqEnVS7Wm7a9pA==
X-Google-Smtp-Source: APXvYqxD+JrvdwNziaXkpfYwENyjYfhMX0TCYLhWRXzr0Nmk28hukOQJyU4sgKFYX0MfQDFy6G11DYI4jMJBVwre0x0=
X-Received: by 2002:a19:645b:: with SMTP id b27mr10944903lfj.117.1574696256337;
 Mon, 25 Nov 2019 07:37:36 -0800 (PST)
MIME-Version: 1.0
References: <20191125122256.53482-1-stephan@gerhold.net> <20191125122256.53482-2-stephan@gerhold.net>
In-Reply-To: <20191125122256.53482-2-stephan@gerhold.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 25 Nov 2019 16:37:25 +0100
Message-ID: <CACRpkdaM1O6xNE3yNsnnK=ZeOPCcaFTt-pUbMC9fUsSF38fOCw@mail.gmail.com>
Subject: Re: [PATCH 2/5] ARM: dts: ux500: Rename generic pin configs according
 to pin group
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Nov 25, 2019 at 1:27 PM Stephan Gerhold <stephan@gerhold.net> wrote:

> Some components (e.g. SDI, I2C) can be used with different pin assignments.
> Before we can add the alternative configurations, we need to rename the
> current configurations to more generic names.
>
> Each pin configuration usually configures one specific pin group.
> Therefore we rename the configurations to use the pin group as name.
> Make up for the slightly longer names by removing the "_mode" suffix.
>
> Rename all existing uses to use the new labels.
>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>

Patch applied for v5.6.

Yours,
Linus Walleij
