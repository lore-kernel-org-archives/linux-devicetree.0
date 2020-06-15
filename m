Return-Path: <SRS0=vQ7I=74=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48649C433E1
	for <linux-devicetree@archiver.kernel.org>; Mon, 15 Jun 2020 19:42:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1E03320714
	for <linux-devicetree@archiver.kernel.org>; Mon, 15 Jun 2020 19:42:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Q1gomGsu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731321AbgFOTmt (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 15 Jun 2020 15:42:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731178AbgFOTmo (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 15 Jun 2020 15:42:44 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0A2BC08C5C4
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2020 12:42:42 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id g12so7215976pll.10
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2020 12:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tNVFiaYWMiO2hIPSPELA+UbwGrUr+c9/QS6tPzZlZsA=;
        b=Q1gomGsuoZPi4npsUFWHj1X8MZjjMEubXg7JRHxvk16FoLBYMBUvqQMm982CkHMfju
         kTVQPbwC0DsOCx0LE6fgPtUKSTAeU8r5AWd12DkRI0M02V8Z+b+P4J2xJcfSFVf8Wchh
         6A31hSMp5TIxadWGu7+0uTJE0uXGGueo9vk6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tNVFiaYWMiO2hIPSPELA+UbwGrUr+c9/QS6tPzZlZsA=;
        b=HYjKB1TVJ4V7Fjll/QpNbKIf1bqzbGQGp7qRyrImYGYwZx2x7UgoFX7+9UAwAGI3iN
         nU5i1qie9Mh4judUi29xYoepVKlxvqwdkG1OdpyQ/xPWbjzpwfFXQjGwII1Wr02mNSOT
         UixP0u+lvFNjH2qc3LmLK1PM50IS53UPThIuzt8XWmxLQ/SfreBD7Za+GH35ba3i7EOm
         pvRBO3ZkuMDpw4St5X1IH5LJMrINSofwd3eOSwAMkpudvji92XoHTbaiIMvjvk/9eXxo
         0fKLL9tbwQ9bckigTtOmT7R7BLhru3OS7inLf2INMTXljnb+EoOvkwbyLVuoOlwxj6T4
         V8cw==
X-Gm-Message-State: AOAM532wV4+VzDIbw1FAYFxT+kFy9VKjx/oB7aylS718hUFHwZU77lN5
        K7eII4ZDiAVMz9k2DOaiU006tQ==
X-Google-Smtp-Source: ABdhPJxeWDuRfhj7W7RmVrlhoom2XQpVpwdGn2PnNXzzogrg7beHu71xLjlNVRnZ9EVTyBGEIkw/Uw==
X-Received: by 2002:a17:902:ed53:: with SMTP id y19mr13563762plb.318.1592250162297;
        Mon, 15 Jun 2020 12:42:42 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id m1sm264533pjr.56.2020.06.15.12.42.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2020 12:42:41 -0700 (PDT)
Date:   Mon, 15 Jun 2020 12:42:39 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
Subject: Re: [PATCH v7 2/4] usb: dwc3: qcom: Add interconnect support in dwc3
 driver
Message-ID: <20200615194239.GW4525@google.com>
References: <1585718145-29537-1-git-send-email-sanm@codeaurora.org>
 <1585718145-29537-3-git-send-email-sanm@codeaurora.org>
 <159120577830.69627.13288547914742515702@swboyd.mtv.corp.google.com>
 <d9ccf188-4f00-d3ac-ba0f-73f06c087553@codeaurora.org>
 <159126939154.69627.13027312816468830595@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <159126939154.69627.13027312816468830595@swboyd.mtv.corp.google.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Jun 04, 2020 at 04:16:31AM -0700, Stephen Boyd wrote:
> Quoting Sandeep Maheswaram (Temp) (2020-06-04 02:43:09)
> > 
> > On 6/3/2020 11:06 PM, Stephen Boyd wrote:
> > > Quoting Sandeep Maheswaram (2020-03-31 22:15:43)
> > >> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> > >> index 1dfd024..d33ae86 100644
> > >> --- a/drivers/usb/dwc3/dwc3-qcom.c
> > >> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> > >> @@ -285,6 +307,101 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom)
> > >>          return 0;
> > >>   }
> > >>   
> > >> +
> > >> +/**
> > >> + * dwc3_qcom_interconnect_init() - Get interconnect path handles
> > >> + * @qcom:                      Pointer to the concerned usb core.
> > >> + *
> > >> + */
> > >> +static int dwc3_qcom_interconnect_init(struct dwc3_qcom *qcom)
> > >> +{
> > >> +       struct device *dev = qcom->dev;
> > >> +       int ret;
> > >> +
> > >> +       if (!device_is_bound(&qcom->dwc3->dev))
> > >> +               return -EPROBE_DEFER;
> > > How is this supposed to work? I see that this was added in an earlier
> > > revision of this patch series but there isn't any mention of why
> > > device_is_bound() is used here. It would be great if there was a comment
> > > detailing why this is necessary. It sounds like maximum_speed is
> > > important?
> > >
> > > Furthermore, dwc3_qcom_interconnect_init() is called by
> > > dwc3_qcom_probe() which is the function that registers the device for
> > > qcom->dwc3->dev. If that device doesn't probe between the time it is
> > > registered by dwc3_qcom_probe() and this function is called then we'll
> > > fail dwc3_qcom_probe() with -EPROBE_DEFER. And that will remove the
> > > qcom->dwc3->dev device from the platform bus because we call
> > > of_platform_depopulate() on the error path of dwc3_qcom_probe().
> > >
> > > So isn't this whole thing racy and can potentially lead us to a driver
> > > probe loop where the wrapper (dwc3_qcom) and the core (dwc3) are probing
> > > and we're trying to time it just right so that driver for dwc3 binds
> > > before we setup interconnects? I don't know if dwc3 can communicate to
> > > the wrapper but that would be more of a direct way to do this. Or maybe
> > > the wrapper should try to read the DT property for maximum speed and
> > > fallback to a worst case high bandwidth value if it can't figure it out
> > > itself without help from dwc3 core.
> > >
> > This was added in V4 to address comments from Matthias in V3
> > 
> > https://patchwork.kernel.org/patch/11148587/
> > 
> 
> Yes, that why I said:
> 
> "I see that this was added in an earlier
>  revision of this patch series but there isn't any mention of why
>  device_is_bound() is used here. It would be great if there was a comment
>  detailing why this is necessary. It sounds like maximum_speed is
>  important?"
> 
> Can you please respond to the rest of my email?

I agree with Stephen that using device_is_bound() isn't a good option
in this case, when I suggested it I wasn't looking at the big picture
of how probing the core driver is triggered, sorry about that.

Reading the speed from the DT with usb_get_maximum_speed() as Stephen
suggests would be an option, the inconvenient is that we then
essentially require the property to be defined, while the core driver
gets a suitable value from hardware registers. Not sure if the wrapper
driver could read from the same registers.

One option could be to poll device_is_bound() for 100 ms (or so), with
sleeps between polls. It's not elegant but would probably work if we
don't find a better solution.
