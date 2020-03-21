Return-Path: <SRS0=1bdf=5G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8F25C4332D
	for <linux-devicetree@archiver.kernel.org>; Sat, 21 Mar 2020 00:53:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 83CDC2072D
	for <linux-devicetree@archiver.kernel.org>; Sat, 21 Mar 2020 00:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1584752018;
	bh=CFKiwkO6JUlfsfyln4iYga6mEX9WPGTNg2qGJgsROk0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=iXiFJ6HQRu5iYVuBIe8nD3xyZJyEy1dyvbYw/nEqFpNB/j4vwzzu5D87+YGX9TjNc
	 XK0cFg/6GAx8q875qMhI4IFOZV34nR870p+R7uLzWFJ5syPI/R9dV34fyU99iUcM0i
	 Wj2Jg0FHkw1IxCz9QxutYPuR7TCjYIharYnaFZPA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727061AbgCUAxi (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 20 Mar 2020 20:53:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:33378 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726773AbgCUAxh (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 20 Mar 2020 20:53:37 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4236F2070A;
        Sat, 21 Mar 2020 00:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584752017;
        bh=CFKiwkO6JUlfsfyln4iYga6mEX9WPGTNg2qGJgsROk0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=zShU9YxzTuwrddSttDijXoXbABk0tFEjoeT6Qk/6ySaTivTgVv3X6IpJdQVd0ahmq
         lJcNTnptg+/pg7zU4v4wptZeF63OJ+Z8O3r9IpoFIhjl9FGRKfEuE9M/e9mdlA/Lwu
         E2vU/ejwrGVhRamvASSNOoO7bggkEIw3+fOZDOkw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200219103326.81120-1-linus.walleij@linaro.org>
References: <20200219103326.81120-1-linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3 v3] dt-bindings: clock: Create YAML schema for ICST clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Fri, 20 Mar 2020 17:53:36 -0700
Message-ID: <158475201650.125146.2266786636927937035@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Linus Walleij (2020-02-19 02:33:24)
> The ICST clocks used in the ARM Integrator, Versatile and
> RealView platforms are updated to use YAML schema, and two
> new ICST clocks used by the Integrator IM-PD1 logical module
> are added in the process.
>=20
> Cc: devicetree@vger.kernel.org
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v2->v3:
> - Actually merge in the fix fixing the literal |
> ChangeLog v1->v2:
> - Add a literal | to preserve formatting in the bindings
> - Collect Rob's review tag
> ---
>  .../bindings/clock/arm,syscon-icst.yaml       | 103 ++++++++++++++++++
>  .../bindings/clock/arm-integrator.txt         |  34 ------
>  .../bindings/clock/arm-syscon-icst.txt        |  70 ------------
>  3 files changed, 103 insertions(+), 104 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/arm,syscon-ic=
st.yaml
>  delete mode 100644 Documentation/devicetree/bindings/clock/arm-integrato=
r.txt
>  delete mode 100644 Documentation/devicetree/bindings/clock/arm-syscon-ic=
st.txt
>=20
> diff --git a/Documentation/devicetree/bindings/clock/arm,syscon-icst.yaml=
 b/Documentation/devicetree/bindings/clock/arm,syscon-icst.yaml
> new file mode 100644
> index 000000000000..c5e43e6c9834
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/arm,syscon-icst.yaml
> @@ -0,0 +1,103 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/arm,syscon-icst.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ARM System Conctroller ICST Clocks

Controller? I can fix it.
