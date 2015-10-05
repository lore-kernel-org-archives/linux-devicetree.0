From: Siarhei Siamashka <siarhei.siamashka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: dts: sun4i: Allow to use the PH6
 pin for GPIO on pcDuino1/2
Date: Mon, 5 Oct 2015 08:39:40 +0300
Message-ID: <20151005083940.78d04f63@i7>
References: <1443985128-23137-1-git-send-email-siarhei.siamashka@gmail.com>
	<1443985128-23137-2-git-send-email-siarhei.siamashka@gmail.com>
	<CAGb2v65n6ymon+sEASa726sam0KLOvMPbxTxCqvV4j0ust2PCA@mail.gmail.com>
Reply-To: siarhei.siamashka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCH4DA7NUEBBBIE2ZCYAKGQEKUNUZVA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <CAGb2v65n6ymon+sEASa726sam0KLOvMPbxTxCqvV4j0ust2PCA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: wens-jdAy2FN1RRM@public.gmane.org
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Zoltan HERPAI <wigyori-1V5s5g7wVVk@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 5 Oct 2015 09:55:28 +0800
Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> wrote:

> On Mon, Oct 5, 2015 at 2:58 AM, Siarhei Siamashka
> <siarhei.siamashka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > The pcDuino1 board does not use any power switches at all for its
> > two USB host ports and the VBUS pins are always connected to 5V.
> >
> > The pcDuino2 board uses the RT9701GB power switch for its single
> > USB host port, but the USB_EN pin (PD2) is pulled up with a 10K
> > resistor. So that the USB power is still enabled by default even
> > if nobody bothers to configure the PD2 pin or runs the pcDuino1
> > firmware.
> 
> Seems like it would be better if you had a regulator controlled
> by PD2. At least can shut down VBUS power when it wants to?

That's a good question.

Describing the regulator controlled by PD2 in the dts file is surely
the right solution for pcDuino2 boards. But in the case of using this
dts for pcDuino1, the kernel would think that it can shut down VBUS
power, while in fact this is not true.

The RT9701GB switch also provides the current limiting feature in
addition to the ability to enable/disable the VBUS power. Probably
this was a real reason why it was added to the board.

Everything boils down to the question whether we want to have a
common dts file for pcDuino1 and pcDuino2 or decide to split them.
Based on the schematics comparison, there do not seem to be any
substantial differences between these boards if we ignore the PD2
pin altogether. LinkSprite says that "Ubuntu images are same for
both pcDuino1 and pcDuino2" at their website:
    http://www.linksprite.com/?page_id=809

And I actually like their decision to have the PD2 pin pulled-up.
If every devboard manufacturer did a similar thing and had USB power
always enabled by default without any need to configure anything (with
or without the possibility to switch it off if necessary), then we
would have a much easier job with generic device-independent bootable
SD card installer images for Allwinner boards:

    http://lists.denx.de/pipermail/u-boot/2015-January/202306.html

    "USB host ports use dedicated pins and only enabling/disabling power
     can be device specific. The missing USB power can be solved by
     using a powered USB hub, which is not very convenient, but
     still a workable solution."

-- 
Best regards,
Siarhei Siamashka
