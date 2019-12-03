Return-Path: <SRS0=0idb=ZZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD2BEC432C3
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 19:34:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8BCD7206DF
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 19:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1575401664;
	bh=BYlj+xxTswXgpngVeRi8/BN57naFYBtGbL2kahcQmQE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=yVJtKkvu48KiyDs7uaXJyjuwXpl8wQ6Jy0f/V5z5Mg3OtV49pBpNLIrqSye1zsl0q
	 fC1OMbd6QRVjmEHvuoOeL0AeHC3T3ib8TOe7ByadzqVTspGME2lx6mMtSA/Eldqooi
	 K0hL4na0YjhoaMVCOpY3YoKfFFd49ZOLzSUM5jV4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726079AbfLCTeY (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 3 Dec 2019 14:34:24 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:44898 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727425AbfLCTeX (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 3 Dec 2019 14:34:23 -0500
Received: by mail-oi1-f194.google.com with SMTP id d62so4398100oia.11;
        Tue, 03 Dec 2019 11:34:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tbKbNs/QxN6CUOXQECRFOajifnmUQFCmQwKvQGjgzLo=;
        b=o6904U3eZpx6OI2GgGgORH/+TsTEvQkuXm8wc585nSCabrCg0cN8yWxJoEidkV12KZ
         40NxTaI9eo5ufVfqpkTN6W/ymV0JntnhgLV8ZADpa1s9mlmDgLoo8+Y38hpDzzcxdGla
         wR3z5OSDJjOrWOCwieMybaFYgzBv8fFBzB6PGAi8XeBM91V9PJjlHUHwxejbFNLJGWnM
         ptRBEuFdBRrze199+tssGzxlf/b6pnQlRdegoKIZaScZncMJxUOLn0oi8NAVWhkNBHYt
         ZnkgkapJ2At1HyrpxcdJS2MTsVAIp0KQwJkGd0uncj5drkwr6X5LptEFhEdjPzGRG5jM
         gyQw==
X-Gm-Message-State: APjAAAXpZmo1nDoZqzIDr7dAjTdnO4p2sQcrOZzECp0P+uQJsEDl146T
        l6btuScmyqYqEd8QsauYMQ==
X-Google-Smtp-Source: APXvYqyw232/T6H5ODTFMuTpyZYHJTvhh9c8wpRDE/gcQmFOcRYpXENohq6/itN4aQZWeDKKRk2v6A==
X-Received: by 2002:a05:6808:9a1:: with SMTP id e1mr5184706oig.175.1575401662862;
        Tue, 03 Dec 2019 11:34:22 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id m2sm1436432oim.13.2019.12.03.11.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2019 11:34:22 -0800 (PST)
Date:   Tue, 3 Dec 2019 13:34:21 -0600
From:   Rob Herring <robh@kernel.org>
To:     Al Cooper <alcooperx@gmail.com>
Cc:     linux-kernel@vger.kernel.org, Al Cooper <alcooperx@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-kernel@lists.infradead.org,
        Mark Rutland <mark.rutland@arm.com>,
        Srinath Mannam <srinath.mannam@broadcom.com>
Subject: Re: [PATCH v2 06/13] dt-bindings: Add Broadcom STB USB PHY binding
 document
Message-ID: <20191203193421.GA9078@bogus>
References: <20191115184223.41504-1-alcooperx@gmail.com>
 <20191115184223.41504-7-alcooperx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191115184223.41504-7-alcooperx@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, 15 Nov 2019 13:42:16 -0500, Al Cooper wrote:
> Add support for bcm7216 and bcm7211
> 
> Signed-off-by: Al Cooper <alcooperx@gmail.com>
> ---
>  .../bindings/phy/brcm,brcmstb-usb-phy.txt     | 69 +++++++++++++++----
>  1 file changed, 56 insertions(+), 13 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
