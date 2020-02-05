Return-Path: <SRS0=uboK=3Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C8F1C35247
	for <linux-devicetree@archiver.kernel.org>; Wed,  5 Feb 2020 17:33:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 19F7220659
	for <linux-devicetree@archiver.kernel.org>; Wed,  5 Feb 2020 17:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1580923994;
	bh=dDdn5xtdB+st172DSpUXYY0xm0Ed5Ds8avMEYUtPX8c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=NXx01dSK4iUVfNjYQgAiTB5QI5fKKODE83zAXK2c2bZWfesxBxg4aPaWZLxHWxRC+
	 sF+mwg9ctP6rGjn9OixVL9LsAIlJmP2p1s5a8K1vbdA7LnmJgE1lTcExBxw320Q8K4
	 jEMNsbjjWhNAD7FkFOL/KDzFEcJEm9HcCUsvK9qo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727363AbgBERdN (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 5 Feb 2020 12:33:13 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:37176 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726957AbgBERdN (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 5 Feb 2020 12:33:13 -0500
Received: by mail-wm1-f68.google.com with SMTP id f129so3829481wmf.2
        for <devicetree@vger.kernel.org>; Wed, 05 Feb 2020 09:33:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NIXMdyM17Vsgu9U2iF1Gocz/YPTIf7hG1iqxFJ4gHAI=;
        b=ELoOernyXg2ar/E/Z443W3ChfcsK9aRhNsqNqYlsdtDZSJdkGEy0/a03HgdFS9p3SX
         jIm+rIRxkJWCJYsv2/7PcBnQLTLYewLdNwebSFhRQZBEzlrmWXOkbrIpKEyFVgHPGMMs
         43H1q91bEihNCKE9gg/GN+VBCYCQWCbYDyD107Fj0DbqYilvgkm/a+NTHlOqpRgG7uZk
         AQ9uVaApXROQWCBu26IA86Y65ra6XqMQwRjTFkTbq44o5I93W3wlW5OSSQq45pKilVaA
         TyXYTc0JALLrjDx1bbtNug1HOS8nshP6QE8Myjtv0tQT0R39ekE5TnTY+3tcgIlQRII6
         ktIg==
X-Gm-Message-State: APjAAAXsvmQGTUL1g8vV5YP/9AoAm6ZRybrkdx1H1sSV7vix9SnjJUBp
        tvo0tial0EkUSJ1ke9M+UA==
X-Google-Smtp-Source: APXvYqx3+2W+cyvAcOhXugVfztjPGzLY93MUdM73HQ7///RVqRrqQvMvrFeRIzWNzJm+AfMJ5rSu4A==
X-Received: by 2002:a1c:6755:: with SMTP id b82mr6472269wmc.127.1580923991972;
        Wed, 05 Feb 2020 09:33:11 -0800 (PST)
Received: from rob-hp-laptop ([212.187.182.166])
        by smtp.gmail.com with ESMTPSA id r1sm658791wrx.11.2020.02.05.09.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2020 09:33:11 -0800 (PST)
Received: (nullmailer pid 3137 invoked by uid 1000);
        Wed, 05 Feb 2020 17:33:09 -0000
Date:   Wed, 5 Feb 2020 17:33:09 +0000
From:   Rob Herring <robh@kernel.org>
To:     Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
Cc:     noralf@tronnes.org, Sam Ravnborg <sam@ravnborg.org>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: add vendor prefix for OzzMaker and
 Waveshare Electronics
Message-ID: <20200205173309.GA2474@bogus>
References: <cover.1580134320.git.kamlesh.gurudasani@gmail.com>
 <aa8799c4164b54fa5c4ca55e48966d7b61352c2c.1580134320.git.kamlesh.gurudasani@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa8799c4164b54fa5c4ca55e48966d7b61352c2c.1580134320.git.kamlesh.gurudasani@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, 27 Jan 2020 19:55:33 +0530, Kamlesh Gurudasani wrote:
> Add vendor prefix for OzzMaker [1] and Waveshare Electronics [2]
> Both are display manufacturers
> 
> [1] https://ozzmaker.com/about/
> [2] https://www.waveshare.com/contact_us
> 
> Signed-off-by: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Applied, thanks.

Rob
