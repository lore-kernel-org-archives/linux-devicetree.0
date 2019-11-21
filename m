Return-Path: <SRS0=OHRJ=ZN=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48E50C432C3
	for <linux-devicetree@archiver.kernel.org>; Thu, 21 Nov 2019 13:53:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 17B4620679
	for <linux-devicetree@archiver.kernel.org>; Thu, 21 Nov 2019 13:53:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LsRF+WnD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726714AbfKUNxl (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 21 Nov 2019 08:53:41 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:43851 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726293AbfKUNxl (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 21 Nov 2019 08:53:41 -0500
Received: by mail-lj1-f193.google.com with SMTP id y23so3281977ljh.10
        for <devicetree@vger.kernel.org>; Thu, 21 Nov 2019 05:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=T1PuP4VfLVAgAH1rwCvjfUIifgOahXGW5a5nSozr7tM=;
        b=LsRF+WnD/fz1BhAJPqvcc7ugaaEYCn8jfsnmyT8OUeg2TWFCSX0nBr+u9Hz9IFXNxy
         DrAyBhQXEIP9WMjmLIAT3Q/KkgW6yr3x2hYbpseoAyMb0359Z+AS8UnE/wRpeg7xANoL
         xa2PtVzA1jCxSLqJ7X4JzX+bEmEVM35uTCUkhCjf2fsGoZ6z8OBNVQFt/evKmsxyPA67
         1WOvoPbJMAktaaMI8WOpK/A3nb8pKfQcr5elGaLB6bIw07rHrMFHnsbK1AuU/WWJpRLb
         5x8vfzLgsmM31VCsYiZVn+8xJIdgB9/AF57oVXHBO9CJI6IYg6vbPyM02HN5w+lWYqOU
         n4tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T1PuP4VfLVAgAH1rwCvjfUIifgOahXGW5a5nSozr7tM=;
        b=IBsymlauGJi5bXrfMID2UgP73ld9JjRTrVHaxd1AoiHxXz3AjNoCgLRvKG2iGwF6rb
         rzAjoYGPpb8nrJrxy15gw+J7u5qYQ4WT1GBfQeMM7y+GQDaWJzKXm/hoCbIQ9LK2KpdV
         +y8LpZZVTFmYetOcbOnHm0KdFfsOkAVvSFol/QakllLP42p7MOCqlYvXgo5CVaFXPX4Z
         o6uFmSAziUUJaAFaYgRi6f0ZhyeoIKVjlLU5bzYi6tspOi3CaEhWPaAueK5l52JuFoTi
         9mQCgNL3DpRBlLqO8VnEpSBjhf5b3a9ifsT3WvIfHTfWabUcZ8Q8ISdn1kty/EqPXypc
         xTxQ==
X-Gm-Message-State: APjAAAVKzmiVu0VHoIqmbEUH5Jgmbj5ICOFSg7xJTRXoXjSBhW8ez6Ox
        wn2iZtgNJCXyRO0hTt5xnnBMFJj57gaPQadfq2ZqqTc+GSonAHbc
X-Google-Smtp-Source: APXvYqyGCA85Na7btrkKi+qMRlphfA0QGHjMWq+wQcUoMu0dMemrFCbVzha5zKB3wkOB5mHBvsygvRUkmNgOClwj+wY=
X-Received: by 2002:a2e:9699:: with SMTP id q25mr7550252lji.251.1574344418227;
 Thu, 21 Nov 2019 05:53:38 -0800 (PST)
MIME-Version: 1.0
References: <cover.1573797249.git.rahul.tanwar@linux.intel.com> <b59afc497e41404fea06aa48d633cba183ee944d.1573797249.git.rahul.tanwar@linux.intel.com>
In-Reply-To: <b59afc497e41404fea06aa48d633cba183ee944d.1573797249.git.rahul.tanwar@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 21 Nov 2019 14:53:26 +0100
Message-ID: <CACRpkdYZi-0LRjih8+2cgWZ6u-eFN5+3sW1eV2ujYRd0UBoEKQ@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] dt-bindings: pinctrl: intel: Add for new SoC
To:     Rahul Tanwar <rahul.tanwar@linux.intel.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>,
        Andriy Shevchenko <andriy.shevchenko@intel.com>,
        qi-ming.wu@intel.com, yixin.zhu@linux.intel.com,
        cheol.yong.kim@intel.com
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Nov 15, 2019 at 10:25 AM Rahul Tanwar
<rahul.tanwar@linux.intel.com> wrote:

> Add dt bindings document for pinmux & GPIO controller driver of
> Intel Lightning Mountain SoC.
>
> Signed-off-by: Rahul Tanwar <rahul.tanwar@linux.intel.com>

Patch applied, you worked hard to get these bindings done in the
right YAML format and all.

I have some generic bindings from Rob merged simultaneously
so it'd be great if you could investigate whether it is possible
to follow up with a patch to switch over from some of the local
grammar and toward including pinmux-node.yaml and
pincfg-node.yaml into these bindings.

The method for inclusion of external generic files can be seen
in e.g. the display panel bindings, like how
panel-common.yaml is included into other bindings under
display/panel/*.yaml.

Tell us if you have any problems with this!

Yours,
Linus Walleij
