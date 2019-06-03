Return-Path: <SRS0=5yH4=UC=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-wr1-f68.google.com ([209.85.221.68]:35796 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726486AbfFCG0d (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 3 Jun 2019 02:26:33 -0400
Received: by mail-wr1-f68.google.com with SMTP id m3so10674278wrv.2
        for <devicetree@vger.kernel.org>; Sun, 02 Jun 2019 23:26:31 -0700 (PDT)
Date: Mon, 3 Jun 2019 07:26:29 +0100
From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH RFC 0/2] Add Renesas RPC-IF support
Message-ID: <20190603062629.GC4797@dell>
References: <ad503d6e-4739-9744-64b4-fd13f44ea6fe@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ad503d6e-4739-9744-64b4-fd13f44ea6fe@cogentembedded.com>
Sender: devicetree-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Mason Yang <masonccyang@mxic.com.tw>, linux-spi@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Thu, 30 May 2019, Sergei Shtylyov wrote:

> Hello!
> 
> Here's a set of 2 patches against the 'for-mfd-next' branch of Lee Jones's
> 'mfd.git' repo. Renesas Reduced Pin Count Interface (RPC-IF) allows a SPI
> flash or HyperFlash connected to the SoC to be accessed via the external
> address space read mode or the manual mode. The MFD driver for RPC-IF
> registers either the SPI or HyperFLash subdevice, depending on the contents
> of the device tree subnode; it also provides the absract "back end" API
> that can be used by the "front end" SPI/MTD drivers to talk to the real
> hardware... The HyperFlash subdriver isn't ready yet, so the MFD driver
> may need some updates in order to serve it, hence the RFC status...
> 
> Based on the original patch by Mason Yang <masonccyang@mxic.com.tw>.
> 
> [1/2] dt-bindings: mfd: document Renesas RPC-IF bindings
> [2/2] mfd: add Renesas RPC-IF driver

Please use `git` to create your cover letters.

You are missing useful information e.g. the change stats.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
