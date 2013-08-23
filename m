Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-oa0-f53.google.com ([209.85.219.53]:51065 "EHLO
	mail-oa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755491Ab3HWRtY (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Fri, 23 Aug 2013 13:49:24 -0400
Received: by mail-oa0-f53.google.com with SMTP id k18so1099675oag.26
        for <devicetree@vger.kernel.org>; Fri, 23 Aug 2013 10:49:23 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1376953494-9684-2-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1376953494-9684-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
	<1376953494-9684-2-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Date: Fri, 23 Aug 2013 19:49:23 +0200
Message-ID: <CACRpkdaXa5TGpLYdA_on9QV0igb7NvWc9G87XD30hEqqqMgTwA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] gpio: pcf857x: Sort headers alphabetically
From: Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset=ISO-8859-1
Sender: devicetree-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Tue, Aug 20, 2013 at 1:04 AM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:

> This makes checking for duplicates when adding a new #include easier.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

And I'm dreaming of patching all the GPIO drivers to have
the header includes in inverted christmas tree order. ;-)

Okay, applied anyway.

Yours,
Linus Walleij
