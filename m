From: Henrik =?ISO-8859-1?Q?Nordstr=F6m?= <henrik-N0bZODiMPoV/1Aw6q1k8hdHuzzzSOjJt@public.gmane.org>
Subject: Re: Re: Generic communication of boot loader state to
 the OS
Date: Wed, 27 Aug 2014 12:14:14 +0200
Message-ID: <1409134454.2701.46.camel@localhost>
References: <CAKON4Oz-PRgXyNKj=T9ymzOOhCMPjBMdYdE1Mr1CHWv3boskiw@mail.gmail.com>
	 <20140826182816.GW30401@n2100.arm.linux.org.uk>
	 <CAKON4Oy7SU9kj=DdJ+Oq14ukL7kHP7Qn9bPrQ3PKUL6ZJww=gw@mail.gmail.com>
	 <20140826190230.GX30401@n2100.arm.linux.org.uk>
	 <CAKON4OwG2XfGYv+BMqMStWvAf_K_AYdarhpQQw3FLHWE+D8Sxg@mail.gmail.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDOLXAGRVEERB7W662PQKGQEHHBBEDA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <CAKON4OwG2XfGYv+BMqMStWvAf_K_AYdarhpQQw3FLHWE+D8Sxg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, ARM Linux Mailing List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

tis 2014-08-26 klockan 16:50 -0400 skrev jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org:

> I wonder if DHCP client couldn't be replaced with a udev event. Set a
> timer in the kernel for the length of the lease. Then generate a udev
> event when it is ready to expire. Udev event runs an app that gets a
> new lease.  Now there is no process to kill on reboot and everyone is
> happy.

DHCP clients should release their IP back to the DHCP pool when no
longer in use and is why this is normally down on shutdown/reboot.
Special care is needed for doing this when your rootfs is on NFS, but
that's all an OS support issue in how to properly supporting NFS root,
not at all related to devicetree or bootloaders.

The question on communicating DHCP lease details between bootloader and
OS is partially valid for this discussion as an example of possible user
of such communication. It is not strictly required as we can have (and
do have) an initrd that requests a dhcp lease before kernel needs IP
running for NFS etc, but reusing the existing lease is faster (in the
range of seconds in many networks). There is however a lot of small
details in DHCP that may make that infeasible in the end, but those are
again all OS implementation details not related to how to communicate
existing lease information from bootloader to OS.

Regards
Henrik
