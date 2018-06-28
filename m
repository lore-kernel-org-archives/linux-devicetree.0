Return-Path: <SRS0=4PV1=JO=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-qt0-f193.google.com ([209.85.216.193]:40940 "EHLO
        mail-qt0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752095AbeF1EKw (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 28 Jun 2018 00:10:52 -0400
Received: by mail-qt0-f193.google.com with SMTP id s47-v6so3616382qth.7
        for <devicetree@vger.kernel.org>; Wed, 27 Jun 2018 21:10:51 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180626232109.10944-2-benh@kernel.crashing.org>
References: <20180626232109.10944-1-benh@kernel.crashing.org> <20180626232109.10944-2-benh@kernel.crashing.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 28 Jun 2018 13:40:30 +0930
Message-ID: <CACPK8XcoW6HCkpYYhFvyVkjzDrWYAzRLcXpnLVpaR+8wcjrhqA@mail.gmail.com>
Subject: Re: [PATCH 01/14] devres: Add devm_of_iomap()
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: linux-aspeed@lists.ozlabs.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>, devicetree <devicetree@vger.kernel.org>, Andrew Jeffery <andrew@aj.id.au>, linux-kernel@vger.kernel.org-v2
List-ID: <devicetree@vger.kernel.org>

On 27 June 2018 at 08:50, Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
> There are still quite a few cases where a device might want
> to get to a different node of the device-tree, obtain the
> resources and map them.
>
> We have of_iomap() and of_io_request_and_map() but they both
> have shortcomings, such as not returning the size of the
> resource found (which can be useful) and not being "managed".
>
> This adds a devm_of_iomap() that provides all of these and
> should probably replace uses of the above in most drivers.
>
> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>
