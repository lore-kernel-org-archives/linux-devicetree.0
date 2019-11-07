Return-Path: <SRS0=C4ig=Y7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5266C5DF61
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 Nov 2019 13:19:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 94C58214D8
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 Nov 2019 13:19:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bqmZ+5Yo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388911AbfKGNTF (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 7 Nov 2019 08:19:05 -0500
Received: from mail-wm1-f53.google.com ([209.85.128.53]:40727 "EHLO
        mail-wm1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727142AbfKGNTE (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 7 Nov 2019 08:19:04 -0500
Received: by mail-wm1-f53.google.com with SMTP id f3so2378646wmc.5
        for <devicetree@vger.kernel.org>; Thu, 07 Nov 2019 05:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=7RnYyZPkuF3R6Pjdl6TQ7ksG73Gxu8ALHEDQIVRgO5I=;
        b=bqmZ+5YoXw4bugzXvLjciuo6mzPa5nyO0K76U+A9AKoN3Pv6gsosxLpK8HuZllTFsv
         S3qemF+5yCBzBp5XLJKVKmMOhhjZLGA+g6Xt95YGBsrYqWXuvUafxIDfy63kkEhc/OR3
         cVp/wNNRDIGjjAdzLBKcpeN8B7Zqg57Hs/WdeJOyQKBz4+FbcSqGrMewtb9O8jk5dOdY
         +nj+e4GUFlPQBO5igtlpWLSrChWi2e6ZVx1yWfo1YuvmPOnOWd9dRR0lCjL3RmeVLIFV
         6UBOeaLRj+8l2d8w9Djk9a2YfUzdq89YoZwqAkurVQPF8c855vwkwHeEthD9yPbgGDLo
         T8Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=7RnYyZPkuF3R6Pjdl6TQ7ksG73Gxu8ALHEDQIVRgO5I=;
        b=J6hFD5XnwlQXNVGxkMbJKrv16I3BDdzG1fw+oUT+WctFxJoaVWO+M29NopW6BKQ1dF
         mqoW8OB4+y1HEy5BvrELV86FrziS/zSAlIiVs4gAmfcHr8PuSfG2kW/6Xya/S3HkiM2V
         JDK6KGshxm+fCR+LT5B2c3nKYxSUG/ISKwIJkaAfNBwF3/wUPlqz8ycgCS9ibZWtSF7x
         nK3kvSbgCmarFSWYpYkuRclmNPwGBQtF6+f8nXhjzcDMs6INka9Q4NGJVqqPx3fWBdIk
         jE1OwEdyLNEgW05LIy/o0ICD+Kf5Ke1qGUU7lFDTE4HdQgxwv9Sz9h/ib8RUMi6CysI1
         PO3w==
X-Gm-Message-State: APjAAAW2BGpg473Ip7mpV5M4ns0LvEc2gd/Y9pMqg7MHUbSTYMrBU+5t
        J+z4Ztv6sJhrm6JA1hAUbo3NSHsvH92WBA==
X-Google-Smtp-Source: APXvYqw/i0KiWaCW8SyOAKM9ExPV9nTUFYFx/CvpZN/+KyvlOHC0a/Gjmp8cY2Il2204AKsBsrN+BQ==
X-Received: by 2002:a1c:38c3:: with SMTP id f186mr2971778wma.58.1573132743111;
        Thu, 07 Nov 2019 05:19:03 -0800 (PST)
Received: from cheddar.halon.org.uk (cheddar.halon.org.uk. [93.93.131.118])
        by smtp.gmail.com with ESMTPSA id w10sm1841695wmd.26.2019.11.07.05.19.02
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Nov 2019 05:19:02 -0800 (PST)
Received: from bsmtp by cheddar.halon.org.uk with local-bsmtp (Exim 4.89)
        (envelope-from <steve.mcintyre@linaro.org>)
        id 1iShgk-0000pB-52
        for devicetree@vger.kernel.org; Thu, 07 Nov 2019 13:19:02 +0000
Received: from stemci01 by c30-smcintyre.einval.org with local (Exim 4.92)
        (envelope-from <steve.mcintyre@linaro.org>)
        id 1iShgg-00022e-FP
        for devicetree@vger.kernel.org; Thu, 07 Nov 2019 13:18:58 +0000
Date:   Thu, 7 Nov 2019 13:18:58 +0000
From:   Steve McIntyre <steve.mcintyre@linaro.org>
To:     devicetree@vger.kernel.org
Subject: Device Tree Evolution Project - call notes - 6th November (pointer)
Message-ID: <20191107131858.GF3697@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-attached: unknown
User-Agent: Mutt/1.10.1 (2018-07-13)
X-wibble: sender_address steve.mcintyre@linaro.org
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi folks,

Just as a heads-up:

We held our bi-weekly call about DTE yesterday. I've forwarded a copy
of the notes to the devicetree-spec list. In case anybody here hasn't
seen it and may be interested, here's a link to that mail in the
spinics archive:

  https://www.spinics.net/lists/devicetree-spec/msg00888.html

Background information about DTE
================================

Linaro engineers are working on a range of initiatives in the DT
space, collected together as a project called Device Tree Evolution
(DTE). We hold a discussion call every second Wednesday at
1700 GMT / 1200 EST / 0900 PST. If you would like to be invited, please
ask me (Steve McIntyre).

This is a summary of the notes from the most recent meeting. I aim to
tidy up and post the meeting notes shortly after each meeting. The raw
notes are published at

https://docs.google.com/document/d/e/2PACX-1vRVDrVFWjIOascqZFCO--T8pIqyFB_MDh9cvgyoqhI6Y0tqaA9TcCcvQhcmxi5IY7CG44JfIrCdAUDL/pub

For more information about DTE, see:

 * https://www.linaro.org/engineering/core/devicetree-evolution/
 * https://www.linaro.org/assets/pdf/Linaro-White-Paper--Device-Tree-Evolution.pdf

Cheers,
-- 
Steve McIntyre                                steve.mcintyre@linaro.org
<http://www.linaro.org/> Linaro.org | Open source software for ARM SoCs

