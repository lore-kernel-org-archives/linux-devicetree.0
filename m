Return-Path: <SRS0=VloT=6N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4F19C83003
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Apr 2020 09:13:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 86B2320775
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Apr 2020 09:13:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726470AbgD2JNT convert rfc822-to-8bit (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 29 Apr 2020 05:13:19 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:34861 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726345AbgD2JNT (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 29 Apr 2020 05:13:19 -0400
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 4AC02FF803;
        Wed, 29 Apr 2020 09:13:16 +0000 (UTC)
Date:   Wed, 29 Apr 2020 11:13:14 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     Yifeng Zhao <yifeng.zhao@rock-chips.com>, richard@nod.at,
        vigneshr@ti.com, robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-mtd@lists.infradead.org, heiko@sntech.de,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v5 1/7] dt-bindings: mtd: Describe Rockchip RK3xxx NAND
 flash controller
Message-ID: <20200429111314.5f15d72b@xps13>
In-Reply-To: <4a83e5d2-90cc-1db7-cdfd-47b7ceb4fcef@gmail.com>
References: <20200426100250.14678-1-yifeng.zhao@rock-chips.com>
        <20200426100250.14678-2-yifeng.zhao@rock-chips.com>
        <4a83e5d2-90cc-1db7-cdfd-47b7ceb4fcef@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Johan,

Johan Jonker <jbx6244@gmail.com> wrote on Wed, 29 Apr 2020 10:53:30
+0200:

> Hi Yifeng,
> 
> > On Sun, Apr 26, 2020 at 06:02:44PM +0800, Yifeng Zhao wrote:  
> >> Documentation support for Rockchip RK3xxx NAND flash controllers
> >> 
> >> Signed-off-by: Yifeng Zhao <yifeng.zhao@rock-chips.com>
> >> ---
> >> 
> >> Changes in v5:
> >> - Fix some wrong define
> >> - Add boot-medium define
> >> - Remove some compatible define
> >> 
> >> Changes in v4:
> >> - The compatible define with rkxx_nfc
> >> - Add assigned-clocks
> >> - Fix some wrong define
> >> 
> >> Changes in v3:
> >> - Change the title for the dt-bindings
> >> 
> >> Changes in v2: None
> >> 
> >>  .../mtd/rockchip,nand-controller.yaml         | 124 ++++++++++++++++++
> >>  1 file changed, 124 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/mtd/rockchip,nand-controller.yaml
> >> 
> >> diff --git a/Documentation/devicetree/bindings/mtd/rockchip,nand-controller.yaml b/Documentation/devicetree/bindings/mtd/rockchip,nand-controller.yaml  
> 
> The name of this file is based on Miquel's opinion, but the
> compatibility strings, (for which robh has given a 'reviewed by' tag) in
> version 4 don't fit with this format.

What do you mean? Is the file name restricted somehow? I just don't
want a compatible with just "nand" in it because this word is too vague
as it defines: a bus, a spec, a chip, people are also confusing it with
the controller and sometimes with the ECC engine too. "nfc" is okay
though.

Thanks,
Miquèl
