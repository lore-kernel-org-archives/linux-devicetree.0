Return-Path: <SRS0=PToE=Z3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90A9CC43603
	for <linux-devicetree@archiver.kernel.org>; Thu,  5 Dec 2019 18:30:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 658A822525
	for <linux-devicetree@archiver.kernel.org>; Thu,  5 Dec 2019 18:30:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="mlQt3epE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729755AbfLESaE (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 5 Dec 2019 13:30:04 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:44558 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726946AbfLESaE (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 5 Dec 2019 13:30:04 -0500
Received: by mail-lj1-f195.google.com with SMTP id c19so4671710lji.11
        for <devicetree@vger.kernel.org>; Thu, 05 Dec 2019 10:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Liz72NCXkEAckQVD7MW+24BIWl0sOWnVX/96MZKykOg=;
        b=mlQt3epE/9Va47JkSlhnWLLGH98u8ZNMYb964IRwKBztHOwNmlGfZBUO+lXGFTObYE
         CR2jQIF+EomPEJo/zekfvqoXCBAmI4rPHh6IsBtA83+ORZ4CPEWSwb9+29+OOJAarc8J
         9Y+cdDoVr2aFFHU9MZQ6E/JkLDUTqMJIQ4mDVZ1CWo8jA8wicFb4yE98Th6mSBNVV7iH
         T0j4Tk2XzVTDaHuw3cHfq+8Y0eKeqMFpgtkIAyZXl0L71c29CNPVGdYtkH0pDEDwLicW
         uNqufYHiwvimCRTd4TW616lxdmOryz+gjooLELPEs0m01LESnIbPgknOtPvTMm0l+wXr
         e0HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Liz72NCXkEAckQVD7MW+24BIWl0sOWnVX/96MZKykOg=;
        b=dasC9Vn27s0QDmyprOCQxc+e3cilQBWt61CDdlAZLLJxa3qhSAHC0uZHZVQMYW0PW3
         RxzK8Y3hvuGdHyWqXWr6bB06WRSesIqCFmjjsb56Mt7yumWqghc+8ASYltUZc8RiwMQy
         N9X9D8zaFAZo6Nah1GfSFQz9P1YorslPabhfCSI/uJf+6nIkRR9uTfJvqI6uRhmxdWLl
         KB/S3zCgqOwgl1HJhRKHMIoCjpO+z5j4bKRq31WrZsK9g2kNFTVgbyCoI7O5HzaTde6Q
         aZ6pjtBoDVEXaGowlPgnIDj6KVeREspmSDZRjZlYxpZ9Y0UF46ZUwdNGC2nl/BubzZbq
         99hw==
X-Gm-Message-State: APjAAAUyuCLzcDV01/JauM7INO9p0TduMiRg51wdnNZxCu5Jk0cJuPAG
        +wWhMaY+BLuiFGt3YThMRZ4MOw==
X-Google-Smtp-Source: APXvYqwMRDhqK66bffFBTqeRC4iOCCV7YtIISsUrOoNQh9e5SDtQbwC+HAg6B9D5B7JttNFunAxI5g==
X-Received: by 2002:a2e:b010:: with SMTP id y16mr6586985ljk.238.1575570602573;
        Thu, 05 Dec 2019 10:30:02 -0800 (PST)
Received: from wasted.cogentembedded.com ([2a00:1fa0:461a:4d5:34ab:68cc:66b9:83dc])
        by smtp.gmail.com with ESMTPSA id d16sm5341505lfa.16.2019.12.05.10.30.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Dec 2019 10:30:01 -0800 (PST)
Subject: Re: [PATCH] dt-bindings: net: ravb: Document r8a77961 support
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        "David S . Miller" <davem@davemloft.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20191205134504.6533-1-geert+renesas@glider.be>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <b2db5dfd-8d8a-eaef-b969-d2d55f04623e@cogentembedded.com>
Date:   Thu, 5 Dec 2019 21:30:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20191205134504.6533-1-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 12/05/2019 04:45 PM, Geert Uytterhoeven wrote:

> Document support for the Ethernet AVB interface in the Renesas R-Car
> M3-W+ (R8A77961) SoC.
> 
> Update all references to R-Car M3-W from "r8a7796" to "r8a77960", to
> avoid confusion between R-Car M3-W (R8A77960) and M3-W+.
> 
> No driver update is needed.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

[...]

MBR, Sergei
