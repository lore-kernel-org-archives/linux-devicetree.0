Return-Path: <SRS0=DpSr=6M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B628C83000
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Apr 2020 13:24:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 391E6206D7
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Apr 2020 13:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1588080253;
	bh=MAzmc0W8BMbkDnvxtQl2oe0CfTiYNxikPTypwNDL8S4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=glqONd6RJ8hLIx3PHOQl5r+Cc7WoeOE0E/wtF55Tn6Rvr5z5Ob7JujSqCpoetMS7x
	 PQN0PVnVaqIkJs2CzzPWmMtrekaFmk5ri/BTp4DpKAhMUfB7UWQVUIVrfsUIX5dp0P
	 pcKKI3wLO9bCTl/GWsGS6X1Hai09ABSbj1zyjyKI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726798AbgD1NYM (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 28 Apr 2020 09:24:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:57378 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726827AbgD1NYM (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 28 Apr 2020 09:24:12 -0400
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C092E206D7
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2020 13:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588080251;
        bh=MAzmc0W8BMbkDnvxtQl2oe0CfTiYNxikPTypwNDL8S4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=KPYNeiwH38T00VKHYENK6pdon5p1XDRXwCIPSn6o/i/engVbnfgnkPd07oVD7rMuB
         USWVFRlTN05TB8sS4gaDbHj6pksEh+lCVB6ldfbknrClcTESSmA7lrbjdG3EmNabES
         RJKJjPjRAFty3fLFmJnh4ZoQZvRQiET2E2u0vlX0=
Received: by mail-ot1-f45.google.com with SMTP id e26so32574947otr.2
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2020 06:24:11 -0700 (PDT)
X-Gm-Message-State: AGi0PuaBzs7tyXxElhE3naMWW9XY71B3miOTOdEzrkjBr6qFsGwsCh9J
        p2ctrVDJkSEbQ8f480RRwt+E7N7n+GLPsHyIDw==
X-Google-Smtp-Source: APiQypLPN1zIwiUl/lZdTAxejLTb/tMJFdWABheE8C8SguCoESJx3qPNaYkZoZMETESKMayNGYlN5utgW7kwPD7gTqI=
X-Received: by 2002:aca:1904:: with SMTP id l4mr2941731oii.106.1588080251111;
 Tue, 28 Apr 2020 06:24:11 -0700 (PDT)
MIME-Version: 1.0
References: <6cdf20c3-7b74-679c-0e6f-4d385d12f9fe@xilinx.com>
In-Reply-To: <6cdf20c3-7b74-679c-0e6f-4d385d12f9fe@xilinx.com>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 28 Apr 2020 08:23:59 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+ehJSK7sjqmKtWOVjr-QZ3LDB+ywCO85uF8WJ+cB=AAw@mail.gmail.com>
Message-ID: <CAL_Jsq+ehJSK7sjqmKtWOVjr-QZ3LDB+ywCO85uF8WJ+cB=AAw@mail.gmail.com>
Subject: Re: u-boot DT configuration node
To:     Michal Simek <michal.simek@xilinx.com>
Cc:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
        Tom Rini <trini@konsulko.com>,
        Loic Poulain <loic.poulain@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Apr 1, 2020 at 4:23 AM Michal Simek <michal.simek@xilinx.com> wrote:
>
> Hi Rob and others,
>
> for couple of years already u-boot is using config node in root DT for
> u-boot configuration.
>
> Here is one example in u-boot source code.
> https://gitlab.denx.de/u-boot/u-boot/-/blob/master/arch/arm/dts/exynos5250-spring.dts#L47
>
> And here is dt binding description
> https://gitlab.denx.de/u-boot/u-boot/-/blob/master/doc/device-tree-bindings/config.txt
>
> I was checking dt binding specification and there no such a thing
> described there. It means I expect this is more adhoc u-boot solution.
> We have reached the point where could be beneficial to put some u-boot
> specific configurations to DT.
>
> Actually I have done similar thing some time ago too by using chosen
> node and add xilinx specific property there to point to eeprom.
> https://gitlab.denx.de/u-boot/u-boot/-/blob/master/arch/arm/dts/zynqmp-zcu102-revA.dts#L39

In this case, I think an alias should be used as it's more of just a
shortcut to finding a specific node.

> I think it is a time to discuss it and do it properly.
>
> First of all my question is where we could list SW prefixes to make sure
> that they are listed and everybody is aware about it. We have
> vendor-prefixes and we should have a way to record also prefixes for sw
> projects. U-Boot is using u-boot. Xen has file in the kernel with using
> xen prefix. At least these two should be listed.

Documentation/devicetree/bindings/vendor-prefixes.yaml.

> Next my question is what is the recommended way to pass sw specific
> parameters via DT? I think using chosen node is more appropriate then
> adhoc config node. Or is there a better way how this should be done?

/chosen

For vendor specific things though I would be cautious. If they are
settings for a specific device, then they probably belong in the
device's node. Second, are they really vendor specific? What we don't
want is each vendor doing the same thing in slightly different ways.

Rob
