Return-Path: <SRS0=so6l=OM=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-wr1-f66.google.com ([209.85.221.66]:45079 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725903AbeLCWYg (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 3 Dec 2018 17:24:36 -0500
Subject: Re: [PATCH 1/2] ARM: dts: stout: Convert to new LVDS DT bindings
References: <20181203151242.25875-1-geert+renesas@glider.be>
 <20181203151242.25875-2-geert+renesas@glider.be> <2069641.6dBh1jlBqR@avalon>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <068e770d-107d-002f-cebf-a26b5dc8a147@gmail.com>
Date: Mon, 3 Dec 2018 23:24:32 +0100
MIME-Version: 1.0
In-Reply-To: <2069641.6dBh1jlBqR@avalon>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 12/03/2018 10:48 PM, Laurent Pinchart wrote:
> Hi Geert,

Hi,

> Thank you for the patch.
> 
> On Monday, 3 December 2018 17:12:41 EET Geert Uytterhoeven wrote:
>> As of commit 6d2ca85279becdff ("dt-bindings: display: renesas: Deprecate
>> LVDS support in the DU bindings"), the internal LVDS encoder has DT
>> bindings separate from the DU.  The Lager device tree was ported over to
>> the new model, but the Stout device tree was forgotten.
>>
>> Fixes: 15a1ff30d8f9bd83 ("ARM: dts: r8a7790: Convert to new LVDS DT
>> bindings") Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> ---
>> Compile-tested only.
> 
> I can't test the patch either but it looks fine to me.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> I assume you will send this directly to Simon, so I don't plan to take the 
> patch in my tree.
I have a Stout if you need me to test something.

-- 
Best regards,
Marek Vasut
