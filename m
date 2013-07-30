Return-Path: <devicetree-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:36909 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757033Ab3G3VWm (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Tue, 30 Jul 2013 17:22:42 -0400
Message-ID: <51F82E9F.9010309@wwwdotorg.org>
Date: Tue, 30 Jul 2013 15:22:39 -0600
From: Stephen Warren <swarren@wwwdotorg.org>
MIME-Version: 1.0
Subject: Re: [PATCH] pinctrl: msm: Add support for MSM TLMM pinmux
References: <1374702089-2832-1-git-send-email-hanumant@codeaurora.org> <CACRpkdZLFD-KAvZdUUvQKje3vAH1D0EJMW9PSK8VSp3Xs4eiGA@mail.gmail.com> <51F82BCC.1080409@codeaurora.org>
In-Reply-To: <51F82BCC.1080409@codeaurora.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: hanumant <hanumant@codeaurora.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Bjorn Andersson <Bjorn.Andersson@sonymobile.com>, "Bird, Tim" <Tim.Bird@sonymobile.com>, ext Tony Lindgren <tony@atomide.com>
List-ID: <devicetree@vger.kernel.org>

On 07/30/2013 03:10 PM, hanumant wrote:
...
> We actually have the same TLMM pinmux used by several socs of a family.
> The number of pins on each soc may vary.
> Also a given soc gets used in a number of boards.
> The device tree for a given soc is split into the different boards that
> its in ie the boards inherit a common soc.dtsi but have separate dts.
> The boards for the same soc may use different pin groups for
> accomplishing a function, since we have multiple i2c, spi uart etc
> peripheral instances on a soc. A different instance of each of the above
> peripherals, can be used in different boards, utilizing different
> or subset of same pin groups.
> Thus I would need to have multiple C files for one soc, based on the
> boards that it goes into.

The pinctrl driver should be exposing the raw capabilities of the HW.
All the board-specific configuration should be expressed in DT. So, the
driver shouldn't have to know anything about different boards at
compile-time.

