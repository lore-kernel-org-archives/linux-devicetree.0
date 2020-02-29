Return-Path: <SRS0=QVf9=4R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 838B4C3F2CD
	for <linux-devicetree@archiver.kernel.org>; Sat, 29 Feb 2020 23:42:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5A9C520828
	for <linux-devicetree@archiver.kernel.org>; Sat, 29 Feb 2020 23:42:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727205AbgB2XmI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 29 Feb 2020 18:42:08 -0500
Received: from gloria.sntech.de ([185.11.138.130]:55058 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727185AbgB2XmI (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sat, 29 Feb 2020 18:42:08 -0500
Received: from p508fcd9d.dip0.t-ipconnect.de ([80.143.205.157] helo=phil.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <heiko@sntech.de>)
        id 1j8BkC-0004p9-60; Sun, 01 Mar 2020 00:42:04 +0100
From:   Heiko Stuebner <heiko@sntech.de>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     lgirdwood@gmail.com, broonie@kernel.org,
        devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
        pgwipeout@gmail.com, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 3/3] arm64: dts: rockchip: Describe RK3328 GPIO_MUTE users
Date:   Sun, 01 Mar 2020 00:42:03 +0100
Message-ID: <2986513.xosFKxlJ7S@phil>
In-Reply-To: <59fe8a7d-22ab-6098-5266-4fdf4bf41adb@arm.com>
References: <cover.1581376744.git.robin.murphy@arm.com> <53637c0359ad9473dc1391a8428ba21017ec467e.1581376744.git.robin.murphy@arm.com> <59fe8a7d-22ab-6098-5266-4fdf4bf41adb@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Am Freitag, 28. Februar 2020, 13:48:50 CET schrieb Robin Murphy:
> Hi Heiko,
> 
> On 18/02/2020 9:32 pm, Robin Murphy wrote:
> > Add explicit properties to describe existing boards' GPIO_MUTE usage
> > for the analog codec.
> 
> Are you happy to pick this up now that the driver patches are queued?

very happy :-)
And applied for 5.7

Thanks
Heiko


