Return-Path: <SRS0=83Av=24=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6126C33C9E
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Jan 2020 09:48:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7CE5421744
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Jan 2020 09:48:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qtI5LJo3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727647AbgAGJs1 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 7 Jan 2020 04:48:27 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:45701 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727167AbgAGJs0 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 7 Jan 2020 04:48:26 -0500
Received: by mail-lf1-f67.google.com with SMTP id 203so38358751lfa.12
        for <devicetree@vger.kernel.org>; Tue, 07 Jan 2020 01:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=57yyaLukCeYKAR+EhYGKNLb0YJSXe31eGECRa1cvyNQ=;
        b=qtI5LJo3/WvWrVIOP518oxDc3sCuQZBRfr9C5k+6doCxp3MzxLMN6EKtFZgGos+b45
         LkDrzheTzcH8ElGC1D31coYR3J0ag0BydTOCnkr0keaP+7TP+453ZoSSijAkFO2Jn1ns
         DNdC6m9acz9YM+LvrQD5aWwTHN9J/0xtaN/wa6UdUP77zaUcnKO8GMK4A0X+UZtyuYfn
         Dojan9A7M8+5unJ7aoUrDc47Ap1APgA/gtyvSA7dLOqWIWFwN1g/8EJ7ozI0vLP2h50c
         GKOWEwNT6+mgWVJ7cN5Kj5Q8b64XwtQVqTm3ZukPYVhj6NAOIjZbqLym6VSOgAH+u1qH
         GQ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=57yyaLukCeYKAR+EhYGKNLb0YJSXe31eGECRa1cvyNQ=;
        b=dfJtbl+GnyChO7QCGpEM3jJQOAkPB0raS72MAWijy0Uuq7tTXa82xUVmbd3WcnyUQo
         b1nojEc659GsNOXv958QTgeiuUuCxPXY/aDbkzSr26LZUfEOB0nDmjYVtA9UEJYRueSI
         wZW0Kg0bDFaIUgeiaF4891Fn5Mz9vsCXINbuOolYbhtUobp+ktieBvpEo3cZIA8R8blf
         MHZOzBqoEKmA78Lw3kZjhRGL2jsQnvNlAFcNsqXlZMcFDxRepitSQx6Nw3yWn1HBYLgC
         KlRAe0Oxlj5XjemCLBcwTfDPIYgmHEsq8UEWclMXw1/5+KXr8GVHVFxwehALKma+XZ0j
         59+w==
X-Gm-Message-State: APjAAAUDr52uP6e5arULRZUGJa0+iu8OMzLCwc8ZDftuXr6gdf37VXtT
        i+wdZ+pHe4890jgsCyURE65DpRpTv1yCYisntivaMg==
X-Google-Smtp-Source: APXvYqwJ4NEleHWVj49bXWx9f2Reukpm63SdKPnvrbrbdsGZZiFUSvBsk8NVHRhgjrknGj8ifWCADNENNBxCswle48I=
X-Received: by 2002:a19:c648:: with SMTP id w69mr58882108lff.44.1578390504987;
 Tue, 07 Jan 2020 01:48:24 -0800 (PST)
MIME-Version: 1.0
References: <20191219103153.14875-1-srinivas.kandagatla@linaro.org> <20191219103153.14875-10-srinivas.kandagatla@linaro.org>
In-Reply-To: <20191219103153.14875-10-srinivas.kandagatla@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jan 2020 10:48:14 +0100
Message-ID: <CACRpkdaoU9B+981iF4wvLgY-QNNnsNUE=CYVmfX8zNtUuOtKfQ@mail.gmail.com>
Subject: Re: [PATCH v6 09/11] gpio: wcd934x: Add support to wcd934x gpio controller
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Vinod Koul <vinod.koul@linaro.org>,
        "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." 
        <alsa-devel@alsa-project.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        spapothi@codeaurora.org, bgoswami@codeaurora.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Dec 19, 2019 at 11:33 AM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:

> This patch adds support to wcd934x gpio block found in
> WCD9340/WC9341 Audio codecs.
>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

I think I reviewed an earlier version of the patch set yesterday,
the comments are still valid for this version.

Sorry for lag in my reviews :/

Yours,
Linus Walleij
