Return-Path: <SRS0=g9lS=AL=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E32CC433E1
	for <linux-devicetree@archiver.kernel.org>; Tue, 30 Jun 2020 09:35:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 03BBA206A1
	for <linux-devicetree@archiver.kernel.org>; Tue, 30 Jun 2020 09:35:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731934AbgF3Jfg (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 30 Jun 2020 05:35:36 -0400
Received: from 8bytes.org ([81.169.241.247]:50624 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730613AbgF3Jfg (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 30 Jun 2020 05:35:36 -0400
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id 1B98D26B; Tue, 30 Jun 2020 11:35:35 +0200 (CEST)
Date:   Tue, 30 Jun 2020 11:35:33 +0200
From:   Joerg Roedel <joro@8bytes.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     robh+dt@kernel.org, iommu@lists.linux-foundation.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/2] iommu/renesas: Add support for r8a77961
Message-ID: <20200630093533.GE28824@8bytes.org>
References: <1591873830-10128-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1591873830-10128-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Jun 11, 2020 at 08:10:28PM +0900, Yoshihiro Shimoda wrote:
> This patch series is based on next-20200611.
> 
> Yoshihiro Shimoda (2):
>   dt-bindings: iommu: renesas,ipmmu-vmsa: add r8a77961 support
>   iommu/renesas: Add support for r8a77961

Applied, thanks.
