Return-Path: <SRS0=WBDS=5X=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FF51C2BB1D
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Apr 2020 23:27:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 358DD206BE
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Apr 2020 23:27:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726444AbgDGX1Q convert rfc822-to-8bit (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 7 Apr 2020 19:27:16 -0400
Received: from gloria.sntech.de ([185.11.138.130]:39126 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726386AbgDGX1Q (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 7 Apr 2020 19:27:16 -0400
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <heiko@sntech.de>)
        id 1jLxcf-00026Q-8F; Wed, 08 Apr 2020 01:27:13 +0200
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     dri-devel@lists.freedesktop.org
Cc:     thierry.reding@gmail.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, mark.rutland@arm.com,
        christoph.muellner@theobroma-systems.com, sam@ravnborg.org
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Add binding document for Leadtek LTK050H3146W
Date:   Wed, 08 Apr 2020 01:27:12 +0200
Message-ID: <1780295.RUe6JE3oou@diego>
In-Reply-To: <20200331110222.1798093-1-heiko@sntech.de>
References: <20200331110222.1798093-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="iso-8859-1"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Am Dienstag, 31. März 2020, 13:02:21 CEST schrieb Heiko Stuebner:
> From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> 
> The LTK050H3146W is a 5.0" 720x1280 DSI display.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>

FYI: replaced by v2 just now

Heiko


