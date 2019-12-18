Return-Path: <SRS0=jmN2=2I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56955C43603
	for <linux-devicetree@archiver.kernel.org>; Wed, 18 Dec 2019 21:37:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0C2E721582
	for <linux-devicetree@archiver.kernel.org>; Wed, 18 Dec 2019 21:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576705039;
	bh=bPi2CTdZIaUe970JSxfBDg+r8nfVD9xt8p1uSBZS4OA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=qAAfhZ5ILAdKVgDgCWsayMkziGVod0v7yK1heWBpT/pOHSpcGRKQNSIV+g/vvg+2H
	 yIEq2UtK3mXoREHDYXJ23oEtlcnq21roS6UgN4e0zu+P51q4wtIlO13Sej25ATmIhK
	 CMfWLyp/+3FQlvx4GyHDVwGCUgFMLXIBpCy+nr7E=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726518AbfLRVhS (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 18 Dec 2019 16:37:18 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:33080 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726188AbfLRVhS (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 18 Dec 2019 16:37:18 -0500
Received: by mail-ot1-f65.google.com with SMTP id b18so4259048otp.0;
        Wed, 18 Dec 2019 13:37:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:content-language
         :user-agent;
        bh=ifuKCDLglV3cQ2NjiVrZMr22gRDHsz+j+tKyqQeTxHQ=;
        b=W+FdHrzyZB4rhHvRV+SBEntRFDaPb+KZV7L5em79Suppw7wufxQvHpJipBEkX4941/
         Wu1M/VfdNiWkHzWwhrJAb9P/gzn5sjgYO5tCxjl8zd7lHYkeYu2YAzAp++eEq8epLKcL
         V7nVPfu7341RWtF85RY9hMbo+kV8v+z+21yToi8rHsE42Ykb3nYpABX/u8ojiMIqCBPA
         Wad6JYgqVRdNEfmS06Zry8IoVNvyT0HePGkjBkvsYcj7R1VtN1wJgaAHidQM7GT+taif
         S75WJLdz9Yv+bxKNO0EAuLtjo2lbFpZAaqY/MvvwmE8zzFIvnsbXduhemgL3O90HRNmY
         aF6Q==
X-Gm-Message-State: APjAAAU09ETnd4Jr6mOK/kd0gLlrlM9Dzfc4fCR9MrR0OFgaWpR03RnW
        7JVs+NxucvVZAnBAk3iMxw==
X-Google-Smtp-Source: APXvYqyb5pOkEkq05UBSd4+BP9Qw43aHqaQLKGXY2sc4jHQcsLcCb95uhzFgK9KV8LGcg5xUOxHBnA==
X-Received: by 2002:a05:6830:1bf1:: with SMTP id k17mr4833956otb.101.1576705037550;
        Wed, 18 Dec 2019 13:37:17 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id g25sm1263886otr.8.2019.12.18.13.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 13:37:17 -0800 (PST)
Date:   Wed, 18 Dec 2019 15:37:16 -0600
From:   Rob Herring <robh@kernel.org>
To:     Eugen.Hristev@microchip.com
Cc:     robh@kernel.org, Ludovic.Desroches@microchip.com,
        wsa@the-dreams.de, peda@axentia.se, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Codrin.Ciubotariu@microchip.com,
        Eugen.Hristev@microchip.com
Subject: Re: [PATCH v3 1/4] dt-bindings: i2c: at91: cosmetic formatting of
  compatible list
Message-ID: <20191218213716.GA30887@bogus>
References: <1575886763-19089-1-git-send-email-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1575886763-19089-1-git-send-email-eugen.hristev@microchip.com>
Content-Language: en-US
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, 9 Dec 2019 10:19:59 +0000, <Eugen.Hristev@microchip.com> wrote:
> 
> From: Eugen Hristev <eugen.hristev@microchip.com>
> 
> Format the list of compatibles with one compatible per line.
> 
> Suggested-by: Peter Rosin <peda@axentia.se>
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> Acked-by: Ludovic Desroches <ludovic.desroches@microchip.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-at91.txt | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
