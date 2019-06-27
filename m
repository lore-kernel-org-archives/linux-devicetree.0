From: Vivek Unune <npcomplete13-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] arm64: dts: rockchip: Add support for Hugsun X99 TV Box
Date: Thu, 27 Jun 2019 09:45:55 -0400
Message-ID: <20190627134555.GA25086@ubuntu>
References: <2273961.GTPgWWlV5T@phil>
 <20190621205308.5177-1-npcomplete13@gmail.com>
 <3247989.aGYRIomCNH@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <3247989.aGYRIomCNH@phil>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 27, 2019 at 12:38:25AM +0200, Heiko Stuebner wrote:
> Am Freitag, 21. Juni 2019, 22:53:08 CEST schrieb Vivek Unune:
> > Add devicetree support for Hugsun X99 TV Box based on RK3399 SoC
> > 
> > Tested with LibreElec running kernel v5.1.2.
> > Following peripherals tested and work:
> > 
> > Peripheral works:
> > - UART2 debug
> > - eMMC
> > - USB 3.0 port
> > - USB 2.0 port
> > - sdio, sd-card
> > - HDMI
> > - Ethernet
> > - WiFi/BT
> > 
> > Not tested:
> > - Type-C port
> > - OPTICAL
> > - IR
> > 
> > Signed-off-by: Vivek Unune <npcomplete13-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> applied for 5.3 after doing some reordering to make things
> alphabetical.
> 
> Heiko
> 
> 
Thanks Heiko!
