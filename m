Return-Path: <SRS0=7KoJ=ZG=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E9FEC432C3
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 Nov 2019 21:21:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 11DEB206E6
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 Nov 2019 21:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573766472;
	bh=eaeo835Ejk6n2oL2WgB1NwjsbA0NYf3TgvULJz9Te2Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=HDPJ04UK6FYzSR7Ur6H8ZK1Q+7hVPJZ1xpF6hlUEoXJnd4nDYDFAtExww++C4LLLq
	 iNuv0PFhEZwf4VN+tVz8K06cibOHTxKvFZzhcfkZ6SIr77SU2eZ/fvC6bX9z3s3GZO
	 FJzbo+pohUta2WZZ/x9y1ebbAshEnqabuofHllAw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726628AbfKNVVL (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 14 Nov 2019 16:21:11 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:34840 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726592AbfKNVVL (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 14 Nov 2019 16:21:11 -0500
Received: by mail-ot1-f67.google.com with SMTP id n19so2384562otk.2
        for <devicetree@vger.kernel.org>; Thu, 14 Nov 2019 13:21:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=83J06N/2U0I2hY3ijlKmgx6CDRML5iKyBqhq8dV5a1U=;
        b=N+iDSuZBtE7Aho44soS5ZjgJdYhhnpszcp9O+cXXnTL5W3PxrHZk/+JB6FTbTJo4rn
         0TweR2ft/K96E7AkDXXw38s7D2uduaOfFFwXBvYvBrz6mKL5pr+UTE8/Lc1rdagWJ2qZ
         qZ1+e20osBTyKLFzW3zfTXfVAmuiTokDA/2RqZaXhshtG8s4H30ujGjidMb8ml0PZx8S
         9gcKctcbK4pL3is8N7W7cJ3PUy/d1ZdAn44S7qXFL9uJ4HR0Drc7tRoi8ki/f8uHm+7h
         8koVsBdY+cPh6c5ZSjSas/il5aqrarPSyEUuGTLuBY90zAHsF00bow4F/HkYJXh8HUSP
         LgMg==
X-Gm-Message-State: APjAAAUkv2DAFkoYIfgP5ETZF0SEYvVEpU7u0fED3zyXomLrJXNmOIPo
        PI6uhKuhzZVPBsJZWte0vQ==
X-Google-Smtp-Source: APXvYqzPym4HOlsuJAT5utwxXtyrB4NEcV/LoiuR8d9etp6/t1NhmHXvRZMUFWT/cOgpfIbtY77QSQ==
X-Received: by 2002:a9d:6288:: with SMTP id x8mr9400782otk.170.1573766469417;
        Thu, 14 Nov 2019 13:21:09 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id g23sm2199911otl.1.2019.11.14.13.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2019 13:21:08 -0800 (PST)
Date:   Thu, 14 Nov 2019 15:21:08 -0600
From:   Rob Herring <robh@kernel.org>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Frank Rowand <frowand.list@gmail.com>, lee.jones@linaro.org,
        Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <mripard@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2] dt-bindings: Add syscon YAML description
Message-ID: <20191114212108.GA18356@bogus>
References: <20191111133500.135306-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191111133500.135306-1-maxime@cerno.tech>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, 11 Nov 2019 14:35:00 +0100, Maxime Ripard wrote:
> The syscon binding is a pretty loose one, with everyone having a bunch of
> vendor specific compatibles.
> 
> In order to start the effort to describe them using YAML, let's create a
> binding that tolerates additional, not listed, compatibles.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> 
> ---
> 
> Changes from v1:
>   - Move syscon binding from misc to mfd
>   - Add a select statement
> ---
>  .../devicetree/bindings/mfd/syscon.txt        | 32 -------
>  .../devicetree/bindings/mfd/syscon.yaml       | 84 +++++++++++++++++++
>  .../bindings/misc/allwinner,syscon.txt        | 20 -----
>  3 files changed, 84 insertions(+), 52 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mfd/syscon.txt
>  create mode 100644 Documentation/devicetree/bindings/mfd/syscon.yaml
>  delete mode 100644 Documentation/devicetree/bindings/misc/allwinner,syscon.txt
> 

Applied, thanks.

Rob
