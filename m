Return-Path: <SRS0=r3bb=2H=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA220C3F68F
	for <linux-devicetree@archiver.kernel.org>; Tue, 17 Dec 2019 17:19:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8614F24655
	for <linux-devicetree@archiver.kernel.org>; Tue, 17 Dec 2019 17:19:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=netronome-com.20150623.gappssmtp.com header.i=@netronome-com.20150623.gappssmtp.com header.b="GJAQ8eMC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727642AbfLQRTB (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 17 Dec 2019 12:19:01 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:46693 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727654AbfLQRTB (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 17 Dec 2019 12:19:01 -0500
Received: by mail-lf1-f66.google.com with SMTP id f15so7503541lfl.13
        for <devicetree@vger.kernel.org>; Tue, 17 Dec 2019 09:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :organization:mime-version:content-transfer-encoding;
        bh=r6dqBNObWr4LYfk35E/sthMAiwdIizF7BAYUklEVa2g=;
        b=GJAQ8eMCgnCnz1aPscQ0DAtkpg8VWR5miJdKtP53dopJAPWYnM/MCSvBMd8ugJmup1
         yMv+bEGBI8MXFoPeZUiJzzpWaGiWOTEdURVGcNSWGbA8UWiJZKrEFPVMlAABWoAPIjIm
         +PCOCwQh5iYA+htgwpx7+5aeNyy0ZPKHCc4rIhYA9rlFI/6LzZEJpsUX2K/H54h6tyR9
         dgsFFVB0QMDU/sxhuQvIyK/d8OG9Rmzy9+sMO+IaG8MCdmqKFyUv8NW2Bn9mkpq2DUd3
         ySxh7TEaCm2Tc0lahskeBMRYCH6Iv9Psp3Wx1Omc947VO3geUX2XGjx89EBQYT1Qcjib
         pvJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=r6dqBNObWr4LYfk35E/sthMAiwdIizF7BAYUklEVa2g=;
        b=pbO0b/v1Xc7EQ3piwvO3C1inyt8wiTAsRnE4aLoCaqSKeak5AMS399uN/p3GFBeMJp
         RHtqW1dfHxH499cJQJtcnJot6Xnkixux7a8362ut+HnF1NZqTzogdtzEQRPLal63N+uv
         S8ZuD8IaegGEinSfb+hKCDx7vkfn0U0Jhwo9LTGlO5YoUDWZcc+3qFJY13aYpwBIbWEM
         VMI4LSCbalFXkifGDEuwYl5eB3E5Q/pROikfORF+P1rQ+EE4hmV9ooG6hsYspV9MMG/f
         EoqpzcJTcsV91WRW5e7quC/4kimT1W+1+NVDFtpYMnJpNPblHg8Cc+Jvbvk6m5x6/jSe
         6BRA==
X-Gm-Message-State: APjAAAVP08ZM2UYRsl5/8znGWrrN6giBvxkG/AsPBrnqkq5S0D8CFC/E
        HmHkqhDSYBizAn45xk3IREjryg==
X-Google-Smtp-Source: APXvYqzAaXJowj+LMQ1NkOlZ0KLppeaekgoexuXFUA+9sXKsB7TLWCwIPJxK/Wj2tE2cMaOin3iSFA==
X-Received: by 2002:a05:6512:1dd:: with SMTP id f29mr3485778lfp.106.1576603137675;
        Tue, 17 Dec 2019 09:18:57 -0800 (PST)
Received: from cakuba.netronome.com ([66.60.152.14])
        by smtp.gmail.com with ESMTPSA id v9sm13586121lfe.18.2019.12.17.09.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2019 09:18:57 -0800 (PST)
Date:   Tue, 17 Dec 2019 09:18:46 -0800
From:   Jakub Kicinski <jakub.kicinski@netronome.com>
To:     Richard Cochran <richardcochran@gmail.com>
Cc:     netdev@vger.kernel.org, David Miller <davem@davemloft.net>,
        devicetree@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jacob Keller <jacob.e.keller@intel.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Miroslav Lichvar <mlichvar@redhat.com>,
        Murali Karicheri <m-karicheri2@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Willem de Bruijn <willemb@google.com>,
        Wingman Kwok <w-kwok2@ti.com>
