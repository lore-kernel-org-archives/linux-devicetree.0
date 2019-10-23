Return-Path: <SRS0=bPG9=YQ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2531CA9EB6
	for <linux-devicetree@archiver.kernel.org>; Wed, 23 Oct 2019 09:54:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C968220650
	for <linux-devicetree@archiver.kernel.org>; Wed, 23 Oct 2019 09:54:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=antmicro-com.20150623.gappssmtp.com header.i=@antmicro-com.20150623.gappssmtp.com header.b="H8VSkOPT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390545AbfJWJym (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 23 Oct 2019 05:54:42 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:41890 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390390AbfJWJym (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 23 Oct 2019 05:54:42 -0400
Received: by mail-lj1-f196.google.com with SMTP id f5so20391857ljg.8
        for <devicetree@vger.kernel.org>; Wed, 23 Oct 2019 02:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=antmicro-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=4VHhZd/wcq8CsgM9Wmx2uBu3omWaeKjtFbw8MkTHq6g=;
        b=H8VSkOPTjkxxX/RyvszS1osFjESmMV3MyStKtrMJXKcrHnaBAIIT4oQYWysZCSdVA/
         iiTbaT4dONHJeFdxBX/kQs1p28NAGh8qRMeLE0apAU2SpQXgOozRXqx/gcR/5NUtcdCH
         jDR9qE8t8ttnB278/DjCfFphY69YxM2CX4jG5avgiriB5g3owh50ascghBQDePjjRxdX
         KWM2BxLxD2dY1Lo4eojmFkjKoqoEmg8BIrQ8V+DD9VPu+0Jqc51jTuD53vRv+zIxhtJe
         Zz2AmXSw2Psdqro6vxj8boriL8UGofLG2nYKbioiL2CyJ7CG31XVCRa0K/1MZbbN8fpb
         7zLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=4VHhZd/wcq8CsgM9Wmx2uBu3omWaeKjtFbw8MkTHq6g=;
        b=B0IXeQ4bpIDWWMOLnrUebNbUmuHdkVcPnknVNUzIToIuPoMmnir4p7YVXFFwhL52Kv
         Flm+0XyIThNm9rxqoxKB/BlOyZOumLQOwmjXp+y12rgT4p82mMcXOnTX5G/Kk53Fzs60
         AC2EiSaXDtkMwu0MxsdJ6V0W+lxrHrMVUa9dFNgSbDpP5uYM1/HcXVI2Yn3kL8fQKTiF
         CMn6yLnu+UcpE5RRAxLjHoJbrHgDhI2B+fU1UvnG3L53ZI8gk+H8IG210FmZwRmASMAN
         2IUUCDbWFEhYqWFh0e8+gyftiQ0ke9AhzBIXbG6feYIAmPOJdngECIA9JqkaKZXuyei6
         VEMQ==
X-Gm-Message-State: APjAAAVAh5H2wTR5Jk+hYbMqKJjWUQCwtSrFvhBuy1QEAaYVg5I5IpFT
        s0ZaOgxTVhr6dEXTGRZYAVhkvA==
X-Google-Smtp-Source: APXvYqx2dskJDKXaT+E0oNXiAyypndDtxvLHHetWpyjlUHp4FdtjH3uYI6Q1hpDsb+x0thq/HRyJ6g==
X-Received: by 2002:a2e:750c:: with SMTP id q12mr21242131ljc.138.1571824480183;
        Wed, 23 Oct 2019 02:54:40 -0700 (PDT)
Received: from localhost.localdomain (d79-196.icpnet.pl. [77.65.79.196])
        by smtp.gmail.com with ESMTPSA id v7sm9177824lfd.55.2019.10.23.02.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2019 02:54:39 -0700 (PDT)
Date:   Wed, 23 Oct 2019 11:54:33 +0200
From:   Mateusz Holenko <mholenko@antmicro.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jonas Bonn <jonas@southpole.se>,
        Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
        Stafford Horne <shorne@gmail.com>,
        openrisc@lists.librecores.org
Cc:     Karol Gugala <kgugala@antmicro.com>,
        Mateusz Holenko <mholenko@antmicro.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Paul E. McKenney" <paulmck@linux.ibm.com>,
        Filip Kokosinski <fkokosinski@internships.antmicro.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Joel Stanley <joel@jms.id.au>
Subject: [PATCH 0/1]  openrisc: LiteX+mor1kx platform
Message-ID: <20191023115427.23684-0-mholenko@antmicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This patchset adds a new LiteX SoC-based platform
configured for mor1kx (OpenRISC) CPU coupled with
LiteUART serial device.

Details about LiteX can be found at
https://github.com/enjoy-digital/litex.

This platform is intended for further extension
once drivers for other LiteX devices are merged
to the kernel.

NOTE:
This requires another patchset to be merged first:
https://lore.kernel.org/patchwork/cover/1143352/

Filip Kokosinski (1):
  openrisc: add support for LiteX

 MAINTAINERS                               |  1 +
 arch/openrisc/boot/dts/or1klitex.dts      | 49 +++++++++++++++++++++++
 arch/openrisc/configs/or1klitex_defconfig | 18 +++++++++
 3 files changed, 68 insertions(+)
 create mode 100644 arch/openrisc/boot/dts/or1klitex.dts
 create mode 100644 arch/openrisc/configs/or1klitex_defconfig

-- 
2.23.0

