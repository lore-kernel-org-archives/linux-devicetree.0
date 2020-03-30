Return-Path: <SRS0=ov7W=5P=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A598C2D0E5
	for <linux-devicetree@archiver.kernel.org>; Mon, 30 Mar 2020 16:46:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 21CE32072E
	for <linux-devicetree@archiver.kernel.org>; Mon, 30 Mar 2020 16:46:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura-hr.20150623.gappssmtp.com header.i=@sartura-hr.20150623.gappssmtp.com header.b="SVW0nrw9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729424AbgC3Qqx (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 30 Mar 2020 12:46:53 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:46040 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727779AbgC3Qqw (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 30 Mar 2020 12:46:52 -0400
Received: by mail-oi1-f195.google.com with SMTP id l22so16201298oii.12
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2020 09:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DPz9gtxpMPf6tArK7MvaaRJYhPzPBkxkpKB6SAn10yM=;
        b=SVW0nrw9OU8xTC4JiaLDCppad8ywA6MOGUwE5c83bNflZhIs+9J4qyevvQWlZlmS4C
         ezl2EmbERzSzOcNNtg+HcjH3TRtM2Wfm8jWsShVPektGOLBqAu+8Zt01eYM2z7AeOZyg
         qvcTemzaAxTjscS6yAaY6j3kX0S5B7Z0JiGW2sxNi6rdu6GBm5r9X1ZWRx43RPO+5s6b
         nSYhh8Qvtcxv1xGir1hh/u6+sH2GEEwHYM/LCGD6awSNFWq76itiMT3PG2angx6rRXJq
         crw4daFNWy8RgJq5YMiy6NIUvW6x90mKIh7OfPkhsBzOAHRFzQY791dg6zOtuUnWFJJi
         ivTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DPz9gtxpMPf6tArK7MvaaRJYhPzPBkxkpKB6SAn10yM=;
        b=RVbrbPQIK52JSmSA1gbQuDvNMbVH0tdhxRJGn5yVe053aNY2/lRhh0YwP0AZt/XnsY
         2dM+nf5j+6fxSG4aUN5OcDUY6TTPUPds1D5Iy/XSbgraBSKuzwRmsIBN+kgJkDMxgy06
         fxAmV25IGga4UiyQuHxl4slWPXGLIcHTt6HBTtXUPLw4GNRwiRDXEWl5HNQwxvzKWMlI
         UReyKk0NgwNSsz4kYcQnFinF9j2r5T/PWS+074oG4j/xZPmjdcaiPO4NY0KpJA2PQ+X4
         XYXZGHyeU5jebDxEYXWHvxvmiGx3YPmDGJDW4u9D9ZRoowaEBuAEJ/i0tXm/ASpkPKYV
         wiOQ==
X-Gm-Message-State: ANhLgQ3Z2lf5XPm2OiyMCwdla93yagK4YAbs6MVtYyciAV14qq025haW
        kkg4yHf0dawIxHCFzkelg1piRetYyvCqivEObW1MoQ==
X-Google-Smtp-Source: ADFU+vtUGsmlN2XFYfF62TaUwNUzBJOISRq1oEeqlaCLbMM2tYHWk9/YylsjgI6dk9sJqFOq4w9ceQfS1SA8m2ByZbA=
X-Received: by 2002:aca:4d86:: with SMTP id a128mr182032oib.96.1585586811745;
 Mon, 30 Mar 2020 09:46:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200328135345.695622-1-robert.marko@sartura.hr>
 <20200328135345.695622-2-robert.marko@sartura.hr> <20200330154056.GA22114@bogus>
In-Reply-To: <20200330154056.GA22114@bogus>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Mon, 30 Mar 2020 18:46:40 +0200
Message-ID: <CA+HBbNEBCK_TfMRuKC71-dw1Wcir+43LK4ahAi9F_3kMosWJsQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] dt-bindings: phy-qcom-ipq4019-usb: add binding document
To:     Rob Herring <robh@kernel.org>
Cc:     agross@kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
        kishon@ti.com, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, John Crispin <john@phrozen.org>,
        Luka Perkov <luka.perkov@sartura.hr>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Mar 30, 2020 at 5:40 PM Rob Herring <robh@kernel.org> wrote:
>
> On Sat, 28 Mar 2020 14:53:49 +0100, Robert Marko wrote:
> > This patch adds the binding documentation for the HS/SS USB PHY found
> > inside Qualcom Dakota SoCs.
> >
> > Signed-off-by: John Crispin <john@phrozen.org>
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > Cc: Luka Perkov <luka.perkov@sartura.hr>
> > ---
> >  .../bindings/phy/qcom-usb-ipq4019-phy.yaml    | 45 +++++++++++++++++++
> >  1 file changed, 45 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/phy/qcom-usb-ipq4019-phy.yaml
> >
>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> Documentation/devicetree/bindings/phy/qcom-usb-ipq4019-phy.yaml:  while scanning a block scalar
>   in "<unicode string>", line 37, column 5
> found a tab character where an indentation space is expected
>   in "<unicode string>", line 39, column 1
> Documentation/devicetree/bindings/Makefile:12: recipe for target 'Documentation/devicetree/bindings/phy/qcom-usb-ipq4019-phy.example.dts' failed
> make[1]: *** [Documentation/devicetree/bindings/phy/qcom-usb-ipq4019-phy.example.dts] Error 1
> make[1]: *** Waiting for unfinished jobs....
> warning: no schema found in file: Documentation/devicetree/bindings/phy/qcom-usb-ipq4019-phy.yaml
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/qcom-usb-ipq4019-phy.yaml: ignoring, error parsing file
> Makefile:1262: recipe for target 'dt_binding_check' failed
> make: *** [dt_binding_check] Error 2
>
> See https://patchwork.ozlabs.org/patch/1263219
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure dt-schema is up to date:
>
> pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade
>
> Please check and re-submit.

Thanks,

I fixed it and pushed v5.

Cheers
Robert
