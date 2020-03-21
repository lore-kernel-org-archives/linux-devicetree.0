Return-Path: <SRS0=1bdf=5G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05E41C4332B
	for <linux-devicetree@archiver.kernel.org>; Sat, 21 Mar 2020 01:24:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C377E20757
	for <linux-devicetree@archiver.kernel.org>; Sat, 21 Mar 2020 01:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1584753883;
	bh=z0jLXD1iBTi81A3uUJ2QBtjEgegduO/JoJbFVFkXCEw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=TzEFhOMa4PFRw4/Zti7im89ELa/TviWg/vgFJxXb9SWIMuhTuzzabt8bB8+midddX
	 UwWdpGUxeWR8AQLsyaS9Wk4ufoKx890ZgRA9ayNuB3js5FaOIfN8/Ml98rdU47Cosn
	 SHk1a0ftq8HwjNWZdUmzG7Xwf9W2oQ9RrBV11gfA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727763AbgCUBYk (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 20 Mar 2020 21:24:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:45502 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726773AbgCUBYk (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 20 Mar 2020 21:24:40 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 57FDC20732;
        Sat, 21 Mar 2020 01:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584753879;
        bh=z0jLXD1iBTi81A3uUJ2QBtjEgegduO/JoJbFVFkXCEw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=K22lfkY02/TyeYZt0xwEfhf2zlGj2a9F5/C+UhQAjpt2SfxyxuoL2fSrVCp6VK87H
         fx8P8ImgO+FHrG8f5EmHPBSwoSqXtYo9km0AzMlCGSN8u2geuM2v0qKBEgWFceq6v/
         c3PoqI1PoajhOVKJvLHxvmRchFTyN0DOGlbKKUZU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200309194254.29009-4-lkundrak@v3.sk>
References: <20200309194254.29009-1-lkundrak@v3.sk> <20200309194254.29009-4-lkundrak@v3.sk>
Subject: Re: [PATCH v2 03/17] dt-bindings: clock: Convert marvell,mmp2-clock to json-schema
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Lubomir Rintel <lkundrak@v3.sk>, Rob Herring <robh@kernel.org>
To:     Lubomir Rintel <lkundrak@v3.sk>
Date:   Fri, 20 Mar 2020 18:24:38 -0700
Message-ID: <158475387862.125146.16639727598493957737@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Lubomir Rintel (2020-03-09 12:42:40)
> Convert the fixed-factor-clock binding to DT schema format using
> json-schema.
>=20
> While at that, fix a couple of small errors: make the file base name
> match the compatible string, add an example and document the reg-names
> property.
>=20
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> Reviewed-by: Rob Herring <robh@kernel.org>
>=20
> ---

Applied to clk-next
