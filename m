Return-Path: <SRS0=XaEl=A3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E83FAC433E1
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jul 2020 19:24:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BC9DB2074B
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jul 2020 19:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594927495;
	bh=g4AlLsuVvnaAv6YKDeOzrIPXYOX/gRoXUfEGILBDLP8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=VmSDQGdC/WEgizEAR8NxzAnF+52wor8CneXPM5eqL8/H7S8kBZirUsQaJ87N7QncK
	 dD1SrjiMq1Fu+gsy8MHYWiQm3X5+6ypESBn3sDzmBJzyqR+hwB6E6bGSZiMjq1+w97
	 Qml2TXJAZO8A9kZmDh4nz64qPsB+7ctWCEoYxHCg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729136AbgGPTYz (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Jul 2020 15:24:55 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:36500 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728788AbgGPTYz (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 16 Jul 2020 15:24:55 -0400
Received: by mail-io1-f65.google.com with SMTP id y2so7263781ioy.3;
        Thu, 16 Jul 2020 12:24:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fqIIt2FaEzVEayUbwq9mftLIMcW2zYTtnZ5OVri9Dh0=;
        b=g6cwOhoL8WXzP9LMbsXVCDKNbTaO1x6Zz8fwt2aQ13Tc4S1SZNufJRWiZXos9GNB0j
         qQa/yfmX8vLyacvZjV7qvWAAtb72CJ0MEmxtgIURjLrO44VLpJEUo2nvYhAGpGO92tLG
         xJhMbIGtsSWODQG/sQa5rID8BAnlrtY7N8YLvo3C0hJwvwAdisVylvuRMsMeUXm2DeDD
         FdwyS534DFCsToK+mlZIVd2pTVNJQ/13PXA0LzJOh+iWWQkg6phVQJsztsNM93dROJNx
         yE+iODSSdC1Xs1YhEXqey76rIdzDiw7z/lrkdvOrAv1sGjpy5sUXgd7xitD1WnP14rq5
         WXbg==
X-Gm-Message-State: AOAM532anIEsgGaBA632PTHlX0vdfuVrB4zR2bfSxrXFXGCo+rZ3pYZ9
        5xwovAb0sQ44XQsYHW8XjQ==
X-Google-Smtp-Source: ABdhPJx3vjYXOYDEqcmC6qufmiQ19b+sBDpjjIfctsp1sTzarUVj/7pFcLH5uwwo3iYmhB30ZbjW7w==
X-Received: by 2002:a02:b81a:: with SMTP id o26mr6534437jam.41.1594927494418;
        Thu, 16 Jul 2020 12:24:54 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id a11sm3342231iow.26.2020.07.16.12.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 12:24:53 -0700 (PDT)
Received: (nullmailer pid 2701471 invoked by uid 1000);
        Thu, 16 Jul 2020 19:24:52 -0000
Date:   Thu, 16 Jul 2020 13:24:52 -0600
From:   Rob Herring <robh@kernel.org>
To:     Philippe Schenker <philippe.schenker@toradex.com>
Cc:     devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        Peter Chen <Peter.Chen@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: usb: ci-hdrc-usb2: add property
 disable-runtime-pm
Message-ID: <20200716192452.GA2699629@bogus>
References: <20200714151822.250783-1-philippe.schenker@toradex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200714151822.250783-1-philippe.schenker@toradex.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Jul 14, 2020 at 05:18:20PM +0200, Philippe Schenker wrote:
> Chipidea depends on some hardware signals to be there in order
> for runtime-pm to work well. Add the possibility to disable runtime
> power management that is necessary for certain boards.

This is why we have SoC specific compatible strings. Use that.

> 
> Signed-off-by: Philippe Schenker <philippe.schenker@toradex.com>
> ---
> 
> Changes in v2: None
> 
>  Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
> index 51376cbe5f3d..67a31df13e69 100644
> --- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
> +++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
> @@ -90,6 +90,7 @@ Optional properties:
>    case, the "idle" state needs to pull down the data and strobe pin
>    and the "active" state needs to pull up the strobe pin.
>  - pinctrl-n: alternate pin modes
> +- disable-runtime-pm: This disables the runtime power management.

This is a Linux feature, not h/w description or config.

>  
>  i.mx specific properties
>  - fsl,usbmisc: phandler of non-core register device, with one
> -- 
> 2.27.0
> 
