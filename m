Return-Path: <SRS0=12Nb=ZV=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FAKE_REPLY_C,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E313C432C0
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 Nov 2019 07:57:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 439AA21736
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 Nov 2019 07:57:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oX9ygkYV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726360AbfK2H5g (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 29 Nov 2019 02:57:36 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:40817 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726215AbfK2H5g (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 29 Nov 2019 02:57:36 -0500
Received: by mail-wm1-f66.google.com with SMTP id y5so13880234wmi.5
        for <devicetree@vger.kernel.org>; Thu, 28 Nov 2019 23:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=hClcGyZUyRAdPFEjS9zD1iTFQS5wk4UVwSxzy8NeBsE=;
        b=oX9ygkYVmfkmhy6yyVe5qnMqSvemShkjRnoGFQwH7OJmhzPZH5d1VXD4Z3Sx71BBfN
         OmqfwNUjNEazDwZ6pgmaO/EbVx2503hXI4aZwkUfbHFKJ7u1TYerNMrH/huLTXmZOojX
         ahP9UJAX5MYBNSC8wAEhjh8VQQNkOfelHW+79ryd+XKSJXWvarrlVQpRtemr3UMXXAUe
         nfgrP/MiD+QbYie1y9yVFntFeRMzyalEwWxFbCcEDJkzaGb8hWhY0jfQqg3iNHycfEhW
         nkOvqZs1uifx1VTdoJSQ3+RCr12fIzmD2yTuj4KqS9r1i36n7AuXtNQzR4t15BLjRQaF
         YXPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hClcGyZUyRAdPFEjS9zD1iTFQS5wk4UVwSxzy8NeBsE=;
        b=ZTUh5Q8aYKp7yBW73spJn89nFgKNhTzgWS3gFybRH784mX2Qn4LXUgOfAVAtqhkq59
         UkT0TZLnWsJuy0KElagwcQWTPPsTegAABK/oAkaBw+mOO8DVYLwOJyRuwDVibGLiFOms
         flSqS4oU6uotS7zxupG0JIhkdbMCeZ2SB98XIHGYeD6IyEO0Bsl/70K0csHyUlWg3WSW
         738qd2HdBGIgohZLcMffuajfkDYihP8MKnZhBoeboCaaLPRj4cjjp4GpNUmysTUqfuJG
         tgK5f3re1qJf+RcmYVf0p7Cfy6PmdJbpWSlpSYHhCVi5JpohFpP2IITZzrxPJoVDEPrG
         DaOQ==
X-Gm-Message-State: APjAAAUtaZTeLynPlbazmKYiILq00MgfZvMHBvs6q4x6VrsB7E2swTYq
        PSYVcusJFZfrDNIKE3oNNuY=
X-Google-Smtp-Source: APXvYqzzIc2cg6FFoHZWnQAg16nZrA34PO73gfpwf17n8oEimaxGpOKXuawypKW0iXLZZluncDmwgQ==
X-Received: by 2002:a05:600c:21d6:: with SMTP id x22mr13267705wmj.126.1575014253972;
        Thu, 28 Nov 2019 23:57:33 -0800 (PST)
Received: from localhost ([193.47.161.132])
        by smtp.gmail.com with ESMTPSA id c1sm25745470wrs.24.2019.11.28.23.57.32
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Nov 2019 23:57:33 -0800 (PST)
Date:   Fri, 29 Nov 2019 08:56:49 +0100
From:   Oliver Graute <oliver.graute@gmail.com>
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     DTR <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        "linuxppc-dev@lists.ozlabs.org Pantelis Antoniou" 
        <pantelis.antoniou@gmail.com>,
        "netdev@vger.kernel.org Linux ARM" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [RFC PATCH 1/1] arm64: dts: added basic DTS for qmx8 congatec
 board
Message-ID: <20191129075649.GE2460@optiplex>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed8b6139-a67d-d5d3-c65b-260d020c95e0@free.fr>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 28/11/19, Marc Gonzalez wrote:
> On 28/11/2019 10:55, Oliver Graute wrote:
> 
> > On 28/11/19, Marc Gonzalez wrote:
> > 
> >> On 29/10/2019 13:23, Oliver Graute wrote:
> >>
> >>> +&fec1 {
> >>> +	pinctrl-names = "default";
> >>> +	pinctrl-0 = <&pinctrl_fec1>;
> >>> +	phy-mode = "rgmii";
> >>> +	phy-handle = <&ethphy0>;
> >>> +	fsl,magic-packet;
> >>> +	fsl,rgmii_txc_dly;
> >>> +	fsl,rgmii_rxc_dly;
> >>> +	status = "okay";
> >>
> >> The two fsl,rgmii* properties do not exist in mainline.
> >> I suppose there were copied from downstream?
> > 
> > you are right, I'll remove them.
> 
> You should first check what the downstream driver does for them.
> And check if there is an equivalent action in mainline.
> These delays tend to be required for the PHY to work at all.

ok as far as I see there is currently no equilant action in mainline.
Downstream linux-imx use rgmii_txc_dly and rgmii_rxc_dly in fec_probe()
and fec_restart() for some imx8qm-fec and imx8mq-fec PHY delay quirks.
Perhaps this missing quirks are related to the random crashes in that
driver I have with imx8qm.

[  129.211959] fec 5b040000.ethernet eth0: rcv is not +last
[  129.217300] fec 5b040000.ethernet eth0: rcv is not +last
[  129.222647] fec 5b040000.ethernet eth0: rcv is not +last
[  129.227966] fec 5b040000.ethernet eth0: rcv is not +last
[  129.233282] fec 5b040000.ethernet eth0: rcv is not +last

Best regards,

Oliver
