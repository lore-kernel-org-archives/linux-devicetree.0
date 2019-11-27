Return-Path: <SRS0=XuEv=ZT=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E55BC432C0
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 Nov 2019 23:29:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0EDA921736
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 Nov 2019 23:29:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=aj.id.au header.i=@aj.id.au header.b="phbuY+eR";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="eTzxGKd+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727116AbfK0X3A (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 27 Nov 2019 18:29:00 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:51347 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727104AbfK0X3A (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Wed, 27 Nov 2019 18:29:00 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 34D4A7028;
        Wed, 27 Nov 2019 18:28:59 -0500 (EST)
Received: from imap2 ([10.202.2.52])
  by compute4.internal (MEProxy); Wed, 27 Nov 2019 18:28:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm1; bh=WmHnlOTFvScBX2EGmW+ACwDK3duB/G/
        UrnEFxjyQhOQ=; b=phbuY+eRBh+vZeyWUf4cpvAFvBnP6mXg+ATZKmi7K4AwuO0
        LqmcMQHB9hjIiBDT4ptXpZuVULTsfQHBoVKM5jSQuzp5gQRUjfa1/AgReGwR7UbB
        s8SiI+Px9QlcIvEy2ikvgUBYbnb5kfpBsSbXofgTU6icpXXiBZOtfI1upTyKukj0
        +aWH1ncS4r3bmLACRufcQFAYhN56nCiMmyRZNwP6crHCkPMC1LBsVpMR0Qmc0gF5
        QaqNGk55dkpiB3R16YJa6Snhbm3g9NwIQ46Bcbjnoq/nREq0bd5KvS9WbqXKjHn2
        GWMVKR7scvHpj/mEgXxCSJX4nDFOK6V7uCkv8EA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=WmHnlO
        TFvScBX2EGmW+ACwDK3duB/G/UrnEFxjyQhOQ=; b=eTzxGKd+MJ7SV9e1ith8mC
        TsaeQWoXZbBo160hhoYS865k+2AblT3fcVKogo/Pdn4sdOiSFOhmn9lyAlfGXWfK
        jTLcO8QvBDxAINak7oHAEZLNo40sizD6VKgHjcSDPy7mofJDE2zoy2R3trPIrm2H
        zH/RG6RU/hNGingzQi4jM3OCb5rqM3IULaRAQ0ZHhhFgAon9iqonK+Znd3iQtuvj
        X8CX3gwJKRUAB3FA5g3sCjtZFjDVUzMtHcYBgnTTeUzgF3lUMibPLrLw7eT7wwXo
        oHuI+yA+Mgw7/VptN7JlDyB/JydnrwSGEKa9vBgZK/BUo8Qd3Zovv1bBIgNmw2NA
        ==
X-ME-Sender: <xms:uQbfXaWK3T5UnO9kDgcZhpfYXWEAJXDHYtTyTXkH57fsPE-we_7QJQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudeiiedgudduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
    grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
    rhfuihiivgeptd
X-ME-Proxy: <xmx:uQbfXX261WCfMWDB5jVtpYr0oo0TUPiEVxjeTDvBjBfnEh_wT9OkPQ>
    <xmx:uQbfXbcS2yxYFT8m1LFQf3oxm9SX8dM4T1KVzOqgfoF1-ONw9VrUiA>
    <xmx:uQbfXUVk77F0ThkwVyduEWlNi7eEo79FEvPWF-yREuuFL09kWxymLg>
    <xmx:uwbfXQFeqN8D9Ib7Gmygh12vIPjkGpWY3wZ9abhOScETl1dbeLqtNA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id B7C90E00A2; Wed, 27 Nov 2019 18:28:57 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-578-g826f590-fmstable-20191119v1
Mime-Version: 1.0
Message-Id: <4d10183b-3124-4afb-aa77-c53adcc77feb@www.fastmail.com>
In-Reply-To: <20191101112905.7282-3-joel@jms.id.au>
References: <20191101112905.7282-1-joel@jms.id.au>
 <20191101112905.7282-3-joel@jms.id.au>
Date:   Thu, 28 Nov 2019 10:00:27 +1030
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Joel Stanley" <joel@jms.id.au>,
        "Rob Herring" <robh+dt@kernel.org>, "Jeremy Kerr" <jk@ozlabs.org>,
        "Alistair Popple" <alistair@popple.id.au>,
        "Eddie James" <eajames@linux.ibm.com>,
        "Steven Rostedt" <rostedt@goodmis.org>,
        "Ingo Molnar" <mingo@redhat.com>
Cc:     "Benjamin Herrenschmidt" <benh@kernel.crashing.org>,
        devicetree@vger.kernel.org, linux-fsi@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: fsi: Add description of FSI master
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org



On Fri, 1 Nov 2019, at 21:59, Joel Stanley wrote:
> This describes the FSI master present in the AST2600.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
