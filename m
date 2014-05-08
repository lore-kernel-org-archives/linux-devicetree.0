From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 3/4] of/platform: fix device naming for non-translatable addresses
Date: Thu, 08 May 2014 12:41:10 +0200
Message-ID: <4314054.Zr5Mecf9vm@wuerfel>
References: <1399499298-8830-1-git-send-email-robherring2@gmail.com> <1399499298-8830-4-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1399499298-8830-4-git-send-email-robherring2@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Grant Likely <grant.likely@linaro.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, "Ivan T. Ivanov" <iivanov@mm-sol.com>, Josh Cartwright <joshc@codeaurora.org>, Courtney Cavin <courtney.cavin@sonymobile.com>, Bjorn Andersson <bjorn@kryo.se>, Frank Rowand <frowand.list@gmail.com>, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 07 May 2014 16:48:17 Rob Herring wrote:
> From: Rob Herring <robh@kernel.org>
> 
> Using non-translatable addresses in platform device names is wrong
> because they may not be globally unique. Just use the default naming with
> a global index if the address cannot be translated instead.
> 
> of_can_translate_address has the same checks as of_translate_address, so
> we can remove it here as well.

Have you checked that this doesn't break platforms using clkdev lookup
based on names with local addresses? It's quite possible that nobody
does that, but it would be good to have someone confirm it.

	Arnd
