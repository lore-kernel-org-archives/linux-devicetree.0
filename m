Return-Path: <SRS0=BDx3=4U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C09C1C3F2CD
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Mar 2020 00:59:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8997F21D56
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Mar 2020 00:59:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gu2ABzyj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726859AbgCCA7e (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 2 Mar 2020 19:59:34 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:41787 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726773AbgCCA7e (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 2 Mar 2020 19:59:34 -0500
Received: by mail-lf1-f65.google.com with SMTP id y17so1164206lfe.8
        for <devicetree@vger.kernel.org>; Mon, 02 Mar 2020 16:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NBsGwlqlyExK6MebGtSCOV88shQTV00pT4RnlDjq5h8=;
        b=gu2ABzyjMAm2QLsha51eT7chbva+u57D0uURthQ+YT7woX16ehn43gODj9EmfBphyr
         oF1pFfbXNBdij8sDhnJhd+ep+8XKfa6eFthADNSlp3/iYdxT4Zdt6jCayfDYDRspm6f5
         vean+kGodV7qyb/CL9/MKi70WN/u2FWT6g2mXS8bWJICpltJ9Z8ez5lJdPXofufZCySq
         voWvpfzxsGjuFyLvYaYIIbBM3rjUlutGEhGPPPAgK6QuyVXX88xLXnQrIxsPTgErrTs4
         LksL5Odice6qQvkZwGUSS1W1s2C23BtOueEhNBCSLrTkQ6YzIpdfjRwjt0JMzMezNvoL
         Kgrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NBsGwlqlyExK6MebGtSCOV88shQTV00pT4RnlDjq5h8=;
        b=nkDr0Rjf9easb7vW9HTA8vKX99CRG41ZgeggZY1j/hd8IXNlo1HI5K/WOE1YOjJnrA
         RxnZTBv3KgGsoyORE5HPKL4uoVBENNkCLlmK0czUAiK5H8PEweXY/28ArFsMy9OcuuPe
         84Gx6ZCyX4Aq24rLXbOMgwZZ67IFkimCbrK+ud81qb1pcVWZ+5dCwRK+QHfzCBvYRRvX
         fERjUdWsI7XblRItP9Y/oEbiM5ue5sSorDk5G76SqtkqFhAmEFbAJT8iMU0xsa1w5k0I
         dBGEY8uo0XIc5fyQogsZGIK/cZbQ6NdDr8d639rvOoQy2lJXm+fSm+fJZjOdoD2PWW1N
         KREg==
X-Gm-Message-State: ANhLgQ0AkUhO92v8FOzSM6yKxeptg+w2r2/yag5xLurSyCUcO3KQuAPB
        6WXm9f7hIFPzAQT6kHKe9+F+wEi6z6tjxma4HCk=
X-Google-Smtp-Source: ADFU+vvGEPDHL6NW50OU3bAvbL14J6ZpRbkc/t5I/vqh37bxmVgdYziMnL54FOL66o6wwMfq/LddUMsl5SS7hne7I0Q=
X-Received: by 2002:a19:488c:: with SMTP id v134mr1054894lfa.66.1583197171654;
 Mon, 02 Mar 2020 16:59:31 -0800 (PST)
MIME-Version: 1.0
References: <20200303005244.13893-1-vitor@massaru.org>
In-Reply-To: <20200303005244.13893-1-vitor@massaru.org>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Mon, 2 Mar 2020 21:59:20 -0300
Message-ID: <CAOMZO5AmAqToKeDz=GZ0f44P6qAP2OGPHzUiD-xV+hr1W1_BRg@mail.gmail.com>
Subject: Re: [PATCH v5] arm64: dts: imx8mq-phanbell: Add gpio-fan/thermal support
To:     Vitor Massaru Iha <vitor@massaru.org>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Marco Franchi <marco.franchi@nxp.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        lkcamp@lists.libreplanetbr.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Vitor,

On Mon, Mar 2, 2020 at 9:52 PM Vitor Massaru Iha <vitor@massaru.org> wrote:

>         pinctrl_i2c1: i2c1grp {
>                 fsl,pins = <
>                         MX8MQ_IOMUXC_I2C1_SCL_I2C1_SCL                  0x4000007f
> @@ -374,3 +437,4 @@
>                 >;
>         };
>  };
> +

Unneeded blank line added here.

With that line removed you can add:

Reviewed-by: Fabio Estevam <festevam@gmail.com>

Thanks
