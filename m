Return-Path: <SRS0=F2+Z=YR=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9865CA9EAF
	for <linux-devicetree@archiver.kernel.org>; Thu, 24 Oct 2019 20:38:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 859B521929
	for <linux-devicetree@archiver.kernel.org>; Thu, 24 Oct 2019 20:38:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q9USFHVT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728316AbfJXUiX (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 24 Oct 2019 16:38:23 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:45020 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727677AbfJXUiW (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 24 Oct 2019 16:38:22 -0400
Received: by mail-lf1-f67.google.com with SMTP id g3so7997389lfb.11
        for <devicetree@vger.kernel.org>; Thu, 24 Oct 2019 13:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=46gG0xH32mWNPCHT26M/D2mRDfhDwsRIAmZAPlrre/Y=;
        b=q9USFHVTPyl/Pk2iRtxTHSkF6CwqNL40qxvocjG63WdOKw/Z9MIXc/vNRxl+o9lDf6
         JcZUdy2KH129759/sz6MOh/GIEt79sC47m9b8yLoNoWOQ5N0Ynd/kKAdKRKFSvQNsn2g
         Gi84gpraFZS+F8ryRtx7T14L9OWZvibs9492oihE2dBrp3gFv5gng5olquBRogf/XUfr
         s3Ql9fpEINZX4LXK+uTJqMG3Lv3dm+cXwmVIjtcmtkqa7IFU43S04H/MbzaMObTw1hAi
         3Httsv7QY/SGnZf9mItOLusc0FBQPgwg+guoR86M6Z7CW1eBi6Aa2QPdws1YQfCEhMgC
         Jkaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=46gG0xH32mWNPCHT26M/D2mRDfhDwsRIAmZAPlrre/Y=;
        b=BTNFj2lNW3mmtmk0aMSdLh0BNo1uThLhlwhL4afhQBqNCIjRtLXSIWbPD+wrx9BiuA
         kiuLH1rhCy2t+4ghOLtRxtJyLHkoBcLiuJ2VrdrIw5fOb0xyAzZJethPwMoMkUtHHUQn
         C+Rt+bsYHI1nYXddeKTN+53MyePjGIRd/ep2CUKfQ7ev5SgJBr7E1oc/e/rp5XOLiy2y
         U1DsZ+dzQ26zEvHB/iDOX+h8tOKJt4cHUErhyhD33NSN9PulV+IVb46FVrlhHUTfl7sz
         aZPHmKk7PW05EyjG2HK7CM6Q2qlbINTKfsK5+6FPDrfYWuy7T3a61DpCUiBoGlyrM/Nc
         Qt1Q==
X-Gm-Message-State: APjAAAV+aGxbK9hMavDyQullOPtYsPUGrTMyrxPY5oZpW1RH98ZlJGKz
        52lueucWXYstw/6+UwPjicS6awbOxogVWHjOFWU=
X-Google-Smtp-Source: APXvYqwZyrocyjZzKG7bmM5lISqMGw4JS9HVrY3/eLmKaWuJoNkf180Wa8QKVtWdaSn12qd8KIzfG44KqcB0s8PXBqs=
X-Received: by 2002:a19:4318:: with SMTP id q24mr109343lfa.12.1571949500714;
 Thu, 24 Oct 2019 13:38:20 -0700 (PDT)
MIME-Version: 1.0
References: <20191022131655.25737-1-sebastien.szymanski@armadeus.com> <20191022131655.25737-2-sebastien.szymanski@armadeus.com>
In-Reply-To: <20191022131655.25737-2-sebastien.szymanski@armadeus.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Thu, 24 Oct 2019 17:38:22 -0300
Message-ID: <CAOMZO5Bnb-Jd_XkMxdcMFRkmMzcVVikV_6+Ug=Rz6iDa5QZ_yw@mail.gmail.com>
Subject: Re: [PATCH 1/9] ARM: dts: imx6qdl-{apf6,apf6dev}: switch boards to
 SPDX identifier
To:     =?UTF-8?Q?S=C3=A9bastien_Szymanski?= 
        <sebastien.szymanski@armadeus.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Julien Boibessot <julien.boibessot@armadeus.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi S=C3=A9bastien,

On Tue, Oct 22, 2019 at 10:17 AM S=C3=A9bastien Szymanski
<sebastien.szymanski@armadeus.com> wrote:

> - *  a) This file is free software; you can redistribute it and/or
> - *     modify it under the terms of the GNU General Public License as
> - *     published by the Free Software Foundation; either version 2 of
> - *     the License, or (at your option) any later version.

> - */
> +// SPDX-License-Identifier: GPL-2.0 OR MIT

The original license said "either version 2 of the License, or (at
your option) any later version."

So you should use:

// SPDX-License-Identifier: GPL-2.0+ OR MIT
