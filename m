Return-Path: <SRS0=xnVj=BG=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ADC7C433EA
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jul 2020 19:20:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2BF0E20729
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jul 2020 19:20:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AaPrVOqN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728464AbgG0TUw (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 27 Jul 2020 15:20:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726139AbgG0TUw (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 27 Jul 2020 15:20:52 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14435C061794
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2020 12:20:52 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id o13so10456819pgf.0
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2020 12:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=t8hLkFIbtpdEX3UBYFfNbS3mhtXXCA/FYFZZm/zp7IQ=;
        b=AaPrVOqNWMgqMpxH88BEQJnuih5t7lG8Pv8holLzmGEU4PKPfhWaJFBe3+epjBa5TG
         Keaw7CEihV8ZtlT6zoxgh/RsdsdBJpqs4TK1Q0FOtw+Q+IDZMp3VNvwboWf9iZB/5Gh/
         RmXdaa/Uox3jj+vCZXTE35yj488G1nA9Bf82c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=t8hLkFIbtpdEX3UBYFfNbS3mhtXXCA/FYFZZm/zp7IQ=;
        b=CDkALirfYKqa2gD8Qx6bryL0bkpXRmlztT4GqkWKODvP5u/twdlEEXTw+4bjTfkMOV
         1cDQUX/eRi+n+KxSSduIuFGEDI7WQ+MG7dPQqPr6H1PbM+J3zUJJrjXlPiLUqIBUvDjm
         sf+lty4yCz3kgy5RbAkPY2ihXWqCGLyBhA+/JblFxbNBiqkICAqbSb8usNfC0b9BRvWe
         uXrJeXCV8iNcIKYHhWRGRHXV+ywsjq6SU0lat06hlCUi5nuJC8KI1FoE8sbHop4FHDbK
         NvBBw4z43eYOCIRcX+1JhmjfyMF8wD4MicNcLRXTL8dal47vC78xTpFFVumLGuoVnNVE
         HzjQ==
X-Gm-Message-State: AOAM530VfmoECXEP9zNR6GMEC8tived0z3/ysvTdebDf7Pz5DKEbKYU4
        PsSZrMtFZWGlRRRFQx8sx/ijY4dy4dU=
X-Google-Smtp-Source: ABdhPJx0j3o/dfARdxLCxZFu0QCg2nY4pjGflu6c0tuLw5tUQhIucFl39ZjiLASPZto5FWJNbE3ECA==
X-Received: by 2002:a63:6c0a:: with SMTP id h10mr21194250pgc.11.1595877651605;
        Mon, 27 Jul 2020 12:20:51 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id u24sm15605054pfm.211.2020.07.27.12.20.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2020 12:20:51 -0700 (PDT)
Date:   Mon, 27 Jul 2020 12:20:50 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
Subject: Re: [PATCH v11 1/2] usb: dwc3: qcom: Add interconnect support in
 dwc3 driver
Message-ID: <20200727192050.GD3191083@google.com>
References: <1595869597-26049-1-git-send-email-sanm@codeaurora.org>
 <1595869597-26049-2-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1595869597-26049-2-git-send-email-sanm@codeaurora.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Jul 27, 2020 at 10:36:36PM +0530, Sandeep Maheswaram wrote:
> Add interconnect support in dwc3-qcom driver to vote for bus
> bandwidth.
> 
> This requires for two different paths - from USB to
> DDR. The other is from APPS to USB.
> 
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> Signed-off-by: Chandana Kishori Chiluveru <cchiluve@codeaurora.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
