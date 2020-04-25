Return-Path: <SRS0=EFsK=6J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E3F3C55186
	for <linux-devicetree@archiver.kernel.org>; Sat, 25 Apr 2020 10:53:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5A6A62074F
	for <linux-devicetree@archiver.kernel.org>; Sat, 25 Apr 2020 10:53:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OZGH0T0q"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726141AbgDYKxP (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 25 Apr 2020 06:53:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726050AbgDYKxP (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Sat, 25 Apr 2020 06:53:15 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DB01C09B04A
        for <devicetree@vger.kernel.org>; Sat, 25 Apr 2020 03:53:15 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id l11so9826395lfc.5
        for <devicetree@vger.kernel.org>; Sat, 25 Apr 2020 03:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=26J4ZrAWggSGwTknWfcK7YR28bSW/tnQ+qE7te+BnW0=;
        b=OZGH0T0qMpLYn5xn5WHix0O/VOjaJu123fuXmgPLWL75RXh8icrZUYKScc08RmyO7q
         Gka+32u+XmVBmdVzQtTEzsdoeDC1r5Kbjcqky192KiYgzVMOsYehYZxkoZhoHUIiuYkn
         Fc0eq78u8EUv1o2Ncgnv8v73XTBVb9wmBhcswEiLhC6g/Xjy8LjzEAf3ONDdV9E31hVa
         WhOEyFyofa2HdyrWPIjMtzajrmS5TBK30CLcSxKgl1XobNJsIKTg/LCfR/c1brsJ0vap
         tv5FYH1kklbRi4cUqxjxlBVIwHErxwby4xIn0M2G1vNI/QPfr3vyoYGxECxEQjBH9StE
         tj9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=26J4ZrAWggSGwTknWfcK7YR28bSW/tnQ+qE7te+BnW0=;
        b=ZUX0NscuTnz19tlXTFhdOrHJDlBfan8C4xRvIntFhjzO2jy8tHKGVjbKvsT9KEQDxT
         eucPo3uvpgkoUDjqXy2+1YCvVhwm1Gg4N9b1tl8o0Lr6thQMutVP2JcA73DcJOB1+xbg
         7f1BDyUcRK2TZv3jQolqTDPhl7sGb2mNtcPi999YOWHLd/mhzzGDcp2SOqlHzAhOd7HB
         S9NL7hh1z8cduJcFDV0dIaMFlM/uU1LO/cRkvCFkKW/4ri/xP7Ehpwia64z/J0po82AU
         i6kCGekhlrhAhkm/YiN/S5qGxdu4JyrYszWzhsrFUm7mR1q1UjKsTt7fvRA2YGR8D1av
         JhvQ==
X-Gm-Message-State: AGi0PuY6sHki+mHnnvliQDS8c6nyZ2c8Qh4h3mLDSHKP1J9burG5pecW
        TwgoPyC7F4wa9Lu0pugoC38=
X-Google-Smtp-Source: APiQypKsRYOikdeYUoj/HULiptGdonYmXpLRCUAG+cFhY+fe8S4HDom3RDZGr1KRh4SQQzB8EEywhQ==
X-Received: by 2002:a19:ca13:: with SMTP id a19mr9315411lfg.68.1587811993591;
        Sat, 25 Apr 2020 03:53:13 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id c4sm6501805lfg.82.2020.04.25.03.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2020 03:53:12 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Cc:     Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v1 0/2] update dt-extract-example
Date:   Sat, 25 Apr 2020 12:52:53 +0200
Message-Id: <20200425105255.1064-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

First one patch to add support for root nodes in dt-extract-example.
This will allow us to modify the example for simple-frambuffer to it
is more correct without any warnings.
And we may ahve a potential to use this in other places.

Verified that this did not introduce any regressions in
mainline kernel.

Looking at the generating output there was one line with wrong ident.
Fixed this so reading the generated outlut was a little easier
to the eye. The fix has no impact on the checks.

Patching simple-frambuffer.yaml in the kernel will
have to wait a little. At a minimum this patch should be accepted
and dt-schema shall have a higher version.

	Sam


Sam Ravnborg (2):
      tools/dt-extract-example: support examples with root node
      tools/dt-extract-example: beautify output

 tools/dt-extract-example | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)


