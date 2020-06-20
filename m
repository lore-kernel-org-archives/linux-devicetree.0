Return-Path: <SRS0=+D0Y=AB=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D91D3C433DF
	for <linux-devicetree@archiver.kernel.org>; Sat, 20 Jun 2020 02:37:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B6EC622E01
	for <linux-devicetree@archiver.kernel.org>; Sat, 20 Jun 2020 02:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1592620666;
	bh=USMJrv5TGJ58rLPTaSDBTx79oPvTVt+Fh0aaM/+J3xo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=nRJJcNvGleOD9nlhINMfD2PMPXJU/DS0w/1/9/SOC/gVR7w73IzKXBeS85bn3g12M
	 PA7TPzGV5GK6UBMElLazJPLDZwkD5PEHzRCYatSpugyL390jEOl3M0d085PplHxXws
	 kFOt5hS5DVnwEcSuG4zDGrWldOFgjffgHibPjMAc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731961AbgFTChq (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 19 Jun 2020 22:37:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:60222 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731846AbgFTChq (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 19 Jun 2020 22:37:46 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A375022DBF;
        Sat, 20 Jun 2020 02:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592620665;
        bh=USMJrv5TGJ58rLPTaSDBTx79oPvTVt+Fh0aaM/+J3xo=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=2Pi8MIn0NaW3UiS8w8draZe8ULWUy2RAduxjVV80wrCfJLjCYrStFrkKMBj+PN1cX
         bPbxc2SohBwO41prN+zhLnsRQCKSDyd80EgZMFzHgBL5kDqhayXkvSqT0sF4ZAR9Zz
         16V7lfe37y8WnHcsmwA4d4DVcauUHWF8duKvEN18=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200616202417.14376-1-dinguyen@kernel.org>
References: <20200616202417.14376-1-dinguyen@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: agilex: add NAND_X_CLK and NAND_ECC_CLK
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     dinguyen@kernel.org, devicetree@vger.kernel.org,
        mturquette@baylibre.com, robh+dt@kernel.org
To:     Dinh Nguyen <dinguyen@kernel.org>, linux-clk@vger.kernel.org
Date:   Fri, 19 Jun 2020 19:37:44 -0700
Message-ID: <159262066493.62212.8382323290185332150@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Dinh Nguyen (2020-06-16 13:24:15)
> Add the NAND_X_CLK and NAND_ECC_CLK clocks.
>=20
> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
> ---

Applied to clk-next
