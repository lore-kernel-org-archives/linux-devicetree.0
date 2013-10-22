From: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [Ksummit-2013-discuss] ARM topic: Is DT on ARM the solution, or
 is there something better?
Date: Tue, 22 Oct 2013 14:36:47 -0400 (EDT)
Message-ID: <alpine.LFD.2.03.1310221435100.1951@syhkavp.arg>
References: <52644A9E.3060007@wwwdotorg.org> <20131020220839.GT2443@sirena.org.uk> <5264576F.6050307@wwwdotorg.org> <alpine.LFD.2.03.1310201911190.1951@syhkavp.arg> <52658EBC.8020800@wwwdotorg.org> <alpine.LFD.2.03.1310211632460.1951@syhkavp.arg>
 <20131022093923.GC15640@ulmo.nvidia.com> <20131022150426.GF29341@beef> <alpine.LFD.2.03.1310221333300.1951@syhkavp.arg> <CAFEAcA8QQyDyvssamsb8s8ydfHGT8V0FQE-wGYt_kRbRMv9GSQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAFEAcA8QQyDyvssamsb8s8ydfHGT8V0FQE-wGYt_kRbRMv9GSQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Maydell <peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 22 Oct 2013, Peter Maydell wrote:

> On 22 October 2013 18:42, Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> > Having "stable" DT bindings is just a dream.  Experience so far is
> > showing that this is neither practical nor realistic.
> >
> > The unstructured free-for-all approach isn't good either.  Some
> > compromise between the two extremes needs to be found.
> 
> While I entirely agree that the concept of DT bindings as stable
> ABI is a complete pipe dream, it would be nice if we could have
> some suitably restricted parts of it that are defined as stable,
> for the benefit of tools like kvmtool and QEMU which construct
> device tree blobs from scratch to describe the virtual machine
> environment. (That means roughly CPUs, RAM, virtio-mmio
> devices and a UART at least.)

This subset is probably uncontroversial and easy.


Nicolas
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
