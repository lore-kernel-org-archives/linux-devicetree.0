Return-Path: <SRS0=GOr1=2C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9F82C43603
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 19:45:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BD3F12077B
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 19:45:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VURgeD1Z"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730679AbfLLTpV (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 12 Dec 2019 14:45:21 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:35102 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730284AbfLLTpU (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 12 Dec 2019 14:45:20 -0500
Received: by mail-lj1-f196.google.com with SMTP id j6so1225lja.2
        for <devicetree@vger.kernel.org>; Thu, 12 Dec 2019 11:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=N+PmL68gGL5r6ZrrKGwRVkf2UFSLh9doEOWXto4LbOY=;
        b=VURgeD1ZkMkt5tMDkzF5AJQ/Xhv5yYsEvS6k5ISAsKFAagwTBSZAbkHFfNpILalqVO
         XkFQt+LSHpB3Os6s+FRfKYiBzy0BXVRFfeMxJc0dHOPEAe4nifiC7kbyKwitAtomB7GH
         4X+RhCdblXdabWvFLlJsYGXh5JDs3UwbYURg5Q8nAzWBBuTRCcawntZWIrzWi4vH634B
         0qfXHIWXnpbJmB08g8Xpky674GBW2O/CkzTFzq1GfU/4MwMAE/ex94F69CJ0BEehZRCf
         hEQrC/6ZUK4o/sdRUvbwLhLnh4T2mwEEXVUwa+zWhf6o5MSRrPR38ooLnP+LkKR3una1
         G1Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N+PmL68gGL5r6ZrrKGwRVkf2UFSLh9doEOWXto4LbOY=;
        b=EBt7KbdGljjIYvXcSS0h3PduvBj1VZjoM9npSPR4yLEk0m/ar7eNIAuoRADFOjLoEc
         J8/IK7xCfhXh0/hMSxaCp1H0+VaUtTUa+gJLh8XXTGsUgbexUuvWH7hHHoSX7eUL79Uh
         K9vp3adQew473x5tTyx5wgIetxwWUlKjrGHEEqxW5YOH/r6uLWxsNQbpjQnnWV6DLg67
         f/vsmXQBjHjuQYkPGen8nPTjIZDdBJMNnf51+nXut8iElVDoA74yjMyaSYnf7Q6TPvYB
         FRJqKoMXm924LCWFa2t3Hx/pMQTrUnv36UswXGSbTdsA00OvLCW01+hd9Ah4STbRDuT6
         QIeg==
X-Gm-Message-State: APjAAAXlLaj5WqJMwYl784lNp9fTglFTz4Go+MGgfqlKJ3+V9KROviYA
        jFkCKPT2HBLbMvOJW2vrqv11WV0JSm8VB7gSGxOjJS4w
X-Google-Smtp-Source: APXvYqzr4AwdDHnqHxHaJUmB733oBIGG0O3j5qyMBBQq3oNX/wKhu3+s7nE12oZGqDH5TteMUG4kYvjvae//G+/DZik=
X-Received: by 2002:a2e:b4b5:: with SMTP id q21mr7097869ljm.17.1576179918784;
 Thu, 12 Dec 2019 11:45:18 -0800 (PST)
MIME-Version: 1.0
References: <20191212171704.23604-1-festevam@gmail.com>
In-Reply-To: <20191212171704.23604-1-festevam@gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Thu, 12 Dec 2019 16:45:07 -0300
Message-ID: <CAOMZO5CZEdZUbxwOMNyz7-4pyCeXABYOdPsimdzfkcbX_Y7GNg@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: imx51-babbage: Fix the DVI output description
To:     Shawn Guo <shawnguo@kernel.org>
Cc:     Sascha Hauer <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Dec 12, 2019 at 2:17 PM Fabio Estevam <festevam@gmail.com> wrote:

> +       hdmi-connector {
> +               compatible = "hdmi-connector";

This should be "dvi-connector" instead.

I will respin this patch.
