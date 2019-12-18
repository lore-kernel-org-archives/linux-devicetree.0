Return-Path: <SRS0=jmN2=2I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5412EC2D0CD
	for <linux-devicetree@archiver.kernel.org>; Wed, 18 Dec 2019 18:38:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2B144227BF
	for <linux-devicetree@archiver.kernel.org>; Wed, 18 Dec 2019 18:38:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="G5QCuHck"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727150AbfLRSiI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 18 Dec 2019 13:38:08 -0500
Received: from mail-io1-f66.google.com ([209.85.166.66]:42616 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727451AbfLRSiI (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 18 Dec 2019 13:38:08 -0500
Received: by mail-io1-f66.google.com with SMTP id n11so1504434iom.9
        for <devicetree@vger.kernel.org>; Wed, 18 Dec 2019 10:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=If9n9LWtZGwO9cBtHXPSqWrRQWL2H+dGPsSdvZ1Ke3s=;
        b=G5QCuHckZR+UYBlSuoqYvD3YazGZK1yBYvycKFSY3URC8LIyhCbIuej/Kaaffiq5L4
         92606OJK+TKfXSAfkh0FiaB3G5jt9UGQshpfDs2q+I944lz3SEdLnkj/Ub0mvoEu5dOO
         J/Rd18YDRIPIOTc4M8TImCc1kMLL8HN3M2P7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=If9n9LWtZGwO9cBtHXPSqWrRQWL2H+dGPsSdvZ1Ke3s=;
        b=j2B5xzVmj+PZK8ZgRY3/chKgAYfM1WCeCNNXhPPuHSKRjrobvaosFhMSRtDwgkwS7G
         1CpaGj6APtJDS7YVVzorO3EVSjfgPPZxxVTkhzoUaLWqQ54VuBnwNAVVsiVhg2OL6J8C
         8E73MkkXn14ZlmY8IFBI9xqAXt3BXmjA+zzrgEwHEcMNgJSNCLi7lcsUrhBW1JbUJhOQ
         CyXdsSA3+GPuzPEgAo/tSmbbWMkGW09XInVWjWpMCCjrGB+C71+05O1thJow04ZTy1tH
         s8cAvpEBnepR0aay6hGfEHGUkGEBD+AGOuUXlFwHktblngIghy/B/a08lW8hh+RATNTc
         ZwEA==
X-Gm-Message-State: APjAAAWBbutvn+a7/eiIxBXZggH+MJtJGrphB43jOdiQDaT2mEPqRdUS
        z6O1N3mBfXCyotsNJW6QIg+VXdLC1Gc=
X-Google-Smtp-Source: APXvYqwkoLLFfN/ZsEkZNbGZXPiarPzkSaQ4sU3qF1QRbDIL0u371NLCLQ6Hf87+e25oOr4Ir1xOVA==
X-Received: by 2002:a05:6602:2559:: with SMTP id j25mr647448ioe.263.1576694287172;
        Wed, 18 Dec 2019 10:38:07 -0800 (PST)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com. [209.85.166.42])
        by smtp.gmail.com with ESMTPSA id s5sm899982ilc.73.2019.12.18.10.38.05
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2019 10:38:05 -0800 (PST)
Received: by mail-io1-f42.google.com with SMTP id t26so3004313ioi.13
        for <devicetree@vger.kernel.org>; Wed, 18 Dec 2019 10:38:05 -0800 (PST)
X-Received: by 2002:a6b:b941:: with SMTP id j62mr2902869iof.168.1576694284957;
 Wed, 18 Dec 2019 10:38:04 -0800 (PST)
MIME-Version: 1.0
References: <1576474742-23409-1-git-send-email-sanm@codeaurora.org>
 <1576474742-23409-2-git-send-email-sanm@codeaurora.org> <CAD=FV=U48gdGHMbQ22M_59t6va2n41Zh1CDTqMJYpLCwiD35Mg@mail.gmail.com>
 <6d8c979f-daa3-3b40-f29c-cca5a2f8f1c8@codeaurora.org>
In-Reply-To: <6d8c979f-daa3-3b40-f29c-cca5a2f8f1c8@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 18 Dec 2019 10:37:53 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UER4zt=z3XWEzNt5v2oe8V=z6Hb-Wm-2BzuWtuHmYg-A@mail.gmail.com>
Message-ID: <CAD=FV=UER4zt=z3XWEzNt5v2oe8V=z6Hb-Wm-2BzuWtuHmYg-A@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: usb: qcom,dwc3: Convert USB DWC3 bindings
To:     "Sandeep Maheswaram (Temp)" <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-usb@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Wed, Dec 18, 2019 at 4:41 AM Sandeep Maheswaram (Temp)
<sanm@codeaurora.org> wrote:
> +  assigned-clock-rates:
> +    description:
> +      Should be 19.2MHz (19200000) for MOCK_UTMI_CLK
> +      >=125MHz (125000000) for MASTER_CLK in SS mode
> +      >=60MHz (60000000) for MASTER_CLK in HS mode
> +    maxItems: 2
>
> You can still express some limits here even if we don't go all out
> with the "oneOf".  AKA I think this is better:
>
> assigned-clock-rates:
>   items:
>     - const: 19200000
>     - minimum: 60000000
>       description: >= 60 MHz in HS mode, >= 125 MHz in SS mode
>
> Facing error when i add as above.
> properties:assigned-clock-rates: {'items': [{'const': 19200000}, {'minimum': 60000000}]} is not valid under any of the given schemas
> Documentation/devicetree/bindings/Makefile:12: recipe for target 'Documentation/devicetree/bindings/usb/qcom,dwc3.example.dts' failed

I couldn't figure it out either.  ...but at least this seemed to work
and is slightly better than what you have:

  assigned-clock-rates:
    items:
      - description: Must be 19.2MHz (19200000)
      - description: Must be >= 60 MHz in HS mode, >= 125 MHz in SS mode

So I'd say go with that.


-Doug
