Return-Path: <SRS0=lLbR=3C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9592DC3F68F
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jan 2020 23:03:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 65C11207FF
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jan 2020 23:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578956597;
	bh=4RQwIyMnmuJ/JMrFu0r2d634j037hKOiaUUG9SfYIfo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=RnugGTHC1T/dKyrpcOn4zy6PspaPtWAz5MNHvoxO1Dg6kuE7EGnYnXtY0h/lbP5B7
	 J0rIfjWNYHhYU6rZXBVorqdkScTfQqwo0Rzc+Zihb2DG8KWSYvNLEV9xmDubNhXZbt
	 ewIlV8aviJN1J9Inw6emRJEFFQVAcS8tYI8xy5uw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729153AbgAMXDR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Jan 2020 18:03:17 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:47103 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728829AbgAMXDQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 13 Jan 2020 18:03:16 -0500
Received: by mail-ot1-f65.google.com with SMTP id r9so10657797otp.13
        for <devicetree@vger.kernel.org>; Mon, 13 Jan 2020 15:03:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Ri61tZzvuw9GVovdm8Wr7vnv/tkJpOEIL8vV4DTKISA=;
        b=qvexY26kiAPsJBkDeHYlZuYSbqOzvN+PWsMs7IYTTvspleW0Gbpv4vfjXYPBwSMbDE
         dQrx4xlyn0kUXKqlq4OhRhBnbSkQTuQa7wUy/Bn/7+LgQDaczyA58oh5752b9Em6d+e2
         WGOz+CKTYToq7vSkVoE6hh/hJ7+fwfH9D6vcxolm78aZbWYlSILwm54C1NcZjr7B8kmk
         MIRr6KcAkNox++V4dQHWSERrsPzZG/sbi3cftxbUt4qSGme7fDtqQcvNtM8YPrIvfuAQ
         inchDHDl/IGsvh+sxXxPkNjxCWUtqUYSzn+fC2HJt4H+2E07b/BIxV8FE1alql8UnpAB
         kjeg==
X-Gm-Message-State: APjAAAUr58SHua37zPLV9O5SgrpB7SCNNRJzTN0kXRSHnHk+xhvtgGNW
        G5ubuCBJmPTEKEe7V0eEpnUobuY=
X-Google-Smtp-Source: APXvYqya3aHXOQ/b9HicavAyY8fVlec/WTFDTsd1mzmswwBLdBCKgiZeYFrgsI/kr6Qny7ehJl0MXQ==
X-Received: by 2002:a9d:7b51:: with SMTP id f17mr14659861oto.302.1578956595825;
        Mon, 13 Jan 2020 15:03:15 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id f1sm4684533otq.4.2020.01.13.15.03.14
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 15:03:14 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 220b00
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Mon, 13 Jan 2020 17:03:14 -0600
Date:   Mon, 13 Jan 2020 17:03:14 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: Re: [PATCH v3 3/5] dt-bindings: phy: qcom-qusb2: Add support for
 overriding Phy tuning parameters
Message-ID: <20200113230314.GA1041@bogus>
References: <1578658699-30458-1-git-send-email-sanm@codeaurora.org>
 <1578658699-30458-4-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578658699-30458-4-git-send-email-sanm@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, 10 Jan 2020 17:48:17 +0530, Sandeep Maheswaram wrote:
> Add support for overriding QUSB2 V2 phy tuning parameters
> in device tree bindings.
> 
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---
>  .../devicetree/bindings/phy/qcom,qusb2-phy.yaml    | 33 ++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
