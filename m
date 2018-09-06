From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: Re: [PATCH v4 11/11] arm64: dts: allwinner: a64: Enable
 HDMI output on A64 boards w/ HDMI
Date: Thu, 06 Sep 2018 07:07:19 +0200
Message-ID: <1794260.muFTeCcfyt@jernej-laptop>
References: <20180904044053.15425-1-icenowy@aosc.io> <20180905075136.chumwosx76o2n66l@flea> <CAMty3ZAVr_d+Rwry_DMWY221OC+YSWmReNm-TXzYWgpd1s68+w@mail.gmail.com>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDQNBWPU7YERBDXMYLOAKGQEPWJZFII-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAMty3ZAVr_d+Rwry_DMWY221OC+YSWmReNm-TXzYWgpd1s68+w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Jagan,

Dne sreda, 05. september 2018 ob 09:57:54 CEST je Jagan Teki napisal(a):
> On Wed, Sep 5, 2018 at 1:21 PM, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> 
wrote:
> > On Wed, Sep 05, 2018 at 12:56:03PM +0530, Jagan Teki wrote:
> >> On Tue, Sep 4, 2018 at 10:10 AM, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
> >> > From: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> >> > 
> >> > Enable all necessary device tree nodes and add connector node to device
> >> > trees for all supported A64 boards with HDMI.
> >> > 
> >> > Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> >> > [Icenowy: squash all board patches altogether and change supply name]
> >> > Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> >> > ---
> >> > Changes in v4:
> >> > - Rebase some device trees.
> >> > Changes in v3,1:
> >> > - Squash all enablement patches altogether.
> >> > - Change supply name to match DT binding & driver change.
> >> > Changes for v3:
> >> > - Enable all pipeline components
> >> > Changes for v2:
> >> > - none
> >> > 
> >> >  .../dts/allwinner/sun50i-a64-bananapi-m64.dts | 34 +++++++++++++++++++
> >> >  .../dts/allwinner/sun50i-a64-nanopi-a64.dts   | 34 +++++++++++++++++++
> >> >  .../dts/allwinner/sun50i-a64-olinuxino.dts    | 34 +++++++++++++++++++
> >> >  .../dts/allwinner/sun50i-a64-orangepi-win.dts | 34 +++++++++++++++++++
> >> >  .../boot/dts/allwinner/sun50i-a64-pine64.dts  | 34 +++++++++++++++++++
> >> >  .../allwinner/sun50i-a64-sopine-baseboard.dts | 34 +++++++++++++++++++
> >> >  6 files changed, 204 insertions(+)
> >> 
> >> Tested-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org> # BPI-M64, OPI-Win,
> >> A64-Olinuxino, NPI-A64
> >> 
> >> Pine64 boards look unable by saying
> >> [drm] Cannot find any crtc or sizes
> >> 
> >> May be someone can confirm, it.
> > 
> > Then we should drop the pine64 additions until someone figures it out,
> > as it has been already discussed.
> 
> That is fine, but If anyone have pine64 can confirm this.

What is your monitor default resolution and more importantly, what is it's 
pixel clock?

Pine64 has U-Boot support for DE2/HDMI, which has some pixel clock issues 
which can influence Linux, unfortunately. At the time, there wasn't enough 
knowledge to do it properly. I plan to update it after A64 DE2/HDMI support is 
finished in kernel.

Meanwhile, can you test if it works for you either with disabled DE2/HDMI in 
U-Boot or if you apply this patch to Linux:
https://github.com/jernejsk/linux-1/commit/
019121f953229ca2d624ac39300289a24e5389a1

Best regards,
Jernej
