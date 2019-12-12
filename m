Return-Path: <SRS0=GOr1=2C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61C03C00454
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 22:12:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2C419227BF
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 22:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576188753;
	bh=qsQtuvESmLGci5iJAEm1dwzoRJg3ZjZsFOo6TC1d/9g=;
	h=In-Reply-To:References:From:Cc:To:Subject:Date:List-ID:From;
	b=q/vqnErr12wJjYSwc4QlMaTJUDK5NJrPM6767oWBf9eaqTGjyeqm+SLZwZfbE4Lnv
	 kFUHaXiUggnP1U6wWNGHGHbnKXBUg7UnFOceDqwcXZvtTO0XlqjTRQBNesHE1NtSEe
	 2vIhA82xrxrqPgigK7wMJUXUf5Y8vbamXGROkyNU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731304AbfLLWMc (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 12 Dec 2019 17:12:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:49596 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730811AbfLLWMc (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 12 Dec 2019 17:12:32 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 078B52173E;
        Thu, 12 Dec 2019 22:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576188752;
        bh=qsQtuvESmLGci5iJAEm1dwzoRJg3ZjZsFOo6TC1d/9g=;
        h=In-Reply-To:References:From:Cc:To:Subject:Date:From;
        b=ekb+iuD28RbLxVQx6VRq2FZ0IVJCn4Cpy9mimZ4AtPuPQWl7jm5pqEAGgtnxhcNtQ
         dwMUlFUINiNIbvTpdGPGBT+6Qy3ZOPLoFci07cU4N2Q1KfJ+hKb+ZWYJr4d8JDZ8ci
         nAO1VY+SQni+Lw0VFevtFcNrKsUm7F3PQGTCyTfc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191209093558.50940-3-maxime@cerno.tech>
References: <20191209093558.50940-1-maxime@cerno.tech> <20191209093558.50940-3-maxime@cerno.tech>
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
        Maxime Ripard <maxime@cerno.tech>
To:     Frank Rowand <frowand.list@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime@cerno.tech>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 3/3] dt-bindings: clocks: Convert Allwinner A80 DE clocks to a schema
User-Agent: alot/0.8.1
Date:   Thu, 12 Dec 2019 14:12:31 -0800
Message-Id: <20191212221232.078B52173E@mail.kernel.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Maxime Ripard (2019-12-09 01:35:58)
> The Allwinner A80 SoC has a display clocks controller that is supported in
> Linux, with a matching Device Tree binding.
>=20
> Now that we have the DT validation in place, let's convert the device tree
> bindings for that controller over to a YAML schemas.
>=20
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>

