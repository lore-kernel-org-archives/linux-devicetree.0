From: "'Kishon Vijay Abraham I' via linux-sunxi" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Subject: Re: [PATCH 1/6] phy: sun4i-usb: add support for R40 USB PHY
Date: Wed, 18 Oct 2017 17:09:00 +0530
Message-ID: <46407134-3d1f-0132-f692-1536dcc47980@ti.com>
References: <20171008042906.46779-1-icenowy@aosc.io>
 <20171008042906.46779-2-icenowy@aosc.io>
 <20171009205839.432f6jd5zhmstwp3@flea.home>
Reply-To: kishon-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCOOP4VF5IDRBZH2TTHQKGQEED57UQA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20171009205839.432f6jd5zhmstwp3-YififvaboMKzQB+pC5nmwQ@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On Tuesday 10 October 2017 02:28 AM, Maxime Ripard wrote:
> On Sun, Oct 08, 2017 at 04:29:01AM +0000, Icenowy Zheng wrote:
>> Allwinner R40 features a USB PHY like the one in A64, but with 3 PHYs.
>>
>> Add support for it.
>>
>> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> 
> Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Is this patch good to be merged? I see you have pending comments on the other
patch in the series.

Thanks
Kishon
