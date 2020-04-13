Return-Path: <SRS0=/QBj=55=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D3A4C2BB86
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Apr 2020 09:39:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2C6F220732
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Apr 2020 09:39:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="BWhN9CNU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728432AbgDMJjw (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Apr 2020 05:39:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728420AbgDMJjr (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Mon, 13 Apr 2020 05:39:47 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A71E6C00860B
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2020 02:31:45 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id u10so4906403lfo.8
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2020 02:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=22ry+294zZcqaoEVkMcWEawZi6DDugMuA4lCNKrgbiM=;
        b=BWhN9CNUIFwnRIEzUe/BwAX9gwW7YYJZCyOYxczVx74YIU7V0mC7z2OcM35UyP4e1p
         4oOxRRQucYbYOo8AiCmMAGW2yCJUIihy25350/EbU/I375sSwG7o78dsiV8hysjDDbOa
         DCnUiVrCWoS2EZjk23MnwjFyE6krOT3x7Sgxkcs7aHT2ffdKiX8lkj0vMnmWerfoO+2i
         7zWqbpEpLBQKObzkG36N8VsFPvN5FgXPc9jylTJvXndqQyp2RHqSXY8Jmqsv+lNrTK9M
         QWJIsmnIw6LotVNSi1iGc+NY6cZD7jfb5lTAXo0ikhgxxY6x18NMuTetmUhmdg4P5gRK
         IQkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=22ry+294zZcqaoEVkMcWEawZi6DDugMuA4lCNKrgbiM=;
        b=CVrhAQLTLfckoYBf2Gb/soEzSEfFkJwdiGYFjVQPtiqDXX01GqANuHFo0bBozrW3xc
         W9FoZlREC9P0wLCa8ElVMGw6OWz9Jz3VAw79mcLyuOxoS417ALoIObPui9BBaR2kOcLN
         mXcBVRNITBUpmf0Wg7VSgnCUyU8sGnW0Bp4ukHP9RJVdnBtKi16qw+lvysTzU2+aP9nN
         7UXvU2k/ay23tRttBY0oCgth4i1A1FXu0dIfFndCF/RnW5dIUCz84XhZAloeCrxyOJtO
         8mUOVka15ME2+pDyZYNJ8mX5DEfoZCgUBWIdXx8bjyrAbUN3hMP8MCjf4N5L75LPRrv5
         9Pzg==
X-Gm-Message-State: AGi0Pub/OyRkX5dCZhP2XJ026rcpjfTNdF3Bq9FGvr9UX1F5azGJFXGY
        ck7bFSoV+qT8I9I6eVJSrGLqlk7/2c+Q2g==
X-Google-Smtp-Source: APiQypLU2XLKZjsSZmZYU4dGrsmyNyLhGMWhvQXMiwFm5FV0dumbDAT+1S0NQ6VdA0RQSuVQGrkBvQ==
X-Received: by 2002:ac2:4554:: with SMTP id j20mr10171876lfm.91.1586770304122;
        Mon, 13 Apr 2020 02:31:44 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:449a:6c6f:9d43:1ad8:e18f:9ec1? ([2a00:1fa0:449a:6c6f:9d43:1ad8:e18f:9ec1])
        by smtp.gmail.com with ESMTPSA id u1sm6665830ljo.65.2020.04.13.02.31.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2020 02:31:43 -0700 (PDT)
Subject: Re: [PATCH v3 1/5] PCI: OF: Don't remap iospace on unsupported
 platform
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org
Cc:     Bjorn Helgaas <bhelgaas@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Andrew Murray <amurray@thegoodpenguin.co.uk>,
        Paul Burton <paulburton@kernel.org>, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200330114239.1112759-1-jiaxun.yang@flygoat.com>
 <20200413053222.3976680-1-jiaxun.yang@flygoat.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <10ef1a19-c2e5-60fc-b3c8-64547017f758@cogentembedded.com>
Date:   Mon, 13 Apr 2020 12:31:38 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200413053222.3976680-1-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hello!

On 13.04.2020 8:32, Jiaxun Yang wrote:

> There are some platforms doesn't support iospace remapping

    That don't support.

> like MIPS. However, our PCI code will try to remap iospace
> unconditionally and reject io resources on these platforms.
> 
> So we should remove iospace remapping check and use a range
> check instead on these platforms.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
[...]

MBR, Sergei
