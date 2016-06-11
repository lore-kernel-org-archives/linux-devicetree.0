From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 0/3] Add dis_rxdet_inp3_quirk property to USB3 node
Date: Sat, 11 Jun 2016 22:13:54 +0800
Message-ID: <20160611141354.GU20243@tiger>
References: <1465539826-5519-1-git-send-email-rajesh.bhagat@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1465539826-5519-1-git-send-email-rajesh.bhagat@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rajesh Bhagat <rajesh.bhagat@nxp.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, sriram.dash@nxp.com
List-Id: devicetree@vger.kernel.org

On Fri, Jun 10, 2016 at 11:53:43AM +0530, Rajesh Bhagat wrote:
> Adds dis_rxdet_inp3_quirk property to USB3 nodes of ls1021a, ls2080a
> and ls1043a platform.
> 
> Rajesh Bhagat (3):
>   arm: dts: ls1021a: Add dis_rxdet_inp3_quirk property to USB3 node
>   arm: dts: ls2080a: Add dis_rxdet_inp3_quirk property to USB3 node
>   arm: dts: ls1043a: Add dis_rxdet_inp3_quirk property to USB3 node

The last two should be prefixed 'arm64'.  I fixed them up and applied
all 3, thanks.

Shawn
