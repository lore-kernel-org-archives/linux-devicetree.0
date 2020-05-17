Return-Path: <SRS0=ZMZy=67=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16DD3C433E0
	for <linux-devicetree@archiver.kernel.org>; Sun, 17 May 2020 17:13:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DE45E207D4
	for <linux-devicetree@archiver.kernel.org>; Sun, 17 May 2020 17:12:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R8Wz1lI4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726280AbgEQRM7 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 17 May 2020 13:12:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726279AbgEQRM7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 17 May 2020 13:12:59 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD037C061A0C
        for <devicetree@vger.kernel.org>; Sun, 17 May 2020 10:12:58 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id g9so6416740edr.8
        for <devicetree@vger.kernel.org>; Sun, 17 May 2020 10:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KLA7iwxkkZaEe+a5DOe1yKmTHMqLvE482kATUXCfdGA=;
        b=R8Wz1lI4CLk450TXD3doFzsflzNTAt1RBqQyDAHn+j5SygBY1zsopy/ue3X+2Q7i+R
         UTQavT9TnpbTzeaxI2Hbc8qdoEN+GaqFpLsAucQA//iRxsSD1FFidqLozPjmdFjcmP55
         P07ecaG+mLlrqL0F0DaLmt0pxMzc4RhXeQPynfSGYRUjxz5gHM0AsMWM2VJrXz0uqDrY
         kWrgDQOu5plphuGIRDQ3DwMldJ+peQCSt5gcIc6ectSPoVYBBTJwVRwR9TemZaXetNjA
         mxt8I8Wyc74PyqKEYmbigNADeoaaclHkfJ1L++ZqRUOlPMtesYERTheahRaRAVaGF2c5
         PGXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KLA7iwxkkZaEe+a5DOe1yKmTHMqLvE482kATUXCfdGA=;
        b=q94Vftju++68o2XyC9mnglE/ImePeUk+AJaSV2307yVePBXgMW0Lm6YRyZeH+dBvd9
         QQEc5KzTARbnJpzzfxgXGok/hLEtUWqP/zb/Npqv+c1fjaElpEqQ/LYGa6zJYRpyxeP3
         JLlBIAuPAeAapX1cMRv6oysEo9BvwuUnsyDW/SiMPjhOkZPpAJynmKDf5w8kNjRjr9kd
         rvmtSpVKrxDOmN5aJiU4w2uAAkmrRIhv3EnjpI5iljtQ8SKGVv0DdLm/V2OWYZ1itUcL
         GdUOp8ucYXHC6PfX/WqKdO2fwav1BKYDpw7P+HP00X7u6re+zagGAjeQt4TlIvELZxDA
         knZA==
X-Gm-Message-State: AOAM533V+1IuzeQsYpw5gSCuULT+xSsiCmRUpi1XBpJ4dDOHoEpLMR0x
        SCP2Ut05PZRkHYmhUpym+LQ+JZY54xpSmmhtahY=
X-Google-Smtp-Source: ABdhPJw3tYifonZ1qR4I2lbjr/innKLU8dZ6Bg4VrCM7hVSelRH/8a43px/KFbkYjTqXeftsNXB3ymGdFisL7XNLeTc=
X-Received: by 2002:a50:e607:: with SMTP id y7mr10863209edm.71.1589735576627;
 Sun, 17 May 2020 10:12:56 -0700 (PDT)
MIME-Version: 1.0
References: <1589472657-3930-1-git-send-email-amittomer25@gmail.com>
 <1589472657-3930-9-git-send-email-amittomer25@gmail.com> <b2ad8a81-619f-5f35-9596-c2061ae15e4c@arm.com>
 <CABHD4K9yjUGuo0w-RfhdZQJm3Wtj6bU2H4DXcp4Jjp=e0fFeyA@mail.gmail.com> <2cd3cdaf-826e-9d12-9fd4-9f7e2a517ecd@arm.com>
In-Reply-To: <2cd3cdaf-826e-9d12-9fd4-9f7e2a517ecd@arm.com>
From:   Amit Tomer <amittomer25@gmail.com>
Date:   Sun, 17 May 2020 22:42:20 +0530
Message-ID: <CABHD4K-OaQ4Vf_+dg9FMR97ocLeUkDswyEnChPV=H=VcbyUhkg@mail.gmail.com>
Subject: Re: [PATCH v1 8/9] arm64: dts: actions: Add MMC controller support
 for S700
To:     =?UTF-8?Q?Andr=C3=A9_Przywara?= <andre.przywara@arm.com>
Cc:     =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, cristian.ciocaltea@gmail.com,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-actions@lists.infradead.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

> I don't understand what this has to do with the driver, but I asked
> above to also change the binding, allowing this compatible string
> combination.
if we add these two strings "actions,s700-mmc", "actions,owl-mmc" to dts file
and leave the driver as it. Wouldn't this be mismatch(as driver only
has "actions,owl-mmc"
and DTS has two strings).

Shouldn't that be concerned about  ?

Thanks
-Amit
