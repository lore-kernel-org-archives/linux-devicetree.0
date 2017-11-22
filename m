From: Yong <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 1/3] media: V3s: Add support for
 Allwinner CSI.
Date: Wed, 22 Nov 2017 09:33:06 +0800
Message-ID: <20171122093306.d30fe641f269d62daa1f66b4@magewell.com>
References: <1501131697-1359-1-git-send-email-yong.deng@magewell.com>
	<1501131697-1359-2-git-send-email-yong.deng@magewell.com>
	<20171121154827.5a35xa6zlqrrvkxx@flea.lan>
Reply-To: yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBD2JNYHK4MEBB25H2PIAKGQEGMVQEOQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20171121154827.5a35xa6zlqrrvkxx-ZC1Zs529Oq4@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Hugues Fruchet <hugues.fruchet-qxv4g6HH51o@public.gmane.org>, Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jean-Christophe Trotin <jean-christophe.trotin-qxv4g6HH51o@public.gmane.org>, Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, Minghsiu Tsai <minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sun
List-Id: devicetree@vger.kernel.org

On Tue, 21 Nov 2017 16:48:27 +0100
Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:

> Hi,
> 
> On Thu, Jul 27, 2017 at 01:01:35PM +0800, Yong Deng wrote:
> > Allwinner V3s SoC have two CSI module. CSI0 is used for MIPI interface
> > and CSI1 is used for parallel interface. This is not documented in
> > datasheet but by testing and guess.
> > 
> > This patch implement a v4l2 framework driver for it.
> > 
> > Currently, the driver only support the parallel interface. MIPI-CSI2,
> > ISP's support are not included in this patch.
> > 
> > Signed-off-by: Yong Deng <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>
> 
> Thanks again for this driver.
> 
> It seems like at least this iteration is behaving in a weird way with
> DMA transfers for at least YU12 and NV12 (and I would assume YV12).
> 
> Starting a transfer of multiple frames in either of these formats,
> using either ffmpeg (ffmpeg -f v4l2 -video_size 640x480 -framerate 30
> -i /dev/video0 output.mkv) or yavta (yavta -c80 -p -F --skip 0 -f NV12
> -s 640x480 $(media-c tl -e 'sun6i-csi')) will end up in a panic.
> 
> The panic seems to be generated with random data going into parts of
> the kernel memory, the pattern being in my case something like
> 0x8287868a which is very odd (always around 0x88)
> 
> It turns out that when you cover the sensor, the values change to
> around 0x28, so it really seems like it's pixels that have been copied
> there.
> 
> I've looked quickly at the DMA setup, and it seems reasonable to
> me. Do you have the same issue on your side? Have you been able to
> test those formats using your hardware?

I had tested the following formats with BT1120 input:
V4L2_PIX_FMT_NV12		-> NV12
V4L2_PIX_FMT_NV21		-> NV21
V4L2_PIX_FMT_NV16		-> NV16
V4L2_PIX_FMT_NV61		-> NV61
V4L2_PIX_FMT_YUV420		-> YU12
V4L2_PIX_FMT_YVU420		-> YV12
V4L2_PIX_FMT_YUV422P		-> 422P
And they all work fine.

> 
> Given that they all are planar formats and YUYV and the likes work
> just fine, maybe we can leave them aside for now?

V4L2_PIX_FMT_YUV422P and V4L2_PIX_FMT_YUYV is OK, and V4L2_PIX_FMT_NV12
is bad? It's really weird.

What's your input bus code format, type and width?

> 
> Thanks!
> Maxime
> 
> -- 
> Maxime Ripard, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com


Thanks,
Yong
