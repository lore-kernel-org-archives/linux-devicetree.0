Return-Path: <SRS0=HlsD=ZF=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCD89C43331
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 Nov 2019 11:04:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A3881222D0
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 Nov 2019 11:04:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="CsnHYgab"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727344AbfKMLEz (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 13 Nov 2019 06:04:55 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:51624 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726165AbfKMLEz (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 13 Nov 2019 06:04:55 -0500
Received: by mail-wm1-f68.google.com with SMTP id q70so1520564wme.1
        for <devicetree@vger.kernel.org>; Wed, 13 Nov 2019 03:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=message-id:subject:from:reply-to:to:cc:date:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FrqiGopUeVZbFND4MUbJPMnKP4bwlqCYYOKkzF9KaCQ=;
        b=CsnHYgabyTK5y/IO00xSfm3B0zWW+dFDY3DCb3aDIH10LLdQYu1cJJnoABZfQ2WAbI
         sadxqNg0ZU+t++/ckl9QKgCJSpxqAIkgXpXPrglHB2aBVLs0X9knQTDOoxlUGC+8iq41
         Fy1DwtDVrF7+onprTU6eCHptntnA5YtxS4e7eyvAnGeso+EKkMYcgxM7pNKqq642NOzv
         wHPr5iFmHHETf7goLqXGkckqQjfPGJ2GjJ6kbwa5SIODCzhBjQgR66oo+v2N0p4CHOU7
         nkhjKcaoNKQk3yOTcLM9CJF3sCLUso4DUB9SK+OGWiGydDFShOtAGm/CKMaasMHlqtHz
         O6Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=FrqiGopUeVZbFND4MUbJPMnKP4bwlqCYYOKkzF9KaCQ=;
        b=R7NCUciCgd804zCMxJXUUyRv4t4sPXQlFUAxprNOzknN3eXYZgxu7Bw75F8xbXLtL2
         r1PcFewqLNj8v6LzB18avo7xDVoDef39/WfRAIOzypbZteaQJ/YrfLa1Dtn3rKOaHNnZ
         RynhPXqw7Lfbl4+DtnU+bDLuLri06YfL81d7DomafFs1Pm5oFMd9AauRg+k+qAY5ZT3X
         +gRPDCJaBPogesvtJpideqe6b3eOr6LGG5vIXiFOfVStPNwxl/lTlaxt1Gk8VZgFJ8Y3
         iiT0vbFjcETLHdyPdFPQuElHlZ6owZi7A62fn8UgKnW+kBtKxi/ZuCgvCwAQLJ+W4FeW
         lxWg==
X-Gm-Message-State: APjAAAWnZYq/Oc/Lav9787UeSzIWg1v+IjisXi0Wjds6Y6OcA9IrGaTn
        47s3ih7joongC17QrCuuJyQ=
X-Google-Smtp-Source: APXvYqyaVmDFe2joHJUcP4UczTU+4dkJmObU6YyhJ5AEZR8lr/5bjth4QunTNCdrafOeZKCfhO15Sg==
X-Received: by 2002:a7b:c748:: with SMTP id w8mr2323453wmk.114.1573643093367;
        Wed, 13 Nov 2019 03:04:53 -0800 (PST)
Received: from [192.168.0.87] (HSI-KBW-109-192-080-035.hsi6.kabel-badenwuerttemberg.de. [109.192.80.35])
        by smtp.gmail.com with ESMTPSA id a8sm1796941wme.11.2019.11.13.03.04.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 13 Nov 2019 03:04:52 -0800 (PST)
Message-ID: <1573643091.2357.5.camel@googlemail.com>
Subject: Re: [PATCH 1/4] regulator: da9062: refactor buck modes into header
From:   Christoph Fritz <chf.fritz@googlemail.com>
Reply-To: chf.fritz@googlemail.com
To:     Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Cc:     Fabio Estevam <festevam@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Support Opensource <Support.Opensource@diasemi.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Date:   Wed, 13 Nov 2019 12:04:51 +0100
In-Reply-To: <AM5PR1001MB099402F860196D82601BC264807B0@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
References: <1573121050-4728-1-git-send-email-chf.fritz@googlemail.com>
         <1573121050-4728-2-git-send-email-chf.fritz@googlemail.com>
         <AM5PR1001MB099402F860196D82601BC264807B0@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Adam

On Fri, 2019-11-08 at 10:37 +0000, Adam Thomson wrote:
> > --- a/drivers/regulator/da9062-regulator.c
> > +++ b/drivers/regulator/da9062-regulator.c
> > @@ -16,6 +16,7 @@
> >  #include <linux/regulator/of_regulator.h>
> >  #include <linux/mfd/da9062/core.h>
> >  #include <linux/mfd/da9062/registers.h>
> > +#include <dt-bindings/regulator/dlg,da906x-regulator.h>
> 
> Can we please rename this file to use da9063 instead of da906x
[..]

sure

> > @@ -145,15 +138,14 @@ static unsigned da9062_buck_get_mode(struct
> > regulator_dev *rdev)
> > 
> >  	switch (val) {
> >  	default:
> > -	case BUCK_MODE_MANUAL:
> >  		mode = REGULATOR_MODE_FAST |
> > REGULATOR_MODE_STANDBY;
> >  		/* Sleep flag bit decides the mode */
> >  		break;
> 
> I'm not sure your code is based on the latest regulator updates as I believe
> Axel Lin made some improvements to this bit of code. Checkout Mark's regulator
> fork of the kernel.

yes, the line

 mode = REGULATOR_MODE_FAST | REGULATOR_MODE_STANDBY;

is now gone by commit

 be446f183ae35a8c76
 regulator: da9062: Simplify da9062_buck_set_mode for BUCK_MODE_MANUAL case

it's already in linux-next, I'll rebase this patchset


> > diff --git a/include/dt-bindings/regulator/dlg,da906x-regulator.h b/include/dt-
> > bindings/regulator/dlg,da906x-regulator.h
> > new file mode 100644
> > index 00000000..848a4df
> > --- /dev/null
> > +++ b/include/dt-bindings/regulator/dlg,da906x-regulator.h
> > @@ -0,0 +1,16 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +
> > +#ifndef __DLG_DA906X_REGULATOR_H
> > +#define __DLG_DA906X_REGULATOR_H
> 
> Just to echo previous comment, rename from DA906X to DA9063

ok


