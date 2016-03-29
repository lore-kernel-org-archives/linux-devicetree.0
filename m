From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: mvebu: correct the usb node name from usb@ to
 ehci@
Date: Tue, 29 Mar 2016 19:11:34 +0200
Message-ID: <20160329191134.0aeee57b@free-electrons.com>
References: <1459259813-5278-1-git-send-email-patrick@puiterwijk.org>
	<1459259813-5278-2-git-send-email-patrick@puiterwijk.org>
	<4079235.sABSXKnJCE@wuerfel>
	<87zithutnn.fsf@free-electrons.com>
	<CAJweMdbywGZF1qJF2Nv3RTJb_dULOS_JAQpsPJjYgG+5Y7HU3w@mail.gmail.com>
	<20160329190648.1f37cbc3@free-electrons.com>
	<CAJweMdZXSjichcbMkg9o8=+Ecjmqg1pNU8UTOL1uY6TJXzZvxw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAJweMdZXSjichcbMkg9o8=+Ecjmqg1pNU8UTOL1uY6TJXzZvxw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Patrick Uiterwijk <patrick-TjDN7UKZo3m+BTG0ijDn3Q@public.gmane.org>
Cc: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter Robinson <pbrobinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

On Tue, 29 Mar 2016 17:09:11 +0000, Patrick Uiterwijk wrote:

> > On Tue, 29 Mar 2016 16:49:43 +0000, Patrick Uiterwijk wrote:
> >
> >> Thank you for this pointer, setting fdt_skip_update no did fix this
> >> issue indeed.
> >
> > Hum, what should fix the problem is to set fdt_skip_update to "yes". If
> > you set it to "no", then the Marvell U-Boot will do its funky DTB
> > tweaks which are not necessarily compatible with the mainline kernel
> > DT bindings.
> 
> Correct, I meant setting it to "yes" fixed the problem, sorry for the confusion.

Ok, then it makes sense. It's amazing how much weird issues this
Marvell U-Boot behavior has caused :-/

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
