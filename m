Return-Path: <SRS0=E/bd=36=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 978A1C352A5
	for <linux-devicetree@archiver.kernel.org>; Mon, 10 Feb 2020 15:13:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6C447206ED
	for <linux-devicetree@archiver.kernel.org>; Mon, 10 Feb 2020 15:13:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="I/xFN0o6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729014AbgBJPNR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 10 Feb 2020 10:13:17 -0500
Received: from mail-il1-f179.google.com ([209.85.166.179]:45820 "EHLO
        mail-il1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728485AbgBJPNQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 10 Feb 2020 10:13:16 -0500
Received: by mail-il1-f179.google.com with SMTP id p8so465505iln.12
        for <devicetree@vger.kernel.org>; Mon, 10 Feb 2020 07:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FhN4XtFCJkoq1uQy3zAa0gdyCp3Sl71uMPy2Eyj8+bE=;
        b=I/xFN0o6OHNqlV1vOX3xfGZ8d/9J7hUwnWgRkbtmq5yervupWrbgBcGxfGD0b8sYLC
         uwcGuejk6bD/ZVkpBth8Jjaa713iNs++YsuJPMlSmtwGys5Gej+Xh2SSNPtHIoOeigwl
         V98nNsFb2EBay4fOu+ill9j4oWB/gkUdI0yu51YKQnRETpoRkcL5c00+Gq/LH+LCLxlH
         laj+IEGsZEzC7ASAVdAWUuf/cVDMbEiNHcd2qjXFZ2RG1UO3Q6bgSxySNgoDxU5Sc2K5
         iyTcCsUu5ozZRmiqGYQtnaI/XkwlXp7xqsE/jANCwbVG2Kvz90jDI8wrUC7x+dciP+Rx
         JiOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FhN4XtFCJkoq1uQy3zAa0gdyCp3Sl71uMPy2Eyj8+bE=;
        b=rLbTh2fwszkfGH6AoHBaIbc7yggy1Gfc9VGhW0dWOSn6QY8kqvAFc3/woVlY9NKxc8
         9yATnU4iJIdwU8i+y84ZrR1w3IuDVdqnQKd18pIvlnRWRl7569CUzsfgTkjMyunkt1XV
         xrN1tSTSJCTvsswByVg7H3y1E4aKVHBByHyLrUyjpK5LGM7T5qTcebd+92m8XTpUAl9X
         4uwv0SRekYeCMOIGCh1nKRkf2mg6DYkhN2vF1ZHXr8bov6X60rzb3u2TfIlD9bbYVQDo
         A06ziA/WzjC2msY3eiedWNTZgX+dFckpE2pO2n74wCOYkudoa85av2vCeL2h+AOpvYm0
         LQpw==
X-Gm-Message-State: APjAAAVULL5KJkl4ewwHYJuJi3srAlyHiZsbUT1dXy2vHmURLtuUwq9C
        7l1ez96FTZDBofD8xlzljSgT6nWPWPCtoy8BYqhlnR1ih+U=
X-Google-Smtp-Source: APXvYqz8NJ/XJCZgc65CapYNrLpMIOjiJgGhRG/vY2GtMRsBh+nwgtkTAaBtEJw8o0Ee3qShBauPgKT/rw5SSdeonlg=
X-Received: by 2002:a92:ba8d:: with SMTP id t13mr1821680ill.207.1581347594542;
 Mon, 10 Feb 2020 07:13:14 -0800 (PST)
MIME-Version: 1.0
References: <20191120034451.30102-1-Zhiqiang.Hou@nxp.com> <CAOesGMjAQSfx1WZr6b1kNX=Exipj_f4X_f39Db7AxXr4xG4Tkg@mail.gmail.com>
 <DB8PR04MB6747DA8E1480DCF3EFF67C9284500@DB8PR04MB6747.eurprd04.prod.outlook.com>
 <20200110153347.GA29372@e121166-lin.cambridge.arm.com> <CAOesGMj9X1c7eJ4gX2QWXSNszPkRn68E4pkrSCxKMYJG7JHwsg@mail.gmail.com>
 <DB8PR04MB67473114B315FBCC97D0C6F9841D0@DB8PR04MB6747.eurprd04.prod.outlook.com>
In-Reply-To: <DB8PR04MB67473114B315FBCC97D0C6F9841D0@DB8PR04MB6747.eurprd04.prod.outlook.com>
From:   Olof Johansson <olof@lixom.net>
Date:   Mon, 10 Feb 2020 16:12:30 +0100
Message-ID: <CAOesGMieMXHWBO_p9YJXWWneC47g+TGDt9SVfvnp5tShj5gbPw@mail.gmail.com>
Subject: Re: [PATCHv9 00/12] PCI: Recode Mobiveil driver and add PCIe Gen4
 driver for NXP Layerscape SoCs
To:     "Z.q. Hou" <zhiqiang.hou@nxp.com>,
        "bhelgaas@google.com" <bhelgaas@google.com>
Cc:     Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "arnd@arndb.de" <arnd@arndb.de>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "l.subrahmanya@mobiveil.co.in" <l.subrahmanya@mobiveil.co.in>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "m.karthikeyan@mobiveil.co.in" <m.karthikeyan@mobiveil.co.in>,
        Leo Li <leoyang.li@nxp.com>,
        "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
        "will.deacon@arm.com" <will.deacon@arm.com>,
        "andrew.murray@arm.com" <andrew.murray@arm.com>,
        Mingkai Hu <mingkai.hu@nxp.com>,
        "M.h. Lian" <minghuan.lian@nxp.com>,
        Xiaowei Bao <xiaowei.bao@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Feb 6, 2020 at 11:57 AM Z.q. Hou <zhiqiang.hou@nxp.com> wrote:
>
> Hi Olof,
>
> Thanks a lot for your comments!
> And sorry for my delay respond!

Actually, they apply with only minor conflicts on top of current -next.

Bjorn, any chance we can get you to pick these up pretty soon? They
enable full use of a promising ARM developer system, the SolidRun
HoneyComb, and would be quite valuable for me and others to be able to
use with mainline or -next without any additional patches applied --
which this patchset achieves.

I know there are pending revisions based on feedback. I'll leave it up
to you and others to determine if that can be done with incremental
patches on top, or if it should be fixed before the initial patchset
is applied. But all in all, it's holding up adaption by me and surely
others of a very interesting platform -- I'm looking to replace my
aging MacchiatoBin with one of these and would need PCIe/NVMe to work
before I do.


Thanks!


-Olof
