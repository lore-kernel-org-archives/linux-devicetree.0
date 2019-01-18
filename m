From: Richard Cochran <richardcochran@gmail.com>
Subject: Re: [v2, 5/5] ptp_qoriq: add fiper pulse loopback support
Date: Thu, 17 Jan 2019 17:44:20 -0800
Message-ID: <20190118014420.rlyk36477cqj6yb7@localhost>
References: <20190117014936.48117-1-yangbo.lu@nxp.com>
 <20190117014936.48117-6-yangbo.lu@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190117014936.48117-6-yangbo.lu@nxp.com>
Sender: netdev-owner@vger.kernel.org
To: Yangbo Lu <yangbo.lu@nxp.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 17, 2019 at 09:49:36AM +0800, Yangbo Lu wrote:
> This patch is to add Kconfig options to support fiper
> pulse loopback mode. This is very useful for validating
> hardware and driver without external hardware.

To me this feature makes more sense as a debugf-fs option.

Thanks,
Richard
