Return-Path: <SRS0=v2WM=2N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63400C2D0C0
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Dec 2019 09:13:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 31EA4206CB
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Dec 2019 09:13:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="aDKswfiU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725963AbfLWJN6 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 23 Dec 2019 04:13:58 -0500
Received: from vps0.lunn.ch ([185.16.172.187]:37896 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725947AbfLWJN6 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 23 Dec 2019 04:13:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=zj0RL7Zd9GclpVJkxgTizJ6N2fE32p248ECn/vlYHAI=; b=aDKswfiUO/HvuxIQXJKPE9WKTh
        jy4UXbKtXFHWt/g9wFDa0STGLZo1xd1Tebl56Z1i2zleGOPcBVe7zdFS53XiYo3tkAx17U7CjmX83
        fVVwq2+mBs8jKZSw09e0uWHz1OfYNH9hwl0G9tGzYS3K1HxKeS3CnfeiREAGEfAn9qdw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.93)
        (envelope-from <andrew@lunn.ch>)
        id 1ijJmk-0000X0-Ot; Mon, 23 Dec 2019 10:13:54 +0100
Date:   Mon, 23 Dec 2019 10:13:54 +0100
From:   Andrew Lunn <andrew@lunn.ch>
To:     Richard Cochran <richardcochran@gmail.com>
Cc:     netdev@vger.kernel.org, David Miller <davem@davemloft.net>,
        devicetree@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jacob Keller <jacob.e.keller@intel.com>,
        Jakub Kicinski <jakub.kicinski@netronome.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Miroslav Lichvar <mlichvar@redhat.com>,
        Murali Karicheri <m-karicheri2@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Willem de Bruijn <willemb@google.com>,
        Wingman Kwok <w-kwok2@ti.com>
Subject: Re: [PATCH V8 net-next 07/12] net: Introduce a new MII time stamping
 interface.
Message-ID: <20191223091354.GF32356@lunn.ch>
References: <cover.1576956342.git.richardcochran@gmail.com>
 <08ba968da04b8d0f2d663fd018109b52dfafe5c6.1576956342.git.richardcochran@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <08ba968da04b8d0f2d663fd018109b52dfafe5c6.1576956342.git.richardcochran@gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sat, Dec 21, 2019 at 11:36:33AM -0800, Richard Cochran wrote:
> Currently the stack supports time stamping in PHY devices.  However,
> there are newer, non-PHY devices that can snoop an MII bus and provide
> time stamps.  In order to support such devices, this patch introduces
> a new interface to be used by both PHY and non-PHY devices.
> 
> In addition, the one and only user of the old PHY time stamping API is
> converted to the new interface.
> 
> Signed-off-by: Richard Cochran <richardcochran@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
