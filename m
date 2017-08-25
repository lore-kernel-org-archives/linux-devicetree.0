From: Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] arm64: allwinner: h5: add support for
 NanoPi NEO Plus 2
Date: Fri, 25 Aug 2017 14:05:42 +0200
Message-ID: <20170825120542.GA9475@Red>
References: <20170824231716.2623-1-antony@phenome.org>
 <20170825103242.5665-1-antony@phenome.org>
Reply-To: clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBD7YLCN32UNBBH5FQDGQKGQETTB2YPA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170825103242.5665-1-antony-AVhj06Q78b5AfugRpC6u6w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Antony Antony <antony-AVhj06Q78b5AfugRpC6u6w@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 25, 2017 at 12:32:42PM +0200, Antony Antony wrote:
> 	Add initial DT support for NanoPi NEO Plus 2 by FriendlyELEC
> 		Allwinner quad core H5 Cortex A53 with an ARM Mali-450MP GPU
> 		1 GB DDR3 RAM
> 		8GB eMMC flash (Samsung KLM8G1WEPD-B031)
> 		micro SD card slot
> 		Gigabit Ethernet (external RTL8211E-VB-CG chip)
> 		802.11 b/g/n WiFi, Bluetooth 4.0 (Ampak AP6212A module)
> 		2x USB 2.0 host ports & 2x USB via headers
> 
>     The DTS is based on OrangePi PC 2, sun50i-h5-orangepi-pc2
>     Added dwmac-sun8i Gigabit Ethernet support based on
>     Nano Pi Neo2 DT and the schematics.
> 
> Signed-off-by: Antony Antony <antony-AVhj06Q78b5AfugRpC6u6w@public.gmane.org>

Hello

I do not see changes between v1 to v2.
And you need to set your real name in signed-off.

Regards
Corentin Labbe
