Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:28778 "EHLO
	mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755438Ab3HMG31 (ORCPT
	<rfc822;devicetree@vger.kernel.org>);
	Tue, 13 Aug 2013 02:29:27 -0400
Date: Tue, 13 Aug 2013 08:29:24 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
Subject: Re: question about netif_rx
In-Reply-To: <20130813052036.GA11640@electric-eye.fr.zoreil.com>
Message-ID: <alpine.DEB.2.02.1308130828550.1997@localhost6.localdomain6>
References: <alpine.DEB.2.02.1308111151210.2072@localhost6.localdomain6> <20130811155640.GA10070@electric-eye.fr.zoreil.com> <alpine.DEB.2.02.1308111811440.2072@localhost6.localdomain6> <20130813052036.GA11640@electric-eye.fr.zoreil.com>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323328-1654509347-1376375365=:1997"
Sender: devicetree-owner@vger.kernel.org
To: Francois Romieu <romieu@fr.zoreil.com>
Cc: Julia Lawall <julia.lawall@lip6.fr>, grant.likely@linaro.org, rob.herring@calxeda.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1654509347-1376375365=:1997
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Tue, 13 Aug 2013, Francois Romieu wrote:

> Julia Lawall <julia.lawall@lip6.fr> :
> > François Romieu <romieu@fr.zoreil.com> :
> [...]
> > > Can you send a netif_receive_skb replacement patch for it ?
> > 
> > Just to be sure, I just replace netif_rx by netif_receive_skb, nothing
> > else?
> 
> Yes. It should imho be fine with a comment incluing your analysis and a
> few words about the current state of checksum offloading support.

I wouldn't know what to say about the checksum part.  It is not supported 
so I should use netif_receive_skb?

thanks,
julia
--8323328-1654509347-1376375365=:1997--
