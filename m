Return-Path: <SRS0=+O1R=4O=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3502DC4BA13
	for <linux-devicetree@archiver.kernel.org>; Wed, 26 Feb 2020 17:17:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0A22A20838
	for <linux-devicetree@archiver.kernel.org>; Wed, 26 Feb 2020 17:17:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="KPTIuJ6h"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726148AbgBZRRd (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 26 Feb 2020 12:17:33 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:38831 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726151AbgBZRRd (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 26 Feb 2020 12:17:33 -0500
Received: by mail-wm1-f68.google.com with SMTP id a9so55081wmj.3
        for <devicetree@vger.kernel.org>; Wed, 26 Feb 2020 09:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=D5NgFvpvyGD2NAkidGgia/jVmr0ryRkNn23SZkfip3U=;
        b=KPTIuJ6hOKN4eNm6446oV+ufMfdLlLPWUE/tcfYlDyTvUttjmb4fzCSa0EzUQQTqQd
         4A6Lk8gDTE75gNGQNVL7pThfh+KOKigyKwqXaZmiVC0p6B4Tvs0pwoFlJ7elicCo8hrn
         WchqZZ8SHT/si1iGF31t/ZKMIEwvTsxHMUqr43GAELsgjrORQeYSKwABRgw02f/xA3Zw
         4vK0eYbFLJal+Ic4ZjMmDqgc9per9KH3xgnJeg3epqAhAdt8fRkPfoAZryfDW+Ev5n59
         K+UKrDlgGf+BZdmaLwxciFqLtwmoDJVZAHZVRhIt2/WIglamTAcdGRk9VzdwR1vk003J
         rk1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=D5NgFvpvyGD2NAkidGgia/jVmr0ryRkNn23SZkfip3U=;
        b=qB20+va77MRbkcsCdyMHCCZZCmRiL0uOgSKGsWW+BnPQ9wS46FCB6/WYNgzrzFyl2o
         3KajDADaZNaUmIAjbyCBzgytf1bKXzni57NjlKWf9sbQJlSeueDITKC+swfPBnbZFnH1
         MN7CySD/gpYRgvbsDg4HM6earycRYOTEnyohXSNsxoTR77K2KKYOTKBC3Sg7k1Nqwye5
         6jyimtRn610p69+s69Nadhsq0V41uQ/hs8zDFLRp8wrDmJnZaXvV/ochdDyoIanItrsF
         DKTE7rlfyLR6BugK7bgXQUbo/CMS19v0lebgm5eAIMVUY6+wOQGPgdzZ0jvfZ6RdIe4o
         e5Dg==
X-Gm-Message-State: APjAAAV0Hp862MeYnwbWH2MPKHb62YrzEGl5A6pVfAvziHKj1MKiIrBx
        U6Euff/iSheyMmGg2lCAwit+LQ==
X-Google-Smtp-Source: APXvYqxrttVIAUjGEZgZ4W32J3SfMG1F9ArDXDphkR2AMS3TDMpZqL7cqVnwvPG+nsAXG0VspMUfLw==
X-Received: by 2002:a05:600c:299:: with SMTP id 25mr6704261wmk.68.1582737451052;
        Wed, 26 Feb 2020 09:17:31 -0800 (PST)
Received: from ?IPv6:2a00:1098:3142:14:a5b1:f6ea:e382:15d7? ([2a00:1098:3142:14:a5b1:f6ea:e382:15d7])
        by smtp.gmail.com with ESMTPSA id z21sm3719210wml.5.2020.02.26.09.17.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2020 09:17:30 -0800 (PST)
Subject: Re: [PATCH] ARM: dts: bcm2711: Add pcie0 alias
To:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Rob Herring <robh+dt@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>
Cc:     phil@raspberrypi.org, devicetree@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20200226164601.20150-1-nsaenzjulienne@suse.de>
From:   Phil Elwell <phil@raspberrypi.com>
Message-ID: <51e9f945-b047-eb66-28c0-54d467ce51a7@raspberrypi.com>
Date:   Wed, 26 Feb 2020 17:17:30 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200226164601.20150-1-nsaenzjulienne@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Nicolas,

On 26/02/2020 16:46, Nicolas Saenz Julienne wrote:
> Some bcm2711 revisions have different DMA constraints on the their PCIE
> bus. The lower common denominator, being able to access the lower 3GB of
> memory, is the default setting for now. Newer SoC revisions are able to
> access the whole memory space.
> 
> Raspberry Pi 4's firmware is aware of this limitation and will correct
> the PCIE's dma-ranges property if a pcie0 alias is available. So add
> it.

I can confirm that this is exactly what the firmware is looking for, so

Reviewed-by: Phil Elwell <phil@raspberrypi.com>

Phil
