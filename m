From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: Re: [PATCH v3 00/28] Allwinner H6 DE3 and HDMI support
Date: Mon, 03 Dec 2018 19:09:50 +0100
Message-ID: <14295738.m69morCfDC@jernej-laptop>
References: <20181104182705.18047-1-jernej.skrabec@siol.net> <20181105094341.qedt7jvnxooiojki@flea>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDQNBWPU7YERB5HCSXQAKGQENSS3JBI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20181105094341.qedt7jvnxooiojki@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: wens-jdAy2FN1RRM@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Dne ponedeljek, 05. november 2018 ob 10:43:41 CET je Maxime Ripard napisal(a):
> On Sun, Nov 04, 2018 at 07:26:37PM +0100, Jernej Skrabec wrote:
> > This series adds support for Display Engine 3.0 and HDMI 2.0a, which
> > can be found on H6 SoC.
> > 
> > Display Engine 3.0 in comparison to 2.0 mostly adds features needed for
> > displaying and processing 10-bit and AFBC formats, which are not yet
> > supported by this series.
> > 
> > H6 is also the first SoC which supports IOMMU, but support for it is
> > not yet added.
> > 
> > This series is based on linux-next at next-20181102.
> > 
> > I suggest all patches go through allwinner tree, except DRM patches,
> > which should go through drm-misc tree.
> 
> Applied all patches up to the 26. The two last one however should not
> use the clk bindings define you added in the first clk patches, since
> clk and dt patches are going through different tree.

I think you forgot to merge patch "drm/sun4i: Add compatible for H6 display 
engine". At least it is not in linux-next.

Best regards,
Jernej
