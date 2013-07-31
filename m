Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:29581 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754759Ab3GaArw (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Tue, 30 Jul 2013 20:47:52 -0400
From: Jingoo Han <jg1.han@samsung.com>
References: <007601ce8d06$13dbb890$3b9329b0$@samsung.com>
 <20130730135720.GC27962@kroah.com>
In-reply-to: <20130730135720.GC27962@kroah.com>
Subject: Re: [PATCH] Driver core: Add accessor for device tree node
Date: Wed, 31 Jul 2013 09:47:50 +0900
Message-id: <001001ce8d87$9545bd00$bfd13700$@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Sender: devicetree-owner@vger.kernel.org
To: 'Greg Kroah-Hartman' <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 'Grant Likely' <grant.likely@linaro.org>, 'Rob Herring' <rob.herring@calxeda.com>, 'Mark Brown' <broonie@kernel.org>, 'Andrew Morton' <akpm@linux-foundation.org>, Jingoo Han <jg1.han@samsung.com>
List-ID: <devicetree@vger.kernel.org>

On Tuesday, July 30, 2013 10:57 PM, Greg Kroah-Hartman wrote:
> On Tue, Jul 30, 2013 at 06:20:47PM +0900, Jingoo Han wrote:
> > Add the wrapper function for retrieving device tree node instead of
> > accessing dev->of_node directly.
> 
> Why?

Sorry, I cannot find the special reason why it should be used.
Please, ignore it. :)
Thanks.

Best regards,
Jingoo Han

