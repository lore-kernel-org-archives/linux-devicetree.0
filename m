Return-Path: <SRS0=kxJ0=ZX=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C367C432C0
	for <linux-devicetree@archiver.kernel.org>; Sun,  1 Dec 2019 23:28:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EA25D215E5
	for <linux-devicetree@archiver.kernel.org>; Sun,  1 Dec 2019 23:28:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=aj.id.au header.i=@aj.id.au header.b="Gxi2ecUv";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="AIFo9OU6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727285AbfLAX21 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 1 Dec 2019 18:28:27 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:40845 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727279AbfLAX21 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 1 Dec 2019 18:28:27 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id DAA39B59;
        Sun,  1 Dec 2019 18:28:25 -0500 (EST)
Received: from imap2 ([10.202.2.52])
  by compute4.internal (MEProxy); Sun, 01 Dec 2019 18:28:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm1; bh=9iNu/StSTwvVolzT5BSQE4CDTn1BdOH
        wa5OXvvpgJOs=; b=Gxi2ecUvzZT0u5JXvhYuEyFyAhoVoeNh6YkocpxhuEBd9ZE
        pKDO7OqH3tzWx9Odf53njngOz8U7Rf0KjcqsA2zcZGBxxQSE6g+Taxr732qTsG08
        NmMK0jEU15kr8Ec4E3S2Nl5eKbLbVOUITbg6lihDJFoWxTl36mhZOaiprChzXmUM
        gD49lK++GnryC80KPzRhYzGnB/ZjFG478n48NS0dm5tMiKalWdcRmzBr1Nx54aYy
        eSwFXllBGB0Rq4GkQA2LMtAAnCe5FCL3s8nBpRuNbrRwaDCGKeLl19QUAT9UK5Mg
        4vXS/cBS/iNbSoEx+j32q2Yh/IvjkgEYsr07goA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=9iNu/S
        tSTwvVolzT5BSQE4CDTn1BdOHwa5OXvvpgJOs=; b=AIFo9OU6OhHIk+jHZL7NCj
        wVAxqtexSYOCs8bV5YMdfHkOn2dkJ35OHG2p/T1jwwhp7beGVp7j/CNX2JUvgy+K
        Rv38zwWEB27XYQG+N4x8lgPeEwbUiVcvSO16ZDLSRWBr0st6VbyUKwdzrUjTt9HG
        iYZc4G/fv1NreJO8NkJUnIWqrUnynwOL/nvAoJ7peFYwBVlOHHVeMnHtsOdDQofM
        4CzR73Q1tkjcha2eq62ZFWUBW3EZjbamemoH33w7DyR+gnnCvcU+IwsFW6n7BVZQ
        vAC/xZDdIxJYspUpbk53JnpG2346a5tV+R5lrIC0hQykhrY54e2Gxs7/9tpBB4JA
        ==
X-ME-Sender: <xms:l0zkXWGqlPvPlqeFweDYVnRTRqrFsLgv0I4RoqLizKANGEm3AWOP-w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudejgedgudduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
    grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
    rhfuihiivgeptd
X-ME-Proxy: <xmx:l0zkXZOOIMfhOdo9Kh-oTcHz15zXHA9jgJNjO0goshsg7PT9-ZoQbw>
    <xmx:l0zkXZjMnVFO98GRmpUzNo5ftA95gcfDQ0whm5MoDP41vKJ1lzHYbA>
    <xmx:l0zkXZmEvbq1WDF-6IESJw3o5v-q4niA9ufZ7ye1Yfmijiu707Ub1g>
    <xmx:mUzkXUXKA8tAR5JGl0pLx12iUD4EeFZhBtm7wAXV9gRz1pr24PhoVA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 9B780E00A2; Sun,  1 Dec 2019 18:28:23 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-578-g826f590-fmstable-20191119v1
Mime-Version: 1.0
Message-Id: <09b06ed9-ae1c-4bbe-bcb6-c518c4dfd5d2@www.fastmail.com>
In-Reply-To: <20191129000827.650566-2-joel@jms.id.au>
References: <20191129000827.650566-1-joel@jms.id.au>
 <20191129000827.650566-2-joel@jms.id.au>
Date:   Mon, 02 Dec 2019 09:59:57 +1030
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Joel Stanley" <joel@jms.id.au>,
        "Lee Jones" <lee.jones@linaro.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Philipp Zabel" <p.zabel@pengutronix.de>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH v2 1/2] dt-bindings: mfd: Add ast2600 to ASPEED LPC
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org



On Fri, 29 Nov 2019, at 10:38, Joel Stanley wrote:
> The AST2600 has the same LPC layout as previous generation SoCs.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
