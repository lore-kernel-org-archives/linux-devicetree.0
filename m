From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 0/2] ohci and ehci-platform clks, phy and
 dt support
Date: Sat, 11 Jan 2014 03:10:32 +0300
Message-ID: <52D08BF8.9090709@cogentembedded.com>
References: <1389393980-21183-1-git-send-email-hdegoede@redhat.com> <52D0875B.9040102@cogentembedded.com> <52D0799B.3030401@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Return-path: <linux-sunxi+bncBC6MFNV32EFRBZH3YGLAKGQE6ZLODMI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <52D0799B.3030401-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>
Cc: devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-usb <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 01/11/2014 01:52 AM, Hans de Goede wrote:

>>> Here is v4 of my ohci and ehci-platform clks, phy and dt support patch-set,
>>> this version should be 100% ready for merging upstream.

>>     I see you've decided to completely ignore my opinion. NAK, FWIW.

> I'm sorry but the whole prefix thing has become a thing of -ETOOMUCHBIKESHEDDING,
> everyone except you seems to be fine with mmio

    Everyone being couple of people reading this thread? Of which only one 
being familiar with the real [EO]HCI hardware? :-)
    The name is just plain stupid if you want to know my real opinion.
And you've posted v3 with this name used first only what, 1.5 days ago?

> and and one point in time we
> need to make a decision and move forward.

    I see the first version of your patches posted on January 6th, today is 
11th (just starting here). You must be in a very big hurry to get this merged, 
I see. :-)
    Serious changes like this are not really done at such pace. Only the stuff 
that someone else has to painfully fix up later... :-(

> Regards,

> Hans

WBR, Sergei
