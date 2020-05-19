Return-Path: <SRS0=7YFh=7B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C646FC433E1
	for <linux-devicetree@archiver.kernel.org>; Tue, 19 May 2020 20:11:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A1132207E8
	for <linux-devicetree@archiver.kernel.org>; Tue, 19 May 2020 20:11:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="HMbrlclo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726474AbgESULT (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 19 May 2020 16:11:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726348AbgESULT (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 19 May 2020 16:11:19 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4078C08C5C0
        for <devicetree@vger.kernel.org>; Tue, 19 May 2020 13:11:18 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id c12so596194lfc.10
        for <devicetree@vger.kernel.org>; Tue, 19 May 2020 13:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:cc:organization:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=umDGCMjOzElaHcpXS1mIHtTsMYu/2vBzFt+CUEWjizA=;
        b=HMbrlcloN+IuF8m+X22/z5Qp6yEcJ6/5ojLAwp7K0cxSo6/q1KXb8GQhLT/fTN9WqK
         cdjZ37TPgRBERLVXsLji5ZEugG3SrJhBD+ajhb6d84SS+b2xVIe1c1l/Y47Od+xX3ZCV
         k04E6b4g7tm/XYCJ1L89uz5jVRKoqxy2rrcQUYRkjS2s6yJbD5dIqQsutNaTJufpd4IV
         inhzhujqS0ux5QPLhDvJkp7CmLOQVuCFm1ckXtN22p0Me15k4iTJbJGoClZF5oxb3pza
         NM6tOflb0adiD7r63zyrihEawpLZs12cDm03+U+mpjtpZg1Kh/TxnnTx1P6nM+YOlHNp
         MdBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:organization:message-id:date
         :user-agent:mime-version:content-language:content-transfer-encoding;
        bh=umDGCMjOzElaHcpXS1mIHtTsMYu/2vBzFt+CUEWjizA=;
        b=HRr5UHCrY0i3E/CzZIKZF3HS3eUpFyMNRUoqDEWkCVMpH5W/gRuVGbqPrKx0LdX/US
         MZwDHCkcrLvlFEf7NMLHh6enVwcYONobdwTVrs5EN5xXusvAnhGLAG7EXncapZ98pr9j
         Whn/nI+UXn5UGrjBJ/cOob9eI+Z17x4fiRC5fABdaIFv5Q0JwgiWUqDJl1zUd4OC5b1W
         yW1ClCTwWYslLdrK5ZL2hSK6vPc0PMnWBCnvfT/axayAtY3z22b9BklNiWsWnxgSi/ZC
         AHkLkFHJg0C//aF8z9oNOdNtPx1Hgb2UxjgqPeJiadKDN3F3UHh4XzZoJyTHeolOV1jP
         XpEQ==
X-Gm-Message-State: AOAM531xnSHf6XvnI9MFxIqLm4f9fA8nDk449lcGjfnrJVbdbwtinWIf
        9t/VoW2CoxdZgUd5P6JSM2vr7w==
X-Google-Smtp-Source: ABdhPJwClBrtZuLBQYeiUWl5zmIoujH3skYcSgxUFemsMJBlDjLeUwEdruZ3ob5BPq4JnK4QESXa8g==
X-Received: by 2002:ac2:599e:: with SMTP id w30mr362994lfn.188.1589919076162;
        Tue, 19 May 2020 13:11:16 -0700 (PDT)
Received: from wasted.cogentembedded.com ([2a00:1fa0:2c3:baf8:452e:b00:c0e9:c252])
        by smtp.gmail.com with ESMTPSA id t20sm223975lfl.17.2020.05.19.13.11.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 May 2020 13:11:15 -0700 (PDT)
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2 0/2] Add R8A77980 RPC-IF support
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>
Organization: Cogent Embedded
Message-ID: <850d4a7b-4984-eb0f-de89-e5c39d61d19e@cogentembedded.com>
Date:   Tue, 19 May 2020 23:11:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hello!

Here's the set of 2 patches against Geert's 'renesas-devel.git' repo's
'renesas-devel-2020-06-18-v5.7-rc6' tag. I'm adding the RPC-IF device node
for R8A77980 (based on the RPC-IF driver) and describing the QSPI flashes
connected to RPC-IF on the Condor and V3H Starter Kit boards.

I've removed the R8A77970 parts in this version as the RPC-IF driver support
for that SoC isn't complete yet.

[1/2] arm64: dts: renesas: r8a77980: add RPC-IF support
[2/2] arm64: dts: renesas: r8a77980: condor/v3hsk: add QSPI flash support

WBR, Sergei
