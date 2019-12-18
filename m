Return-Path: <SRS0=jmN2=2I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA221C2D0BF
	for <linux-devicetree@archiver.kernel.org>; Wed, 18 Dec 2019 21:54:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 935A02465E
	for <linux-devicetree@archiver.kernel.org>; Wed, 18 Dec 2019 21:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576706075;
	bh=mcExDNILq8pM3LFd+v9d9c6foCOXsxQ1T0oFahqbRh8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=fSUwP4WiEfgfsdrONmMg4gf+fYyGVEKITyK4PrlAWIojYu8fczf2dNy2qC86BQiii
	 Qle9VF3UMjEM+E1QhvxD5DdFU86nfXagP8Sdrt0uErAlTvylLIo+cVyEGc9yDKBuIb
	 Z3NsEf5GZ3rr2alX1H7lTBURcJLxwjGqaliflsjA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726520AbfLRVyf (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 18 Dec 2019 16:54:35 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:46058 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726387AbfLRVye (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 18 Dec 2019 16:54:34 -0500
Received: by mail-oi1-f196.google.com with SMTP id v10so1984385oiv.12;
        Wed, 18 Dec 2019 13:54:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4RebbRKcBu8o8r+u/BBh/JSYzRJPnaXsDajYWgLnYyw=;
        b=uJ0Hv9qmpjjQ4C8wtscrrjYcMCBe7piHv0j76Zuy0ocRkLCFPUNvXUHVeYV3o29eGr
         4Yo09EtaBGO7ONXr1FOBBOCbvt2pDV3Qye1rk0VTvtV2nzObJhWurWhFW/LIe+qodJu7
         oES7PiRwMnzMts2bdqZRFyg9TZpCOY3T+vtmeAsXOEkoV4s2l8p6/7hDCaxNz1DuY8ec
         YDIYjWh32KU/iZGHtduh+13QJsH8lw3fi3xdzuuYNNnvYjR8lCP6HE0HGZYP7xyjVEc8
         Y5Y+Oz9A5ctNndUWe8uJV394NhISkJ7IEXR7+wb3wIf4z2RUgdzOO9/t+E5HHn/caJ7U
         trNA==
X-Gm-Message-State: APjAAAVnjCZHIob9SWehSolCN+/AB6ZZJajAoyfcBoWZyaGomH4nqjvI
        VgA6xdMYxKDxgsSnhi08jA==
X-Google-Smtp-Source: APXvYqwZrcJhNxjx6lo9XtXroFdtRIESqHQuSWgDp6/7eHy2HGyZGdP4rPahMSQLRpcY8klzgrhuug==
X-Received: by 2002:aca:5490:: with SMTP id i138mr1620807oib.34.1576706073981;
        Wed, 18 Dec 2019 13:54:33 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id k5sm1276825otp.33.2019.12.18.13.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 13:54:33 -0800 (PST)
Date:   Wed, 18 Dec 2019 15:54:32 -0600
From:   Rob Herring <robh@kernel.org>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     support.opensource@diasemi.com, lee.jones@linaro.org,
        robh+dt@kernel.org, linus.walleij@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [RESEND PATCH v3 1/3] dt-bindings: mfd: da9062: add gpio bindings
Message-ID: <20191218215432.GA23682@bogus>
References: <20191212160413.15232-1-m.felsch@pengutronix.de>
 <20191212160413.15232-2-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191212160413.15232-2-m.felsch@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, 12 Dec 2019 17:04:11 +0100, Marco Felsch wrote:
> Add gpio device documentation to make the da9062 gpios available for
> users.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
> Changelog:
> 
> v2:
> - remove sub-node documentation
> - squash gpio properties into mfd documentation
> ---
>  Documentation/devicetree/bindings/mfd/da9062.txt | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
