Return-Path: <SRS0=dlvX=AH=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49A45C433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 26 Jun 2020 21:47:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 294E7208C7
	for <linux-devicetree@archiver.kernel.org>; Fri, 26 Jun 2020 21:47:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aW00ncwV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725828AbgFZVrL (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 26 Jun 2020 17:47:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725793AbgFZVrK (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 26 Jun 2020 17:47:10 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92D63C03E97A
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2020 14:47:10 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id l4so194591vsn.5
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2020 14:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BsR9lAG+ZKuy6S8tfE5+62W+cUzuqeg+ojLakVbeNYo=;
        b=aW00ncwVrcFV+2yTbdUmjoHXoVq4ATu+p9+xi+f1wlmnSA3NL8Ks8YkMfmRkVBWGLZ
         02PcNswuAkpSMd44gS8TChs3zBAVbgAFB6uEGkbIUu3+G5AAlccy/7OvRLdg8NSfD9N3
         sC4WFjH+XU40hw38qYpX+hFt0NnxA4nNWRHYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BsR9lAG+ZKuy6S8tfE5+62W+cUzuqeg+ojLakVbeNYo=;
        b=t60M1Z0xSNXfdHBSOtdMWOLyU0mEsOCEpJx21HQgPmw6AesnRXfW82w8GFzQ+dZQ+8
         /Dh3G0xAFtiVJySM7IJuh8qD8DYroUwIsWOTpcJpCzfWe1uPx+E2FY3s78jgtrxiYUKP
         lGXh8ABAvkoxVu5UjjCdGleheirRPlicJKjc1xhAZinVD68DSC9sDZHC5WOcY+UlJ6D+
         goZKWbgNY0njSDu/0Z1rcV6sp0qpweKRXOaS0af+3UcaNryvsW0R1O/Cl7YUJzPawV2E
         7XyyUgUc3Hfce5qLJv8XuBRTatGIlI0Gdkq+pDaapbH3XGI6XxDgeunsszoiEfQyvu8D
         XBiQ==
X-Gm-Message-State: AOAM533/Ek0Bk7j6w/Nh+sLn3AvswcEn3UHeIZ4SE8mz7ZuZARum5pOB
        IspnO7Rj9FyYqHyComS/PzYrFm1N3c4=
X-Google-Smtp-Source: ABdhPJwqHlY89VwgDStfzLP2cU31Neq7JOKVEcdYCEw1QtkZtOgsfMQOuW9XRenfgCDNJkd79n9nfA==
X-Received: by 2002:a67:8e02:: with SMTP id q2mr4250597vsd.108.1593208029535;
        Fri, 26 Jun 2020 14:47:09 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id d200sm2858266vkd.16.2020.06.26.14.47.08
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2020 14:47:08 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id i15so3491625uah.13
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2020 14:47:08 -0700 (PDT)
X-Received: by 2002:ab0:29c1:: with SMTP id i1mr4041837uaq.120.1593208028348;
 Fri, 26 Jun 2020 14:47:08 -0700 (PDT)
MIME-Version: 1.0
References: <1593194502-13164-1-git-send-email-pillair@codeaurora.org> <1593194502-13164-2-git-send-email-pillair@codeaurora.org>
In-Reply-To: <1593194502-13164-2-git-send-email-pillair@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 26 Jun 2020 14:46:57 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X+v1TpZQPBZNV_Azt8J=0ZJw+XGJhLbnBxaZJGCCPwVg@mail.gmail.com>
Message-ID: <CAD=FV=X+v1TpZQPBZNV_Azt8J=0ZJw+XGJhLbnBxaZJGCCPwVg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt: bindings: Add new regulator as optional property
 for WCN3990
To:     Rakesh Pillai <pillair@codeaurora.org>,
        Kalle Valo <kvalo@codeaurora.org>
Cc:     ath10k@lists.infradead.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-wireless <linux-wireless@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Fri, Jun 26, 2020 at 11:02 AM Rakesh Pillai <pillair@codeaurora.org> wrote:
>
> Add an additional regulator supply as an optional
> property for WCN3990.
>
> Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.1-01040-QCAHLSWMTPLZ-1
>
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Overall though: aren't you missing a whole lot of CCs?  Have you tried
using get_maintainer?


> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> index 65ee68e..b7188d3 100644
> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> @@ -65,7 +65,8 @@ Optional properties:
>                                      the length can vary between hw versions.
>  - <supply-name>-supply: handle to the regulator device tree node
>                            optional "supply-name" are "vdd-0.8-cx-mx",
> -                          "vdd-1.8-xo", "vdd-1.3-rfa" and "vdd-3.3-ch0".
> +                          "vdd-1.8-xo", "vdd-1.3-rfa", "vdd-3.3-ch0"
> +                          and "vdd-3.3-ch1".

nit that could probably be fixed by maintainer when applying: missing
comma at the end of "vdd-3.3-ch0"

I will also note that this file is in dire need of being converted to
yaml.  Pretty soon I think people are going to start disallowing
changes to the bindings that haven't been converted to yaml so you
probably want to get a jump start on it so future patches aren't
stalled.

In any case:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
