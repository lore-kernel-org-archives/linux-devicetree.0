Return-Path: <SRS0=cCmK=2Q=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 541B3C2D0C0
	for <linux-devicetree@archiver.kernel.org>; Thu, 26 Dec 2019 03:51:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2A6D22075E
	for <linux-devicetree@archiver.kernel.org>; Thu, 26 Dec 2019 03:51:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726893AbfLZDvz (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 25 Dec 2019 22:51:55 -0500
Received: from shards.monkeyblade.net ([23.128.96.9]:37360 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726741AbfLZDvz (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 25 Dec 2019 22:51:55 -0500
Received: from localhost (unknown [IPv6:2601:601:9f00:1c3::3d5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 441E1154141AB;
        Wed, 25 Dec 2019 19:51:52 -0800 (PST)
Date:   Wed, 25 Dec 2019 19:51:51 -0800 (PST)
Message-Id: <20191225.195151.1515066361114222949.davem@davemloft.net>
To:     richardcochran@gmail.com
Cc:     netdev@vger.kernel.org, devicetree@vger.kernel.org, andrew@lunn.ch,
        f.fainelli@gmail.com, hkallweit1@gmail.com,
        jacob.e.keller@intel.com, jakub.kicinski@netronome.com,
        mark.rutland@arm.com, mlichvar@redhat.com, m-karicheri2@ti.com,
        robh+dt@kernel.org, willemb@google.com, w-kwok2@ti.com
Subject: Re: [PATCH V9 net-next 00/12] Peer to Peer One-Step time stamping
From:   David Miller <davem@davemloft.net>
In-Reply-To: <cover.1577326042.git.richardcochran@gmail.com>
References: <cover.1577326042.git.richardcochran@gmail.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Wed, 25 Dec 2019 19:51:52 -0800 (PST)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Richard Cochran <richardcochran@gmail.com>
Date: Wed, 25 Dec 2019 18:16:08 -0800

> This series adds support for PTP (IEEE 1588) P2P one-step time
> stamping along with a driver for a hardware device that supports this.

Series applied, will push out after build testing.

Thanks.
