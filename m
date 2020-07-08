Return-Path: <SRS0=Vyee=AT=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3FF7C433E3
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jul 2020 11:09:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D910720786
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jul 2020 11:09:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728818AbgGHLJx (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Jul 2020 07:09:53 -0400
Received: from elvis.franken.de ([193.175.24.41]:54233 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728655AbgGHLJx (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 8 Jul 2020 07:09:53 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jt7xR-0008Fx-01; Wed, 08 Jul 2020 13:09:45 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 6F4E7C07D4; Wed,  8 Jul 2020 11:33:47 +0200 (CEST)
Date:   Wed, 8 Jul 2020 11:33:47 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Huacai Chen <chenhc@lemote.com>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH 2/2] dt-bindings: mips: Document two Loongson boards
Message-ID: <20200708093347.GB9458@alpha.franken.de>
References: <1592201057-28151-1-git-send-email-chenhc@lemote.com>
 <1592201057-28151-2-git-send-email-chenhc@lemote.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1592201057-28151-2-git-send-email-chenhc@lemote.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Jun 15, 2020 at 02:04:17PM +0800, Huacai Chen wrote:
> Document loongson64c-4core-ls7a and loongson64g-4core-ls7a, two boards
> with LS7A PCH.
> 
> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  Documentation/devicetree/bindings/mips/loongson/devices.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
