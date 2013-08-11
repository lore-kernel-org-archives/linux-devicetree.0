Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104]:3630 "EHLO
	mail3-relais-sop.national.inria.fr" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752805Ab3HKJ4N (ORCPT
	<rfc822;devicetree@vger.kernel.org>);
	Sun, 11 Aug 2013 05:56:13 -0400
Date: Sun, 11 Aug 2013 11:56:09 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
Subject: question about netif_rx
Message-ID: <alpine.DEB.2.02.1308111151210.2072@localhost6.localdomain6>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: devicetree-owner@vger.kernel.org
To: romieu@fr.zoreil.com, grant.likely@linaro.org, rob.herring@calxeda.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

To my limited understanding, in a NAPI polling function, one should use 
netif_receive_skb, rather than netif_rx.  However, the via-velocity driver 
defines the NAPI polling function velocity_poll, which is the only caller 
of velocity_rx_srv, which is the only caller of velocity_receive_frame, 
which calls netif_rx.  The call to netif_rx seems to predate the 
introduction of NAPI in this driver.  Is this correct?

thanks,
julia
