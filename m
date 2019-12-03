Return-Path: <SRS0=0idb=ZZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B91BC432C0
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 21:38:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 34E712073B
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 21:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1575409114;
	bh=Jt1nPrBpkR8U25wOUT5CXQkfBcFrkXFM2Wlg8ITENFE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=XLQPoRCGPVOPiN2J1tua1id51MrkQIRufitnL5nR9HIxMnsrwln0EtGu6N9KVqxor
	 UnvoMvgWjnjLd3oaXyt5SSbqroaLpe2G8rxX0/el8ZdUuGvE42ONNHWg53onCC4Hnk
	 19gYhItFVs3E2b3Ui8MUwRLd6L0XFW+lSox4CZPk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727457AbfLCVid (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 3 Dec 2019 16:38:33 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:35296 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727430AbfLCVid (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 3 Dec 2019 16:38:33 -0500
Received: by mail-oi1-f193.google.com with SMTP id k196so4844637oib.2
        for <devicetree@vger.kernel.org>; Tue, 03 Dec 2019 13:38:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+da6B0jmMyrdi3GDw/H4jStaTbThsKFt1wFsD48o1f0=;
        b=NwX04pRX7pWLQ80Y+jrIOTta2Auea1BjgXlKc4x1ntDTt0mJBqg0g1WzNr2D1Ceokz
         yUgoTBiQiISlv70RlP0gVTOowxAZSos/1BHRwRcC2JdmKEH6Hshgc4CgmkOCcubgCo2S
         qskIPT/Z9I8+dF7FHMhKGselgmz3R7zIzZBoi1TqrVHFYgGRhCDehKjb7AnelESCD05U
         GcZp/+JcmGT7s09BKzKFFKy5jwc/Vp6F/BEUukNSAPhnVHagk+4Sjvr5WxIyTvuALp0U
         SNYCnsXhU7BZqRQbn1dwlpfh2+Aon8i/7KzEiDRtE3yiok81qed2DoEPry8F/mj8pbrG
         bJVw==
X-Gm-Message-State: APjAAAXlyBGKxdQDx2oBS+LwKZOWtkE8o+jto2HBoGPUqxJBsuJBa/O2
        HAh2vYTf20cCaxlUlupQcQ==
X-Google-Smtp-Source: APXvYqwiKFzIGyg2XnZep58aEU+/D3z1Ps19/TvwlP1+rXM117+CqKroFVFWg6WMidvSdTwId+pGDw==
X-Received: by 2002:a05:6808:b18:: with SMTP id s24mr70968oij.31.1575409112895;
        Tue, 03 Dec 2019 13:38:32 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 47sm1496199otf.54.2019.12.03.13.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2019 13:38:32 -0800 (PST)
Date:   Tue, 3 Dec 2019 15:38:31 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dong Aisheng <aisheng.dong@nxp.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        dongas86@gmail.com, kernel@pengutronix.de, shawnguo@kernel.org,
        linux-imx@nxp.com
Subject: Re: [PATCH 1/3] dt-bindings: mmc: fsl-imx-esdhc: add imx8qm
 compatible string
Message-ID: <20191203213831.GA19512@bogus>
References: <1573995530-14573-1-git-send-email-aisheng.dong@nxp.com>
 <20191203193437.GA9654@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191203193437.GA9654@bogus>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Dec 03, 2019 at 01:34:37PM -0600, Rob Herring wrote:
> On Sun, 17 Nov 2019 20:58:48 +0800, Dong Aisheng wrote:
> > Add imx8qm compatible string.
> > 
> > Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> > ---
> >  Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.txt | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> 
> Acked-by: Rob Herring <robh@kernel.org>

I guess since only Cc'ed to me, you want me to apply. So I have.

Rob
