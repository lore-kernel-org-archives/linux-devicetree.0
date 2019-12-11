Return-Path: <SRS0=G+GX=2B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A9D5C43603
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Dec 2019 18:56:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 652EC2464B
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Dec 2019 18:56:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="IMZ7lXdP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726903AbfLKS4a (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 11 Dec 2019 13:56:30 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:44197 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726487AbfLKS4a (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 11 Dec 2019 13:56:30 -0500
Received: by mail-wr1-f67.google.com with SMTP id q10so25248976wrm.11
        for <devicetree@vger.kernel.org>; Wed, 11 Dec 2019 10:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=message-id:subject:from:reply-to:to:cc:date:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9Tz9pIN2heTTfzmNoMIKpO2fPp6d1pAsyI6xzTnA+qI=;
        b=IMZ7lXdPcaddSS42p3tQ9T3A3Ilo5OSdEpFoZds+SEPA6Zjrojzc6LbOTgCv7rh1w+
         qEO44GuqOKkJssd1DvtBVfcsT/XNCU1WOMh/3NACLLjZNclt+mWVm/Qf4RoC4o7hlmHp
         QDatOt+M10o3kL7n1Hhn6ply6OLPIqI6u2lLYA/56AWvOEIAziBqeHKZESObuermyGX9
         18Zx0XTy60zvJr4DbfQK0gLlv7rd1Rx8QIc/ub9zwaK2IIkZOnU1fHRcHwwvyFlvhd7z
         FNU9SSJ85BsJhWoNNWU6om2ZMiF9mLyspN79RFOJmdIZpOwkTgpNUF7wwy6jLo+4yKcZ
         sYTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=9Tz9pIN2heTTfzmNoMIKpO2fPp6d1pAsyI6xzTnA+qI=;
        b=fpI4EdlwKJGV1G0Bgr9402JDVWS7hsKJ0KeomYTiOt5628SisI+c0OzARAPnip/pEj
         /c9l/CjZKRjq+7d23jPF5m2ehh+Wc+JXy1ZXNlOFRDrgd2Q/efvKBq6mD95KskHzONH7
         6Prrcc2GyNwTyRacxVhNqH8uUTrxvAfMHdc51YbzcH12WpFVe3kzlJ8yNOG12hq3V7zh
         ujZYXKqfF+aJbWGzRZud1tA2cCWKmeCVZR3002Wa745u1dWnTb9320E5JC6Fyv89UCJz
         GYjoCYJlKyvXgaP01E2aM9eyzyk2QfV/sYW5q4nQXLlCUBxsyTEB6XgjtCRrblE3q0rK
         JlAw==
X-Gm-Message-State: APjAAAUNmaZxJGCA+FxCFbWoFO2mfIaKOlALcl1PwsLeX2GTFqJe4Qte
        Aepawt65R1e6mXb+PvmXfps=
X-Google-Smtp-Source: APXvYqzcWWb+dGKAOnXS5ntWbseCwnHKeTnfpps3hlwccdtyqe3xHXISmdPW1AISV1UTvARq5Ja5Hw==
X-Received: by 2002:a5d:494b:: with SMTP id r11mr1460395wrs.184.1576090588522;
        Wed, 11 Dec 2019 10:56:28 -0800 (PST)
Received: from [192.168.0.52] (HSI-KBW-109-192-080-035.hsi6.kabel-badenwuerttemberg.de. [109.192.80.35])
        by smtp.gmail.com with ESMTPSA id a186sm3450785wmd.41.2019.12.11.10.56.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Dec 2019 10:56:27 -0800 (PST)
Message-ID: <1576090586.2695.1.camel@googlemail.com>
Subject: Re: [PATCH v2 4/4] ARM: dts: phycore-imx6: set buck regulator modes
 explicitly
From:   Christoph Fritz <chf.fritz@googlemail.com>
Reply-To: chf.fritz@googlemail.com
To:     Shawn Guo <shawnguo@kernel.org>
Cc:     Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        Mark Brown <broonie@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Support Opensource <Support.Opensource@diasemi.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Date:   Wed, 11 Dec 2019 19:56:26 +0100
In-Reply-To: <20191204125336.GM3365@dragon>
References: <1573652416-9848-1-git-send-email-chf.fritz@googlemail.com>
         <1573652416-9848-5-git-send-email-chf.fritz@googlemail.com>
         <AM5PR1001MB099480739860863EB08EA73280760@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
         <1574973044.2362.11.camel@googlemail.com> <20191204125336.GM3365@dragon>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, 2019-12-04 at 20:53 +0800, Shawn Guo wrote:
> On Thu, Nov 28, 2019 at 09:30:44PM +0100, Christoph Fritz wrote:
> > Hi Shawn,
> > 
> >  any chance to get this patch queued for the upcoming kernel?
> 
> Sorry, no.  I need to wait for DA9063_BUCK_MODE_SYNC landing on 5.5-rc1,
> and then apply this DTS patch.


DA9063_BUCK_MODE_SYNC is now available in 5.5-rc1, could you queue this
patch now?

