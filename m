Return-Path: <SRS0=q8LW=7I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B82CC433E1
	for <linux-devicetree@archiver.kernel.org>; Tue, 26 May 2020 23:25:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 39C1E20899
	for <linux-devicetree@archiver.kernel.org>; Tue, 26 May 2020 23:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1590535537;
	bh=3VAu+XWIsGweeYZ+uYgB3cxi1cpn5/qaWPh5DXRYEBE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=HaKpzxv332lRwqF2sQRmF42w2D7Do16y7tV8AiBVJ3hQRvUHASXCdvtHkoZ2LsYw6
	 dx80tSTqPxa1PRr5XMBKg2rPw1QNZFUXj/0dRdr7I1jrLdrMTywfxdj3wPzNFH+GkB
	 RbOG0E3OkTj6tZLr9i9yGBoFgtxR/XxdTmtAfKk0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725681AbgEZXZg (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 26 May 2020 19:25:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:36294 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725265AbgEZXZg (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 26 May 2020 19:25:36 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 01450206F1;
        Tue, 26 May 2020 23:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590535536;
        bh=3VAu+XWIsGweeYZ+uYgB3cxi1cpn5/qaWPh5DXRYEBE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=pQit+cEq1GaFUW3N5qn+cylwgFDCIUfY+UfMF4Y0iS5MGJ18Gw7ohWvqMZ3Ns9bkN
         +4HD9tZ0rTkfFJ32hkpiuC6V3j1Mr9VhcD0Ngtj3yON1xXnar34j5kBVvh3y9EEwAA
         ae3ENhP3DN/v5+KJurim6Xj6Enfnc2iQOiSykABo=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200518081644.23683-1-geert+renesas@glider.be>
References: <20200518081644.23683-1-geert+renesas@glider.be>
Subject: Re: [PATCH v2] dt-bindings: clock: renesas: cpg: Convert to json-schema
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Date:   Tue, 26 May 2020 16:25:35 -0700
Message-ID: <159053553529.88029.4978813116099634278@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Geert Uytterhoeven (2020-05-18 01:16:44)
> Convert the Renesas Clock Pulse Generator (CPG) Device Tree
> binding documentation to json-schema, combining support for:
>   - R-Mobile APE6 (R8A73A4) and A1 (R8A7740),
>   - R-Car M1 (R8A7778) and H1 (R8A7779),
>   - RZ/A1 (R7S72100),
>   - SH-Mobile AG5 (SH73A0).
>=20
> Keep the example for R-Mobile A1, which shows most properties.
> Drop the consumer examples, as they do not belong here.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
