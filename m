From: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: [PATCH v6 0/3] ARM: sun7i/sun6i: irqchip: Irqchip
 driver for NMI controller
Date: Wed, 19 Mar 2014 13:41:26 +0100 (CET)
Message-ID: <alpine.DEB.2.02.1403191341070.18573@ionos.tec.linutronix.de>
References: <1394890861-18347-1-git-send-email-carlo@caione.org> <alpine.DEB.2.02.1403191213240.18573@ionos.tec.linutronix.de> <20140319123241.GI27873@lukather>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBDAMN6NI5EERB3VAU2MQKGQESUNU3NY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20140319123241.GI27873@lukather>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 19 Mar 2014, Maxime Ripard wrote:

> On Wed, Mar 19, 2014 at 12:13:56PM +0100, Thomas Gleixner wrote:
> > On Sat, 15 Mar 2014, Carlo Caione wrote:
> > 
> > > Allwinner A20/A31 SoCs have a special interrupt controller for managing NMI.
> > > Three register are present to (un)mask, control and acknowledge NMI.
> > > These two patches add a new irqchip driver in cascade with GIC.
> > 
> > If I get an ack for the DT parts, I'll pick it up.
> 
> I had some comments on it, so Carlo will probably resubmit it.

That's the resubmit as far as I can tell.
