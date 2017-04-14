From: Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH 4/4] net: macb: Add macb_ptp to compilation chain
Date: Fri, 14 Apr 2017 09:53:43 +0200
Message-ID: <20170414075343.GB1660@localhost.localdomain>
References: <1492090439-11793-1-git-send-email-rafalo@cadence.com>
 <1492090798-16253-1-git-send-email-rafalo@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1492090798-16253-1-git-send-email-rafalo@cadence.com>
Sender: netdev-owner@vger.kernel.org
To: Rafal Ozieblo <rafalo@cadence.com>
Cc: David Miller <davem@davemloft.net>, nicolas.ferre@atmel.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, harinikatakamlinux@gmail.com, harini.katakam@xilinx.com, Andrei.Pistirica@microchip.com
List-Id: devicetree@vger.kernel.org

On Thu, Apr 13, 2017 at 02:39:58PM +0100, Rafal Ozieblo wrote:
> Add macb_ptp.c to Makefile.
> In case that macb is compiled as a module, it has been renamed to
> cadence-macb.ko to avoid naming confusion in Makefile.

Renaming modules will break user's modpobe scripts.

Why not keep macb.ko as the build product and rename macb.c to
macb_main.c instead?

Thanks,
Richard
