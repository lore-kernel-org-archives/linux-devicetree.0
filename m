Return-Path: <SRS0=2ZKK=7K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B66DBC433E1
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 May 2020 01:01:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9049420888
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 May 2020 01:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1590627713;
	bh=cOkitHkeofGTkIvOtunsBAmy7iGgFfia1uUs24OhOPA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=cJKOccauvvlRI5Zf10g5bzgC2A0gWaqzCJF4tj4gEH2hln7rs27cp0GhBGGWycNf7
	 7vo50nRqhov0gcpjbsq3SOcNPBtbAMuNYmAWZbArEFxvRh3VB0UZveh5fSz518zVcd
	 y+ZmTIbWMgJTyDtsJABTFClQSwEkln3GKjR9bOqI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726334AbgE1BBP (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 27 May 2020 21:01:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:36166 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726209AbgE1BBL (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 27 May 2020 21:01:11 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8231420C56;
        Thu, 28 May 2020 01:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590627670;
        bh=cOkitHkeofGTkIvOtunsBAmy7iGgFfia1uUs24OhOPA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=gCPzBPM6aX8p1+MTN62yOWQ4DffkJB9ZgszqQoRVBYzOw5OoDksK/YIZ5wDqEuaKE
         7rigQQcSGFEp9aLJCYXOcw5QoqNTyaHrW81JaxvbGELqLlpMesIOOYhF0OOuDbBJcC
         U8GYMe0KfVA3T74t8UPpKdla2m17qA6Nz8EDfygc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200519224151.2074597-5-lkundrak@v3.sk>
References: <20200519224151.2074597-1-lkundrak@v3.sk> <20200519224151.2074597-5-lkundrak@v3.sk>
Subject: Re: [PATCH v3 04/13] dt-bindings: marvell,mmp2: Add clock id for the Audio clock
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Lubomir Rintel <lkundrak@v3.sk>, Rob Herring <robh@kernel.org>
To:     Lubomir Rintel <lkundrak@v3.sk>
Date:   Wed, 27 May 2020 18:01:09 -0700
Message-ID: <159062766983.69627.294392206844643835@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Lubomir Rintel (2020-05-19 15:41:42)
> This clocks the Audio block.
>=20
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> Acked-by: Rob Herring <robh@kernel.org>
>=20
> ---

Applied to clk-next
