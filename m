Return-Path: <SRS0=fjOU=5C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87994C10F29
	for <linux-devicetree@archiver.kernel.org>; Tue, 17 Mar 2020 08:26:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2FE0D20724
	for <linux-devicetree@archiver.kernel.org>; Tue, 17 Mar 2020 08:26:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="XdiHHj9I";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="lW2XSjJx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725962AbgCQI0T (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 17 Mar 2020 04:26:19 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:56533 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725870AbgCQI0T (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 17 Mar 2020 04:26:19 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 2F812898;
        Tue, 17 Mar 2020 04:26:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 17 Mar 2020 04:26:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=QcFc4KFHqYr3j6lEXgOzci8FWvz
        LuD5A0QcnYmW5GVM=; b=XdiHHj9IE6ynwv4pYKIa5SAZ7hLRjUmpRaF8KQM357V
        /TgqObjBeaDpTCSOFyWqjQbwzD6e9/I0VUtliB3pH7uLgaooHJmfIXMcOjAVERtA
        KuXoITkZ3db1CyM9RSITGWpVnuDYxuXcW+163w8M0Sph1TQ6G+bZZePQbP778f5V
        jux/HgyNgBZCYFQ+l/eeJoTXjPBm4pn0RYUmki1/RfBWHM84A3qeC73tMeEpD6If
        xfsQta6mDllyLtPaE/T3O8+dhPrB+pOLjOxZ0VAha7AciQ23Pkx5xs8FKP6f/uNr
        Ph6y+RIxpaPVa18KcHzSK5D1o7D8rPSxx/h3cZSeVMg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=QcFc4K
        FHqYr3j6lEXgOzci8FWvzLuD5A0QcnYmW5GVM=; b=lW2XSjJxD3uVq+Vl+xGJNU
        DzINv0R9hushe8Uw+b6C+TtZiso3VaFkC26KNay/iliJv0N6JNHCpsV3gimlpOl1
        4qZnz+uGqQ2ZcHREMa4tYNc+W5GkQGyRSgdK65IPRh+Vap1ZynoI3AjZlH7ntomz
        7dmFpSeWDl2lYfyFyI/mcXz7fKvsV47Dnf2i+wQbNH5VcT1rTJm5HyzrWGaizgR9
        dWva/wQ1fO2INn2FzzoCFAPeIEndS0a2LLs9G1E63AyzRK1fO/Q7XhkB1z2l6BPw
        VNVF2QRsQlIQYkDJ6HDoMuBi91yCelx7RudXb+fIpJcVUSsK8r0gak+Bs6vDnaIw
        ==
X-ME-Sender: <xms:qYlwXqMyvTIm_YrroCNUMb4-HrjE6QdpsGphiPisxxQv9eNRuQ1fnw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudefgedguddukecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkpheple
    dtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:qYlwXtP2dT8YSXxS8TN47TF0jyGv6RuP_SYB_tXx9KFKlD7xkP_o2w>
    <xmx:qYlwXsSWKkfW3nqL654wE-NAvvybM1thChKbB9kXc8IciYWzylffbg>
    <xmx:qYlwXvBSRZQ2WEg9WIEfblYxPw5CWy_PlJ2duMP7Fr5eNrGkgQJGRw>
    <xmx:qYlwXv9cHa6YeTLFuFYDwJ4Df8XH1LQCACk9691bM0nGDYcC3vwXsg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 1CB54328005A;
        Tue, 17 Mar 2020 04:26:17 -0400 (EDT)
Date:   Tue, 17 Mar 2020 09:26:15 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Rob Herring <robh@kernel.org>
Cc:     Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: dts: sunxi: Fix dtc 'dma-ranges' warnings
Message-ID: <20200317082615.2p32qzgvzs6d7ddk@gilmour.lan>
References: <20200313154701.948-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bfpjsm7kcssdh6bm"
Content-Disposition: inline
In-Reply-To: <20200313154701.948-1-robh@kernel.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--bfpjsm7kcssdh6bm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Rob,

On Fri, Mar 13, 2020 at 10:47:01AM -0500, Rob Herring wrote:
> '#address-cells' and '#size-cells' are needed in the same node (for the
> child bus) as 'dma-ranges' in order to parse it. The kernel is more lax
> and will walk up the tree to get the properties from a parent node, but
> it's better to be explicit. dtc now does checks on 'dma-ranges' and is
> more strict:
>
> arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): \
> /soc/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid length (12 bytes) (parent #address-cells == 1, child #address-cells == 2, #size-cells == 1)
> arch/arm/boot/dts/sun8i-r40.dtsi:742.4-52: Warning (dma_ranges_format): \
> /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has invalid length (12 bytes) (parent #address-cells == 1, child #address-cells == 2, #size-cells == 1)
> arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format): \
> /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has invalid length (12 bytes) (parent #address-cells == 1, child #address-cells == 2, #size-cells == 1)
>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> I'm updating dtc for 5.7 which will introduce this warning.

Acked-by: Maxime Ripard <mripard@kernel.org>

We've pushed our changes through arm-soc already, so you might want to
pick this up through your tree?

Thanks!
Maxime

--bfpjsm7kcssdh6bm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXnCJpgAKCRDj7w1vZxhR
xXPbAQCD20XKSz2PdFcJDLTi6jtTDcgbWaSQlNt6AP6s+Lmu0gEA2EffYFn1SZxE
kZglaQxu1bljA8emP9nrUE124REPxwQ=
=Cvbw
-----END PGP SIGNATURE-----

--bfpjsm7kcssdh6bm--
