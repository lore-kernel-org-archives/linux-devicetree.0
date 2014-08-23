From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 0/7] MIPS: Move device-tree files to a common location
Date: Sat, 23 Aug 2014 16:59:04 +0200
Message-ID: <64044023.tHj6rvEyXT@wuerfel>
References: <1408651466-8334-1-git-send-email-abrestic@chromium.org> <201408231556.42571.arnd@arndb.de> <CAOiHx=noe=614vv4GyhuvfoAYj0jYDhO5vX+7M2RbQBpE-uPnQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOiHx=noe=614vv4GyhuvfoAYj0jYDhO5vX+7M2RbQBpE-uPnQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linux-MIPS <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Qais Yousef <qais.yousef-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jayachandran C <jchandra-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Saturday 23 August 2014 16:48:52 Jonas Gorski wrote:
> On Sat, Aug 23, 2014 at 3:56 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> > Another argument is that we plan to actually move all the dts files out of
> > the kernel into a separate project in the future. We really don't want to
> > have the churn of moving all the files now when they get deleted in one
> > of the next merge windows.
> >
> > I don't know if we talked about whether that move should be done for
> > all architectures at the same time. If that is the plan, I think it
> > would be best to not move the MIPS files at all but also wait until
> > they can get removed from the kernel tree.
> 
> I wonder how this is supposed to work with dtbs that are currently
> expected to be built into the kernel?

Most architectures use appended dtb blobs to work around legacy boot
loaders that are lacking native dtb support. For these, combining the
kernel and dtb is part of the installation or system image creation
process, not part of the kernel build.

For the architectures that currently link the dtb into the kernel,
(arc, metag, openrisc, xtensa), I suppose the best way is to move
to use the same method as the other architectures. This also solves
the problem of building a kernel that runs on multiple machines.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
