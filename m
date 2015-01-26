From: Adam Sampson <ats-G+91BasbrijYtjvyW6yDsg@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun7i: Add dts file for pcDuino 3
 Nano board
Date: Mon, 26 Jan 2015 13:59:31 +0000
Message-ID: <20150126135931.GB871@cartman.at.offog.org>
References: <1422199921-325-1-git-send-email-ats@offog.org>
 <20150125164846.GL8470@lukather>
 <20150126003520.GA871@cartman.at.offog.org>
 <20150126100921.GQ8470@lukather>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCQPXGGUXQGBBSMQTGTAKGQEHNGR27I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150126100921.GQ8470@lukather>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Maxime,

On Mon, Jan 26, 2015 at 11:09:21AM +0100, Maxime Ripard wrote:
> If you read Documentation/leds/leds-class.txt, the pattern to follow is:
> "devicename:colour:function"
> so it should rather be pcduino3-nano:green:usr1 and usr2, or some
> other thing.

How about pcduino3-nano:green:usr-led3/4? Or ...:usr1/2, and a comment
in the .dts explaining how they're labelled on the board?

There are a couple of other sunxi boards that have the same problem
(multiple user-controllable LEDs of the same colour):

sun4i-a10-marsboard.dts: label = "marsboard:red1:usr";
sun4i-a10-marsboard.dts: label = "marsboard:red2:usr";
sun4i-a10-marsboard.dts: label = "marsboard:red3:usr";
sun4i-a10-marsboard.dts: label = "marsboard:red4:usr";
sun9i-a80-optimus.dts: label = "optimus:led2:usr";
sun9i-a80-optimus.dts: label = "optimus:led4:usr";

I can send a patch for those if you'd like as well?

> > Should there be aliases for I2C as well, since the same situation
> > applies (i2c0 and i2c2)?
> Yep.

Added.

> > More generally, is it correct to add nodes like these (uart2, spi0,
> > i2c2) for features that appear on the Arduino GPIO headers?
> If those pins are specifically dedicated to this feature, then yes.

They're multipurpose pins on Arduino-compatible headers:
http://learn.linksprite.com/wp-content/uploads/2014/10/pcDuino3-Nano_header-Model.jpg

How you want them to be configured will depend on what you have plugged
in; for example, some Arduino add-on boards will expect J11 P1/2 to be
serial RX/TX and some will expect them to be GPIOs. So should we
configure i2c2 etc. by default (and let the user turn them into GPIOs
if required), or just provide the GPIOs (and require the user to adjust
the .dts)?

Cheers,

-- 
Adam Sampson <ats-G+91BasbrijYtjvyW6yDsg@public.gmane.org>                         <http://offog.org/>
