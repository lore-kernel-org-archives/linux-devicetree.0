Return-Path: <SRS0=u7up=3N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E5FEC2D0DB
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Jan 2020 14:04:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 363232077C
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Jan 2020 14:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579874641;
	bh=EmoC3saBU+pvM+zatEU9e1eFKaGsdFiXHvfsUFIX2/A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=IBKn5mJDkJMuDI5fvGRIX/kZE63UjlZzoDJPwa7SRWb8P6Zx7lSDSmA2a5ILvmUWo
	 pCrCEdNtUWlI39lJDCtxz8S2N1fATdHYky1e254YfX7hBqZS6lm685kCAQlQJ6shIy
	 jazaeUPX6mCz73Al6m6Q8HcsAuN58kW+b09jbDyA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389366AbgAXOEA (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 24 Jan 2020 09:04:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:32988 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387698AbgAXOEA (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 24 Jan 2020 09:04:00 -0500
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A88A82071A;
        Fri, 24 Jan 2020 14:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579874639;
        bh=EmoC3saBU+pvM+zatEU9e1eFKaGsdFiXHvfsUFIX2/A=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=zmCU+2nSNeoG0BOQIx2HgKudgPZO/y9lVwE/uegPyaDsdEeD7gADQslwU6Eeyfdqt
         p6hIoR4Cyg6ASVlnVlcPybdgbJD8ek5A3RCl3Zf9CFypAfya0MazzlPgzMM7O1hcH0
         fQoh4WxM/UP8bjMmcHSZrFBkjlPrIh0qc3WPejsQ=
Received: by mail-qk1-f180.google.com with SMTP id t204so1263221qke.7;
        Fri, 24 Jan 2020 06:03:59 -0800 (PST)
X-Gm-Message-State: APjAAAVabIL4iBeRGq9G1PaS7Ks5fo694OllIvrBiJO3w+2/zvCoRAbf
        zny4b/YKXZBs5JMHV9A57385stYzZSpBNzRFfw==
X-Google-Smtp-Source: APXvYqy5HLZ83xPew4yj0L30VTCwtdMFWYmbUs/IvA3nbdvnWnKHV3+zkH97cIu85Jh+L0yySOSBtrX9qUNvuAl1a+g=
X-Received: by 2002:a05:620a:9c7:: with SMTP id y7mr2583085qky.393.1579874638845;
 Fri, 24 Jan 2020 06:03:58 -0800 (PST)
MIME-Version: 1.0
References: <20200124114914.27065-1-dafna.hirschfeld@collabora.com>
In-Reply-To: <20200124114914.27065-1-dafna.hirschfeld@collabora.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 24 Jan 2020 08:03:47 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKgNzY=KF8XzuGjw2NogBawfi0gh9ytrk_nw_Ewg2QDdg@mail.gmail.com>
Message-ID: <CAL_JsqKgNzY=KF8XzuGjw2NogBawfi0gh9ytrk_nw_Ewg2QDdg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: fix compilation error of the example in intel,lgm-emmc-phy.yaml
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     devicetree@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Collabora Kernel ML <kernel@collabora.com>, dafna3@gmail.com
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Jan 24, 2020 at 5:49 AM Dafna Hirschfeld
<dafna.hirschfeld@collabora.com> wrote:
>
> Running:
> export DT_SCHEMA_FILES=Documentation/devicetree/bindings/phy/intel,lgm-emmc-phy.yaml
> 'make dt_binding_check'
>
> gives a compilation error. This is because in the example there
> is the label 'emmc-phy' but labels are not allowed to have '-' sing.
> Replace the '-' with '_' to fix the error.
>
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

There's a fix from the author, but you're first to get the fix correct, so:

Fixes: 5bc999108025 ("dt-bindings: phy: intel-emmc-phy: Add YAML
schema for LGM eMMC PHY")
Acked-by: Rob Herring <robh@kernel.org>

Kishon, Please apply these soon as linux-next is broken.

Rob
