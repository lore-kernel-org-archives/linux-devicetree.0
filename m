Return-Path: <SRS0=lOvj=AE=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32818C433E0
	for <linux-devicetree@archiver.kernel.org>; Tue, 23 Jun 2020 09:12:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 11B8220774
	for <linux-devicetree@archiver.kernel.org>; Tue, 23 Jun 2020 09:12:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="ASFYFZLD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731775AbgFWJMg (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 23 Jun 2020 05:12:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731853AbgFWJMg (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 23 Jun 2020 05:12:36 -0400
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com [IPv6:2607:f8b0:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11E95C061795
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2020 02:12:36 -0700 (PDT)
Received: by mail-il1-x142.google.com with SMTP id p11so1017616ilp.11
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2020 02:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ArED5WuE5vKbhzC135CloJUx+24YnwYK5ybAFszEdN0=;
        b=ASFYFZLD4aP93JKRZIyA6O0H0NHUXDOOfNLHL/aMSsgdBZOsNnH3zT0gCrhdXgK8nW
         UZDPqMRx5OCS70CZy1VvFgEANzq+vvMA9DkFdMTApsspNXbeKXUaS0QTHNEblOzMxoul
         g+FdxpIqYFHTabKh1lUt2b2iybw5OvjuO7k6R7CoBft0DpYj3dsf39s5Kb0DNOOT3s9j
         LDJTxdGAiwclMZ69BAQmr1FOsIRembCoClHnAnDybsAeZz+xxw/3EHmpT7OuiHsH1krE
         eW/Q5gK2odDWFp6exLEKTP21ly+TvdRk4LNDDTmrHXsHbiKlZMNfOBHZCPU9i8aDsbAT
         xxew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ArED5WuE5vKbhzC135CloJUx+24YnwYK5ybAFszEdN0=;
        b=WaHPfRWfk86qBlhd8+URf5/FwtXZMSVTa+4y9+Dk/ekyxyq4L1w4gy3RAl8OiU3/39
         SuIoyLxhY5m+Ek9OpVbHsH5zrDDzVh1X3rKSHuvIlQhocQREIvsjXyaOwo3aGF7r47r4
         SH9UBJ1G0SA1dEfR/c3XJeskrQuc/C6zQhIkoy0i3eNfEm0uCqyG0z8YhUwhGCmNxiDX
         lyKDpuUQ2wV4CICSRByeeePvOZyLYLSNKcBpwam241VHrO7ds+SnKZTZggoHJUSII9CP
         1a2kxX1XQCM9vnQZjdpb6RsaA/qnda1L7f5FkxsTysZ7YLEq7IIJnVZma8CXQzH5fJKw
         XB3g==
X-Gm-Message-State: AOAM5306fKFqU43UScTK9lJh3xOEIEwCZoqN8sQ5QwBvBLaEBUc+/z1P
        FCuT+IS+tTJkKvrCQl5L/X+NgK+PqHuwpp8IJ9sq0A==
X-Google-Smtp-Source: ABdhPJxU72/5mqONl5oZETdKCZkVmtw1I/YvVqqrx1X4F9E+xx1C98ZJHbHv94J5cjJ0DUueC4XDcam6w5sx7T2+tmk=
X-Received: by 2002:a92:c509:: with SMTP id r9mr21034414ilg.189.1592903555407;
 Tue, 23 Jun 2020 02:12:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200622100056.10151-1-brgl@bgdev.pl> <20200622100056.10151-4-brgl@bgdev.pl>
 <20200622154943.02782b5a@kicinski-fedora-PC1C0HJN>
In-Reply-To: <20200622154943.02782b5a@kicinski-fedora-PC1C0HJN>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 23 Jun 2020 11:12:24 +0200
Message-ID: <CAMRc=MfF1RbQCJ62QhscFLu1HKYRc9M-2SMep1_vTJ2xhKjLAA@mail.gmail.com>
Subject: Re: [PATCH 03/11] net: devres: relax devm_register_netdev()
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Jeff Kirsher <jeffrey.t.kirsher@intel.com>,
        "David S . Miller" <davem@davemloft.net>,
        John Crispin <john@phrozen.org>,
        Sean Wang <sean.wang@mediatek.com>,
        Mark Lee <Mark-MC.Lee@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-doc <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        intel-wired-lan@lists.osuosl.org, netdev <netdev@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC..." 
        <linux-mediatek@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        Fabien Parent <fparent@baylibre.com>,
        Stephane Le Provost <stephane.leprovost@mediatek.com>,
        Pedro Tsai <pedro.tsai@mediatek.com>,
        Andrew Perepech <andrew.perepech@mediatek.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

wt., 23 cze 2020 o 00:49 Jakub Kicinski <kuba@kernel.org> napisa=C5=82(a):
>
> On Mon, 22 Jun 2020 12:00:48 +0200 Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > This devres helper registers a release callback that only unregisters
> > the net_device. It works perfectly fine with netdev structs that are
> > not managed on their own. There's no reason to check this - drop the
> > warning.
> >
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> I think the reasoning for this suggestion was to catch possible UAF
> errors. The netdev doesn't necessarily has to be from devm_alloc_*
> but it has to be part of devm-ed memory or memory which is freed
> after driver's remove callback.
>

Yes I understand that UAF was the concern here, but this limitation is
unnecessary. In its current form devm_register_netdev() only works for
struct net_device allocated with devm_alloc_etherdev(). Meanwhile
calling alloc_netdev() (which doesn't have its devm counterpart yet -
I may look into it shortly), then registering a devm action with
devm_add_action_or_reset() which would free this memory is a perfectly
fine use case. This patch would make it possible.

> Are there cases in practice where you've seen the netdev not being
> devm allocated?

As I said above - alloc_netdev() used by wireless, can, usb etc.
drivers doesn't have a devres variant.

Bartosz
