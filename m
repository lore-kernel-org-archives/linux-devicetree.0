Return-Path: <SRS0=XuEv=ZT=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0746AC43215
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 Nov 2019 23:14:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C08C821741
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 Nov 2019 23:14:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=aj.id.au header.i=@aj.id.au header.b="ev3qIbVO";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="tMCEz7MC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727090AbfK0XOk (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 27 Nov 2019 18:14:40 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:43943 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727031AbfK0XOk (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Wed, 27 Nov 2019 18:14:40 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 5DB58225AC;
        Wed, 27 Nov 2019 18:14:39 -0500 (EST)
Received: from imap2 ([10.202.2.52])
  by compute4.internal (MEProxy); Wed, 27 Nov 2019 18:14:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm1; bh=LW1r4r/I0SNnkloRX9HX4mmC7sWJfJm
        nrDXtKizCASk=; b=ev3qIbVOF14mie9Dd2Z/uZT6bzbs39plEJnGhmjPPxZBeoo
        0fsEkEZcQLvt/pRBl3dvplNuRMZlHv5RAJkuMu+oYOLrppBd5cof4XRUU3fs2JFe
        p4LQvX6X0S2QB8f7Tnn1CSWeCGzt9+imHTdvVqR5Xm3jA/pHuDKv52dNsH+sI/Gy
        Dtfu9yWU/XG9nC7SUCyz+RbQw1KuqLWcr42uH5K0bvTe4MCZG1K+y4oA5WY/RjR8
        RNFgPtu5sScztHp8cl3e2f+OHHkr2GBTyJJgPs6NqnQeq+Cmw5txqPa+LwR8EAdG
        Kp6PziHCb1wOUqN4rmVJO4SAsxt2zk4FCs8H33A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=LW1r4r
        /I0SNnkloRX9HX4mmC7sWJfJmnrDXtKizCASk=; b=tMCEz7MCdBLdjGfQ9A8rfZ
        0/93urLs9lIOGdFCdzOG8wKPUh3ltOD+cPmRhC8W5qp0+DAfPSQ4d53RAvkuVgDU
        6rOyYZTwjrfXyljBaIgE95xIAQSjsR7Da9WRrdwOXe0qTIixw2kFA3i4Azxqt42G
        unb4VuWrOv1wduboPgTTG6+na+pg6oMf83AjzXpACjktGvUNbmEn0wGCf54qvMsb
        CK0t5ZP7en1oRJY36MpQL3Unzqp6J1Hnd5gCSANCxnCN9z8u+viYQCtUSUFBD0MG
        AphTzYVQDFonneDOvr0nJATMIjGfvAwVR5CT39j8RTx4ka0A5b/BU22EWHUrHpRw
        ==
X-ME-Sender: <xms:XQPfXQNXgPnturoN7Y95pHCc4fOE6GeEm8JWFsAo4mkCbagmNn2iBw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudeiiedgtdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
    grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
    rhfuihiivgeptd
X-ME-Proxy: <xmx:XQPfXTT4FaIu7OuUpNt4nYpuCC0Yuz8Y2rU_6Nwy9a0wro6LApr7GA>
    <xmx:XQPfXb-rJGtb8FYprHbcVLt9j0tJzosE0o65qJ-6HiUbkpS8sFpH0A>
    <xmx:XQPfXdOwXS-jM9n1gjx7c0X7hxINAjQw1ScSuEwgkawHilWAZTlTdQ>
    <xmx:XwPfXQa3UmYHG4Jmou0mRvHerV7S1MVMEf7NU6QuMLPW-sLC7rRNhw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id A9722E00A2; Wed, 27 Nov 2019 18:14:37 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-578-g826f590-fmstable-20191119v1
Mime-Version: 1.0
Message-Id: <1a1db770-1f34-4bfe-a235-1b05841428b0@www.fastmail.com>
In-Reply-To: <20191126022243.215261-2-joel@jms.id.au>
References: <20191126022243.215261-1-joel@jms.id.au>
 <20191126022243.215261-2-joel@jms.id.au>
Date:   Thu, 28 Nov 2019 09:46:08 +1030
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Joel Stanley" <joel@jms.id.au>,
        "Lee Jones" <lee.jones@linaro.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Philipp Zabel" <p.zabel@pengutronix.de>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH 1/2] dt-bindings: mfd: Add ast2600 to ASPEED LPC
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org



On Tue, 26 Nov 2019, at 12:52, Joel Stanley wrote:
> The AST2600 has the same LPC layout as previous generation SoCs.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  Documentation/devicetree/bindings/mfd/aspeed-lpc.txt | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt 
> b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> index 86446074e206..bef07c3b1a3e 100644
> --- a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> +++ b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> @@ -46,6 +46,7 @@ Required properties
>  - compatible:	One of:
>  		"aspeed,ast2400-lpc", "simple-mfd"
>  		"aspeed,ast2500-lpc", "simple-mfd"
> +		"aspeed,ast2600-lpc", "simple-mfd"
>  
>  - reg:		contains the physical address and length values of the Aspeed
>                  LPC memory region.
> @@ -64,6 +65,7 @@ BMC Node
>  - compatible:	One of:
>  		"aspeed,ast2400-lpc-bmc"
>  		"aspeed,ast2500-lpc-bmc"
> +		"aspeed,ast2600-lpc-bmc"
>  
>  - reg:		contains the physical address and length values of the
>                  H8S/2168-compatible LPC controller memory region
> @@ -128,6 +130,7 @@ Required properties:
>  - compatible:	One of:
>  		"aspeed,ast2400-lpc-ctrl";
>  		"aspeed,ast2500-lpc-ctrl";
> +		"aspeed,ast2600-lpc-ctrl";
>  
>  - reg:		contains offset/length values of the host interface controller
>  		memory regions
> @@ -168,6 +171,7 @@ Required properties:
>  - compatible:	One of:
>  		"aspeed,ast2400-lhc";
>  		"aspeed,ast2500-lhc";
> +		"aspeed,ast2600-lhc";
>  
>  - reg:		contains offset/length values of the LHC memory regions. In the
>  		AST2400 and AST2500 there are two regions.
> @@ -187,8 +191,11 @@ state of the LPC bus. Some systems may chose to 
> modify this configuration.
>  
>  Required properties:
>  
> - - compatible:		"aspeed,ast2500-lpc-reset" or
> -			"aspeed,ast2400-lpc-reset"
> + - compatible:		One of:
> +			"aspeed,ast2400-lhc";
> +			"aspeed,ast2500-lhc";
> +			"aspeed,ast2600-lhc";

This doesn't look right, you've removed the reset compatibles. It looks like
copy/paste from the hunk before.

> +
>   - reg:			offset and length of the IP in the LHC memory region
>   - #reset-controller	indicates the number of reset cells expected
>  
> -- 
> 2.24.0
> 
>
