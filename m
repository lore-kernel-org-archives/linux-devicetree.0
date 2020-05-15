Return-Path: <SRS0=lCsO=65=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3688BC433E0
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 May 2020 19:05:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 070242073E
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 May 2020 19:05:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IP/nxo/6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726183AbgEOTFy (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 15 May 2020 15:05:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726023AbgEOTFy (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 15 May 2020 15:05:54 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C58CCC061A0C
        for <devicetree@vger.kernel.org>; Fri, 15 May 2020 12:05:52 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id nv1so3144366ejb.0
        for <devicetree@vger.kernel.org>; Fri, 15 May 2020 12:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ownehjnT16AeaOm+l2W7DPInUnd4hMg6fuB995cXtKg=;
        b=IP/nxo/6SfWq7KT7kJmWp4mNJd5k5YCm2N1NtheM85kGUZV7uphToZTGEhsge96QY5
         t33GhDrF2X14dvzkFcxjwAf63vdNOJEfshNtRj1at//RV2ILdCeefNTwfgtUG5ZQfDpP
         PEmVpZ1gRnFYaB2vbY09Sr4uMBmtytAbokbaO8xUSjpL6WO3UlgVpY8IPGowF38bldiM
         kdxtQro62hJG/N0sjnOs2Ny48VKhdA1f6JgvT2dJG1qT+uJqxe1831B3in98+Q08o/cY
         Yyp2i9lKgcd3jZLGJLaZsInJBKLX7gfvr3rmjgvV7dLMrMxDAaKDMDCZLqMB7xlsmnUT
         S5ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ownehjnT16AeaOm+l2W7DPInUnd4hMg6fuB995cXtKg=;
        b=sKjyPY+3RwY+nxrmScU1geFWEFpdbKrPvJO+rVrDBqDgo1Bd9pMiuuHmxrAp3KYu1C
         sCtqfoA73ISwYf5hDZuFSS74z+n1Ie10GBDf5IiuGvifPnScc03dU/4NmnhQaglqskUl
         j/nK9SpAer1J5Ykt78Qtm8u54vWKoNo02huMv1psuUQBiwhFqkm/0NqXEt+HkOWJAuEi
         ZySWdWhtRskD5BgeQl+Ob37bEXVazJvIdd2141TTvC61lyt1oHiGo9wUt5bc3bekOLIz
         z1x0PFn/VWWvsQTm96kUA8hicXmjFzlvPR+nfYbcKtNz7wDJotwQ+eMnWhfse6jiTtp6
         YT0Q==
X-Gm-Message-State: AOAM5319m8VG+juj963uisNfTccckoqcpSpkBxsvC09xE1yq7tjN2CwJ
        46FkW8AiiOoL2Ehc2258AZnQo0h+MrioSz6w9p4=
X-Google-Smtp-Source: ABdhPJx7c4EEMNLReYLEuyFi/aZ+DUocKLS1t2lZ7DCZmV6nAOMT8syRynGCemDJbZJc1BUoOLTY7Wq/5sfXKOPlLss=
X-Received: by 2002:a17:906:d8c1:: with SMTP id re1mr4438325ejb.184.1589569551527;
 Fri, 15 May 2020 12:05:51 -0700 (PDT)
MIME-Version: 1.0
References: <1589472657-3930-1-git-send-email-amittomer25@gmail.com>
 <1589472657-3930-6-git-send-email-amittomer25@gmail.com> <afc0d7f3-d763-b936-988c-d802b86836bc@arm.com>
In-Reply-To: <afc0d7f3-d763-b936-988c-d802b86836bc@arm.com>
From:   Amit Tomer <amittomer25@gmail.com>
Date:   Sat, 16 May 2020 00:35:15 +0530
Message-ID: <CABHD4K_BpHMSypfdiQKeRfHOgdO8e7ekU0TKBmqisDe_+4hGPg@mail.gmail.com>
Subject: Re: [PATCH v1 5/9] dt-bindings: dmaengine: convert Actions Semi Owl
 SoCs bindings to yaml
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

Hi,

> Could you replace those "maxItems: 1" here and below with:
>   - description: ...., copying in the explanation from the .txt binding?
> That should serve the same purpose as "maxItems: 1", but is more
> descriptive.

But having it under reg: looks bit odd to me, no?

reg:
   - description: ...

Or did you mean something else ?

Thanks
-Amit
