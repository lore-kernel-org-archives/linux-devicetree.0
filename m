From: Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH 09/10] dpaa_eth: add support for hardware timestamping
Date: Tue, 5 Jun 2018 06:57:49 -0700
Message-ID: <20180605135748.mlarwiyzf2oe27ax@localhost>
References: <20180604070837.19265-1-yangbo.lu@nxp.com>
 <20180604070837.19265-10-yangbo.lu@nxp.com>
 <20180604134920.ezhe6jz5ntpnqyzj@localhost>
 <DB6PR0401MB2536376432EC481473A5B4A3F8660@DB6PR0401MB2536.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <DB6PR0401MB2536376432EC481473A5B4A3F8660@DB6PR0401MB2536.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Y.b. Lu" <yangbo.lu@nxp.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, Madalin-cristian Bucur <madalin.bucur@nxp.com>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "David S . Miller" <davem@davemloft.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 05, 2018 at 03:35:28AM +0000, Y.b. Lu wrote:
> [Y.b. Lu] Actually these timestamping codes affected DPAA networking performance in our previous performance test.
> That's why we used ifdef for it.

How much does time stamping hurt performance?

If the time stamping is compiled in but not enabled at run time, does
it still affect performace?

Thanks,
Richard
