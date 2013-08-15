Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-oa0-f41.google.com ([209.85.219.41]:53012 "EHLO
	mail-oa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757017Ab3HOTzt (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Thu, 15 Aug 2013 15:55:49 -0400
Received: by mail-oa0-f41.google.com with SMTP id j6so1348691oag.14
        for <devicetree@vger.kernel.org>; Thu, 15 Aug 2013 12:55:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1376412156-3899-1-git-send-email-dinguyen@altera.com>
References: <1376412156-3899-1-git-send-email-dinguyen@altera.com>
Date: Thu, 15 Aug 2013 21:55:48 +0200
Message-ID: <CACRpkdZkyeA5ExvHQPExNBq5qB1hDHON32TO63BmtVrRxDxhXw@mail.gmail.com>
Subject: Re: [RFC] phy: micrel: Convert micrel PHY driver to use OF
From: Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset=ISO-8859-1
Sender: devicetree-owner@vger.kernel.org
To: Dinh Nguyen <dinguyen@altera.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: Dinh Nguyen <dinh.linux@gmail.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, Richard Cochran <richardcochran@gmail.com>, Felipe Balbi <balbi@ti.com>, "David S. Miller" <davem@davemloft.net>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Olof Johansson <olof@lixom.net>, Rob Herring <rob.herring@calxeda.com>
List-ID: <devicetree@vger.kernel.org>

On Tue, Aug 13, 2013 at 6:42 PM,  <dinguyen@altera.com> wrote:

> From: Dinh Nguyen <dinguyen@altera.com>
>
> Convert the Micrel PHY driver to use OF. This initial patch is only
> the beginning of an idea to convert the PHY driver to device tree.
>
> Signed-of-by: Dinh Nguyen <dinguyen@altera.com>

This is full of device tree stuff so please copy it to
devicetree@vger.kernel.org.

It seems to add quite a few compatible strings so these should
be added to the bindings doc, or is it already?

Yours,
Linus Walleij
