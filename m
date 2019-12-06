Return-Path: <SRS0=B/fR=Z4=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 472A0C2BBE2
	for <linux-devicetree@archiver.kernel.org>; Fri,  6 Dec 2019 18:40:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2186324670
	for <linux-devicetree@archiver.kernel.org>; Fri,  6 Dec 2019 18:40:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="ja4FwW0l"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726312AbfLFSki (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 6 Dec 2019 13:40:38 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:38905 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726298AbfLFSki (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 6 Dec 2019 13:40:38 -0500
Received: by mail-lf1-f66.google.com with SMTP id r14so6013975lfm.5
        for <devicetree@vger.kernel.org>; Fri, 06 Dec 2019 10:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UwMCmr796apltCBLUqhe/A5aREgROqeA/aKGMVOBK5A=;
        b=ja4FwW0ldHzkgz7cFjZiTR4WwZTx291RUps/Y5tPmXtLWqqXGR/Mt2Sz/eofDjGBYh
         7RrVqrQ2AQ1PxwrDbhSRFwipbclA3C0ftzK80mIPhUETBx64M6HUSGiW3Y0mIYPAvTki
         Aq3q6ZLigqXlHZ8lbMwKhmNDmzuGYUpDNCPHfputU6+rkN4gs6iih+lvf09Y1Fcdrg47
         eZLY1u/DUKVzH58EtI+eRdkMrdLNC0Un7QM69yRcXwDCtYMahx1tLehjRwcCS9iGEJiN
         Jr6MzYRQ5Q8ytqVsVHVR0p0G/O1HXerBiL7uMqN6V8HWQ7GS7qSg90EwJHg/I/QLOnzU
         5QgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=UwMCmr796apltCBLUqhe/A5aREgROqeA/aKGMVOBK5A=;
        b=HhQy7XSnbAhQCzao5y7etxpSFRHBRgBeN8x1fm5wBdWmbseWII5BrKWEFrfXEdCG+i
         /asxrQG6I6j6kq3Qr/G8Qm5+ldfPTo9U1y1wyCwShEqEzwCjyHOpRI3E10mi3boA0lvc
         xKgU9utt+qHleLtj09ZYq0D3xAhlCXnx7stqtoSrM7uFZDm3RnzJ8nHdwiNNbK6Gds8X
         vKBTw3jKSS9/7BElRZ39LinKGHEKbxOu1iC/utnXITHhGdQCimZT5u0+1ZAUCDshTzp0
         pUF4Z2U7wF1aYikJhSXz5coQY9DYIB+flJ6xskxOzMOExJ+oadqFS8ndDzpj+dnOGdxv
         Magg==
X-Gm-Message-State: APjAAAVOTGDC2LI8icA39zZvfVDvbDfwiVr0NrU9lOsII6z1Y6ZnNQqz
        K4UMTKfkTKrXfr/iReBCcab8wQ==
X-Google-Smtp-Source: APXvYqwoiF1L7BhBtSP9Wb2lbIR6oGXDekXGfEbkT9v9ygQo6K88wZj1r41+5B0NKf9UvMHc0EJ3VA==
X-Received: by 2002:ac2:430e:: with SMTP id l14mr5508779lfh.79.1575657636192;
        Fri, 06 Dec 2019 10:40:36 -0800 (PST)
Received: from wasted.cogentembedded.com ([2a00:1fa0:4291:257c:a228:1c89:88a1:5b3b])
        by smtp.gmail.com with ESMTPSA id l28sm6929760lfk.21.2019.12.06.10.40.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Dec 2019 10:40:35 -0800 (PST)
Subject: Re: [PATCH v2 3/6] clk: renesas: r7s9210: Add SPIBSC clock
To:     Chris Brandt <chris.brandt@renesas.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Mason Yang <masonccyang@mxic.com.tw>
References: <20191206134202.18784-1-chris.brandt@renesas.com>
 <20191206134202.18784-4-chris.brandt@renesas.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <5644c687-7692-53f2-f01e-0e7bf62464ea@cogentembedded.com>
Date:   Fri, 6 Dec 2019 21:40:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20191206134202.18784-4-chris.brandt@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 12/06/2019 04:41 PM, Chris Brandt wrote:

> The SPIBSC clocks are marked as critical because for XIP systems, the
> kernel will be running from QSPI flash and cannot be turned off.
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
> v2:
>  * Removed spibsc from critical clock section

   So you've removed it from the critical table but left the patch description
intact?

[...]

MBR, Sergei
