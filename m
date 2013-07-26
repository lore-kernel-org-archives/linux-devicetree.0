Return-Path: <devicetree-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:57980 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751900Ab3GZUFa (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Fri, 26 Jul 2013 16:05:30 -0400
Message-ID: <51F2D686.4090104@wwwdotorg.org>
Date: Fri, 26 Jul 2013 14:05:26 -0600
From: Stephen Warren <swarren@wwwdotorg.org>
MIME-Version: 1.0
Subject: Re: [PATCH] of: add vendor prefix for Altera Corp.
References: <1374867540-9477-1-git-send-email-dinguyen@altera.com>
In-Reply-To: <1374867540-9477-1-git-send-email-dinguyen@altera.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: dinguyen@altera.com
Cc: dinh.linux@gmail.com, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ian.campbell@citrix.com>, devicetree@vger.kernel.org, Olof Johansson <olof@lixom.net>
List-ID: <devicetree@vger.kernel.org>

On 07/26/2013 01:39 PM, dinguyen@altera.com wrote:

> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt

> +altr	Altera Corp.

In the context of Marvel(?) wanting to change between a longer and
stock-ticker vendor name, there was some discussion re: whether we had
decided not to use stock tickers any more. Is there still consensus that
we should? If so, I have no problem with this patch, but I wanted to
make sure everyone was on the same page.
