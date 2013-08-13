Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:47210 "EHLO
	mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756937Ab3HMPBr (ORCPT
	<rfc822;devicetree@vger.kernel.org>);
	Tue, 13 Aug 2013 11:01:47 -0400
Date: Tue, 13 Aug 2013 17:01:28 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
Subject: question about drivers/net/ethernet/nxp/lpc_eth.c
Message-ID: <alpine.DEB.2.02.1308131658460.2263@hadrien>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: devicetree-owner@vger.kernel.org
To: grant.likely@linaro.org, rob.herring@calxeda.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

I wonder why drivers/net/ethernet/nxp/lpc_eth.c uses dev_alloc_skb in the
function __lpc_handle_recv, rather than netdev_alloc_skb?  The difference
seems to be only that with dev_alloc_skb, the dev field of the skb is
initialized to NULL, rather than to a net_device, but this function seems
to have a net_device value available, so I wonder why it is not used?

thanks,
julia
