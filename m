Return-Path: <SRS0=r6ca=Y6=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9161C5DF62
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 Nov 2019 03:38:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9EF242077B
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 Nov 2019 03:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573011499;
	bh=msiF3FePTtHWabHN5NMihI6DIc6NefZ+aAfsw7bB5fg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=EdxN/Rh1IxcbsWD/TdorOJSDCJRhzj8Dpm0crXmCS/00WkaC7e6Bb3HhV5lSsKr90
	 Y3jrfPd11xTSZ4v4jlnlEdwRV+VqoPGm8chxkEuqIoZQTOS/MAlG8iMnQc6JITPQJ7
	 DfNjq9YcYzl1/mS+c605wHowHIffLG5nmonsI93k=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726368AbfKFDiT (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 5 Nov 2019 22:38:19 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:41840 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725768AbfKFDiT (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 5 Nov 2019 22:38:19 -0500
Received: by mail-oi1-f194.google.com with SMTP id e9so15814912oif.8
        for <devicetree@vger.kernel.org>; Tue, 05 Nov 2019 19:38:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zYoJtXViZUkrmaEjzeRuN7ipxhnFw6iV8oL8qz3KPME=;
        b=O8nBXf0WaCqwJKwu0UINqmV32jb7dGF7mBH0mwEWUXxEfnxKiZ/a2meyJSKzx8A/EJ
         WlmSeu0lvGAswE+y/rnJLG4uIYElszodtEtq7olrShP5qR4YhXKq6Gn0JEIuLijEyUn1
         ZMQxC58/9hpoDM3efTIyDeBwPWfHhWj4v/jR6yY141lZky6NFmejVNEGnHmf1w8wDPj4
         6MZ1XAYzboJGL2m7da/2piPy/8rd25rxBt9ChNS7SHbiDFpfPDibjvkZXW7RzAmsVXwV
         s9OMYERjZmmAfdQoNr3ryGc2jF+pY59zKRHcTOulOUUH4e6m9lM5dnX/FzvVhyd3GwSV
         H0jg==
X-Gm-Message-State: APjAAAXa6TjmTrFhUunKfYkICPuGlVSXACPVdzkto4RBac9zQRsyritV
        XCtIiqP0OmsuUHk49ay2bQ==
X-Google-Smtp-Source: APXvYqxEujDFblVonVJq+omcN2s8+na+HgO9Kbj1fM7xCNkKHEaFSDDc151GZOAvsomjXgf08bEb7A==
X-Received: by 2002:a05:6808:1cf:: with SMTP id x15mr316386oic.147.1573011497988;
        Tue, 05 Nov 2019 19:38:17 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id q28sm6752977otc.77.2019.11.05.19.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 19:38:17 -0800 (PST)
Date:   Tue, 5 Nov 2019 21:38:16 -0600
From:   Rob Herring <robh@kernel.org>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Mark Brown <broonie@kernel.org>,
        Linux-ALSA <alsa-devel@alsa-project.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] ASoC: fsi: switch to yaml base Documentation
Message-ID: <20191106033816.GA6124@bogus>
References: <878sp4jaqy.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878sp4jaqy.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 29 Oct 2019 16:01:41 +0900, Kuninori Morimoto wrote:
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> This patch switches from .txt base to .yaml base Document for FSI.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  .../devicetree/bindings/sound/renesas,fsi.txt      | 31 ---------
>  .../devicetree/bindings/sound/renesas,fsi.yaml     | 76 ++++++++++++++++++++++
>  2 files changed, 76 insertions(+), 31 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/renesas,fsi.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/renesas,fsi.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
