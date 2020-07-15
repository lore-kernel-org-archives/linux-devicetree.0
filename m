Return-Path: <SRS0=eA0J=A2=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B89B0C433EC
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jul 2020 07:56:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8A6C0206E9
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jul 2020 07:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594799816;
	bh=cB3OG/kpJ+NvwV5671hfGFPD8AmmPbbYMpuxOBegWXU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=qtPV4G3Z/TBtWDGlsQlHSCO1dAcni6r81B/Y6rc5pBSgQSi4tl/RR70fCkWqPexIW
	 kbt6Ipg/UknCmXxJpcW9lZqwqit0qgyqH74qhuz90xnLxE+lHgwa6w7ZsMnNGhl7h4
	 CQzgD0oQjwbvhRv8K4QrzJMW9B6CMcDkXxxQwyHg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729538AbgGOH44 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Jul 2020 03:56:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:56976 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729001AbgGOH4z (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 15 Jul 2020 03:56:55 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 14AFA2064C;
        Wed, 15 Jul 2020 07:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594799815;
        bh=cB3OG/kpJ+NvwV5671hfGFPD8AmmPbbYMpuxOBegWXU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jMa0iqEfmCiv+pVWfSZrdA8grC3NQHfNRjwyoIgJtgHTDQ3gxYpk6dW/Q1YexwLEN
         Lt3zwxjOsn5XzpIahJFdNw8eFdlXOO9rO5CbBBxPr8Ge9I8KnnObk1p6zev/fP3DFR
         kXOmO5Tr54tVIJnuMDWW7jGLvETivwl1JFA4lRkU=
Date:   Wed, 15 Jul 2020 09:56:51 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Bhanu Prakash Maiya <bhanumaiya@chromium.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        Lee Jones <lee.jones@linaro.org>,
        Furquan Shaikh <furquan@chromium.org>,
        Raul E Rangel <rrangel@chromium.org>,
        Eric Peers <epeers@google.com>,
        Duncan Laurie <dlaurie@google.com>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Bhanu Prakash Maiya <bhanumaiya@google.com>
Subject: Re: [PATCH v2 1/2] cros: platform/chrome: Add cros-ec-uart driver
 for uart support
Message-ID: <20200715075651.GC2514306@kroah.com>
References: <20200715074907.1756034-1-bhanumaiya@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200715074907.1756034-1-bhanumaiya@google.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Jul 15, 2020 at 12:49:06AM -0700, Bhanu Prakash Maiya wrote:
> From: Bhanu Prakash Maiya <bhanumaiya@chromium.org>
> 
> This patch enables uart transport layer for cros_ec framework.
> The cros-ec-uart binds with EC device working on uart transport to
> send request and receive response.
> 
> Signed-off-by: Bhanu Prakash Maiya <bhanumaiya@chromium.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Change-Id: Icb23b633700f1ef4d123e3f21fd26fad21a3f207
> Signed-off-by: Bhanu Prakash Maiya <bhanumaiya@google.com>
> ---
>  MAINTAINERS                            |   1 +
>  drivers/platform/chrome/Kconfig        |  10 +
>  drivers/platform/chrome/Makefile       |   1 +
>  drivers/platform/chrome/cros_ec_uart.c | 411 +++++++++++++++++++++++++
>  4 files changed, 423 insertions(+)
>  create mode 100644 drivers/platform/chrome/cros_ec_uart.c

What changed from v1?

Always put that below the --- line.

thanks,

greg k-h
