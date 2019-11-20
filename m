Return-Path: <SRS0=8557=ZM=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27C89C432C0
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 Nov 2019 11:31:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F20E421823
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 Nov 2019 11:31:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QitaLrX0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728376AbfKTLbi (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 20 Nov 2019 06:31:38 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:45430 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728004AbfKTLbi (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 20 Nov 2019 06:31:38 -0500
Received: by mail-wr1-f65.google.com with SMTP id z10so27704053wrs.12
        for <devicetree@vger.kernel.org>; Wed, 20 Nov 2019 03:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=C3KAWGfaClOFI5NUnMyDNUYSh3+o4o+52K4hEO02IJo=;
        b=QitaLrX0wnOm4XQpAuXRTYIQAATVoN6tHhxIRmDD61g+wCXtAWikV1C7vch3ckzSSc
         QwpO1ji/+CNXa5yVZ37J/TPW2bkumJQfnTitY67OxaWk8ZhfBdRb1ARJvRhhYWW7MKSQ
         jMFDlF0LRNXS142YYwuKLoRSw5NdiuLuWdrYZGubuNGuVhpcbtV47l4/xQfetZ0ggXOT
         +LPytLBdQtMJbj8FzNumcNT/2ViBHAdxqZchnY8zeQePQXMUu9ODcoQmKzGB0dsJW5kL
         CxctLLRRVONGhPW2ZctC/24lnOnkhvHPf5vChWqDkrcLrP3Jd1rV+3JBHeSG2hP5CVs9
         bpUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=C3KAWGfaClOFI5NUnMyDNUYSh3+o4o+52K4hEO02IJo=;
        b=lx9qJPeRwUmhyGKd53ri81QIEiZnfl9tuRvtfR3u3e+4iUaUXR10/JNpoNUbl+tVDJ
         cDJ864yeWiO5Un+mZVmvERT9EuSGjacVsxW8Ffy1I8/Bi3rvO6ySY+XGZoQdq0Gu80PM
         nWIpheOl7XJsNbfcuIPP9jewauo/zry0fRmhK+lE5s+Dd4jn9s9XRE4tDDh4RjKzWJYO
         ZgYE8jfYaIfCMIsDXFF0Wm3YbWCIH7el+QC8Hunlf6NL4/y9Xfo4Vpt08re2jvZcr0+k
         dHqFwMyv2mUOd1JIMan2SQ6sFvDqxAnFMUII/a2e5RmQvTwN6u6q5btT4vlSCtc5jV4w
         NK3g==
X-Gm-Message-State: APjAAAUdD+C8r1q1KSCCrHG2PNCCX87ZEFJXig01uIA5hO6ihe8PX+fK
        EBPapiU2AckYOaenH46wP5o=
X-Google-Smtp-Source: APXvYqypeufkH/HREZT6LAEz8ZwEmnfxwarkn/YMbNXRMAje9zb/zrWrJWnuSxbVjkrCqzSsVwc3sQ==
X-Received: by 2002:adf:fdca:: with SMTP id i10mr2726927wrs.356.1574249496052;
        Wed, 20 Nov 2019 03:31:36 -0800 (PST)
Received: from localhost ([37.238.189.2])
        by smtp.gmail.com with ESMTPSA id g11sm490567wro.2.2019.11.20.03.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2019 03:31:35 -0800 (PST)
Date:   Wed, 20 Nov 2019 14:31:33 +0300
From:   Mohammad Rasim <mohammad.rasim96@gmail.com>
To:     Marcel Holtmann <marcel@holtmann.org>
Cc:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: net: Add compatible for BCM4335A0
 bluetooth module
Message-ID: <20191120113133.nrpgwblwfvkt5jbf@manjaro.localdomain>
References: <20191119194638.4967-1-mohammad.rasim96@gmail.com>
 <20191119194638.4967-2-mohammad.rasim96@gmail.com>
 <142FFF61-2253-4DE2-BF82-CEAB780252C7@holtmann.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <142FFF61-2253-4DE2-BF82-CEAB780252C7@holtmann.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 19/11/20 12:36AM, Marcel Holtmann wrote:
> Hi Mohammad,
> 
> > Available in the Ampak AP6335 WiFi/Bluetooth combo
> > 
> > Signed-off-by: Mohammad Rasim <mohammad.rasim96@gmail.com>
> > ---
> > Documentation/devicetree/bindings/net/broadcom-bluetooth.txt | 1 +
> > 1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt b/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
> > index 4fa00e2eafcf..0717399191a2 100644
> > --- a/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
> > +++ b/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
> > @@ -14,6 +14,7 @@ Required properties:
> >    * "brcm,bcm4330-bt"
> >    * "brcm,bcm43438-bt"
> >    * "brcm,bcm4345c5"
> > +   * "brcm,bcm4335a0"
> 
> this patch doesn’t apply to latest bluetooth-next tree.
>
Rebased and resent

Regards
> Regards
> 
> Marcel
> 
