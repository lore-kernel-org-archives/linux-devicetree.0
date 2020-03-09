Return-Path: <SRS0=Fzrg=42=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94CA1C3F2C6
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Mar 2020 22:13:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7181B2465A
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Mar 2020 22:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1583791995;
	bh=7Gq2PXCZY0GqdmcCbDg4OhTKZeKcu2LpwF2TRVWOzXs=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=CV6XsnUq7e7+G4PWXoUJvr3Wf6F8JB6uWmpAIzdTCi2SiqpWjaR5Z41oSMAVlCN+p
	 nXtxlRAnsy4YMe86L6qjjDNXxbRRANSxtny9lVskMBQh6Dyil8py2MtsXyHoZ8dBtr
	 Ci172YzpmzXdpl0sPxF4HDsyE71lCU0laFP9KrUI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727273AbgCIWNP (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 9 Mar 2020 18:13:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:56236 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726656AbgCIWNO (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 9 Mar 2020 18:13:14 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3DCDF24654;
        Mon,  9 Mar 2020 22:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583791994;
        bh=7Gq2PXCZY0GqdmcCbDg4OhTKZeKcu2LpwF2TRVWOzXs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=QV6Dg6MEO39ivpjJ4KA6P8SA6CkGEqc6Acfb4crcaDa9keWV0GajT9rf1XhMivsok
         4GrZH/LTR7b6oOYceXSC5ONx8A8S+jTJUbazvgtIhe1sxdwnTHp83Vq7akXGkbuoaC
         6afBAeum49E7rr6mY7SuR3/kNllntWq/kMszLYsA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191031112951.35850-3-kholk11@gmail.com>
References: <20191031112951.35850-1-kholk11@gmail.com> <20191031112951.35850-3-kholk11@gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: clock: rpmcc: Document msm8976 compatible
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     kholk11@gmail.com, marijns95@gmail.com, agross@kernel.org,
        mturquette@baylibre.com, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
To:     kholk11@gmail.com, linux-arm-msm@vger.kernel.org
Date:   Mon, 09 Mar 2020 15:13:13 -0700
Message-ID: <158379199350.66766.15631578266876135281@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting kholk11@gmail.com (2019-10-31 04:29:51)
> From: AngeloGioacchino Del Regno <kholk11@gmail.com>
>=20
> Support for MSM8976 was added to the clk-smd-rpm driver: let's
> document here the newly added compatible string.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> ---

Applied to clk-next
