Return-Path: <SRS0=aO3b=7J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 028FCC433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 May 2020 00:32:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C9574207CB
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 May 2020 00:32:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="sIAKCvc0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726907AbgE0Acc (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 26 May 2020 20:32:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726898AbgE0Acc (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 26 May 2020 20:32:32 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB1CCC03E96F
        for <devicetree@vger.kernel.org>; Tue, 26 May 2020 17:32:31 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id x13so10937041pfn.11
        for <devicetree@vger.kernel.org>; Tue, 26 May 2020 17:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=b3E7kBOAM2ew0xZ38kPv10y9VtHtStBNAPoFOCwdwzA=;
        b=sIAKCvc0u5PTCAIepNUBqhcRsAcLBfmDxstjdS7VwkNKBZmUZ/E/X+L4tZTb4qX4xm
         3Z5lRnZk7EVb9clRn8reNvvO0h1/HVu3xYL7LIMe37sTYQcVm3s0oCcOz2Q79T3f6iQ7
         bA/CUUmuwqKc58s6BnXfGlwXQu4ABI6KYefld9YLsaL+xj0KvVHAX58vlT0XSV3t1FoB
         mrNOy3QSZjkJP7SoFA5FToBJPK8dsa/xNpI/BCcGlfaQcs2yUt6PQ/oLDCSOI6KOnoT8
         n8SQ16PWLOqtOTGi/h4fT1zexP+hvWlItmdC31or1jVbQhS8EJaVW5Ez4NYm/G8eGPxU
         Fs1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=b3E7kBOAM2ew0xZ38kPv10y9VtHtStBNAPoFOCwdwzA=;
        b=MclK1hsQKtRvSlcEwsjNk22BqyB69ketQu21oAyOiqFzPg4LE5tW6cagpTsvKIQC1j
         YRCxLw4vX0nFBSSztNMfEsLOQZh7ua4tQWaQHZLHgDL1W9TME4/wBedH52HExSvXwUMQ
         L1WeTwGvMTo13bQ1bFIYEruySP2cicE8f0ZEjowDCwMMAAQPmkdGjgAsrdB3Y8f1ZWRq
         0HjYeq5iZ7kuIXduf8AiEysQxA8pLmcPSe2QS8EKkgoT+WTelyIZl63lzKjab5VOFjh/
         TNxn9tWFO18n6AoLfYFew6BIZSF1b6kWi002xfgNJCm336cITI11xvO2yEvSF7Q/z3Au
         8rFQ==
X-Gm-Message-State: AOAM5302RNiBXlbTHUchVHNfNjL6mszfHWE8lA6g7yJYDVQYXqobe+T2
        C3An8q2s+GKN75dmNP8COwV2bA==
X-Google-Smtp-Source: ABdhPJyLyZQqJTK/aWjlOUiPRd4F92ADMhZZVfoxKIVjzzI0ER808j2pZAQdP72+g4iGhVujHr1P9g==
X-Received: by 2002:a63:5763:: with SMTP id h35mr1353749pgm.98.1590539551005;
        Tue, 26 May 2020 17:32:31 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id b23sm616219pgs.33.2020.05.26.17.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 17:32:30 -0700 (PDT)
Date:   Tue, 26 May 2020 17:32:30 -0700 (PDT)
X-Google-Original-Date: Tue, 26 May 2020 17:32:27 PDT (-0700)
Subject:     Re: [PATCH 5/5] dt-bindings: timer: Add CLINT bindings
In-Reply-To: <c0e9e625-daf8-b72f-2237-06018ff5d8a0@gmail.com>
CC:     anup@brainfault.org, Anup Patel <Anup.Patel@wdc.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        aou@eecs.berkeley.edu, robh+dt@kernel.org,
        daniel.lezcano@linaro.org, tglx@linutronix.de,
        devicetree@vger.kernel.org, Damien Le Moal <Damien.LeMoal@wdc.com>,
        linux-kernel@vger.kernel.org, Atish Patra <Atish.Patra@wdc.com>,
        Alistair Francis <Alistair.Francis@wdc.com>,
        linux-riscv@lists.infradead.org
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     seanga2@gmail.com
Message-ID: <mhng-0995a264-b39c-4790-9aa5-b8c598b43ffd@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, 21 May 2020 23:29:36 PDT (-0700), seanga2@gmail.com wrote:
> On 5/22/20 1:54 AM, Anup Patel wrote:
>> On Fri, May 22, 2020 at 1:35 AM Sean Anderson <seanga2@gmail.com> wrote:
>>>
>>> On 5/21/20 9:45 AM, Anup Patel wrote:
>>>> +Required properties:
>>>> +- compatible : "sifive,clint-1.0.0" and a string identifying the actual
>>>> +  detailed implementation in case that specific bugs need to be worked around.
>>>
>>> Should the "riscv,clint0" compatible string be documented here? This
>> 
>> Yes, I forgot to add this compatible string. I will add in v2.
>> 
>>> peripheral is not really specific to sifive, as it is present in most
>>> rocket-chip cores.
>> 
>> I agree that CLINT is present in a lot of non-SiFive RISC-V SOCs and
>> FPGAs but this IP is only documented as part of SiFive FU540 SOC.
>> (Refer, https://static.dev.sifive.com/FU540-C000-v1.0.pdf)
>> 
>> The RISC-V foundation should host the CLINT spec independently
>> under https://github.com/riscv and make CLINT spec totally open.
>> 
>> For now, I have documented it just like PLIC DT bindings found at:
>> Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.txt
>
> The PLIC seems to have its own RISC-V-sponsored documentation [1] which
> was split off from the older privileged specs. By your logic above,
> should it be renamed to riscv,plic0.txt (with a corresponding change in
> the documented compatible strings)?
>
> [1] https://github.com/riscv/riscv-plic-spec

Let's propose tagging that PLIC spec as v1.0.0 in the platform spec group, but
I don't see a reason why that wouldn't be viable.  Assuming that's all OK, we
can start calling this a RISC-V PLIC (in addition to a SiFive PLIC, as they'll
be compatible).

>> 
>> If RISC-V maintainers agree then I will document it as "RISC-V CLINT".
>> 
>> @Palmer ?? @Paul ??

The CLINT is a SiFive spec.  It has open source RTL so it's been implemented in
other designs, but it's not a RISC-V spec.  The CLIC, which is a superset of
the CLINT, is a RISC-V spec.  IIRC it's not finished yet (it's the fast
interrupts task group), but presumably we should have a "riscv,clic-2.0.0" (or
whatever it ends up being called) compat string to go along with the
specification.

>> Regards,
>> Anup
>> 
>
> --Sean
