Return-Path: <SRS0=A/SL=6T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21E48C47247
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 May 2020 17:38:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E96EA206FA
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 May 2020 17:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1588700294;
	bh=z79LaLry/A90OVpEnttD7R9a5D7yZr9qPH1hLXUkrT0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=AGaR4VcpKcZuNt5tl2f+wEUmec3rgvA+r9wiHNV6rFPgnh1zhSQXETeqm2hPeMkZz
	 LMZWJWeyDysgiUJJznpxYoMIiTzm8U55qs3fgCSpq5TNcxr/dhR0ZLB2AtwH5DgloI
	 vgfSIh2POVwSyAdNDTdOyf007/foMF94hi+mD5K8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730242AbgEERiN (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 5 May 2020 13:38:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:42246 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729697AbgEERiN (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 5 May 2020 13:38:13 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6C753206CC;
        Tue,  5 May 2020 17:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588700292;
        bh=z79LaLry/A90OVpEnttD7R9a5D7yZr9qPH1hLXUkrT0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tJETKM7UWkjT00zsSipTnUWVt3DtHKQ9TDoLK5wlqBdPUhBgvCpfKZYJAyqGWoJVn
         2KXVfQGGimnY2Xo/8nXYYtZVyamkpkQ6V1RUp13L0jgFpHflaI7XicLzAe5jQ++HNJ
         pG5wOdw3M/wIxbH8/tHxqXbz7gZfa+Ib+o3pfETc=
Date:   Tue, 5 May 2020 19:38:10 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     Rob Herring <robh@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Mark Rutland <mark.rutland@arm.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 00/16] dts/dt-bindings: Fix Arm Ltd. ARMv8 "boards"
Message-ID: <20200505173810.GD1114580@kroah.com>
References: <20200505165212.76466-1-andre.przywara@arm.com>
 <20200505165212.76466-4-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200505165212.76466-4-andre.przywara@arm.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, May 05, 2020 at 05:51:59PM +0100, Andre Przywara wrote:
> Date: Mon, 4 May 2020 12:43:18 +0100
> Subject: [PATCH 03/16] dt-bindings: ehci/ohci: Allow iommus property

Did you mean these lines to be in the patch body?

Something went wrong :(

greg k-h
