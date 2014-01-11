From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: [PATCH v4 0/2] ohci and ehci-platform clks, phy and
 dt support
Date: Sat, 11 Jan 2014 17:30:24 -0500 (EST)
Message-ID: <Pine.LNX.4.44L0.1401111728150.16586-100000@netrider.rowland.org>
References: <52D0799B.3030401@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBD6LRVPZ6YGRBAMMY6LAKGQEQQNLDIQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <52D0799B.3030401-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-usb <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 10 Jan 2014, Hans de Goede wrote:

> Hi,
> 
> On 01/11/2014 12:50 AM, Sergei Shtylyov wrote:
> > Hello.
> >
> > On 01/11/2014 01:46 AM, Hans de Goede wrote:
> >
> >> Here is v4 of my ohci and ehci-platform clks, phy and dt support patch-set,
> >> this version should be 100% ready for merging upstream.
> >
> >     I see you've decided to completely ignore my opinion. NAK, FWIW.
> 
> I'm sorry but the whole prefix thing has become a thing of -ETOOMUCHBIKESHEDDING,
> everyone except you seems to be fine with mmio and and one point in time we
> need to make a decision and move forward.

If this isn't beating a dead horse...  Maybe everyone can agree on a
name like ohci-generic or generic-ohci.  That seems like a pretty good
description of the hardware that the platform driver can handle.

Alan Stern
