Return-Path: <devicetree-owner@vger.kernel.org>
Received: from multi.imgtec.com ([194.200.65.239]:34302 "EHLO multi.imgtec.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753090Ab3HLP7p (ORCPT <rfc822;devicetree@vger.kernel.org>);
	Mon, 12 Aug 2013 11:59:45 -0400
Message-ID: <52090650.3000309@imgtec.com>
Date: Mon, 12 Aug 2013 16:59:12 +0100
From: James Hogan <james.hogan@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH] MIPS: add driver for the built-in PCI controller of the
 RT3883 SoC
References: <1376064212-28415-1-git-send-email-juhosg@openwrt.org>
In-Reply-To: <1376064212-28415-1-git-send-email-juhosg@openwrt.org>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Gabor Juhos <juhosg@openwrt.org>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, John Crispin <blogic@openwrt.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 09/08/13 17:03, Gabor Juhos wrote:
> +   - status: either "disabled" or "okay"

Is this really a required property? If it's using the generic code for
it then I think it will be treated as "okay" if omitted. In any case I
don't think this property is normally documented in these bindings docs
(I couldn't find any other instances of it).

Cheers
James

