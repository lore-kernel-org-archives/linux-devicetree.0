Return-Path: <SRS0=oGub=MD=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-ed1-f66.google.com ([209.85.208.66]:41261 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389545AbeIUX5G (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 21 Sep 2018 19:57:06 -0400
Date: Fri, 21 Sep 2018 20:07:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3] arm64: dts: exynos: add OF graph between USB-PHY and
 MUIC
Message-ID: <20180921180700.GA10577@kozik-lap>
References: <CGME20180921131359eucas1p2fd46913e0a9845bbb6e8260aa9f5c20f@eucas1p2.samsung.com>
 <20180921131359eucas1p2fd46913e0a9845bbb6e8260aa9f5c20f~WbISmyGpy1936319363eucas1p2i@eucas1p2.samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20180921131359eucas1p2fd46913e0a9845bbb6e8260aa9f5c20f~WbISmyGpy1936319363eucas1p2i@eucas1p2.samsung.com>
Sender: devicetree-owner@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, "open list : DESIGNWARE USB3 DRD IP DRIVER" <linux-usb@vger.kernel.org>, "open list : OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-samsung-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Fri, Sep 21, 2018 at 03:13:55PM +0200, Andrzej Hajda wrote:
> OF graph describes USB data lanes between USB-PHY and respective MUIC.
> Since graph is present and DWC driver can use it to get extcon, obsolete
> extcon property can be removed.
> 
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
> v3:
>  - removed #address-cells/#size-cells from ports node.
> 
> Hi Krzysztof,
> 
> This is next version of the patch I forgot. I have addressed your comments,

Thanks, applied.

Best regards,
Krzysztof
