Return-Path: <SRS0=g3EE=5U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C681C4332B
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Apr 2020 17:21:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CE4242063A
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Apr 2020 17:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1586020873;
	bh=AQudnWWtHVKiwXGGkpIIGhqDuxJTpyMVuXJa5LLOg3s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=puT/hQUzulxr7oCkt5yR+LCddlfmW0KMJt0ypH/wXEi0Z9bcSwaovLO0NU4U4h32S
	 +qjJ4DIaI5h3G4oyOnxnUOHTRQktRdGBQoFYas5gX7iVEmaii1l/NySmbpjYbQSd8L
	 gr8ucjvTBuKt+znjx6Z7ej4WdQQE/yl6quMHJEmU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726386AbgDDRVN (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 4 Apr 2020 13:21:13 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:44651 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726066AbgDDRVN (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 4 Apr 2020 13:21:13 -0400
Received: by mail-io1-f67.google.com with SMTP id h6so1262078iok.11;
        Sat, 04 Apr 2020 10:21:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zgDQbUcNJwxR+dzbFMRsbOst75kBYn5+SQ0OPvg3WHA=;
        b=KUL/iO0HEdCrFs+sTPR5zhQogwzzFtrL/7gd+HCb+B+ksW0bOaOJ3FbibtvpT7mlf+
         MH68kuyJ4tkqbtRrQBFG/PrYX0KohcPzHZFthmUEt3wOQxpvw29GAIhCGk5/Cc/ahFzu
         CD5eWVXGThoaqll8h7DCp3e3RgyoOVY3kT8RZkFI4CvGHlqbxT9wL0F5oJbkf55v6oRn
         Yqv6N0SB/fG9KCQwVlfvvAz9w0EAiOITkFM/HUJN7RaqOzpNtv2PBSQgtyqxPrEbzBRr
         phqQJuWcCm036LYxyMeP/NJD4usu55eYOywPd0D64LCYWuAi80i+Z3Cp9/HyhpZiIx0s
         HZpw==
X-Gm-Message-State: AGi0PubxfGmXSf+gyDZrbuzFFTDXAAFfTci6ipriSAXNTknTuJXMSYsR
        wA1NcE9nfH1WgpCYaRu8yg==
X-Google-Smtp-Source: APiQypJ7N6jZy1soE6iAhL4IE8KqdG0yBnqhy+kwEW4M8Xn2uBrcnYiOaWbDf5kJhbv+UCYkbJw7PA==
X-Received: by 2002:a02:70c7:: with SMTP id f190mr6658439jac.60.1586020872470;
        Sat, 04 Apr 2020 10:21:12 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id f2sm4050771ill.51.2020.04.04.10.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 10:21:12 -0700 (PDT)
Received: (nullmailer pid 28088 invoked by uid 1000);
        Sat, 04 Apr 2020 17:21:10 -0000
Date:   Sat, 4 Apr 2020 11:21:10 -0600
From:   Rob Herring <robh@kernel.org>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     kishon@ti.com, balbi@kernel.org, khilman@baylibre.com,
        martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 13/14] doc: dt: bindings: usb: dwc3: remove amlogic
 compatible entries
Message-ID: <20200404172110.GA28033@bogus>
References: <20200326134507.4808-1-narmstrong@baylibre.com>
 <20200326134507.4808-14-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200326134507.4808-14-narmstrong@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, 26 Mar 2020 14:45:05 +0100, Neil Armstrong wrote:
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  Documentation/devicetree/bindings/usb/dwc3.txt | 2 --
>  1 file changed, 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
