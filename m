Return-Path: <SRS0=1bdf=5G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 714D5C4332D
	for <linux-devicetree@archiver.kernel.org>; Sat, 21 Mar 2020 01:24:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 387FD20757
	for <linux-devicetree@archiver.kernel.org>; Sat, 21 Mar 2020 01:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1584753872;
	bh=b2JbIbLu1vzPlTM1xcky55IFGUKce44Xpwaq1wYIoPg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=EvFaPP6nDQgXo4/D4qejKLiVFIBvLQpUXUO6wYvS6cifgvBAJB2o14iWAiqRgiSzh
	 nSTLa/qP6iPhpyZO2Fm0XT6u0i5U9jh2EEno0PaWXlcr42aq8gXbRvuzpMkmgpjDC9
	 d0kRIW9ry5M3B9/FvKTYMEbYVXZG+ubEYQomGwmo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727778AbgCUBYb (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 20 Mar 2020 21:24:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:45260 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727763AbgCUBYb (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 20 Mar 2020 21:24:31 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D26B220732;
        Sat, 21 Mar 2020 01:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584753870;
        bh=b2JbIbLu1vzPlTM1xcky55IFGUKce44Xpwaq1wYIoPg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=as16LPAWLiq2GGQWpg88bWepte1CiqKsdWHlK5e56VYNpk/5EEiZY8+EoaXHpEWl3
         xirLPIPJhFkTfIbKiHpYNbxQQDwwD3LQdjF0yUwj1CIcokGrATXDV+bkAgeJq5pZDk
         cdtCFPpud0JTtxdYphuWZczKaSO2/mBMAzkDQG9Q=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200309194254.29009-2-lkundrak@v3.sk>
References: <20200309194254.29009-1-lkundrak@v3.sk> <20200309194254.29009-2-lkundrak@v3.sk>
Subject: Re: [PATCH v2 01/17] clk: mmp2: Remove a unused prototype
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Lubomir Rintel <lkundrak@v3.sk>
To:     Lubomir Rintel <lkundrak@v3.sk>
Date:   Fri, 20 Mar 2020 18:24:30 -0700
Message-ID: <158475387003.125146.14218245508304103071@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Lubomir Rintel (2020-03-09 12:42:38)
> There is no mmp_clk_register_pll2() routine.
>=20
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> ---

Applied to clk-next
