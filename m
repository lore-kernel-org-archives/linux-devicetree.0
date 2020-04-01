Return-Path: <SRS0=fmve=5R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70576C43331
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Apr 2020 18:02:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4A60D20719
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Apr 2020 18:02:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732582AbgDASCd (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 1 Apr 2020 14:02:33 -0400
Received: from shards.monkeyblade.net ([23.128.96.9]:37320 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732304AbgDASCd (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 1 Apr 2020 14:02:33 -0400
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 18413119556F2;
        Wed,  1 Apr 2020 11:02:33 -0700 (PDT)
Date:   Wed, 01 Apr 2020 11:02:25 -0700 (PDT)
Message-Id: <20200401.110225.1720142569158158448.davem@davemloft.net>
To:     robh@kernel.org
Cc:     devicetree@vger.kernel.org, tobias@waldekranz.com,
        netdev@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: net: mvusb: Fix example errors
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20200401175804.2305-1-robh@kernel.org>
References: <20200401175804.2305-1-robh@kernel.org>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Wed, 01 Apr 2020 11:02:33 -0700 (PDT)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Rob Herring <robh@kernel.org>
Date: Wed,  1 Apr 2020 11:58:04 -0600

> David, Please take this and send to Linus before rc1 as 'make 
> dt_binding_check' was broken by the above commit. That would have been 
> caught had the DT list been CC'ed or if this had been in linux-next long 
> enough to test and fix (it landed in next on Monday :().

Will do.
