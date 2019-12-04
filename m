Return-Path: <SRS0=zDkl=Z2=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 359B6C43603
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Dec 2019 22:21:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 058512073C
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Dec 2019 22:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1575498108;
	bh=fsW26aMycBRY177JsvJe4tBpzShaxZImXYUauAILfBA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=ORKumvv6fD8ThNLlzw7EFqDYh3VbCxvWXRUd+a15oV/r5F2P33/T22ISeCZfG7HT6
	 qE2FR6gjGvopWLA8JblbxW+Ho5ZU5X3HPriXTEM5qvJD1POLOnSYvvl8qr9cJvb7ty
	 YsgPUgYNusPldZ1LtgVGp00WbdoUf1qVLzAjETYg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728053AbfLDWVr (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 4 Dec 2019 17:21:47 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:41598 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727989AbfLDWVr (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 4 Dec 2019 17:21:47 -0500
Received: by mail-oi1-f193.google.com with SMTP id i1so793042oie.8;
        Wed, 04 Dec 2019 14:21:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0YMXPK0MWLWyfIyxG2mVwtUXfMBfXzC4dJTyDwiUSCI=;
        b=EsvFcgw+93ewHXAgf2a+xrCmFjfD1lHaL2vFNhL4VhLs9NlMsNqkU+fx3qANdzhuUN
         FWkyRIdSZUgsXRD0nj12/zucWRIGCp3/U+atoHtH7NszlS6U5YZx2ydh9vm8VD7Imx3t
         MolPCt7Xewu/VH1jMlmj2UqZg6wkHNmHK+uemZjKkljFnhIUjdrDnGXD6Pr6ycJSpljF
         S2el8wZCjtnhI8U0jwhyH47mc18PouiUNtACc/fhWPgX5O6j/m5orKsi11rF+5FS6Zgh
         LlgW2zqa+DJM2ArDisLSwZiTpL+n1xsrwm+kLJoBwKoo8SYYATU0M/hL2RIbxFrEw4sx
         tmDA==
X-Gm-Message-State: APjAAAXou1Z1aekDg0A0GhllmeFD+tqqnBtFWE6UIRgUjyyLSu/KmYub
        FG4/ILFojb2jU9VpC9CLBqozyys=
X-Google-Smtp-Source: APXvYqxd6OOdNmobqARjtlfaN0LLudPr5TKfnJ4uyLbrkH6cblTCYO0/yUZjNuu/J1TAHun4I2prDQ==
X-Received: by 2002:aca:d5d3:: with SMTP id m202mr4421120oig.161.1575498106026;
        Wed, 04 Dec 2019 14:21:46 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y24sm2784605oix.31.2019.12.04.14.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2019 14:21:45 -0800 (PST)
Date:   Wed, 4 Dec 2019 16:21:44 -0600
From:   Rob Herring <robh@kernel.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@st.com>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Fabien Dessenne <fabien.dessenne@st.com>,
        Arnaud Pouliquen <arnaud.pouliquen@st.com>
Subject: Re: [PATCH] dt-bindings: remoteproc: stm32: add wakeup-source
 property
Message-ID: <20191204222144.GA25718@bogus>
References: <20191122125402.14730-1-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191122125402.14730-1-arnaud.pouliquen@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, 22 Nov 2019 13:54:02 +0100, Arnaud Pouliquen wrote:
> If the optional wdg interrupt is defined, then this property
> may be defined.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> ---
> This commit is related to the merge conflict issue reported by
> Stephen Rothwell: https://lkml.org/lkml/2019/11/21/1168
> ---
>  .../devicetree/bindings/remoteproc/st,stm32-rproc.yaml          | 2 ++
>  1 file changed, 2 insertions(+)
> 

Applied, thanks.

Rob
