Return-Path: <SRS0=Fzrg=42=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D03AAC10F27
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Mar 2020 18:07:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AD56320578
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Mar 2020 18:07:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="a94axufR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727391AbgCISHP (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 9 Mar 2020 14:07:15 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:35717 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726168AbgCISHO (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 9 Mar 2020 14:07:14 -0400
Received: by mail-pf1-f196.google.com with SMTP id u68so4461358pfb.2
        for <devicetree@vger.kernel.org>; Mon, 09 Mar 2020 11:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=uSDDm+szHmvIWUPLQNgJK88QQsyLobcm7m+erYi43MA=;
        b=a94axufRiybOs8QUmxdRJUFDKVHtyzYU52JehSFnSfSSbUCNc5D5hcmvKKJb2xycUk
         Qta3py6TaSaj+JanBvfoDP42W72bqzPNKHvi/KVbGDrBBnpjS+Mv5ofJXN3xRKGN3Caa
         vVbrhLTL5U5SG+YIGR5iDxV94lcQPjylD41S0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=uSDDm+szHmvIWUPLQNgJK88QQsyLobcm7m+erYi43MA=;
        b=QrOc+oJTPqq/3PD8I3LMWyNdItgvyS7gKDIf3tBEUS++Kw5pwkmdYZI8u2AB5hncvE
         mMYRQmmZHDJNPlVwF/PQx26ot0hJdaY7YnuqWKxHbMhIk1b71B8MVNBVW0QOo03n9E+7
         yVHCK9OUjWy/ggxqGKI6CIXEAUc0E/HyBY38TDXPVNkeJoKeLCs1fsIm0wRd8Bxt4vdv
         uZYah65Z0Kh9hg9zqF4xOuCcFyli36hlGDOlClJ3yyQh5M5Y85oD5fcqnshNJxC9epxG
         5CLIdBBXeZ23atpU1uvLxvu6p1sbGZLUNVSPuhlh9bJb5fU1JPZ+AspDgl7qKiGyXOwn
         G1JQ==
X-Gm-Message-State: ANhLgQ2JGB76YpXob3LP+K6OcwQz3CRqrL5qXLL4pq1we0ATDoPssJG4
        gQCTXhIxPoLABqoWDXm+gEufBw==
X-Google-Smtp-Source: ADFU+vvY9aLEitVJtJPOO+vFStdZSayTG7guRMuMoXAdUXidcTnSY4YMWpIA6UahObJI62YYr+9DKQ==
X-Received: by 2002:a63:844a:: with SMTP id k71mr6844622pgd.79.1583777232712;
        Mon, 09 Mar 2020 11:07:12 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id b70sm5500362pfb.6.2020.03.09.11.07.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2020 11:07:12 -0700 (PDT)
Date:   Mon, 9 Mar 2020 11:07:10 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Evan Green <evgreen@chromium.org>
Cc:     Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-usb@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: usb: qcom,dwc3: Convert USB DWC3
 bindings
Message-ID: <20200309180710.GY24720@google.com>
References: <1581316605-29202-1-git-send-email-sanm@codeaurora.org>
 <1581316605-29202-2-git-send-email-sanm@codeaurora.org>
 <158137029351.121156.8319119424832255457@swboyd.mtv.corp.google.com>
 <CAE=gft47is6Td7dtM_FmP1g6TFv+yRYuz7yca015YXbRRDon5w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAE=gft47is6Td7dtM_FmP1g6TFv+yRYuz7yca015YXbRRDon5w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Feb 28, 2020 at 03:41:47PM -0800, Evan Green wrote:
> Sandeep, are you going to spin this series?

ping
