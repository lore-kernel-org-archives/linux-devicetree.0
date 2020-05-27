Return-Path: <SRS0=aO3b=7J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FE4FC433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 May 2020 08:41:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C802020723
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 May 2020 08:41:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ia9cBwKn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388083AbgE0Ilu (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 27 May 2020 04:41:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387858AbgE0Ilu (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 27 May 2020 04:41:50 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC92CC061A0F
        for <devicetree@vger.kernel.org>; Wed, 27 May 2020 01:41:49 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id e1so23162783wrt.5
        for <devicetree@vger.kernel.org>; Wed, 27 May 2020 01:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hUudrY4n5TJoRLFYuGbnj/ynP3kKZ6PzeqLLC1Y9vLY=;
        b=Ia9cBwKnBLKCJMYaauUNF25v0ARnU70yfbKeUOBTph0+Xzje83jRJxDwcPs61lucVY
         IcB3WVN9vt1X/h3OvxEedOJ9r69WYev2C33H65K5FiKsnDdJqJLpq8RNTKksXa0rOcnz
         TxBO57dh+LWIuBsT0tFvMwr9lfykO/Tw/jvKKVARPZHH08mhL27nholqnUcfKnX7mgD1
         iAse1MiKVAqA41m28BnS+Lv+Dj44WS5o5BUQMS0bj0a97mECUb658E7ah2hiOIGNhkHK
         IPmDG9nI4cB6d8N1P9wtVe27q96mQyW6JoEQFCTkWRFPees5a7dJC7FeQKEpnL7bZ1Es
         ZdKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hUudrY4n5TJoRLFYuGbnj/ynP3kKZ6PzeqLLC1Y9vLY=;
        b=OeP/r3TCLR+AuziZRvdClT8mQtKiJdBkiyFh3i6/mcZmhyGMy2kspN+y2dkxQ/beFd
         4/wwt9hjumAy6eIa2lqTH/d4lsuhL7hKRroV7k653N7T/LxT/NpXTM+RP8G94OUUMI3K
         0I4cvovA3Eh82ha330xyH5D4R3kOD0Ud24yvCZRyh7unMnu0nVDTRUpNI171fPjRuRhN
         d6lQmuLBYDYzJE9Bw/lkkn09XHH5QSUfverAl2cuQvRWTPkM4TGFfHPhGFn33D3kgMJ5
         Od3gnoaxgm3r/x6MaJkAuvDqEHJqOtkxc4z37zV2MadyGEIf16L1tzJntrQ8nWTFnbqZ
         F4eA==
X-Gm-Message-State: AOAM533e/f+0uyT9Dwvh13O27uVdK4QoqySngzicKsvO+SGrzYBQkev8
        w1vmjkaFWPPy9uyrmHDtxRyorQ==
X-Google-Smtp-Source: ABdhPJzqoGf6Z/QRASvsBBJ7Mi/1v+DHuWG7VFZ92LMFBPICZDognl6udyMXUL6BbimKw34o0Uo6Ag==
X-Received: by 2002:a05:6000:10cf:: with SMTP id b15mr23239941wrx.214.1590568908454;
        Wed, 27 May 2020 01:41:48 -0700 (PDT)
Received: from myrica ([2001:171b:226e:c200:c43b:ef78:d083:b355])
        by smtp.gmail.com with ESMTPSA id q1sm2208428wmj.9.2020.05.27.01.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2020 01:41:47 -0700 (PDT)
Date:   Wed, 27 May 2020 10:41:37 +0200
From:   Jean-Philippe Brucker <jean-philippe@linaro.org>
To:     Xiang Zheng <zhengxiang9@huawei.com>
Cc:     iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
        linux-mm@kvack.org, fenghua.yu@intel.com, kevin.tian@intel.com,
        jacob.jun.pan@linux.intel.com, jgg@ziepe.ca,
        catalin.marinas@arm.com, joro@8bytes.org, robin.murphy@arm.com,
        hch@infradead.org, zhangfei.gao@linaro.org,
        Jonathan.Cameron@huawei.com, felix.kuehling@amd.com,
        xuzaibo@huawei.com, will@kernel.org, christian.koenig@amd.com,
        baolu.lu@linux.intel.com, Wang Haibin <wanghaibin.wang@huawei.com>
Subject: Re: [PATCH v7 18/24] iommu/arm-smmu-v3: Add support for Hardware
 Translation Table Update
Message-ID: <20200527084137.GA265288@myrica>
References: <20200519175502.2504091-1-jean-philippe@linaro.org>
 <20200519175502.2504091-19-jean-philippe@linaro.org>
 <4eea10e0-1343-8d7d-ba8d-214d05558c76@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4eea10e0-1343-8d7d-ba8d-214d05558c76@huawei.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, May 27, 2020 at 11:00:29AM +0800, Xiang Zheng wrote:
> Hi Jean,
> 
> This patch only enables HTTU bits in CDs. Is it also neccessary to enable
> HTTU bits in STEs in this patch?

Only if you need HTTU for stage-2 tables. This series is only about
sharing stage-1 page tables, for which HTTU is enabled in the CD. I'll add
a statement in the commit message.

Thanks,
Jean

