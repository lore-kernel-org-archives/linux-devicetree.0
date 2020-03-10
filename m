Return-Path: <SRS0=JrLZ=43=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08453C10F27
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 18:37:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CE0FD21D7E
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 18:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1583865424;
	bh=lQVDNAcoZQ4EJkgGU5nsh1fGHECAljWHdyCdNwQZXYw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=zwO4S8Wm3Z14/SmKF3N4lOTgK5Lkrw/BSOEtJprTGyDiXxtJgDxtK/+jM58Qzap+j
	 P7RUOooHq06d9Sbsxy/Cf1gzNpvQDFU9948gohAoHcio9pS8Zy061OBTCOqOyKXxbV
	 4SBUrU8deAUj52Xa+ArYShKBi+/T7xt0PNgk9qow=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727211AbgCJShE (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 10 Mar 2020 14:37:04 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:35818 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726283AbgCJShE (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 10 Mar 2020 14:37:04 -0400
Received: by mail-ot1-f65.google.com with SMTP id k26so6934407otr.2;
        Tue, 10 Mar 2020 11:37:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=yStf7f/XsnJEmzaviqACodDn91793Tn9vezKk0BWl5c=;
        b=dq0swCSumu2uDI/38MvUEorIeuVxanIxGFVpd4EuFc+dQlwCKCp1Wzc5ZWq6KWOM+V
         TNHivNIOxXI7HHJBqJ4oY30vnhpmDEj8v3ZglMqVF4d3uye1Jic1Ksr7AXq2QCIa0J8Q
         NEEIOkn+7s4cgMjQp9vxSCYrDcPHNVGehsHNdIvC3YryHxdba4j9KZDF2cvqqr7GVMH+
         M7IwnLzqzHHQBtkiBViImsUWcjNKq+i/0qWMn4oL07Thx8djbD5D3Or+DN0hFUYzA57g
         Ae7CB0R/VVrZLZI+QJKG1ODcAvZoYcZqPXL/WKgMuobScE2bXe7e9OR3OEqZnFIsXbfN
         2g0g==
X-Gm-Message-State: ANhLgQ3AQ6YBAhfyI9h8bQFpP4TuLY9uew+EqXP3E9iuvz5Kj9azobc8
        KCouRTfdERPT8FbTXuAnYA==
X-Google-Smtp-Source: ADFU+vsHEvYM7R1GvqMvTM5s8E5xaH6V1wZXlEKH92HYSACcEnSjIVK70rJZiVtdjK8MZhA47sVGFA==
X-Received: by 2002:a05:6830:2391:: with SMTP id l17mr15643200ots.339.1583865421499;
        Tue, 10 Mar 2020 11:37:01 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id k110sm14405518otc.59.2020.03.10.11.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 11:37:00 -0700 (PDT)
Received: (nullmailer pid 23836 invoked by uid 1000);
        Tue, 10 Mar 2020 18:36:59 -0000
Date:   Tue, 10 Mar 2020 13:36:59 -0500
From:   Rob Herring <robh@kernel.org>
To:     Lubomir Rintel <lkundrak@v3.sk>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lubomir Rintel <lkundrak@v3.sk>
Subject: Re: [PATCH 3/4] dt-bindings: mfd: Add ENE KB3930 Embedded Controller
 binding
Message-ID: <20200310183659.GA22876@bogus>
References: <20200309203818.31266-1-lkundrak@v3.sk>
 <20200309203818.31266-4-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200309203818.31266-4-lkundrak@v3.sk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon,  9 Mar 2020 21:38:17 +0100, Lubomir Rintel wrote:
> 
> Add binding document for the ENE KB3930 Embedded Controller.
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> ---
>  .../devicetree/bindings/mfd/ene-kb3930.yaml   | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/ene-kb3930.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

Error: Documentation/devicetree/bindings/mfd/ene-kb3930.example.dts:22.34-35 syntax error
FATAL ERROR: Unable to parse input tree
scripts/Makefile.lib:311: recipe for target 'Documentation/devicetree/bindings/mfd/ene-kb3930.example.dt.yaml' failed
make[1]: *** [Documentation/devicetree/bindings/mfd/ene-kb3930.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
Makefile:1262: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1251828
Please check and re-submit.
