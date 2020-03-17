Return-Path: <SRS0=fjOU=5C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2D82C5ACD6
	for <linux-devicetree@archiver.kernel.org>; Tue, 17 Mar 2020 18:40:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D03EF20738
	for <linux-devicetree@archiver.kernel.org>; Tue, 17 Mar 2020 18:40:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="GYgmJC/1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726473AbgCQSkn (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 17 Mar 2020 14:40:43 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:38340 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726388AbgCQSkn (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 17 Mar 2020 14:40:43 -0400
Received: by mail-qt1-f193.google.com with SMTP id e20so18421883qto.5
        for <devicetree@vger.kernel.org>; Tue, 17 Mar 2020 11:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VHKB5MBsrQc8nrjB6tUnlbV1kL4bZZjV/ANQdFM3zDk=;
        b=GYgmJC/1qoccDCyGB3v9AgtNVsE4IcW54DliKpkiU/8qcWTDdff956/y0JBhF6CoW+
         2AF3nNaAMz/neObEUtK5PPJVt6C6RgI8Mamly3muAOZNRXY+QQdadXK48Ee6KpqLHE8+
         2sRqltqPMbyl/9ocejJDj+1YnNKrMgk9wHeYF4k8oNhl0PT7yNA63RmZF0oQYwdNe+IK
         br+N+cfXCWnuHi3IfnIquqLO6xf4ZdjNCFFB2q07lTxjelyugkvRGj5+dyLWtOvVZ5hD
         xdec7OKSTTgRyouKPD5VyOUCJvSrHDwna0Y1VSUzlbHpyFDnaETsTzcMXknVS9MfUmor
         9n+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=VHKB5MBsrQc8nrjB6tUnlbV1kL4bZZjV/ANQdFM3zDk=;
        b=a66kP6Ezlt0lq0+Zn7dpb6WXUIVXVSlbW0Yt/zd6DX2lcTNxOkl7kaXObNMm5mI9AK
         bhqG07vAgK+I4mK3Em+oWa1kdvABUEe7jDYh172gKm6Mjc1jfvE2avxG09H7dAr69bK4
         v7JtW7gUhp/oAVyf9figTRza0MfV/b4tsd6zmw2bHF3YWDrU5Z8SVim+bQEjJoO5L8U9
         aApev+uCl2XvFuW9R7j1NACdQ2fIohHuSvoFHxBrT7XSIpe51vOb3Ng50bVJ7xKczPLS
         heH31E24ElHlZREPtXZKPRtGT2Rh9cPtT/Cxv6ir0GDdxJVRcbJAvYGbA0ObEs33Rip+
         QGrQ==
X-Gm-Message-State: ANhLgQ0thdAyeCfBQ8qTGDTdEC8oD0aAtZL9m4Fdk4OmhgbBAfuqMFrd
        CwNdqsOkKpwC8LNiDO6D2uXCOQ==
X-Google-Smtp-Source: ADFU+vugAiZdEw2sEZSIbJEAWeyFz2UbVwFEy00ld5KQjtHya0UyHyqsGI1Bsave1cDjhm+ecny+gg==
X-Received: by 2002:ac8:7b54:: with SMTP id m20mr566590qtu.92.1584470440664;
        Tue, 17 Mar 2020 11:40:40 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.57.212])
        by smtp.gmail.com with ESMTPSA id 199sm2417617qkm.7.2020.03.17.11.40.40
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Mar 2020 11:40:40 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1jEH8p-00016b-OY; Tue, 17 Mar 2020 15:40:39 -0300
Date:   Tue, 17 Mar 2020 15:40:39 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Jean-Philippe Brucker <jean-philippe@linaro.org>,
        mark.rutland@arm.com, devicetree@vger.kernel.org,
        kevin.tian@intel.com, Dimitri Sivanich <sivanich@sgi.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-pci@vger.kernel.org, robin.murphy@arm.com,
        linux-mm@kvack.org, iommu@lists.linux-foundation.org,
        robh+dt@kernel.org, catalin.marinas@arm.com,
        zhangfei.gao@linaro.org, Andrew Morton <akpm@linux-foundation.org>,
        will@kernel.org, christian.koenig@amd.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 01/26] mm/mmu_notifiers: pass private data down to
 alloc_notifier()
Message-ID: <20200317184039.GV20941@ziepe.ca>
References: <20200224190056.GT31668@ziepe.ca>
 <20200225092439.GB375953@myrica>
 <20200225140814.GW31668@ziepe.ca>
 <20200228143935.GA2156@myrica>
 <20200228144844.GQ31668@ziepe.ca>
 <20200228150427.GF2156@myrica>
 <20200228151339.GS31668@ziepe.ca>
 <20200306095614.GA50020@myrica>
 <20200306130919.GJ31668@ziepe.ca>
 <20200316154659.GA18704@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200316154659.GA18704@infradead.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Mar 16, 2020 at 08:46:59AM -0700, Christoph Hellwig wrote:
> On Fri, Mar 06, 2020 at 09:09:19AM -0400, Jason Gunthorpe wrote:
> > This is why release must do invalidate all - but it doesn't need to do
> > any more - as no SPTE can be established without a mmget() - and
> > mmget() is no longer possible past release.
> 
> Maybe we should rename the release method to invalidate_all?

It is a better name. The function it must also fence future access if
the mirror is not using mmget(), and stop using the pgd/etc pointer if
the page tables are accessed directly.

Jason
