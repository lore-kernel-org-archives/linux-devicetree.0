Return-Path: <SRS0=DpSr=6M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E7D9C83004
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Apr 2020 10:05:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 79657206D6
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Apr 2020 10:05:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qqX6J2EM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727901AbgD1KFs (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 28 Apr 2020 06:05:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727086AbgD1KFs (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 28 Apr 2020 06:05:48 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7F5AC03C1A9
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2020 03:05:47 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id g13so23919755wrb.8
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2020 03:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=lfm90FlfDh8o3M3yvP99/SV8PXnzx+NxtpWbePydH4k=;
        b=qqX6J2EMEVt8r4xC+OrCy2/tUswVLa9s3ms1vvctEDSrG713MYTkg2HQ8f6y2XTo7j
         fOk04o+o8GLoQ28PhzDd3kXsb0nPnsrELb3fJbvbqfw/CxRMPs33DWoi/wCYQiCM/7Uu
         SZ+Q/9Ri3QEU9cLbMAuqU4vx2JI6nH+6F9XoFKu5XxiSxgfL+Co+9E01BOoP2KShDD9c
         o4Lf0/s8dIlNJ/cophFhENgBKpYRQCwzi+NAKmJ7iwyZOvjHfRgx9JVHRNBwSRygfn4Z
         Naf6PIZqw1f3zQTnnVKjuA7ZfhrKS3VI1uXgrS8GSOFfUd+07jSPOwMp1Lw3QJQBMsfY
         Rn3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=lfm90FlfDh8o3M3yvP99/SV8PXnzx+NxtpWbePydH4k=;
        b=OhzPDgA4+ceiOrPlukPpYdDic5fSUWCpwGjUnMCVxVvMJoLlXeCpAh39hNsmHYUBJD
         SG0IQ1kXV/0TrdT/JuPFglOPi1iirJVpOc1EoUyV9cyFZSQ1tApQcqzLSXZntYf5mVgM
         yNvIwb6jiayHop5pscdlSURh5sioroyJ6u1kyGDhL5rLldOkwXx2ScVXRxaRplOw1r/f
         oi/n4TG2IOqqzu1F/+DmuukyHZYvI6qAi3bENM0jX3783/LFd3bjDKB4J1g65u4bYleG
         W1i85h7yVz9xDc+9TYIalsUJ28tH32PZFMnBV1+iVWlCGi/axAgWcbV1ZSnewtWdrjN6
         tkAA==
X-Gm-Message-State: AGi0PuZRBz5kftWDsExCH9Pd71IS7DPBJ65g/RB7dyouzjwsi/t9kZud
        rpK3B4Dy82Ff5iA3D9gMbur5Zg==
X-Google-Smtp-Source: APiQypIb33Cq75mhGYIS7D20rHoXkVvluX6WO+VDKzYFS5XGKuc0f5tjJ0c7cus8hXhiHUvXj6ZVGw==
X-Received: by 2002:adf:e5c8:: with SMTP id a8mr35254777wrn.56.1588068346456;
        Tue, 28 Apr 2020 03:05:46 -0700 (PDT)
Received: from dell ([2.31.163.63])
        by smtp.gmail.com with ESMTPSA id s18sm26293024wra.94.2020.04.28.03.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 03:05:45 -0700 (PDT)
Date:   Tue, 28 Apr 2020 11:05:38 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Dilip Kota <eswara.kota@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, kishon@ti.com,
        devicetree@vger.kernel.org, arnd@arndb.de, robh@kernel.org,
        andriy.shevchenko@intel.com, cheol.yong.kim@intel.com,
        chuanhua.lei@linux.intel.com, qi-ming.wu@intel.com,
        yixin.zhu@intel.com
Subject: Re: [RESEND PATCH v6 1/4] mfd: syscon: Add fwnode_to_regmap
Message-ID: <20200428100538.GM3559@dell>
References: <cover.1585889042.git.eswara.kota@linux.intel.com>
 <9c58aeb1561f28f302921d54aee75942545c4971.1585889042.git.eswara.kota@linux.intel.com>
 <20200417093551.GH2167633@dell>
 <d5b7eb87-7468-a1c4-bf19-d676c8e9c49d@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d5b7eb87-7468-a1c4-bf19-d676c8e9c49d@linux.intel.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, 21 Apr 2020, Dilip Kota wrote:

> 
> On 4/17/2020 5:35 PM, Lee Jones wrote:
> > On Mon, 06 Apr 2020, Dilip Kota wrote:
> > 
> > > Traverse regmap handle entry from firmware node handle.
> > > 
> > > Signed-off-by: Dilip Kota <eswara.kota@linux.intel.com>
> > > ---
> > > Changes on v5:
> > >    No changes
> > > Changes on v5:
> > >    No changes
> > > 
> > > Changes on v4:
> > >    No changes
> > > 
> > >   drivers/mfd/syscon.c       | 8 ++++++++
> > >   include/linux/mfd/syscon.h | 6 ++++++
> > >   2 files changed, 14 insertions(+)
> > > 
> > > diff --git a/drivers/mfd/syscon.c b/drivers/mfd/syscon.c
> > > index 3a97816d0cba..e085c50816b9 100644
> > > --- a/drivers/mfd/syscon.c
> > > +++ b/drivers/mfd/syscon.c
> > > @@ -178,6 +178,14 @@ struct regmap *device_node_to_regmap(struct device_node *np)
> > >   }
> > >   EXPORT_SYMBOL_GPL(device_node_to_regmap);
> > > +struct regmap *fwnode_to_regmap(struct fwnode_handle *fwnode)
> > > +{
> > > +	struct device_node *np = to_of_node(fwnode);
> > You are assuming that the fwnode was Device Tree pointer.
> > 
> > The point of a fwnode is that it could be one of multiple types.
> > 
> > What if it was a pointer to an ACPI property?
> Yes, i missed to check in other perspective. Thanks for pointing it.
> While going through the System control driver to address the query, i
> noticed that System Control
> driver is talking with 'of' framework only. (No ACPI)
> 
> So, i think to add a defensive check and return error pointer if
> 'to_of_node' returns NULL
> As System control Driver cannot talk with ACPI, so fwnode_to_regmap() cannot
> talk and return error.
> 
> Or, the other option is removing the 'fwnode_to_regmap()' definition itself,
> to avoid confusion as fwnode can
> point to 'OF', 'ACPI'or 'swnode'.
> 
> But, i feel return error for ACPI or oother, looks better because
> 'device_node' has fwnode pointer. And provide description
> in the header file, mentioning function is success for 'OF' and returns
> error for the rest.

I don't think this patch adds much to be honest.

Better to just do:

    device_node_get_regmap(to_of_node(fwnode), false);

... from the call site I think.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
