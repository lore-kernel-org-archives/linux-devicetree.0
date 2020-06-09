Return-Path: <SRS0=SRlD=7W=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B27BFC433DF
	for <linux-devicetree@archiver.kernel.org>; Tue,  9 Jun 2020 11:55:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8039620835
	for <linux-devicetree@archiver.kernel.org>; Tue,  9 Jun 2020 11:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1591703731;
	bh=DZZhGzI+zYbVwAglBZbNEPnQrJ7dihjeI/FOUkhIb4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=IUplVugWhMflDDduBKTqCX4oLU8HTIh6azPWlm96Ba1mr7jdv4TXy9fyEOO37HufG
	 XAam72eg/EnR7wPht/yArvajsRVxscMHoVBDqmjW0B+sX3VEqfDLdBmv1+K+NTvKRe
	 6nNoHM+/Fi5KEpqk86sDVWg31JdUyis9q/42n1lk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727945AbgFILza (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 9 Jun 2020 07:55:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:56328 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726911AbgFILz3 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 9 Jun 2020 07:55:29 -0400
Received: from localhost (unknown [122.171.156.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9277720814;
        Tue,  9 Jun 2020 11:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591703729;
        bh=DZZhGzI+zYbVwAglBZbNEPnQrJ7dihjeI/FOUkhIb4k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=2iLIT+qfuXefaCTB6NGgnXlaQ9kNKUrCXOe2fdo2ImwNm/o+nUFsHDKMzihTxBNB3
         jJ++fFj5/tYq5RTz5SGC8GP6evZRU5ysoXx0Kz943WE8tiXdwCv14fJVDOhJGOE8pX
         L3uFLHzuZNySy55RhcaZhTV/Pb/P1iPOa/DUO8g0=
Date:   Tue, 9 Jun 2020 17:25:25 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Jonathan McDowell <noodles@earth.li>
Cc:     ansuelsmth@gmail.com,
        'Bjorn Andersson' <bjorn.andersson@linaro.org>,
        'Andy Gross' <agross@codeaurora.org>,
        'Andy Gross' <agross@kernel.org>,
        'Kishon Vijay Abraham I' <kishon@ti.com>,
        'Rob Herring' <robh+dt@kernel.org>,
        'Mark Rutland' <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: R: [PATCH v6 1/2] phy: qualcomm: add qcom ipq806x dwc usb phy
 driver
Message-ID: <20200609115525.GD1084979@vkoul-mobl>
References: <20200603132237.6036-1-ansuelsmth@gmail.com>
 <20200604161942.GK311@earth.li>
 <017001d63b5a$c3807740$4a8165c0$@gmail.com>
 <20200609114148.GS311@earth.li>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200609114148.GS311@earth.li>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 09-06-20, 12:41, Jonathan McDowell wrote:
> On Fri, Jun 05, 2020 at 07:00:04PM +0200, ansuelsmth@gmail.com wrote:
> > > On Wed, Jun 03, 2020 at 03:22:34PM +0200, Ansuel Smith wrote:
> > > > This has lost in the original push for the dwc3 qcom driver.
> > > > This is needed for ipq806x SoC as without this the usb ports
> > > > doesn't work at all.
> > > 
> > > FWIW I tested this on my RB3011 so feel free to add:
> > > 
> > > Tested-by: Jonathan McDowell <noodles@earth.li>
> > > 
> > > One minor comment; would PHY_QCOM_USB_IPQ806X not be a better
> > > choice than PHY_QCOM_IPQ806X_USB given the existing naming?
> > > 
> >
> > Thanks for the feedback. About naming I'm following the sata ipq806x
> > naming.  I really hope someone gets this and reviews it since usb is
> > broken for a long time now.
> 
> Doesn't seem to have made the 5.8 merge window; I note Vinod has done a
> bunch of the recent commits to phy/qualcomm/ so adding him to the CC in
> addition to Kishon.

It is too late for 5.8 now, please rebase and resend it after rc1 is
tagged

Thanks
-- 
~Vinod
