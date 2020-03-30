Return-Path: <SRS0=ov7W=5P=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC723C2D0F1
	for <linux-devicetree@archiver.kernel.org>; Mon, 30 Mar 2020 22:11:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8929D206CC
	for <linux-devicetree@archiver.kernel.org>; Mon, 30 Mar 2020 22:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1585606273;
	bh=90QKeBB1aA40obi1FEhqunDp8JA5qxdE/g/4O1kAJkk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=1DkLA5i8EgUj5Ikr12Ch5ZD08TL/W6/ngO+/y+OYzUd6QmIjfGBfRkL8wTiEynngN
	 rcriRZRdQu+n+ARkDL2rgI2f7PK08v9JlolsPW8SB+NjJe3fWStLc8TAU78cC4G2Pm
	 WW45q9q+0oolkZAhj+P7xd+3L4WRUloVe2xzMYLU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729139AbgC3WLN (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 30 Mar 2020 18:11:13 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:42025 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728987AbgC3WLM (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 30 Mar 2020 18:11:12 -0400
Received: by mail-il1-f193.google.com with SMTP id f16so17474886ilj.9;
        Mon, 30 Mar 2020 15:11:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Gej1ukEzef5kQg6YLiAXZ8FMZy3ON+jYs0LTpdTxAeY=;
        b=ddg+Dm6XumBz1m9+finNz4C1UgrC54HxxnhC5tVQMIUTFodpo61/rUPWMF3FRZjBP1
         uxYzrwePYzA3gxG358CgRwQHf7tT2wTFC39Pa3wfhoWbGCLu5DXmgb4figX4wxgD5xb6
         Zkox7eI8U3i6oeITt438k0ioDnrQNvfTzD+dUm0CXC+8f/uTLJv6cA615qmyvTwgnt15
         XyRrsCDFVDllvbneXLEBmOYBiBO96JPfNpUK0jsDlT8Ong8b792JwLoSORkaLIIsZnfZ
         2WmlFOmCKl9MnJqo3K90exa2zbUITldd3H9i4Qy7G9nW3JoMN7klSi86Z0IoTQY0P6mQ
         DqYw==
X-Gm-Message-State: ANhLgQ3GkeQj88LxJiJV5bSbPESsf2vHYDuJAdT11RtK4p0rbLOeT3Ul
        gmv/gvMIgvltVvfpkmDPjg==
X-Google-Smtp-Source: ADFU+vseMwBWRiWNnvqHDls55gkMPjZLcdFN53VAHUJfvtwLdCe+R59lZx97hWKbGwQtot2UEN0jmg==
X-Received: by 2002:a92:7a0d:: with SMTP id v13mr14199608ilc.175.1585606271334;
        Mon, 30 Mar 2020 15:11:11 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id z20sm4498542ioj.4.2020.03.30.15.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2020 15:11:09 -0700 (PDT)
Received: (nullmailer pid 17820 invoked by uid 1000);
        Mon, 30 Mar 2020 22:11:06 -0000
Date:   Mon, 30 Mar 2020 16:11:06 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org, joro@8bytes.org,
        robin.murphy@arm.com, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-remoteproc@vger.kernel.org,
        ohad@wizery.com, agross@kernel.org, dianders@chromium.org,
        Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: remoteproc: qcom: Add iommus property
Message-ID: <20200330221106.GA17769@bogus>
References: <20200317150910.26053-1-sibis@codeaurora.org>
 <20200317150910.26053-2-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200317150910.26053-2-sibis@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, 17 Mar 2020 20:39:08 +0530, Sibi Sankar wrote:
> Add iommus property to allow Q6 modem to boot on platforms which do
> not have trustZone.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
