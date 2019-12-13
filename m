Return-Path: <SRS0=VR/D=2D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 812E6C43603
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Dec 2019 08:59:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4B4F1206C3
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Dec 2019 08:59:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vxcn/yQJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725948AbfLMI7X (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 13 Dec 2019 03:59:23 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:46428 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725793AbfLMI7X (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 13 Dec 2019 03:59:23 -0500
Received: by mail-lj1-f194.google.com with SMTP id z17so1738667ljk.13
        for <devicetree@vger.kernel.org>; Fri, 13 Dec 2019 00:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=neDwLTAD9jZBzNHCTpQNXqb55Q19dpVUnqxtm4qngC4=;
        b=vxcn/yQJtKa3gJABcbwws+zsCvWydlc4hiIlN9oHnNaSKTpm0zNd3gpSZO5lShK4Lz
         7ySxoBZZGyT5IiZTF3DrIFpn/9WuEgc0UolRO7BMf9GXSrO5NI07h63FPaW4jxPCtWOB
         I6SnDaSDk7AnavpFEBYYFZBUwEDPcQKoDKB3wp/iAv/UC2ql2i548auPCoNPhWAInw0I
         +tyTHKlU29ssg/GMIwqe/VMfmRUjcRPrtFbovPdBY4g84ap+mKqX6vsx2uC9nZQs0pP/
         MqyAg7GtGxi9QH3iQGXuAmmorV5vGfdgh/zqtwbWfmk9c2rI8MKy4OSuTlOREaAvuZdb
         2qoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=neDwLTAD9jZBzNHCTpQNXqb55Q19dpVUnqxtm4qngC4=;
        b=iS3C8PxD86vz7RHjt3bQV4WqUPiOhAqgmEwHRG7sDKCiM4VPzpCPxBJWR7MbjhBBmi
         zauRawN9jOG0jlTFGfJT6GH7miXxycKJY3lGpRHAkT32jzrcPycv5iP7DntyDDy2bREe
         t7sbzkqfmsLFRb7U0RAB9W/OIFW01ohjv0WIodjJrCnwAuz24nQtvbPwfWhvecGUgFXs
         KYb6TgfA+nLGK29/V/OVpPQRgv4XHfYJ6p8nGcNIqsIszH2U99v8SqptaoxoRb3pJhis
         nWh3FNp9xLK050TKTY4JCj8SGekIg13Ry0ndXV6xflJ1i56M1zpDV6T4VRUdmWx+rvmJ
         RX5w==
X-Gm-Message-State: APjAAAXYd5yk9IBxKDJTsxBP7bZcmhLYrt1Ng5OW1AQbPMI9U1eL9cQh
        IvqAWLWhcG+1I034F7HUAXfrX+zxDVEV6ALOWhqEkQ==
X-Google-Smtp-Source: APXvYqwZVnxTaJNmp0/febncjlgk6iuHq5jonrer+d7mi78Ma4GA9yOu/5k0S1c8VDfcEAJynShMKVgq8xK7fsF7R/k=
X-Received: by 2002:a2e:9587:: with SMTP id w7mr8447089ljh.42.1576227561359;
 Fri, 13 Dec 2019 00:59:21 -0800 (PST)
MIME-Version: 1.0
References: <20191204101042.4275-1-cleger@kalray.eu>
In-Reply-To: <20191204101042.4275-1-cleger@kalray.eu>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 13 Dec 2019 09:59:10 +0100
Message-ID: <CACRpkdbHGitYzwVEVYLUmaE+Qn0ix1O1bOSjoTJomf+h9b4+rg@mail.gmail.com>
Subject: Re: [PATCH 0/5] Add pinctrl support for dwapb gpio driver
To:     Clement Leger <cleger@kalray.eu>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Dec 4, 2019 at 11:10 AM Clement Leger <cleger@kalray.eu> wrote:

> Synopsys DWAPB IP includes support for pin control. This control is basic
> and allows to switch between a hardware and a software function.
> Software function is when driving GPIOs from IP and hardware is controlled
> by external signals.
> This serie export necessary interface to be able to move the driver to
> pinctrl folder and then implement the pinctrl support which is based on the
> digicolor driver. The idea is to avoid hardcoding pins in driver since
> this IP is a generic one available on multiple SoC.

The overall approach is correct, just tidy up the patch series the
way indicated by Andy and we can probably proceed efficiently with
this. I will review the patch adding the pinctrl interfaces separately.

Yours,
Linus Walleij