Subject: Re: [PATCH V6 net-next 11/11] ptp: Add a driver for InES time
 stamping IP core.
Message-ID: <20191217091846.1ce6ef81@cakuba.netronome.com>
In-Reply-To: <20191217043433.GA1363@localhost>
References: <cover.1576511937.git.richardcochran@gmail.com>
        <33afc113fa0b301d289522971c83dbbf0d36c8ba.1576511937.git.richardcochran@gmail.com>
        <20191216161114.3604d45d@cakuba.netronome.com>
        <20191217043433.GA1363@localhost>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, 16 Dec 2019 20:34:33 -0800, Richard Cochran wrote:
> On Mon, Dec 16, 2019 at 04:11:14PM -0800, Jakub Kicinski wrote:
> > On Mon, 16 Dec 2019 08:13:26 -0800, Richard Cochran wrote:  
> > > +	clkid = (u64 *)(data + offset + OFF_PTP_CLOCK_ID);
> > > +	portn = (u16 *)(data + offset + OFF_PTP_PORT_NUM);
> > > +	seqid = (u16 *)(data + offset + OFF_PTP_SEQUENCE_ID);  
> > 
> > These should perhaps be __be types?
> > 
> > Looks like there is a few other sparse warnings in ptp_ines.c, would
> > you mind addressing those?  
> 
> I saw the sparse warnings before (from one of the robots), but I
> decided that they are false positives.  Or perhaps I don't appreciate
> what the warnings mean...
> 
> Take the 'clkid' pointer for example:
>  
> > > +	if (cpu_to_be64(ts->clkid) != *clkid) {
> > > +		pr_debug("clkid mismatch ts %llx != skb %llx\n",
> > > +			 cpu_to_be64(ts->clkid), *clkid);
> > > +		return false;
> > > +	}  
> 
> The field that to which 'clkid' points is in network byte order.  The
> code correctly converts ts->clkid (in CPU byte order) to network byte
> order before comparing it with the field.
> 
> So where is the error?

Not necessarily an error as much as a sparse warning, if the type of
clkid was __be64 that'd make sparse happy.

This is what my build system spat out for a W=1 C=1 build:

