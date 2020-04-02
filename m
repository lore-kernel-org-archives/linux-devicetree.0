Return-Path: <SRS0=tl9x=5S=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB189C2BA12
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Apr 2020 22:56:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 804C02072E
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Apr 2020 22:56:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AWWeCU4h"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729549AbgDBW43 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 2 Apr 2020 18:56:29 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:45560 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387919AbgDBW43 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 2 Apr 2020 18:56:29 -0400
Received: by mail-vs1-f68.google.com with SMTP id x82so3697660vsc.12
        for <devicetree@vger.kernel.org>; Thu, 02 Apr 2020 15:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ok4wGTvzCTXydODevfiQEyG5yYpGPlaZ9o6pHHlLTpk=;
        b=AWWeCU4hDYBU+OF5Y1ceaY6RIGtjixFYMB6CHk1om2doQr/qKmzNCgXSJraZDzZfSR
         Q3KjibosDCnp2LuIKlLoDoqs0C+fmtZlLp/2UoNaSRGfDjVSvofs9p+Yl6XJbvxIbkoT
         blGSyQI2wo3Vm9+IiP6WpSEAODiHqUPilerQM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ok4wGTvzCTXydODevfiQEyG5yYpGPlaZ9o6pHHlLTpk=;
        b=f7BUjQVIAKvdrL7xMDbgiyVM6gNezQgyGUNhjLyqYjvT2bmpYmlCZzxplMJD+Twu2H
         3nwDBXNEUwSJg93hFGEA8fO+NTgW8XR9f/xGb3SOg0R3N/deAFqvhDEtSvaQuh4iEKtx
         +H49MLfdwhYRmP3C/pZaIE7dkv1bxNFmUChcDOpYIHPKA/Nl4COm1V2Q+MI+GuEnTlyx
         lDebu8B5ZDds0xa69KP3R40w/XJ17OdpL9b7tyyLu5OR3g2wgkpOeQcsiI3lQpkKs3fr
         J85E34hCalHcyc1RQQGGV5paYwmyC3w7JVDsM+dqRLpYpG10NKcMGAo1gNomciwVobq+
         Ratw==
X-Gm-Message-State: AGi0PuZxWnKEJ5jvL7N6U2KrI0SDBejwLkcbXQkSwloSsGdCgyqpzFH2
        08slCO3SQVeYs44+/+KVpwSqDAMGpww=
X-Google-Smtp-Source: APiQypIl9/dtqplFjZ0ma2M2XgqRy4r8gdHaq2jU/q/NhSRCux0LgmRp8BoKnffScHFUX1h7kscBlg==
X-Received: by 2002:a05:6102:116d:: with SMTP id k13mr4108726vsg.79.1585868187893;
        Thu, 02 Apr 2020 15:56:27 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id c16sm1661845vsq.18.2020.04.02.15.56.25
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2020 15:56:26 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id z125so3700148vsb.13
        for <devicetree@vger.kernel.org>; Thu, 02 Apr 2020 15:56:25 -0700 (PDT)
X-Received: by 2002:a67:1e46:: with SMTP id e67mr4469905vse.106.1585868185329;
 Thu, 02 Apr 2020 15:56:25 -0700 (PDT)
MIME-Version: 1.0
References: <CANcMJZCr646jav3h14K0xV=ANMxXg=U20wvSB546qrLX3TECBg@mail.gmail.com>
 <20200402223723.7150-1-john.stultz@linaro.org>
In-Reply-To: <20200402223723.7150-1-john.stultz@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 2 Apr 2020 15:56:14 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VGT75c4_ErQAJgNtcCd2Jzv0A2KpfEkS637GqOhamj9Q@mail.gmail.com>
Message-ID: <CAD=FV=VGT75c4_ErQAJgNtcCd2Jzv0A2KpfEkS637GqOhamj9Q@mail.gmail.com>
Subject: Re: [PATCH] phy: qcom-qusb2: Re add "qcom,sdm845-qusb2-phy" compat string
To:     John Stultz <john.stultz@linaro.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Thu, Apr 2, 2020 at 3:37 PM John Stultz <john.stultz@linaro.org> wrote:
>
> In commit 8fe75cd4cddf ("phy: qcom-qusb2: Add generic QUSB2 V2
> PHY support"), the change was made to add "qcom,qusb2-v2-phy"
> as a generic compat string. However the change also removed
> the "qcom,sdm845-qusb2-phy" compat string, which is documented
> in the binding and already in use.
>
> This patch re-adds the "qcom,sdm845-qusb2-phy" compat string
> which allows the driver to continue to work with existing dts
> entries such as found on the db845c.
>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Doug Anderson <dianders@chromium.org>
> Cc: Manu Gautam <mgautam@codeaurora.org>
> Cc: Sandeep Maheswaram <sanm@codeaurora.org>
> Cc: Matthias Kaehlcke <mka@chromium.org>
> Cc: Stephen Boyd <swboyd@chromium.org>
> Cc: Kishon Vijay Abraham I <kishon@ti.com>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Fixes: 8fe75cd4cddf ("phy: qcom-qusb2: Add generic QUSB2 V2 PHY support")
> Reported-by: YongQin Liu <yongqin.liu@linaro.org>
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qusb2.c | 3 +++
>  1 file changed, 3 insertions(+)

Do you have an out-of-tree dts file?  If not, I'd prefer that the fix
was for this patch to land instead:

https://lore.kernel.org/r/1583747589-17267-9-git-send-email-sanm@codeaurora.org

While we can land your patch if someone needs it for supporting an
out-of-tree dts, it gives people supporting future SoCs the idea that
they need to add themselves to this table too.  That's now discouraged
unless there's a specific quirk that needs to be handled just for this
SoC.

-Doug
