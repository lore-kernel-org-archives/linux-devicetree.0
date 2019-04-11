Return-Path: <SRS0=bLyw=SN=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:52024 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725783AbfDKHH5 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 11 Apr 2019 03:07:57 -0400
Date: Thu, 11 Apr 2019 15:07:36 +0800
From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 1/1] ARM: dts: imx6sx: select rgmii-id phy mode
Message-ID: <20190411070735.GF26817@dragon>
References: <1554781105-3514-1-git-send-email-fugang.duan@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1554781105-3514-1-git-send-email-fugang.duan@nxp.com>
Sender: devicetree-owner@vger.kernel.org
To: Andy Duan <fugang.duan@nxp.com>
Cc: "festevam@gmail.com" <festevam@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Tue, Apr 09, 2019 at 03:39:18AM +0000, Andy Duan wrote:
> The PHY AR8031 must add both tx and rx delay. But PHY driver
> disable tx/rx delay by default in Commit 6d4cd041f0af(net: phy:
> at803x: disable delay only for RGMII mode), which brokes i.MX6SX
> sdb board networking.
> 
> So enable rgmii-txid phy mode to enable the tx/rx delay.
> 
> Signed-off-by: Fugang Duan <fugang.duan@nxp.com>

We already queued a patch from Fabio [1] that covers imx6sx-sdb.

Shawn

[1] https://patchwork.kernel.org/patch/10884569/
