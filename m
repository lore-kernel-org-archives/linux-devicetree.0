Return-Path: <SRS0=bvxT=57=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACBD3C2BA19
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Apr 2020 08:21:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1E07520775
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Apr 2020 08:21:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gerhold.net header.i=@gerhold.net header.b="TH/NXVnH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2635575AbgDOIUz (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Apr 2020 04:20:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2635838AbgDOIUv (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 15 Apr 2020 04:20:51 -0400
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5302::10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69384C061A0C
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2020 01:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1586938849;
        s=strato-dkim-0002; d=gerhold.net;
        h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=YTTie5J9+VtqDVNQ1XWkbq9G8gBx+DEr3VPTmvjCzG0=;
        b=TH/NXVnHaMaw5UOlGDsIvF0ALcrzl3trMfSJAthiiLz+/frlGHmhDrWEszDMjJY9ww
        yCnWs+9uPCAFg+OuokkEMh7UbYWUnWAxgMCNSgsCVYaKV4AHK/+DArfRVZXVGPYLQwbe
        /4unWCDLBW1ZGopn6XgLLDo9mwsrAVKPieyZwWlY0rZ7vK9db2kJiM/Pui+mgg9ddG96
        iESzPC0F9UoPV2z/QEgSN8KdC9hhqeSYehCkDLkq35cCW3O168LCJnWYT+vZTHEpLwK7
        eAuZx0zk8nGNKHrDNaNODEWBP+a6DiHcNT8rgwQQZnbImum16FUTJI190PAgyzPcllJJ
        5QUw==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j9Ic/CaIo="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
        by smtp.strato.de (RZmta 46.4.0 DYNA|AUTH)
        with ESMTPSA id k074e0w3F8Kj0Hg
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Wed, 15 Apr 2020 10:20:45 +0200 (CEST)
Date:   Wed, 15 Apr 2020 10:20:39 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Rob Herring <robh@kernel.org>
Cc:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Patrick Lai <plai@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        alsa-devel@alsa-project.org, Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Kenneth Westfield <kwestfie@codeaurora.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 1/2] dt-bindings: sound: lpass-cpu: Document DAI subnodes
Message-ID: <20200415082039.GA1395@gerhold.net>
References: <20200406135608.126171-1-stephan@gerhold.net>
 <20200415000649.GA28504@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200415000649.GA28504@bogus>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Rob,

Thanks a lot for your review!

On Tue, Apr 14, 2020 at 07:06:49PM -0500, Rob Herring wrote:
> On Mon, Apr 06, 2020 at 03:56:07PM +0200, Stephan Gerhold wrote:
> > The lpass-cpu driver now allows configuring the MI2S SD lines
> > by defining subnodes for one of the DAIs.
> > 
> > Document this in the device tree bindings.
> > 
> > Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> > ---
> >  .../bindings/sound/qcom,lpass-cpu.txt         | 23 +++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
> > index 21c648328be9..df53a10502f7 100644
> > --- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
> > +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
> > @@ -30,6 +30,8 @@ Required properties:
> >  - reg			: Must contain an address for each entry in reg-names.
> >  - reg-names		: A list which must include the following entries:
> >  				* "lpass-lpaif"
> > +- #address-cells	: Must be 1
> > +- #size-cells		: Must be 0
> >  
> >  
> >  
> > @@ -37,6 +39,18 @@ Optional properties:
> >  
> >  - qcom,adsp		: Phandle for the audio DSP node
> >  
> > +By default, the driver uses up to 4 MI2S SD lines, for a total of 8 channels.
> > +The SD lines to use can be configured by adding subnodes for each of the DAIs.
> > +
> > +Required properties for each DAI (represented by a subnode):
> > +- reg			: Must be one of the DAI IDs
> > +			  (usually part of dt-bindings header)
> > +- qcom,playback-sd-lines: List of serial data lines (0-3) to use for playback
> 
> 0-3 for the values or number of entries?
> 

It's basically a list of bits, e.g. <0 1> or <1 2 3> where the bits are
0-3. Number of entries would be 1-4. I will clarify this a bit in the
next version.

> > +- qcom,capture-sd-lines	: List of serial data lines (0-3) to use for capture
> > +
> > +Note that adding a subnode changes the default to "no lines configured",
> > +so both playback and capture lines should be configured when a subnode is added.
> > +
> >  Example:
> >  
> >  lpass@28100000 {
> > @@ -51,4 +65,13 @@ lpass@28100000 {
> >  	reg = <0x28100000 0x10000>;
> >  	reg-names = "lpass-lpaif";
> >  	qcom,adsp = <&adsp>;
> > +
> > +	#address-cells = <1>;
> > +	#size-cells = <0>;
> > +
> > +	/* Optional to set different MI2S SD lines */
> > +	mi2s-quaternary@3 {
> 
> Normally the node name reflects the class of device. IOW, all the child 
> nodes should have the same name.
> 

Given that I somewhat adapted these node names from existing bindings
at Documentation/devicetree/bindings/sound/qcom,q6afe.txt,
I have sent out two patches to change them there first:

  https://lore.kernel.org/linux-devicetree/20200415081159.1098-1-stephan@gerhold.net/

Maybe you can take a look at the new node names there first,
and if they are fine I will send an updated version of this patch set.

Thanks,
Stephan

> > +		reg = <MI2S_QUATERNARY>;
> > +		qcom,playback-sd-lines = <0 1>;
> > +	};
> >  };
> > -- 
> > 2.26.0
> > 
