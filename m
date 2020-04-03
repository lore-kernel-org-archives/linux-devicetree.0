Return-Path: <SRS0=qh1l=5T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4399CC2BA16
	for <linux-devicetree@archiver.kernel.org>; Fri,  3 Apr 2020 18:16:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0C82F207FF
	for <linux-devicetree@archiver.kernel.org>; Fri,  3 Apr 2020 18:16:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NYx+sHPE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728499AbgDCSQe (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 3 Apr 2020 14:16:34 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:34565 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728066AbgDCSQe (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 3 Apr 2020 14:16:34 -0400
Received: by mail-pl1-f194.google.com with SMTP id a23so3033143plm.1
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2020 11:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=l9OtO5bBjU4ri0ecYRkCgiryeyjL/1OJpZNChQ7ItYI=;
        b=NYx+sHPEuWXImveqC5saq7LPSHEW29HyBJwPIy0Wsv4qxJp8hwJZwCQLBGUxkDoz5n
         NRTdcePZ89Ihj3Nr1q4SSWTYE9L6ixXMinliK5sCArFNnBmm0cTAjVAVEUR491pc7zx+
         7TWCe9R7nyZui0z+kqVrFdlu5SedTFb/AKFV4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=l9OtO5bBjU4ri0ecYRkCgiryeyjL/1OJpZNChQ7ItYI=;
        b=fn2/Oou6FUu9Po1ULajGfiC3aPn43p5urz65Z+IObAAa4KDs8vtJakNHWoVo+ZVI4O
         1xawa3CEgd9QC67gLz/C5u93od175MjIAt46YHtpK+YDFFZUR1Z1cx5YzwW7SPrg9eTE
         5N+V6wt904KMzsWb6ux3//wJYwZf5rDAUFWc4srvA17KZQgr6OdBpNMD4EilSBE1L0y/
         c4jHdRxHbBM/1vPHk9s8Mrr/w+SG10Foa04Hmq1/JnvHd8fNMLtfO1NQiJuVWByRrmq5
         bvJRB5ptJNul0EpjIqjS1snD0R4fnMizWjEJpc2H5ZF4lvrJnipbLjiAfRl6e9Ju0a9B
         NLyQ==
X-Gm-Message-State: AGi0PubLsObJrNXQTizZKXv5h5e3TUGC7OhrJY7L6kE1eomO+w0Z36ys
        In+L0B+2XLXt1Ykq9YHzF0qEBA==
X-Google-Smtp-Source: APiQypIGHcLKfA4BC6dhIJebo6CEcV70oa/S4T2XWdYpRNyxtEt21rnfykH5/137XQhZwQNCpuZxdQ==
X-Received: by 2002:a17:902:d3cb:: with SMTP id w11mr8949903plb.257.1585937792655;
        Fri, 03 Apr 2020 11:16:32 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id x3sm6250986pfp.167.2020.04.03.11.16.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2020 11:16:30 -0700 (PDT)
Date:   Fri, 3 Apr 2020 11:16:29 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     "Rajeshwari Ravindra Kamble (Temp)" <rkambl@codeaurora.org>
Cc:     Amit Kucheria <amit.kucheria@verdurent.com>,
        Doug Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        sivaa@codeaurora.org, Sandeep Maheswaram <sanm@codeaurora.org>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Changed polling-delay in
 Thermal-zones node
Message-ID: <20200403181629.GP199755@google.com>
References: <1584430804-8343-1-git-send-email-rkambl@codeaurora.org>
 <CAD=FV=VLZ4RQQuji=1kKE5EnqrpY0M=U_G8XigAWAaZ8mxc=eg@mail.gmail.com>
 <fc7f250e-aa85-0835-8bc4-8274235c74d0@codeaurora.org>
 <CAHLCerMCrNdKUmRww4EFctU8cojh6Fqhs7gpux3SNCSwYUBOvQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHLCerMCrNdKUmRww4EFctU8cojh6Fqhs7gpux3SNCSwYUBOvQ@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Rajeshwari,

do you plan to send v2 with an updated commit message?

Thanks

Matthias

On Wed, Mar 18, 2020 at 02:40:47PM +0530, Amit Kucheria wrote:
> On Wed, Mar 18, 2020 at 11:49 AM Rajeshwari Ravindra Kamble (Temp)
> <rkambl@codeaurora.org> wrote:
> >
> >
> > On 3/17/2020 10:20 PM, Doug Anderson wrote:
> >
> > Hi,
> >
> > On Tue, Mar 17, 2020 at 12:42 AM Rajeshwari <rkambl@codeaurora.org> wrote:
> >
> > Changed polling-delay and polling-delay-passive to zero as per
> > the requirement.
> >
> > Signed-off-by: Rajeshwari <rkambl@codeaurora.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sc7180.dtsi | 100 +++++++++++++++++------------------
> >  1 file changed, 50 insertions(+), 50 deletions(-)
> >
> > It probably wouldn't hurt to mention in the commit message that this
> > is because the thermal sensor interrupts are all hooked up and thus
> > the polling is not a useful thing to do.  ...but other than that:
> >
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> >
> >
> > Hi Douglas
> >
> > I didn't  get your comment.
> >
> > Thanks,
> > Rajeshwari
> 
> I think he means that you haven't mentioned WHY this patch is needed
> in the message. The reason you should mention is "to disable polling
> mode of the framework since interrupts for tsens are already
> configured."
> 
> Regards,
> Amit
