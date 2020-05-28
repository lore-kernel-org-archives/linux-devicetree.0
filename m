Return-Path: <SRS0=2ZKK=7K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DFC2C433E0
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 May 2020 01:01:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DB80C208B8
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 May 2020 01:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1590627665;
	bh=QZVovAg3P0CDDBYuXa84Mk4f+pzCTaS1urGpsaPq4pM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=SDE+0//CQuN+CjDGDs519fR1LNn/Iq7GlYaO6U/+rBKoPnDOdeU+E9lD+ykqDTGko
	 EOBIcPTW6GWSvYCKXmjjs9B8U4Z+ziKbJMEeM8qZllIrh0cMkJyIOeQHNES46Jq5c1
	 42jIglsrwTapAtMT33T84cNO5QbcR/9hA4c2Iqj4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725601AbgE1BBC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 27 May 2020 21:01:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:35854 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725294AbgE1BBC (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 27 May 2020 21:01:02 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EF3A8207CB;
        Thu, 28 May 2020 01:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590627662;
        bh=QZVovAg3P0CDDBYuXa84Mk4f+pzCTaS1urGpsaPq4pM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=UtXLQgkfltJgjpCiLclQ2qwHaOA9rs+AOTPwCpDhc6lt8/t8zfrZxKVodhkG4jCvy
         D8b5Ba+nVhfBGuwaLdOCdz46hn/yIoJq4dNCXiKwilCxkpx+izlzfRqYbQ9NDCnlfK
         JUvH/nHkCj8NvhGhzBNWPJDsZ8n2/Sg0mnHGozRI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200519224151.2074597-2-lkundrak@v3.sk>
References: <20200519224151.2074597-1-lkundrak@v3.sk> <20200519224151.2074597-2-lkundrak@v3.sk>
Subject: Re: [PATCH v3 01/13] clk: mmp: frac: Do not lose last 4 digits of precision
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Lubomir Rintel <lkundrak@v3.sk>
To:     Lubomir Rintel <lkundrak@v3.sk>
Date:   Wed, 27 May 2020 18:01:01 -0700
Message-ID: <159062766126.69627.12547507696491958467@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Lubomir Rintel (2020-05-19 15:41:39)
> While calculating the output rate of a fractional divider clock, the
> value is divided and multipled by 10000, discarding the least
> significant digits -- presumably to fit the intermediate value within 32
> bits.
>=20
> The precision we're losing is, however, not insignificant for things like
> I2S clock. Maybe also elsewhere, now that since commit ea56ad60260e ("clk:
> mmp2: Stop pretending PLL outputs are constant") the parent rates are more
> precise and no longer rounded to 10000s.
>=20
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> ---

Applied to clk-next
