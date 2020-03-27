Return-Path: <SRS0=jSFQ=5M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94083C43331
	for <linux-devicetree@archiver.kernel.org>; Fri, 27 Mar 2020 20:57:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5B07A2073B
	for <linux-devicetree@archiver.kernel.org>; Fri, 27 Mar 2020 20:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1585342667;
	bh=RgrPt9tySRJLmHza0fW3xHHS6+RmaCFlMYTyDCYHr1E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=rW2wfCj9kYSHSNYhAzRC6Xo6IxAqeDzU+ewpM/WkkhBsvHGOs2PrE8X0LKthvAP7V
	 m0/D8O1LV9r9CeRdPSs6Nx64NC51x4E8LxRaDkVvrldiEfOYq171+1SoCCvWR0Wb+k
	 7SPvHhKLZHtqO8uhx3WdiCKFda72plSO/T/sAuqw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727352AbgC0U5r (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 27 Mar 2020 16:57:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:51462 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727322AbgC0U5q (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 27 Mar 2020 16:57:46 -0400
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3BBF92073B
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2020 20:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585342666;
        bh=RgrPt9tySRJLmHza0fW3xHHS6+RmaCFlMYTyDCYHr1E=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=xEeGDCgT2uFJjd8r01m04l4zsxTxDM1PDLHXACs/5RnDcNPEVO8njtVIKXVZYxdLV
         hkxKz7aL54xAmsdfWsHWGqvduNzkBn7h7r+FbkZ67UkGRGu9hwDUFu08BMK23EjvlB
         7ylJ+jQM1wF7xI3ovdBafFtdl9QdDrAQ9xrMXbNw=
Received: by mail-qk1-f182.google.com with SMTP id x3so12371741qki.4
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2020 13:57:46 -0700 (PDT)
X-Gm-Message-State: ANhLgQ22lYPBI049eY9CdgGKe7yVO+LeDJ2NcZgdVzfPgYon9upl5z69
        le87UbHim4i33bABjboHNmtkaaM/QS5rwJmvsw==
X-Google-Smtp-Source: ADFU+vvy8zfMg0Lcg8/2c14ugs6YthbMLNdUeEeyFjmhaODyuRV9hLl5dBdqzOApPCLiLIJSNOZjgZuKkqZK6pm8698=
X-Received: by 2002:a37:8502:: with SMTP id h2mr1304822qkd.223.1585342665409;
 Fri, 27 Mar 2020 13:57:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200327155721.7596-1-festevam@gmail.com>
In-Reply-To: <20200327155721.7596-1-festevam@gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 27 Mar 2020 14:57:34 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+wB=84rnSQqd+6-42LtPDz5=Xxt6ypWbVrxUjKONPz2g@mail.gmail.com>
Message-ID: <CAL_Jsq+wB=84rnSQqd+6-42LtPDz5=Xxt6ypWbVrxUjKONPz2g@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: sound: cs42l51: Remove unneeded I2C unit name
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Mark Brown <broonie@kernel.org>,
        Benjamin Gaignard <benjamin.gaignard@st.com>,
        Linux-ALSA <alsa-devel@alsa-project.org>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Mar 27, 2020 at 9:57 AM Fabio Estevam <festevam@gmail.com> wrote:
>
> The following warning is seen with 'make dt_binding_check':
>
> Documentation/devicetree/bindings/sound/cirrus,cs42l51.example.dts:18.15-34.11: Warning (unit_address_vs_reg): /example-0/i2c@0: node has a unit name, but no reg or ranges property
>
> Fix it by removing the unneeded i2c unit name.
>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  Documentation/devicetree/bindings/sound/cirrus,cs42l51.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks!

Acked-by: Rob Herring <robh@kernel.org>
