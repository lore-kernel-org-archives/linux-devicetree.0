From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: Questions About a Semi-Soft irqchip Device
Date: Tue, 8 Jul 2014 10:56:39 -0400
Message-ID: <20140708145639.GD13433@titan.lakedaemon.net>
References: <CAJgR-Bi2HX+aYVabaFLyu9QAnAS4RmQ7DvBtDHOawkfi08zycA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAJgR-Bi2HX+aYVabaFLyu9QAnAS4RmQ7DvBtDHOawkfi08zycA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Loeliger <loeliger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Jon,

On Tue, Jul 08, 2014 at 09:02:14AM -0500, Jon Loeliger wrote:
> My IP block provides software-assignable interrupts.  That
> is, I have a large pool of interrupt sources, and a large pool
> of interrupt bits in the controller, but they are not physically
> tied together. Instead they are assigned by some driver as it
> initializes and allocates resources.  This, I think, means that
> I can not describe the interrupt  bindings in the DTS file.

Please take a look at the crossbar driver.  It's had quite a bit of
cleanup this cycle, so you may way to look at

  git://git.infradead.org/users/jcooper/linux.git irqchip/crossbar

It sounds very similar.

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
