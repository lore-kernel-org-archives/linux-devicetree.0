Return-Path: <SRS0=m/6z=3Q=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E2D3C2D0DB
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jan 2020 14:27:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 00CE920716
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jan 2020 14:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1580135240;
	bh=q6mIaNMnzUQbj9RZ/0s+QkpSBIdE0IlaRVA9teWCqwU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=FQ42TkyvtbkYubwvnX6zERAoBSQi9q7QUyN46D0lJoMq9qRYeYY7bfT7AZuNwPz0W
	 Sj0R/6n6kwhR9sPipGozQtcen04pXZHF3uIEXRt1lohznL0zR3OOhHnSZ0LRglackh
	 xEAda26qt3sU2JmD/nj3I8HPZ7AegKed1JRxZGLU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728939AbgA0O1T (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 27 Jan 2020 09:27:19 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:38281 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727235AbgA0O1T (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 27 Jan 2020 09:27:19 -0500
Received: by mail-oi1-f193.google.com with SMTP id l9so6791066oii.5
        for <devicetree@vger.kernel.org>; Mon, 27 Jan 2020 06:27:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ex/Vz3wX/g9HFdy28JpEbqVZXRZ73mjVXy3JN9csMIU=;
        b=rFRFwOZf5Zr8b5SibFXP6Iuyv0QFtcDimy8hk/Rdmoh1IuezwzeLnIJw5Bp5LPq1mv
         unBcOXZDSXt/ojvI1piDoQJPcBN5HktALwQclygnO8+7mfgVEdEBSRnLNkwrMImvUmZ3
         J0CP2esMtIP8Of/yM0C9ea/66qwbT78hpABNWpCddTxoYy/qWoNXmUt3/ch2pO2pkKBT
         VCXp5Mrlylz+Gdfak233gV8Q4R7Qe1O8pBk5dtUFWduLSbAOjpw3dAGACpYt5uSjQoOh
         Fj4c/w/WbLDHO0zBA+VQKrpbS1p6sudKxy2nt5rk/BE2hYLzhRmqGLyOWGtXajXbBkCj
         gykg==
X-Gm-Message-State: APjAAAVNb0OgbQQbkkwX8OqV4Q/bwv0vwtGAYCHcsW/L2iJVTuLc/pK5
        NEniRQ12ZSrKdYhRYxo0VKP4Wbk=
X-Google-Smtp-Source: APXvYqyir024SUWVI341ABEbH3M1KuLPM8D4LvZPtpyviODJx/tjaS2QhxNbgMaSNSZSKOYciY2OEg==
X-Received: by 2002:aca:e146:: with SMTP id y67mr7212323oig.93.1580135238334;
        Mon, 27 Jan 2020 06:27:18 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id j186sm4787555oih.55.2020.01.27.06.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2020 06:27:17 -0800 (PST)
Received: (nullmailer pid 31278 invoked by uid 1000);
        Mon, 27 Jan 2020 14:27:17 -0000
Date:   Mon, 27 Jan 2020 08:27:17 -0600
From:   Rob Herring <robh@kernel.org>
To:     Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
Cc:     noralf@tronnes.org, Sam Ravnborg <sam@ravnborg.org>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: add binding for tft displays based
 on ilitek,ili9486
Message-ID: <20200127142717.GA30789@bogus>
References: <cover.1580059987.git.kamlesh.gurudasani@gmail.com>
 <a37d95cbfc9603265ed15916cdd2fb69e8c5f041.1580059987.git.kamlesh.gurudasani@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a37d95cbfc9603265ed15916cdd2fb69e8c5f041.1580059987.git.kamlesh.gurudasani@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun, 26 Jan 2020 23:12:00 +0530, Kamlesh Gurudasani wrote:
> This binding is for the tft displays based on ilitek,ili9486.
> ozzmaker,piscreen and waveshare,rpi-lcd-35 are such displays
> 
> Signed-off-by: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
> ---
> 
> v2 changes:
> * Changing file from txt to yaml format
> * removed ilitek,ili9486 from compatible string
> ---
>  .../bindings/display/ilitek,ili9486.yaml           | 79 ++++++++++++++++++++++
>  1 file changed, 79 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/ilitek,ili9486.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/display/simple-framebuffer.example.dts:21.16-37.11: Warning (chosen_node_is_root): /example-0/chosen: chosen node must be at root node
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/ilitek,ili9486.example.dt.yaml: display@0: compatible: ['waveshare,rpi-lcd-35'] is not valid under any of the given schemas (Possible causes of the failure):
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/ilitek,ili9486.example.dt.yaml: display@0: compatible: ['waveshare,rpi-lcd-35'] is too short
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/ilitek,ili9486.example.dt.yaml: display@0: compatible:0: 'waveshare,rpi-lcd-35' is not one of ['ozzmaker,piscreen']

See https://patchwork.ozlabs.org/patch/1229397
Please check and re-submit.
