Return-Path: <SRS0=WWXW=5F=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B95EAC4332D
	for <linux-devicetree@archiver.kernel.org>; Fri, 20 Mar 2020 10:18:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 99BBE20722
	for <linux-devicetree@archiver.kernel.org>; Fri, 20 Mar 2020 10:18:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726527AbgCTKSr convert rfc822-to-8bit (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 20 Mar 2020 06:18:47 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:33595 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726976AbgCTKSq (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 20 Mar 2020 06:18:46 -0400
Received: from xps13 (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 4F407240014;
        Fri, 20 Mar 2020 10:18:43 +0000 (UTC)
Date:   Fri, 20 Mar 2020 11:18:41 +0100
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Yifeng Zhao <yifeng.zhao@rock-chips.com>
Cc:     richard@nod.at, vigneshr@ti.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
        heiko@sntech.de, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 0/3] Add Rockchip NFC drivers for RK3308 and others
Message-ID: <20200320111841.3386d415@xps13>
In-Reply-To: <20200320093342.15470-1-yifeng.zhao@rock-chips.com>
References: <20200320093342.15470-1-yifeng.zhao@rock-chips.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Yifeng,

Yifeng Zhao <yifeng.zhao@rock-chips.com> wrote on Fri, 20 Mar 2020
17:33:39 +0800:

> Rockchp's NFC(Nand Flash Controller) has three versions: V6, V8 and V9.
> This series patch can support all  three versions.
> 
> 
It looks like it's the third time you send a v4 for this series, if you
change things in the series, please increase the version number. If
it is a mistake, please tell us so, because it is not easy to follow :)


Thanks,
Miquèl
