Return-Path: <SRS0=wvnl=TK=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:57992 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726864AbfEJCxZ (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 9 May 2019 22:53:25 -0400
Date: Fri, 10 May 2019 10:53:03 +0800
From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [v4] arm64: dts: ls1028a: Add properties for Mali DP500 node
Message-ID: <20190510025302.GB15856@dragon>
References: <20190422101941.11335-1-wen.he_1@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190422101941.11335-1-wen.he_1@nxp.com>
Sender: devicetree-owner@vger.kernel.org
To: Wen He <wen.he_1@nxp.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Leo Li <leoyang.li@nxp.com>, "liviu.dudau@arm.com" <liviu.dudau@arm.com>
List-ID: <devicetree@vger.kernel.org>

On Mon, Apr 22, 2019 at 10:18:10AM +0000, Wen He wrote:
> The LS1028A has a LCD controller and Displayport interface that
> connects to eDP and Displayport connectors on the LS1028A board.
> 
> This patch enables the LCD controller driver on the LS1028A.
> 
> Signed-off-by: Alison Wang <alison.wang@nxp.com>
> Signed-off-by: Wen He <wen.he_1@nxp.com>
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Hi Wen,

The base64 encoding of the message makes it very difficult to apply the
patch.  I managed to apply it manually this time, but please do not use
base64 for future patch posting.

Shawn
