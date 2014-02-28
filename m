From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 0/9] Doc/DT: DT bindings for various display components
Date: Fri, 28 Feb 2014 13:37:07 +0100
Message-ID: <531082F3.6050501@samsung.com>
References: <1393590016-9361-1-git-send-email-tomi.valkeinen@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1393590016-9361-1-git-send-email-tomi.valkeinen@ti.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: Tomi Valkeinen <tomi.valkeinen@ti.com>, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Tomi,

On 28.02.2014 13:20, Tomi Valkeinen wrote:
> Hi,
>
> This series is a re-send of
> http://article.gmane.org/gmane.linux.drivers.devicetree/61739
>
> I'm cc'ing more people, and I want to clarify the contents of the series:
>
> While this has been developed for OMAP, only the first patch is about OMAP
> bindings. The rest are generic bindings for video components, which can be used
> on any platform.
>
> The bindings use the V4L2 style video port/endpoint system, described in
> Documentation/devicetree/bindings/media/video-interfaces.txt, to connect the
> components. The same port/endpoint bindings are used by Philipp Zabel in his
> imx-drm patch series.
>
> Shortly about the display components in the series, in the order of probable
> public interest:
>
> * Analog TV, DVI and HDMI Connectors represent a respective connector on the
>    board. They don't do much, but they do mark the end of the video pipeline (from
>    the board's pov), and they should also in the future offer ways to handle
>    things like the +5V pin on DVI and HDMI connector and HPD pin.
>
> * MIPI DPI panel and MIPI DSI CM panels represent bindings for simple panels
>    using the respective video bus.

I'm yet to take a deeper look at this series, but have you seen Andrzej 
Hajda's patches adding support for DSI panels on Exynos [1] ?

[1] http://thread.gmane.org/gmane.linux.kernel.samsung-soc/27044

Best regards,
Tomasz
