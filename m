From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] rtc/spear: Add Device Tree probing capability
Date: Mon, 26 Mar 2012 12:36:04 +0000
Message-ID: <201203261236.05037.arnd@arndb.de>
References: <8747a4b3bdcfb7b3384c14ca909228e1164d0fc5.1332755275.git.viresh.kumar@st.com> <201203261332.02073.sr@denx.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201203261332.02073.sr@denx.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Roese <sr@denx.de>
Cc: Viresh Kumar <viresh.kumar@st.com>, akpm@linux-foundation.org, devicetree-discuss@lists.ozlabs.org, rajeev-dlh.kumar@st.com, linux-kernel@vger.kernel.org, rtc-linux@googlegroups.com, a.zummo@towertech.it, spear-devel@list.st.com, viresh.linux@gmail.com, Rob Herring <robherring2@gmail.com>
List-Id: devicetree@vger.kernel.org

On Monday 26 March 2012, Stefan Roese wrote:
> > diff --git a/Documentation/devicetree/bindings/rtc/spear-rtc.txt
> > b/Documentation/devicetree/bindings/rtc/spear-rtc.txt new file mode 100644
> > index 0000000..928410f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/rtc/spear-rtc.txt
> > @@ -0,0 +1,18 @@
> > +* SPEAr RTC
> > +
> > +Required properties:
> > +- compatible : "st,spear-rtc"
> > +- reg : Address range of the rtc registers
> > +- interrupt-parent: Should be the phandle for the interrupt controller
> > +  that services interrupts for this device
> > +- interrupt: Should contain the rtc interrupt number
> > +
> > +Example:
> > +
> > +     rtc@fc000000 {
> > +             compatible = "st,spear-rtc";
> 
> With Rob's comments in mind, wouldn't it be better to use a more specific 
> compatible property? Should we stick with "st,spear600-rtc"? Or use "st-
> spear300-rtc" as "oldest" SoC variant?

I wouldn't mind if you list all three, or at least spear600 as the actual
chip and spear300 as the one that introduced the device. Of course, if the
device itself is licensed from some other vendor or was used in a prior product,
I would list that one.

	Arnd
