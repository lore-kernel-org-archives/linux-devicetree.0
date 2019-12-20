Return-Path: <SRS0=Tw2w=2K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFE8CC2D0D4
	for <linux-devicetree@archiver.kernel.org>; Fri, 20 Dec 2019 21:38:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A3681218AC
	for <linux-devicetree@archiver.kernel.org>; Fri, 20 Dec 2019 21:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576877919;
	bh=LOdBOyrzT1VmXB8JTzj+YKmGQhDJR+j+A1D6menJUBg=;
	h=Date:From:To:Cc:Subject:List-ID:From;
	b=VjnLi/+l+LRpfCEWr/CvyB6/1OkMZ8PIzkA5hXQ0v1pmBTpMyDFJB7tPckhuAFK1P
	 1p/ZTCqKJ2gEAjKFeWSOy38vUPlGT766W+WxPvX8uPkXIaRvniFAWdzXsHqwOIqO15
	 sxC4PpkiSzS3m/pjH8yNIZqdctGkJ7GcKe/wIvDE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727595AbfLTVif (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 20 Dec 2019 16:38:35 -0500
Received: from mail-io1-f45.google.com ([209.85.166.45]:46516 "EHLO
        mail-io1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727422AbfLTVie (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 20 Dec 2019 16:38:34 -0500
Received: by mail-io1-f45.google.com with SMTP id t26so10811680ioi.13;
        Fri, 20 Dec 2019 13:38:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=n3MQGPtTm+uV6G1PXnJ6y6afnswYuWytb5HsIywWnJ0=;
        b=M02oZJq0vyKK1+Tpfgy0F/fDb2SfCwlvAvsCNLdhogtS6OHEhZv/jqDZ2ztpoCcXKD
         ddH+mHnb3lcHB2KocUBNtCVGHgGQYhOxaUelnpO+UTWkYiPFhc3cIbk7uzJ4x028oSKn
         DgWygGcsIW2efFaCDJlegFSM7cKubIpLcC7JCAxdP5saoIJeabK4B25o3CybuVu1f1Yo
         5ZVnSofzq93SqzKrscrFE/gqI6MtIqbQ96qe3M08oirD94fKmxl6J8KVtqUG/+wMb+lt
         MVid8RS0m9y7k9UbEcKCnvmnFWgi0c7/qgn+7cSUVJjonN+cA0RjL4/HIxg63VdNGBsQ
         +3DA==
X-Gm-Message-State: APjAAAUZrtKoeycyMNAlHMAgUef9k0TrTMDfkoOxK8iZU3FwbWr7ZMwH
        lGZPBlB7iCezrNEOl3uGRvIouX0=
X-Google-Smtp-Source: APXvYqzfDMkq+wnBYjJ+Lfhd5TdrmV2sA3hnCtcbd586osW8Ix4xZWReeY6KRPrXPb+Rtyh6p/hNbA==
X-Received: by 2002:a05:6638:a4a:: with SMTP id 10mr14152619jap.44.1576877913871;
        Fri, 20 Dec 2019 13:38:33 -0800 (PST)
Received: from localhost ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id w16sm5389036ilq.5.2019.12.20.13.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2019 13:38:33 -0800 (PST)
Date:   Fri, 20 Dec 2019 14:38:32 -0700
From:   Rob Herring <robh@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Frank Rowand <frowand.list@gmail.com>
Subject: [GIT PULL] Devicetree fixes for v5.5-rc, take 2
Message-ID: <20191220213832.GA23111@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Linus,

Please pull this single DT fix.

Rob


The following changes since commit ee9b280e17dce51c44e1d04d11eb0a4acd0ee1a9:

  of/platform: Unconditionally pause/resume sync state during kernel init (2019-12-12 18:39:52 -0600)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git tags/devicetree-fixes-for-5.5-2

for you to fetch changes up to dbce0b65046d1735d7054c54ec2387dba84ba258:

  dt-bindings: Add missing 'properties' keyword enclosing 'snps,tso' (2019-12-17 17:29:00 -0600)

----------------------------------------------------------------
Devicetree fix for 5.5-rc take 2:

- Add missing 'properties' keyword enclosing 'snps,tso' in snps,dwmac
  binding

----------------------------------------------------------------
Rob Herring (1):
      dt-bindings: Add missing 'properties' keyword enclosing 'snps,tso'

 Documentation/devicetree/bindings/net/snps,dwmac.yaml | 1 +
 1 file changed, 1 insertion(+)
