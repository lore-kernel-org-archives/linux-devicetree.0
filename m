From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: Re: [PATCH v2 00/16] Implement H3/H5 HDMI driver
Date: Wed, 28 Feb 2018 22:23:35 +0100
Message-ID: <2235934.0TF68fluGz@jernej-laptop>
References: <20180227222701.9716-1-jernej.skrabec@siol.net>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDQNBWPU7YERBW533TKAKGQEBCHWEFA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180227222701.9716-1-jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Cc: wens-jdAy2FN1RRM@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Maxime,

Dne torek, 27. februar 2018 ob 23:26:45 CET je Jernej Skrabec napisal(a):
> This series implements H3/H5 HDMI driver. It was tested on OrangePi 2 (H3),
> OrangePi Plus2e (H3) and OrangePi PC2 (H5) with many resolutions and it
> works well. Bug, which prevented correct operation for some resolutions,
> is also fixed.
> 
> Code is based on linux-next, next-20180226 tag.

Today I tried on this series on  next-20180228, but resolution switching 
doesn't really work. The reason for this is use of clk_set_rate_exclusive() in 
sun4i_tcon1_mode_set(). If I revert it to ordinary clk_set_rate() it works ok. 
I investigated a bit and it seems that clocks stays at first set even if tcon 
(the owner of exclusive lock) request the new one. Example:

[   69.325732] TCON clk wanted: 148500000
[   69.325740] TCON real clk: 69272728
[   69.325770] HDMI clk wanted: 148500000
[   69.325773] HDMI real clk: 138545455
[   69.325815] HDMI PHY clk wanted: 148500000
[   69.325819] HDMI PHY real clk: 138545454

Is there anything I can do to help debug this?

Best regards,
Jernej
