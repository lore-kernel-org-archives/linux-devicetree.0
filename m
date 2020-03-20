Return-Path: <SRS0=WWXW=5F=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2FE0C4332B
	for <linux-devicetree@archiver.kernel.org>; Fri, 20 Mar 2020 13:28:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 723092076E
	for <linux-devicetree@archiver.kernel.org>; Fri, 20 Mar 2020 13:28:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nnqJ9jmy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727133AbgCTN2O (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 20 Mar 2020 09:28:14 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:52262 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727046AbgCTN2O (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 20 Mar 2020 09:28:14 -0400
Received: by mail-wm1-f66.google.com with SMTP id 11so6506503wmo.2
        for <devicetree@vger.kernel.org>; Fri, 20 Mar 2020 06:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=bbJaYLpxU8XXdc8d+5VShL8Kd/qrqFMok7iO4nMhIUA=;
        b=nnqJ9jmylnpMOjV2SiijEZbC7o669iynhXBc/AO4L1OCw1VTZErJ3AD0WHerUrBi+Z
         /s4C1ufnrubyuLM1GvaB22RhN0L0my0D4WFzrm6r2xndM5bpX6mSE5dn4AePQTn6hfmB
         svBJ8fPsL3ZenAbCcQpkTRL1kpKgAWuKsJ1gx+I2vxkzTohXkij5dZQnJb1F2BKpRixx
         6Ux11ExlA4cnx+f2WZD0TPt4RcRpua+6kicAD06u3j9LFYoIYnN+i56JNUzt6miJ/Y8C
         9I+KMUIHZuNLug63/94HmbDEXIgWrJhtlEuxAXU0NFOrgCFZqUnx+ZuvGJGHwGZLnOnd
         vWIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=bbJaYLpxU8XXdc8d+5VShL8Kd/qrqFMok7iO4nMhIUA=;
        b=Fu6PGRuBjEZaVhWFTV6eoqB0QmBDq/9d3Bl092ANJaP8OUgi47dmUz0nKj5hwc0nKP
         9uRizV09j9PmLU/e4A9/h0RksYdmY2nw8FU3DcOLcYQkG21qZizTuAMQmC7P1Mfq/xUk
         dMzuAc57Xe4AS2DSzaDH9biCtNsSjMvImVM0+zvtiH9dcl+Wdi2lT5h9GaZqWUkg6D0r
         rRRpBKlCx6N4oWtJvpXEM6VBf7XS3Wadfk6eOJYprN+ebqc9xcAIHXI23d0E/8Qq2/pk
         LCg19u1/woA2Rb/EVuPFk0KyfsdwdaSNpKSUTrV7oKzW0fyf2gCD3podO65lUtnPm8bL
         E4bw==
X-Gm-Message-State: ANhLgQ3k7Y3S196ZTpVCTajiqcdp+8KbMb2aLe409A5zlNTiMLH1I9EQ
        rpt9GYT5rZ3RXRd0VgRdsf4fQg==
X-Google-Smtp-Source: ADFU+vvMwyOeJ1bw+b6fHEvAIEyef46hTkIwvJkawUe8Y1M+n9FzyKHV88aLPaSsWHc1yabEAZvqYA==
X-Received: by 2002:a7b:c458:: with SMTP id l24mr10063577wmi.120.1584710892462;
        Fri, 20 Mar 2020 06:28:12 -0700 (PDT)
Received: from dell ([2.27.35.213])
        by smtp.gmail.com with ESMTPSA id x24sm7637493wmc.36.2020.03.20.06.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2020 06:28:11 -0700 (PDT)
Date:   Fri, 20 Mar 2020 13:28:57 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     mazziesaccount@gmail.com, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v2] dt-bindings: bd718x7: Yamlify and add BD71850
Message-ID: <20200320132857.GC5477@dell>
References: <20200320094233.GA30959@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200320094233.GA30959@localhost.localdomain>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, 20 Mar 2020, Matti Vaittinen wrote:

> Convert ROHM bd71837 and bd71847 PMIC binding text docs to yaml. Split
> the binding document to two separate documents (own documents for BD71837
> and BD71847) as they have different amount of regulators. This way we can
> better enforce the node name check for regulators. ROHM is also providing
> BD71850 - which is almost identical to BD71847 - main difference is some
> initial regulator states. The BD71850 can be driven by same driver and it
> has same buck/LDO setup as BD71847 - add it to BD71847 binding document and
> introduce compatible for it.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Acked-by: Mark Brown <broonie@kernel.org>
> ---
> 
> Hello Lee, Do you think you could take this in MFD? Rob and Mark have
> acked/reviewed this.
> 
> This is a resend of a resend of a resend of v2 - no changes other than rebasing.
> 
> changes since v1:
> - constrains to short and long presses.
> - reworded commit message to shorten a line exceeding 75 chars
> - added 'additionalProperties: false'
> - removed 'clock-names' from example node
> 
>  .../bindings/mfd/rohm,bd71837-pmic.txt        |  90 -------
>  .../bindings/mfd/rohm,bd71837-pmic.yaml       | 236 ++++++++++++++++++
>  .../bindings/mfd/rohm,bd71847-pmic.yaml       | 222 ++++++++++++++++
>  .../regulator/rohm,bd71837-regulator.txt      | 162 ------------
>  .../regulator/rohm,bd71837-regulator.yaml     | 103 ++++++++
>  .../regulator/rohm,bd71847-regulator.yaml     |  97 +++++++
>  6 files changed, 658 insertions(+), 252 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd71837-pmic.txt
>  create mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd71837-pmic.yaml
>  create mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd71847-pmic.yaml
>  delete mode 100644 Documentation/devicetree/bindings/regulator/rohm,bd71837-regulator.txt
>  create mode 100644 Documentation/devicetree/bindings/regulator/rohm,bd71837-regulator.yaml
>  create mode 100644 Documentation/devicetree/bindings/regulator/rohm,bd71847-regulator.yaml

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
