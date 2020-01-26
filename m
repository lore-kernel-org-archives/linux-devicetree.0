Return-Path: <SRS0=8cl9=3P=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20B2AC2D0DB
	for <linux-devicetree@archiver.kernel.org>; Sun, 26 Jan 2020 22:04:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E27D22070A
	for <linux-devicetree@archiver.kernel.org>; Sun, 26 Jan 2020 22:04:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="udwnkTDt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726323AbgAZWEB (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 26 Jan 2020 17:04:01 -0500
Received: from mail-wm1-f46.google.com ([209.85.128.46]:53691 "EHLO
        mail-wm1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726144AbgAZWEB (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 26 Jan 2020 17:04:01 -0500
Received: by mail-wm1-f46.google.com with SMTP id s10so1239337wmh.3;
        Sun, 26 Jan 2020 14:03:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8xT2YCj/kdkoO4ypf9g6bJbEofr8bfZO0AuotrJsPkM=;
        b=udwnkTDtGg3iuFwd8j4vmcT/KilmxvtI78NKaFGiKf0iA8O+X1h58LFpcgwzvQROph
         yI7cQVgTsjx+lRMR92E4QUo2KCztcDyTR9G6bhnhR/78KvwB7vr56MLoQfJa+6ltCKT3
         wugP77IL5GY8QEty9vcbdXsb1OMBMNzYGvVlVwrylZXUMFsFFl9JqrEktIF/ZPXcObsz
         zx0fWRizSdlT4xQxY6MA40YmIWJqk8ZiYdNb6+O9tWjJ3fgG7qWqAxY96myqDNgAKUOn
         AWNVYB44xjz0U++QMvo3cJoe1nJlrnWbmzZ0zaQtDAglkzoLmhFx5SiWivQG3GUIylmB
         zd/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8xT2YCj/kdkoO4ypf9g6bJbEofr8bfZO0AuotrJsPkM=;
        b=JiMP/Av9cd9hfFX/opfsaDh8XBflLUF64DwkrcKeDU9d+Zb85Jj1gAZ+NhEP2gW0VA
         4k2IK/IhN35U4Xhhq9at+zzK3TAiB8qwOg7qi1LILizs18pCpd/70z1JPDvKlNt22eoZ
         b8Oli4iVi4NDLsN3rQ398EAJiH4f5G34FXB77ztF3vCklE7ZpkrwGVdau3WFD8Kx0C34
         wuvRyjsTMSOAqOPnx0/Axo4oBrweoLuf1pWRZuOOfMTQcOHWdYOMslO4HIfNEO1UOxX6
         7qICQUq4yAxIRXbP1kAjZIdUMrDG5tv3/NRQotcLi9nSFGIGfSgnVt/goBT/ADzBujbL
         MKhg==
X-Gm-Message-State: APjAAAW6seuuUEyXz8SEkEx7ngo9ffo4zwZW5L2QHEc07YSkKzuGZJpt
        m3I/9jsnBzAoj662mKeAz0H4zr0A
X-Google-Smtp-Source: APXvYqyVq7rQ52H2JEUWMNZFskDa3qU+AcyevjNKOmTv1A/4PZcrLIlRwKmFQvhgVH+/sBM+D/ZlGQ==
X-Received: by 2002:a1c:2089:: with SMTP id g131mr9822744wmg.63.1580076238693;
        Sun, 26 Jan 2020 14:03:58 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id o4sm17596949wrw.97.2020.01.26.14.03.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jan 2020 14:03:58 -0800 (PST)
Subject: Re: [RFC 2/2] dt-bindings: firmware: tegra186-bpmp: Document
 interconnects property
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Georgi Djakov <georgi.djakov@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20200114181519.3402385-1-thierry.reding@gmail.com>
 <20200114181519.3402385-2-thierry.reding@gmail.com>
 <7aefac6c-092c-b5a6-2fa6-e283d2147fc3@linaro.org>
 <20200120150605.GA712203@ulmo>
 <57c37b3c-1473-d444-db59-8c6650241188@gmail.com>
 <20200121141027.GE899558@ulmo>
 <83d94918-bc01-131b-924c-9750767d3b29@linaro.org>
 <20200121155432.GA912205@ulmo>
 <ffc22502-0e7e-522c-543d-0e74cc25f4b1@gmail.com>
 <853bb7bd-8e04-38ac-d0d6-a958135a49be@gmail.com>
Message-ID: <f915949a-b46e-26fe-f103-fbc8d1fa3bb1@gmail.com>
Date:   Mon, 27 Jan 2020 01:03:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <853bb7bd-8e04-38ac-d0d6-a958135a49be@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

27.01.2020 00:56, Dmitry Osipenko пишет:
[snip]
> Thinking a bit more about how to define the ICC, I'm now leaning to a
> variant like this:
> 
> interconnects =
>     <&mc TEGRA186_MEMORY_CLIENT_BPMP &emc TEGRA_ICC_EMEM>,

>     <&mc TEGRA186_MEMORY_CLIENT_BPMPR>,
>     <&mc TEGRA186_MEMORY_CLIENT_BPMPW>,
>     <&mc TEGRA186_MEMORY_CLIENT_BPMPDMAR>,
>     <&mc TEGRA186_MEMORY_CLIENT_BPMPDMAW>;

I forgot that each ICC path should have SRC and DST, but you got the idea.

This should be a more correct variant:

	<&mc TEGRA186_MEMORY_CLIENT_BPMPR &mc TEGRA_ICC_MC>,
	<&mc TEGRA186_MEMORY_CLIENT_BPMPW &mc TEGRA_ICC_MC>,
	<&mc TEGRA186_MEMORY_CLIENT_BPMPDMAR &mc TEGRA_ICC_MC>,
	<&mc TEGRA186_MEMORY_CLIENT_BPMPDMAW &mc TEGRA_ICC_MC>;

> 
> interconnect-names = "dma-mem", "read", "write", "dma-read", "dma-write";
...
