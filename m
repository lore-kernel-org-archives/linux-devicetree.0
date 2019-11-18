Return-Path: <SRS0=UR7X=ZK=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97E60C432C0
	for <linux-devicetree@archiver.kernel.org>; Mon, 18 Nov 2019 06:12:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 69ED220727
	for <linux-devicetree@archiver.kernel.org>; Mon, 18 Nov 2019 06:12:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="zG0GfU55"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726246AbfKRGM2 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 18 Nov 2019 01:12:28 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:33190 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726140AbfKRGM2 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 18 Nov 2019 01:12:28 -0500
Received: by mail-wr1-f65.google.com with SMTP id w9so17961657wrr.0
        for <devicetree@vger.kernel.org>; Sun, 17 Nov 2019 22:12:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=AJsaT5DgrHtaCNma+B9BtLu3BvxW/8LIu7bVrOjvJcw=;
        b=zG0GfU55CfIq0bxqCfyIHFIxx3fvkMttFzS3Xkc1BHyNNxJ63t+K35DzNEi2QJdorL
         eAuy1vxsuQFq33tue6ItS9AVZgi0iP+xbGIJB+GW2xcHzbjsvNwcbSYUz31d+geX15Ko
         E31HfnnHnP8zKrOFKkMQJWguItFUW2eNV3A5Vy87q8PItuesaKxhwh5e/6IOhMMivIFG
         BiKyNMn8a2x0wFOqxXn3vGd4SMU/E78F9mBux91j2CvejF69EVbFQHzsDOsyQcL4PLrZ
         6i+SU7I4c2Mapi4d1HWYuguHDBKtXedYFCWauGtiIXNvqBuP1tcZtHowTHGiVnAn6jyS
         rE6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=AJsaT5DgrHtaCNma+B9BtLu3BvxW/8LIu7bVrOjvJcw=;
        b=Y15aEFS8YTga7cioWhknfqsVACYG0/0aSvWKJCEcd04F4rktMwHl4ZeYO4TT7aSxyq
         zcZa6zr+p7VuGl69nP3lRGVipep9NgbkaP26DJyDP7BsQ1iUNoz+60Pi8IzJ2ZSHsV4t
         lYX9UAqTQ6i94qifSd+0gtWpm491bCLnIHKVSVovu6F6JLVETz4l7WKIuyQL0cIaP7DB
         aPkg4E2Exv4tOcNYSL70jLgW3+x40VZiToaAQYWRr13bP7aJBUCIeyLFfeS1b6hd9xdV
         2IKbw87JjhouOsVFhhzLNlB+HnDCFqta5MfYkP6D9mH6Uxf3baB8F2EF1imT6QDJs7AH
         QhRg==
X-Gm-Message-State: APjAAAVw1oxqIpdg2UQejkZ33Ri9wizWNV9owGhdQcWUZMilDWkCIYp+
        PiM4r7KvCvoEjwpzpR8m239CZbH8MHfyol1jHplFXw==
X-Google-Smtp-Source: APXvYqwB3mALuF+xrfOFxo6FhxUJ3+/T3sFpcxYqdgA9qswdYF/EtXU0VTIbAKX+PRN8dPiqpo1l4F1iCFTwAIDgVcs=
X-Received: by 2002:adf:b746:: with SMTP id n6mr27431556wre.65.1574057545931;
 Sun, 17 Nov 2019 22:12:25 -0800 (PST)
MIME-Version: 1.0
References: <20191107212408.11857-1-hch@lst.de> <cca46a52ee91548962e2f9da4cf2202e@mailhost.ics.forth.gr>
In-Reply-To: <cca46a52ee91548962e2f9da4cf2202e@mailhost.ics.forth.gr>
From:   Anup Patel <anup@brainfault.org>
Date:   Mon, 18 Nov 2019 11:42:14 +0530
Message-ID: <CAAhSdy0N0m+ibSdOKnn3XSfcbb3y068ek6aJNUzHaVVfRcPNbg@mail.gmail.com>
Subject: Re: QEMU RISC-V virt machine poweroff driver
To:     Nick Kossifidis <mick@ics.forth.gr>
Cc:     Christoph Hellwig <hch@lst.de>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        Sebastian Reichel <sre@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sat, Nov 16, 2019 at 3:45 AM Nick Kossifidis <mick@ics.forth.gr> wrote:
>
> =CE=A3=CF=84=CE=B9=CF=82 2019-11-07 23:24, Christoph Hellwig =CE=AD=CE=B3=
=CF=81=CE=B1=CF=88=CE=B5:
> > Hi all,
> >
> > this patch add a driver for the test device in the Qemu RISC-V
> > virt machine which allows properly shutting down the VM.
> > It also is added to the riscv defconfig given that qemu-virt
> > is the most popular riscv platform.
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
>
> We do this already through OpenSBI, I contributed a patch for this some
> time ago.
>
> https://github.com/riscv/opensbi/commit/51e543511a7425da1a5378e149de0b459=
28c7111#diff-36ecc47313ff13e406c53b99471f294e
>
> Last time I checked I could just halt and the system would shut down
> properly.

We only have poweroff SBI call in SBI v0.1 spec.

Also, we had proposed SBI v0.2 SRST extension having both
Poweroff and Reboot SBI calls but before we can have this SBI
extension we need to clarify scope of SBI interface in RISC-V
privilege spec so that we can have system-level SBI calls defined
in SBI spec. In future, we will bring back the proposal for SBI v0.2
SRST extension.

There are two cases in which we might need SOC specific
Poweroff and Reboot drivers in Linux:
1. SBI v0.2 onwards all SBI calls are optional so SOC vendor
can choose to provide explicit driver instead of implementing
SBI calls for Poweroff and Reboot.
2. The M-mode NOMMU Linux does not have SBI interface
so for this case SOC vendors will have to provide explicit
drivers.

If SOC Poweroff and Reboot mechanisms are simple enough
then SOC vendors can straight away use SYSCON Poweroff
and SYSCON Reboot drivers instead of writing it from scratch.

Regards,
Anup
