Return-Path: <SRS0=6Sr8=4T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DCE4C3F2D2
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Mar 2020 09:31:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 398EA246BB
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Mar 2020 09:31:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727176AbgCBJba convert rfc822-to-8bit (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 2 Mar 2020 04:31:30 -0500
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:41163 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726382AbgCBJba (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 2 Mar 2020 04:31:30 -0500
X-Originating-IP: 90.89.41.158
Received: from xps13 (lfbn-tou-1-1473-158.w90-89.abo.wanadoo.fr [90.89.41.158])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 80483FF803;
        Mon,  2 Mar 2020 09:31:03 +0000 (UTC)
Date:   Mon, 2 Mar 2020 10:31:03 +0100
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Yifeng Zhao <yifeng.zhao@rock-chips.com>
Cc:     richard@nod.at, vigneshr@ti.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
        heiko@sntech.de, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 0/3] Add Rockchip NFC drivers for RK3308 and others
Message-ID: <20200302103103.1eb7df94@xps13>
In-Reply-To: <1582884076-27615-1-git-send-email-yifeng.zhao@rock-chips.com>
References: <1582884076-27615-1-git-send-email-yifeng.zhao@rock-chips.com>
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

Yifeng Zhao <yifeng.zhao@rock-chips.com> wrote on Fri, 28 Feb 2020
18:01:13 +0800:

> Rockchp's NFC(Nand Flash Controller) has three versions: V6, V8 and V9.
> This series patch can support all  three versions.
> 

Your series has been badly created, strangely I received twice patch 1
with two different contents, patch 2 arrived way later than patch 1 and
3 and the commit title of the bindings patch is wrong, it should
besomething like:

	dt-bindings: mtd: Describe Rockchip RK3xxx NAND flash controller

Can you please resend this series in a v2?

Thanks,
Miquèl
