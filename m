Return-Path: <SRS0=2Ix+=4H=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6314C5ACC4
	for <linux-devicetree@archiver.kernel.org>; Wed, 19 Feb 2020 23:12:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ADAE72464E
	for <linux-devicetree@archiver.kernel.org>; Wed, 19 Feb 2020 23:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582153941;
	bh=uVdWup0wpgU3++rb54UglkWP9F1kJLPIbPV3Xzfyenk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=kFzfYAPi3SMi414bYvvwdZ1+R5BbBryRDxXQIsB1XO0nPGFKH5YOKT0TO/ZY3aqoG
	 Eoob1j0sr2XgxSHADoCXZ6XGt8sqPzR0b0G66oL1SNj0eYqTasu6IagPSq10OlMkfw
	 peo2HxavLZpCb0yzwcHrBUHm6PliTtkeJZaM2VlI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726680AbgBSXMV (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 19 Feb 2020 18:12:21 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:45494 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726647AbgBSXMV (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 19 Feb 2020 18:12:21 -0500
Received: by mail-oi1-f196.google.com with SMTP id v19so25592562oic.12
        for <devicetree@vger.kernel.org>; Wed, 19 Feb 2020 15:12:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CLPRmzON2R02+/ZY31sqBcy//1vfhbocYVY0OJmPA7Q=;
        b=dWULPtMSt2p46BK8w2P+M3Sk+hE8/WkMuzgA/jVDNMMIYj5QPN+C8Q61Ub6jSaPkKI
         eN9sbFGL7CQBoFW9xa6G+FpyIVWPJ5r5MZVa0t1wcKdU4zuURjOjplTV78c8ep7kAVeg
         ow1ewHXvIFQj2iQSfg8TIqaFrLa8uvn8O6YrUsHcM66mM+oHruw2TGKtbSJTUIyWHyuX
         RhTT8uDOazCvOv0i6O7UbbSyG6UGXmHdx6Tu8Oj8xeRFvDm8OaDO4oWvSCwvpvC9gF5z
         iEgOWKQDqNp8GjBOHenkg76vGY84340QrjOoYREu9G3CIB9f8dqWJEkUe/6I1afse2KY
         jy6A==
X-Gm-Message-State: APjAAAWglRuVBtRq5NUGLUCI+7CqD3DXxVmGOEqvKvbswh8GGHz8cc6O
        cR+i7D4RhTffLdB1P9MNlA==
X-Google-Smtp-Source: APXvYqyH6dHK8cr/NZ+DC/49bIcKPOlYG+691fjOnLj0uJTTKRot/Tcf71eVud11ZtmHjyKBDuPNUA==
X-Received: by 2002:a54:4418:: with SMTP id k24mr77122oiw.46.1582153940062;
        Wed, 19 Feb 2020 15:12:20 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id h15sm420269otq.67.2020.02.19.15.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 15:12:19 -0800 (PST)
Received: (nullmailer pid 17648 invoked by uid 1000);
        Wed, 19 Feb 2020 23:12:18 -0000
Date:   Wed, 19 Feb 2020 17:12:18 -0600
From:   Rob Herring <robh@kernel.org>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
        dri-devel@lists.freedesktop.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Sean Paul <seanpaul@chromium.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>, devicetree@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/4] dt-bindings: panel: lvds: Add properties for clock
 and data polarities
Message-ID: <20200219231218.GA24409@bogus>
References: <cover.b12a054012ce067fa2094894147f953ab816d8d0.1581682983.git-series.maxime@cerno.tech>
 <620a740cec4186177ce346b092d4ba451e1420dc.1581682983.git-series.maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <620a740cec4186177ce346b092d4ba451e1420dc.1581682983.git-series.maxime@cerno.tech>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Feb 14, 2020 at 01:24:39PM +0100, Maxime Ripard wrote:
> Some LVDS encoders can support multiple polarities on the data and
> clock lanes, and similarly some panels require a given polarity on
> their inputs. Add a property on the panel to configure the encoder
> properly.

If the panel requires a specific setting, then that can be implied by 
the panel's compatible. Does Boris' format constraint solving series 
help here?

Rob
