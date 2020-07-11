Return-Path: <SRS0=t1WB=AW=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EAC4C433DF
	for <linux-devicetree@archiver.kernel.org>; Sat, 11 Jul 2020 16:42:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 70EEF20786
	for <linux-devicetree@archiver.kernel.org>; Sat, 11 Jul 2020 16:42:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728471AbgGKQmb (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 11 Jul 2020 12:42:31 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:58630 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728412AbgGKQma (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sat, 11 Jul 2020 12:42:30 -0400
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
        (envelope-from <andrew@lunn.ch>)
        id 1juIa3-004dhU-17; Sat, 11 Jul 2020 18:42:27 +0200
Date:   Sat, 11 Jul 2020 18:42:27 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Kurt Kanzenbach <kurt@linutronix.de>
Cc:     Rob Herring <robh@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vivien Didelot <vivien.didelot@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        netdev <netdev@vger.kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v1 1/1] dt-bindings: net: dsa: Add DSA yaml binding
Message-ID: <20200711164227.GN1014141@lunn.ch>
References: <20200710090618.28945-1-kurt@linutronix.de>
 <20200710090618.28945-2-kurt@linutronix.de>
 <20200710164500.GA2775934@bogus>
 <8c105489-42c5-b4ba-73b6-c3a858f646a6@gmail.com>
 <CAL_Jsq+zP9++MftM+Dh2Fe-OdKq6EiGA_tASEbBwA_jEdwoFCA@mail.gmail.com>
 <871rliw9cq.fsf@kurt>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <871rliw9cq.fsf@kurt>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

> > Though I missed that this is really just a conversion of dsa.txt which
> > should be removed in this patch. Otherwise, you'll get me re-reviewing
> > the binding.
> 
> Yes, it's a conversion of the dsa.txt. I should have stated that more
> clearly. I didn't remove the .txt file, because it's referenced in all
> the different switch bindings such as b53.txt, ksz.txt and so on. How to
> handle that?

~/linux$ cat Documentation/devicetree/bindings/net/ethernet.txt 
This file has moved to ethernet-controller.yaml.

As an example. Once all the other files which reference it have been
converted, we can come back and remove the .txt file.

   Andrew
