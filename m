Return-Path: <SRS0=2ZKK=7K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E438C433E0
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 May 2020 01:01:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 47714207CB
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 May 2020 01:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1590627672;
	bh=jSnGA6RV2oFNzPoNom+N8ujAw65H40gxYvMz7HCMWHo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=FqonAFwwV5i4g8ZX/DmWfiSsYvbZLN/0sh8E4KLbyes4eZrcyosopuwnvBxDbUopX
	 MFNylF4vfR2XYAGcK6hQgFoJOvic6DpbyWqBgtQ2WxXZEg/fzCcTKeG7RpDPnuHCXg
	 FXEwybTeyC5+y/slpQGtmVxDTdCluRNU6NCKaEIY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726130AbgE1BBI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 27 May 2020 21:01:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:36046 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726093AbgE1BBI (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 27 May 2020 21:01:08 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9AAC7208B8;
        Thu, 28 May 2020 01:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590627667;
        bh=jSnGA6RV2oFNzPoNom+N8ujAw65H40gxYvMz7HCMWHo=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=BfP7sSUtyf96B+BanjO7kQLrLdkoJmD6D1IXzGlc6nECMklRLq14jzkAo3MK5OKTi
         5mRZxNtCuCJyR3PQNwiaG6EZADfLQoOvA0YMalMjQuGEGwICnZ32QlQkltWnv5g+1A
         ewxW/x2K4g3F6/KgmwXrQS4lv3U7NfXhDgl6yK80=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200519224151.2074597-4-lkundrak@v3.sk>
References: <20200519224151.2074597-1-lkundrak@v3.sk> <20200519224151.2074597-4-lkundrak@v3.sk>
Subject: Re: [PATCH v3 03/13] dt-bindings: marvell,mmp2: Add clock id for the I2S clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Lubomir Rintel <lkundrak@v3.sk>, Rob Herring <robh@kernel.org>
To:     Lubomir Rintel <lkundrak@v3.sk>
Date:   Wed, 27 May 2020 18:01:06 -0700
Message-ID: <159062766693.69627.8252714022214022156@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Lubomir Rintel (2020-05-19 15:41:41)
> There are two of these on a MMP2.
>=20
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> Acked-by: Rob Herring <robh@kernel.org>
>=20
> ---

Applied to clk-next
