Return-Path: <SRS0=DG9v=56=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBEC0C2BA19
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 15:59:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C608D20656
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 15:59:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Knet1f2Y"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391213AbgDNP7i (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 11:59:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1732397AbgDNP7g (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 14 Apr 2020 11:59:36 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02E03C061A0C
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2020 08:59:36 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id q19so317608ljp.9
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2020 08:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Rms6uY6CaVS0vSi3goxkK0o2bZJ2P/sEKrGiTc8JDbs=;
        b=Knet1f2YFczx+Bvkly4ATsCcdhmrsklTebUitDqlLsMrw3LqMzvVruqj3CQPZKV1Yj
         /ycBcRyNhoItxGuHJPwS5RlOu6J5b+tRlSpyQpky4b7DCAZVp3IWHe0eFjX+25qzXN4j
         T56HyXBHYqBKKaGTA5TytiwH64ksyAH9Ai653dTMo1Kw5uisWioqbeKHdeo+IBOmRdix
         o/1MUYYNYJfED04KUzqhbJdrDwnRbHUQoRQ74Aop0Cn5LIATsrWwIuZOO64noMdNVpns
         G7GjhicmqH3L3N6dB1nOyQUq2nB7C5L84kfOO7NB6ytZ+tkaHGDdowd471QUwf/fNBTh
         zB2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Rms6uY6CaVS0vSi3goxkK0o2bZJ2P/sEKrGiTc8JDbs=;
        b=HgOibWcDL+VvPQJcIfBU/KQj0fzEw0cGJjHhp5htmRofgSWvy5OgBdSeScJHT3b6R2
         d7NAROsHNS8SYzlbJ8kr41j/Pmr6RpOHH+/LWj+messjOSPqtSLgHy8RuSo7rfZRRwM/
         KL8SIJYR5bgTdC4/ofsCmMuPXXhcSGnqa9DJpTVprv5R9ei1h+U0gdy7pidohMMANPnb
         7Kh6m/8tKnLdiZNuHoJvimpCr+A2las/pbK2EWhKVdA4sclLv7L/5IQSA8bd6jVeRDoI
         ne2ZRP0PRyNMIqXrB4sbIJaHLY4Zp4mIeGr/svH8PxUCvJ68yQyLX4CAbNAWhYBFSA/i
         xVYw==
X-Gm-Message-State: AGi0PubDX6x24xlKfv1YNBZENaMR1LA+VM76UtwXYyHNCDxCOJ7IUeAI
        2SwjmVbkbRCWXju69CCFHFUGMVDR5Uo=
X-Google-Smtp-Source: APiQypKoehuSnG4FD3G0KCu9dyHnNmILoTThe26Z09YTqPw9oyFO24Qc3tSrK+0QjMZ4BVcUiGn4rQ==
X-Received: by 2002:a2e:854e:: with SMTP id u14mr504262ljj.182.1586879974504;
        Tue, 14 Apr 2020 08:59:34 -0700 (PDT)
Received: from curiosity (ip-195-182-157-78.clients.cmk.ru. [195.182.157.78])
        by smtp.gmail.com with ESMTPSA id r20sm7278237ljk.42.2020.04.14.08.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 08:59:33 -0700 (PDT)
Date:   Tue, 14 Apr 2020 19:03:54 +0300
From:   Sergey Matyukevich <geomatsi@gmail.com>
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Baruch Siach <baruch@tkos.co.il>,
        Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: Re: [bug report] armada-8040-mcbin: 5.6-rc5 boot failure
Message-ID: <20200414160354.GA463339@curiosity>
References: <20200413220520.GA25917@curiosity>
 <20200413222645.GT25745@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200413222645.GT25745@shell.armlinux.org.uk>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

> > Hi Russel, Miquel, and all,
> > 
> > MacchiatoBin Double-shot board fails to boot v5.6-rc5 kernel properly:
> > USB, PCIe, and ethernet interfaces are not enabled. Before that I have
> > been running v5.3 kernel w/o any noticeable issues.

...
 
> > However looking at firmware version complaints, I guess that the actual
> > reason of all those issues could be in ATF version rather than in the
> > latest DTS changes. Probably I am using ATF version which is too old
> > to work with up-to-date kernel: armada-17.10.3 from atf-marvell
> > repository on github. If this is indeed the actual root cause of all
> > the issues, then could you please recommend a preferable ATF version
> > to test with ?
> 
> I would strongly recommend upgrading the firmware in any case, because
> of work I did (and submitted back through Jon @ SolidRun) to improve
> the eye mask on the 10G Ethernet interfaces.  I'm using the 18.12
> version.  Firmware build instructions can be found at:
> 
> https://developer.solid-run.com/knowledge-base/armada-8040-machiatobin-u-boot-and-atf/
> 
> I've booted 5.6 recently on a number of Armada 8040 based boards
> without issue, likely all running the later firmware.

Thanks ! After ATF update to 18.12 both USB and PCIe are working fine
without any changes to DTS. But network interfaces including 1G copper
interface still do not work as expected:

$ ip link set eth0 up                                                                                                                                                                             
[  626.774003] mvpp2 f2000000.ethernet eth0: could not attach PHY (-19) RTNETLINK answers: No such device
$ ip link set eth2 up
[  504.054084] mvpp2 f4000000.ethernet eth2: could not attach PHY (-19) RTNETLINK answers: No such device

I have not changed configuration since 5.3, so all the marvell phy
drivers are in place. Is there anything in configuration that could
be missed after moving from 5.3 to 5.6 kernel ?

Regards,
Sergey
