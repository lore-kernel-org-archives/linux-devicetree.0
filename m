Return-Path: <SRS0=1bdf=5G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77F75C4332D
	for <linux-devicetree@archiver.kernel.org>; Sat, 21 Mar 2020 01:24:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 35D5020752
	for <linux-devicetree@archiver.kernel.org>; Sat, 21 Mar 2020 01:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1584753885;
	bh=a7oq14gh90f9G9cupQDvc9EWm1m9yJ4iZFLErXizOcA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=OIfnZv6CJm4zFntRHk+1ApmL/Q3WuJtJ2LVuKPZtFZbgjhVFVca1zyoG05zvPp7cQ
	 T0sU7wG7LwcIXM47xyl/4V/WakNnAbrvV3mm5M3gM3/77JcUVS72BEmMNXm8ZDqf2z
	 3mIKhqmiq17JQPTJ6tat8z9oyrJ9+7H5XroSMZFI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727911AbgCUBYo (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 20 Mar 2020 21:24:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:45592 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726773AbgCUBYn (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 20 Mar 2020 21:24:43 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 615C820732;
        Sat, 21 Mar 2020 01:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584753883;
        bh=a7oq14gh90f9G9cupQDvc9EWm1m9yJ4iZFLErXizOcA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=TGEI4V2Sr9IwJ2vBZpVZGIAwljW2QxC17vCA1WzaVme3mY5AjgPfyfixpvTQgspyz
         omNWEhBVFBT8YfXNrFYmYw5dg8JcsPjOXCDyoOJWEa4mvy8dpxHs3kTTWYfruumyqT
         J7JYlBIh/rvdFNpNScrVbkMGiM0orrW9U07q7WGI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200309194254.29009-5-lkundrak@v3.sk>
References: <20200309194254.29009-1-lkundrak@v3.sk> <20200309194254.29009-5-lkundrak@v3.sk>
Subject: Re: [PATCH v2 04/17] clk: mmp2: Add support for PLL clock sources
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Lubomir Rintel <lkundrak@v3.sk>
To:     Lubomir Rintel <lkundrak@v3.sk>
Date:   Fri, 20 Mar 2020 18:24:42 -0700
Message-ID: <158475388263.125146.11372517982520346232@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Lubomir Rintel (2020-03-09 12:42:41)
> The clk-of-mmp2 driver pretends that the clock outputs from the PLLs are
> constant, but in fact they are configurable.
>=20
> Add logic for obtaining the actual clock rates on MMP2 as well as MMP3.
> There is no documentation for either SoC, but the "systemsetting" drivers
> from Marvell GPL code dump provide some clue as far as MPMU registers on
> MMP2 [1] and MMP3 [2] go.
>=20
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/lkundrak/linux-mmp3-d=
ell-ariel.git/tree/drivers/char/mmp2_systemsetting.c
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/lkundrak/linux-mmp3-d=
ell-ariel.git/tree/drivers/char/mmp3_systemsetting.c
>=20
> A separate commit will adjust the clk-of-mmp2 driver.
>=20
> Tested on a MMP3-based Dell Wyse 3020 as well as MMP2-based OLPC
> XO-1.75 laptop.
>=20
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> ---

Applied to clk-next
