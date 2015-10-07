From: Siarhei Siamashka <siarhei.siamashka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/3] ARM: dts: sun4i: USB DRC and
 voltage-scaling for pcDuino1/2
Date: Wed, 7 Oct 2015 07:06:52 +0300
Message-ID: <20151007070652.3ff06358@i7>
References: <1443985128-23137-1-git-send-email-siarhei.siamashka@gmail.com>
	<20151005123848.GL2696@lukather>
Reply-To: siarhei.siamashka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCH4DA7NUEBBBX5U2KYAKGQERQCVXDI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20151005123848.GL2696@lukather>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Zoltan HERPAI <wigyori-1V5s5g7wVVk@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 5 Oct 2015 14:38:48 +0200
Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:

> Hi,
> 
> On Sun, Oct 04, 2015 at 09:58:45PM +0300, Siarhei Siamashka wrote:
> > Hello,
> > 
> > This brings LinkSprite pcDuino1/2 boards up to date with the latest
> > kernel features. And the first patch in this set is a bugfix for the
> > PH3/PH6 pins misuse.
> > 
> > There is currently a single dts file for pcDuino1 and pcDuino2 boards.
> > They obviously had been designed to be compatible with each other, but
> > have some minor differences, as can be seen when comparing schematics:
> >     https://s3.amazonaws.com/pcduino/Hardware/PC+Duino_V01-20130128.pdf
> >     https://s3.amazonaws.com/pcduino/Hardware/v2/pcDuino_v2_sch.pdf
> 
> Usually, the way we handle this is simply by including just the other
> DT that will only hold those differences.
> 
> What are those differences exactly ?

For the exact differences, one might look into the pdf schematics
files (that's why I have provided links). But a short summary is
the following:

* pcDuino1 has two USB host receptacles, but pcDuino2 has one USB host
  receptacle and a USB WIFI chip.
* There is this difference with the USB_EN pin (PD2), which controls
  a USB power switch in pcDuino2. There is no USB power switch in
  pcDuino1 and the PD2 pin is apparently only connected to a test
  point on the PCB.
* The SZQ resistor is different, which might mean different DDR3
  tracks routing.
* The Ethernet transceiver is different (RTL8201CP in pcDuino1 and
  IP101A_LF in pcDuino2).
* An extra LED is connected to the WIFI chip, but can't be accessed
  in any other way.

Other than the PD2 pin, nothing else seems to be really relevant
to the dts file. And even the PD2 pin is pulled-up in pcDuino2,
making the USB host port powered by default just like in pcDuino1.

-- 
Best regards,
Siarhei Siamashka
