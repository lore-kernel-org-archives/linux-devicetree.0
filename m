Return-Path: <SRS0=QJws=63=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1818DC433E0
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 May 2020 16:04:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4DE0120659
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 May 2020 16:04:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kiSqRdlA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389530AbgEMQEr (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 13 May 2020 12:04:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389518AbgEMQEq (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 13 May 2020 12:04:46 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A267DC061A0E
        for <devicetree@vger.kernel.org>; Wed, 13 May 2020 09:04:46 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id w65so8177380pfc.12
        for <devicetree@vger.kernel.org>; Wed, 13 May 2020 09:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=hJ5N61sE10eRL4DM+W4UrbBWatlxhnPhuPfpeLbYAOQ=;
        b=kiSqRdlAm/boKLbWTfEN2X8+EBqRaSVdoXYv9kJa02YIgbVYXvRF+59+Yv2XHKo8qi
         rBrpN0s6yx2dUyuMJKbhVZsqeCS3FoA02wD+Ts7ytX9iEqVPDClUmPSGVU+683k46TMz
         FwKWxLWqerz5HCZCdfAGZbw6Lk+DW+F98PsFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=hJ5N61sE10eRL4DM+W4UrbBWatlxhnPhuPfpeLbYAOQ=;
        b=NWv8Qk18COgZgkO5B5evJnFHTSgGgkayYzr5RUSPQIeBsDWKSwq2vYHsN/LN+7vY5u
         MIafSQjGDsk6iO61a4V0LpfRPRqmF0Yys4gxHN0wETt1mLAYtSvY/GV7WtA69XpKuuAM
         oUL5ZVwqZkcHXLGeffP74buIdbNMhnmXlMMbSqCwC40tDU6gewm5GcKq6nw8QF+aNgL0
         +YNc5JgDUkGYXZaTMrkwBIoF01L7BfxnRRJmk9O65S2Lg+U7gOktoQMD3NpejUNOJxZP
         NMtvIbARgbuJEPWMoJYyltc5cRFYAtVMbx9VujstAD9YD/07lmQuB1OlrE98t/Eg/uOB
         bHIQ==
X-Gm-Message-State: AOAM532uDav1WrFnzpm48cEjEKNJdIc2EycP3rga3IEp6oXo7w1+Fb9M
        K409URkt7vx0CjCRk84ocKwMsQ==
X-Google-Smtp-Source: ABdhPJyPsTcFSIBk/DAHklhW1pcRIRaRaUU5QwbDE+nyHPm0ykX7G67oXsvcd4xplfYnljeDPtlE5w==
X-Received: by 2002:a62:7bcf:: with SMTP id w198mr44902pfc.226.1589385885999;
        Wed, 13 May 2020 09:04:45 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id h31sm16404422pjb.33.2020.05.13.09.04.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2020 09:04:45 -0700 (PDT)
Date:   Wed, 13 May 2020 09:04:43 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     "Sandeep Maheswaram (Temp)" <sanm@codeaurora.org>
Cc:     Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH v5 1/2] dt-bindings: usb: qcom,dwc3: Convert USB DWC3
 bindings
Message-ID: <20200513160443.GK4525@google.com>
References: <1585206368-685-1-git-send-email-sanm@codeaurora.org>
 <1585206368-685-2-git-send-email-sanm@codeaurora.org>
 <20200404171700.GA10096@bogus>
 <5e2eb0a4-ed70-4212-fc70-6ee850507a7e@codeaurora.org>
 <5793ea62-7a73-789e-33d6-6b2fb37b376c@codeaurora.org>
 <20200423193923.GK199755@google.com>
 <64ce118c-2a8d-e16c-eed1-49350c8b07bc@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <64ce118c-2a8d-e16c-eed1-49350c8b07bc@codeaurora.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Sandeep,

I would suggest to send v6 with the changes Rob and Stephen requested,
except for the 'assigned-clock-rate' constraints. A description instead
of the constraints is not ideal, but the constraints could be also be
added at a later time. Hopefully Rob can either ack with the description
or help to resolve the constraints issue.

Regards

Matthias

On Fri, May 08, 2020 at 11:52:52AM +0530, Sandeep Maheswaram (Temp) wrote:
> Hi Rob,
> 
> Any suggestions to solve this error in assigned-clock-rates
> 
> 
> Regards
> Sandeep
> 
> On 4/24/2020 1:09 AM, Matthias Kaehlcke wrote:
> > On Wed, Apr 15, 2020 at 02:23:29PM +0530, Sandeep Maheswaram (Temp) wrote:
> > > Hi Rob,
> > > 
> > > Any suggestions to solve this error in assigned-clock-rates
> > > On 4/6/2020 10:09 PM, Sandeep Maheswaram (Temp) wrote:
> > > > Hi Rob,
> > > > 
> > > > On 4/4/2020 10:47 PM, Rob Herring wrote:
> > > > > On Thu, Mar 26, 2020 at 12:36:07PM +0530, Sandeep Maheswaram wrote:
> > > > > > Convert USB DWC3 bindings to DT schema format using json-schema.
> > > > > > 
> > > > > > Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> > > > > > ---
> > > > > >    .../devicetree/bindings/usb/qcom,dwc3.txt          | 104
> > > > > > --------------
> > > > > >    .../devicetree/bindings/usb/qcom,dwc3.yaml         | 158
> > > > > > +++++++++++++++++++++
> > > > > >    2 files changed, 158 insertions(+), 104 deletions(-)
> > > > > >    delete mode 100644
> > > > > > Documentation/devicetree/bindings/usb/qcom,dwc3.txt
> > > > > >    create mode 100644
> > > > > > Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> > > > > > diff --git
> > > > > > a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> > > > > > b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> > > > > > new file mode 100644
> > > > > > index 0000000..0f69475
> > > > > > --- /dev/null
> > > > > > +++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> > ...
> > 
> > > > > > +    items:
> > > > > > +      - description: Must be 19.2MHz (19200000).
> > > > > Sounds like a constraint:
> > > > > 
> > > > > - const: 19200000
> > > > > 
> > > > > > +      - description: Must be >= 60 MHz in HS mode, >= 125 MHz
> > > > > > in SS mode.
> > > > > - minimum: 60000000
> > > > >     maximum: ?
> > > > Tried  as below but facing errors
> > > > 
> > > > assigned-clock-rates:
> > > >      items:
> > > >        - const: 19200000
> > > >        - minimum: 60000000
> > > >          maximum: 150000000
> > > > 
> > > > Errors
> > > > 
> > > > linux-next/Documentation/devicetree/bindings/usb/qcom,dwc3.example.dt.yaml:
> > > > usb@a6f8800: assigned-clock-rates: Additional items are not allowed
> > > > ([150000000] was unexpected)
> > > > linux-next/Documentation/devicetree/bindings/usb/qcom,dwc3.example.dt.yaml:
> > > > usb@a6f8800: assigned-clock-rates:0: [19200000] is too short
> > > > linux-next/Documentation/devicetree/bindings/usb/qcom,dwc3.example.dt.yaml:
> > > > usb@a6f8800: assigned-clock-rates: [[19200000], [150000000]] is too long
> > judging from the error messages my uneducated guess is that the above rules for
> > assigned-clock-rates expect a single tuple of two elements, not two tuples with
> > a single element, i.e.
> > 
> > assigned-clock-rates = <19200000, 150000000>;
> > 
> >    instead of
> > 
> > assigned-clock-rates = <19200000>, <150000000>;
> > 
> > I experimented a bit but couldn't find the magic incantation to appease the
> > schema deities.
> > 
> > Rob, could you please help to distentangle this?
> > 
> > Thanks
> > 
> > Matthias
> 
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
> 
