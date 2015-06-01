From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v4] drivers: soc: sunxi: Introduce SoC
 driver to map SRAMs
Date: Mon, 01 Jun 2015 17:58:26 +0200
Message-ID: <4341126.tsXmi47bFP@wuerfel>
References: <1433149466-17013-1-git-send-email-maxime.ripard@free-electrons.com>
Reply-To: arnd-r2nGTMty4D4@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDEKVJM7XAHRBK4CWKVQKGQEX67VX4A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1433149466-17013-1-git-send-email-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Monday 01 June 2015 11:04:26 Maxime Ripard wrote:
> The Allwinner SoCs have a handful of SRAM that can be either mapped to be
> accessible by devices or the CPU.
> 
> That mapping is controlled by an SRAM controller, and that mapping might
> not be set by the bootloader, for example if the device wasn't used at all,
> or if we're using solutions like the U-Boot's Falcon Boot.
> 
> We could also imagine changing this at runtime for example to change the
> mapping of these SRAMs to use them for suspend/resume or runtime memory
> rate change, if that ever happens.
> 
> These use cases require some API in the kernel to control that mapping,
> exported through a drivers/soc driver.
> 
> This driver also implement a debugfs file that shows the SRAM found in the
> system, the current mapping and the SRAM that have been claimed by some
> drivers in the kernel.
> 
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> Acked-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Tested-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
> 
> Hi Arnd, Kevin, Olof,
> 
> Could you please apply directly this patch to your tree?
> 
> It's the only driver related patch that should come in for this release
> cycle.
> 

Applied to next/drivers. Thanks for your hard work to get it adapted to all
my wishes over your weekend, very much appreciated.

	Arnd