../drivers/ptp/ptp_ines.c:490:13: warning: restricted __be64 degrades to integer
../drivers/ptp/ptp_ines.c:495:28: warning: cast to restricted __be16
../drivers/ptp/ptp_ines.c:495:28: warning: cast to restricted __be16
../drivers/ptp/ptp_ines.c:495:28: warning: cast to restricted __be16
../drivers/ptp/ptp_ines.c:495:28: warning: cast to restricted __be16
../drivers/ptp/ptp_ines.c:496:17: warning: cast to restricted __be16
../drivers/ptp/ptp_ines.c:496:17: warning: cast to restricted __be16
../drivers/ptp/ptp_ines.c:496:17: warning: cast to restricted __be16
../drivers/ptp/ptp_ines.c:496:17: warning: cast to restricted __be16
../drivers/ptp/ptp_ines.c:500:26: warning: cast to restricted __be16
../drivers/ptp/ptp_ines.c:500:26: warning: cast to restricted __be16
../drivers/ptp/ptp_ines.c:500:26: warning: cast to restricted __be16
../drivers/ptp/ptp_ines.c:500:26: warning: cast to restricted __be16
../drivers/ptp/ptp_ines.c:501:17: warning: cast to restricted __be16
../drivers/ptp/ptp_ines.c:501:17: warning: cast to restricted __be16
../drivers/ptp/ptp_ines.c:501:17: warning: cast to restricted __be16
../drivers/ptp/ptp_ines.c:501:17: warning: cast to restricted __be16
../drivers/ptp/ptp_ines.c:543:28: warning: incorrect type in argument 1 (different address spaces)
../drivers/ptp/ptp_ines.c:543:28:    expected void const volatile [noderef] <asn:2> *addr
../drivers/ptp/ptp_ines.c:543:28:    got unsigned int *
../drivers/ptp/ptp_ines.c:547:30: warning: incorrect type in argument 1 (different address spaces)
../drivers/ptp/ptp_ines.c:547:30:    expected void const volatile [noderef] <asn:2> *addr
../drivers/ptp/ptp_ines.c:547:30:    got unsigned int *
../drivers/ptp/ptp_ines.c:557:31: warning: incorrect type in argument 1 (different address spaces)
../drivers/ptp/ptp_ines.c:557:31:    expected void const volatile [noderef] <asn:2> *addr
../drivers/ptp/ptp_ines.c:557:31:    got unsigned int *
../drivers/ptp/ptp_ines.c:561:31: warning: incorrect type in argument 1 (different address spaces)
../drivers/ptp/ptp_ines.c:561:31:    expected void const volatile [noderef] <asn:2> *addr
../drivers/ptp/ptp_ines.c:561:31:    got unsigned int *
../drivers/ptp/ptp_ines.c:562:31: warning: incorrect type in argument 1 (different address spaces)
../drivers/ptp/ptp_ines.c:562:31:    expected void const volatile [noderef] <asn:2> *addr
../drivers/ptp/ptp_ines.c:562:31:    got unsigned int *
../drivers/ptp/ptp_ines.c:579:16: warning: incorrect type in argument 1 (different address spaces)
../drivers/ptp/ptp_ines.c:579:16:    expected void const volatile [noderef] <asn:2> *addr
../drivers/ptp/ptp_ines.c:579:16:    got unsigned int *
../drivers/ptp/ptp_ines.c:583:24: warning: incorrect type in argument 1 (different address spaces)
../drivers/ptp/ptp_ines.c:583:24:    expected void const volatile [noderef] <asn:2> *addr
../drivers/ptp/ptp_ines.c:583:24:    got unsigned int *
../drivers/ptp/ptp_ines.c:626:16: warning: incorrect type in argument 1 (different address spaces)
../drivers/ptp/ptp_ines.c:626:16:    expected void const volatile [noderef] <asn:2> *addr
../drivers/ptp/ptp_ines.c:626:16:    got unsigned int *
../drivers/ptp/ptp_ines.c:630:24: warning: incorrect type in argument 1 (different address spaces)
../drivers/ptp/ptp_ines.c:630:24:    expected void const volatile [noderef] <asn:2> *addr
../drivers/ptp/ptp_ines.c:630:24:    got unsigned int *
../drivers/ptp/ptp_ines.c:208:21: warning: incorrect type in assignment (different address spaces)
../drivers/ptp/ptp_ines.c:208:21:    expected struct ines_global_registers *regs
../drivers/ptp/ptp_ines.c:208:21:    got void [noderef] <asn:2> *base
../drivers/ptp/ptp_ines.c:225:9: warning: incorrect type in argument 2 (different address spaces)
../drivers/ptp/ptp_ines.c:225:9:    expected void volatile [noderef] <asn:2> *addr
../drivers/ptp/ptp_ines.c:225:9:    got unsigned int *
../drivers/ptp/ptp_ines.c:226:9: warning: incorrect type in argument 2 (different address spaces)
../drivers/ptp/ptp_ines.c:226:9:    expected void volatile [noderef] <asn:2> *addr
../drivers/ptp/ptp_ines.c:226:9:    got unsigned int *
../drivers/ptp/ptp_ines.c:228:9: warning: incorrect type in argument 1 (different address spaces)
../drivers/ptp/ptp_ines.c:228:9:    expected void const volatile [noderef] <asn:2> *addr
../drivers/ptp/ptp_ines.c:228:9:    got unsigned int *
../drivers/ptp/ptp_ines.c:229:9: warning: incorrect type in argument 1 (different address spaces)
../drivers/ptp/ptp_ines.c:229:9:    expected void const volatile [noderef] <asn:2> *addr
../drivers/ptp/ptp_ines.c:229:9:    got unsigned int *
../drivers/ptp/ptp_ines.c:230:9: warning: incorrect type in argument 1 (different address spaces)
../drivers/ptp/ptp_ines.c:230:9:    expected void const volatile [noderef] <asn:2> *addr
../drivers/ptp/ptp_ines.c:230:9:    got unsigned int *
../drivers/ptp/ptp_ines.c:231:9: warning: incorrect type in argument 1 (different address spaces)
../drivers/ptp/ptp_ines.c:231:9:    expected void const volatile [noderef] <asn:2> *addr
../drivers/ptp/ptp_ines.c:231:9:    got unsigned int *
../drivers/ptp/ptp_ines.c:235:17: warning: incorrect type in argument 2 (different address spaces)
../drivers/ptp/ptp_ines.c:235:17:    expected void volatile [noderef] <asn:2> *addr
../drivers/ptp/ptp_ines.c:235:17:    got unsigned int *
../drivers/ptp/ptp_ines.c:313:28: warning: incorrect type in argument 1 (different address spaces)
../drivers/ptp/ptp_ines.c:313:28:    expected void const volatile [noderef] <asn:2> *addr
../drivers/ptp/ptp_ines.c:313:28:    got unsigned int *
../drivers/ptp/ptp_ines.c:318:30: warning: incorrect type in argument 1 (different address spaces)
../drivers/ptp/ptp_ines.c:318:30:    expected void const volatile [noderef] <asn:2> *addr
../drivers/ptp/ptp_ines.c:318:30:    got unsigned int *
../drivers/ptp/ptp_ines.c:326:30: warning: incorrect type in argument 1 (different address spaces)
../drivers/ptp/ptp_ines.c:326:30:    expected void const volatile [noderef] <asn:2> *addr
../drivers/ptp/ptp_ines.c:326:30:    got unsigned int *
../drivers/ptp/ptp_ines.c:330:30: warning: incorrect type in argument 1 (different address spaces)
../drivers/ptp/ptp_ines.c:330:30:    expected void const volatile [noderef] <asn:2> *addr
../drivers/ptp/ptp_ines.c:330:30:    got unsigned int *
../drivers/ptp/ptp_ines.c:331:30: warning: incorrect type in argument 1 (different address spaces)
../drivers/ptp/ptp_ines.c:331:30:    expected void const volatile [noderef] <asn:2> *addr
../drivers/ptp/ptp_ines.c:331:30:    got unsigned int *
../drivers/ptp/ptp_ines.c:401:21: warning: incorrect type in argument 1 (different address spaces)
../drivers/ptp/ptp_ines.c:401:21:    expected void const volatile [noderef] <asn:2> *addr
../drivers/ptp/ptp_ines.c:401:21:    got unsigned int *
../drivers/ptp/ptp_ines.c:405:9: warning: incorrect type in argument 2 (different address spaces)
../drivers/ptp/ptp_ines.c:405:9:    expected void volatile [noderef] <asn:2> *addr
../drivers/ptp/ptp_ines.c:405:9:    got unsigned int *
../drivers/ptp/ptp_ines.c:406:9: warning: incorrect type in argument 2 (different address spaces)
../drivers/ptp/ptp_ines.c:406:9:    expected void volatile [noderef] <asn:2> *addr
../drivers/ptp/ptp_ines.c:406:9:    got unsigned int *
../drivers/ptp/ptp_ines.c:407:9: warning: incorrect type in argument 2 (different address spaces)
../drivers/ptp/ptp_ines.c:407:9:    expected void volatile [noderef] <asn:2> *addr
../drivers/ptp/ptp_ines.c:407:9:    got unsigned int *
../drivers/ptp/ptp_ines.c:440:21: warning: incorrect type in argument 1 (different address spaces)
../drivers/ptp/ptp_ines.c:440:21:    expected void const volatile [noderef] <asn:2> *addr
../drivers/ptp/ptp_ines.c:440:21:    got unsigned int *
../drivers/ptp/ptp_ines.c:444:9: warning: incorrect type in argument 2 (different address spaces)
../drivers/ptp/ptp_ines.c:444:9:    expected void volatile [noderef] <asn:2> *addr
../drivers/ptp/ptp_ines.c:444:9:    got unsigned int *
../drivers/ptp/ptp_ines.c:643:21: warning: incorrect type in argument 1 (different address spaces)
../drivers/ptp/ptp_ines.c:643:21:    expected void const volatile [noderef] <asn:2> *addr
../drivers/ptp/ptp_ines.c:643:21:    got unsigned int *

New errors added
