Return-Path: <SRS0=1bdf=5G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10C53C43333
	for <linux-devicetree@archiver.kernel.org>; Sat, 21 Mar 2020 01:24:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CD52C2076C
	for <linux-devicetree@archiver.kernel.org>; Sat, 21 Mar 2020 01:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1584753876;
	bh=A57ZaAx82Z2jEW2mREtLgHtpPiMzCA97hFnMfQNLaTM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=ZH9eeKtaGiXcKMfKuBcZHEpA9UU562yfgJhykP+Lv++KMJVPeLCaqnxa1a5fhLGto
	 /VrwGXOZR4oRgSX7fATBjhbUqAxD6xYRLtIX2EzO9p9pkYIZ4tFqJtMzDWTJgphHzI
	 nkV0PODynwowhNwYnRX7kq5J76UegDhC5GR2mrFc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727847AbgCUBYg (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 20 Mar 2020 21:24:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:45376 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727763AbgCUBYf (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 20 Mar 2020 21:24:35 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 36AC020732;
        Sat, 21 Mar 2020 01:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584753875;
        bh=A57ZaAx82Z2jEW2mREtLgHtpPiMzCA97hFnMfQNLaTM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=F0RpbGNc7AEZ8XaG+5tjLK+8DCS6v7PGuNLC4043LKjhaftAPTYC0Cfz3v6BJAXH6
         NvYDlgZvo8cxppFtIUeyl0B2HIUlhJtFshl+jHncfGOJ1htXBD1rAWffLJIjFKcM7W
         4s4nu+c9Wq4fO6SK6HD3CRv9/enGHW544nv56fI8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200309194254.29009-3-lkundrak@v3.sk>
References: <20200309194254.29009-1-lkundrak@v3.sk> <20200309194254.29009-3-lkundrak@v3.sk>
Subject: Re: [PATCH v2 02/17] clk: mmp2: Constify some strings
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Lubomir Rintel <lkundrak@v3.sk>
To:     Lubomir Rintel <lkundrak@v3.sk>
Date:   Fri, 20 Mar 2020 18:24:34 -0700
Message-ID: <158475387448.125146.983997540572802510@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Lubomir Rintel (2020-03-09 12:42:39)
> All the parent clock names for the muxes are constant. Add const.
>=20
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> ---

Applied to clk-next
