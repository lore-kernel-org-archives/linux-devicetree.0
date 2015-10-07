From: Siarhei Siamashka <siarhei.siamashka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: dts: sun4i: Allow to use the PH6
 pin for GPIO on pcDuino1/2
Date: Wed, 7 Oct 2015 07:27:31 +0300
Message-ID: <20151007072731.40db3695@i7>
References: <1443985128-23137-1-git-send-email-siarhei.siamashka@gmail.com>
	<1443985128-23137-2-git-send-email-siarhei.siamashka@gmail.com>
	<CAGb2v65n6ymon+sEASa726sam0KLOvMPbxTxCqvV4j0ust2PCA@mail.gmail.com>
	<20151005083940.78d04f63@i7>
	<20151005124949.GM2696@lukather>
Reply-To: siarhei.siamashka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCH4DA7NUEBBBN562KYAKGQEW6QRRMA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20151005124949.GM2696@lukather>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: wens-jdAy2FN1RRM@public.gmane.org, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Zoltan HERPAI <wigyori-1V5s5g7wVVk@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 5 Oct 2015 14:49:49 +0200
Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:

> On Mon, Oct 05, 2015 at 08:39:40AM +0300, Siarhei Siamashka wrote:
> > On Mon, 5 Oct 2015 09:55:28 +0800
> > Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> wrote:
> > 
> > > On Mon, Oct 5, 2015 at 2:58 AM, Siarhei Siamashka
> > > <siarhei.siamashka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > > > The pcDuino1 board does not use any power switches at all for its
> > > > two USB host ports and the VBUS pins are always connected to 5V.
> > > >
> > > > The pcDuino2 board uses the RT9701GB power switch for its single
> > > > USB host port, but the USB_EN pin (PD2) is pulled up with a 10K
> > > > resistor. So that the USB power is still enabled by default even
> > > > if nobody bothers to configure the PD2 pin or runs the pcDuino1
> > > > firmware.
> > > 
> > > Seems like it would be better if you had a regulator controlled
> > > by PD2. At least can shut down VBUS power when it wants to?
> > 
> > That's a good question.
> > 
> > Describing the regulator controlled by PD2 in the dts file is surely
> > the right solution for pcDuino2 boards. But in the case of using this
> > dts for pcDuino1, the kernel would think that it can shut down VBUS
> > power, while in fact this is not true.
> 
> I do agree that this is the right solution for the pcduino1, but it's
> definitely not the right one for the pcduino 2 then.
> 
> Declaring this as a regulator isn't just meant for the USB to be
> working, it's also meant so that it keeps working. If the pin is not
> claimed by anyone, the userspace and / or some other driver, will
> actually be able to grab that pin and do whatever it wants with it,
> effectively fiddling with the VBUS supply behind the USB driver's
> back.

OK. That's a very good point.

> It also allows to disable the regulator if VBUS isn't going to be
> used, for example because the driver has not be compiled in, or that
> it's actually a module that might (or might not) be loaded later.
> 
> Finally, it also allows to keep track of who consumes what amount of
> power in the system, which is a nice plus.
>
> > The RT9701GB switch also provides the current limiting feature in
> > addition to the ability to enable/disable the VBUS power. Probably
> > this was a real reason why it was added to the board.
> > 
> > Everything boils down to the question whether we want to have a
> > common dts file for pcDuino1 and pcDuino2 or decide to split them.
> 
> You don't have to split them, if this is really the only difference,
> just create a new dts for the pcduino2 that includes the first one,
> and add the supply there.

Well, we get two dts files instead of one as the end result. If "split"
is not a good description, then I should have probably used a different
word for it.

I don't mind having separate dts files for pcDuino1 and pcDuino2.
What are we going to do with testing on pcDuino1? I only have
pcDuino2 hardware myself.

-- 
Best regards,
Siarhei Siamashka
