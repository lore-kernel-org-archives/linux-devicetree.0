From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v7 0/6] Add support for Orange Pi 3
Date: Mon, 24 Jun 2019 19:46:37 +0200
Message-ID: <20190624174637.6sznc5ifiuh4c3sm@core.my.home>
References: <20190620134748.17866-1-megous@megous.com>
 <20190624.102927.1268781741493594465.davem@davemloft.net>
Reply-To: megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDXLF6FR5INBB7UYYTUAKGQEXKOBJ6A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20190624.102927.1268781741493594465.davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, jernej.skrabec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, peppe.cavallaro-qxv4g6HH51o@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org, joabreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-stm32-XDFAJ8BFU24N7RejjzZ/Li2xQDfSxrLKVpNB7YpNyf8@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jun 24, 2019 at 10:29:27AM -0700, David Miller wrote:
> From: megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org
> Date: Thu, 20 Jun 2019 15:47:42 +0200
> 
> > From: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
> > 
> > This series implements support for Xunlong Orange Pi 3 board.
> > 
> > - ethernet support (patches 1-3)
> > - HDMI support (patches 4-6)
> > 
> > For some people, ethernet doesn't work after reboot (but works on cold
> > boot), when the stmmac driver is built into the kernel. It works when
> > the driver is built as a module. It's either some timing issue, or power
> > supply issue or a combination of both. Module build induces a power
> > cycling of the phy.
> > 
> > I encourage people with this issue, to build the driver into the kernel,
> > and try to alter the reset timings for the phy in DTS or
> > startup-delay-us and report the findings.
> 
> This is a mixture of networking and non-networking changes so it really
> can't go through my tree.
> 
> I wonder how you expect this series to be merged?
> 
> Thanks.

This series was even longer before, with patches all around for various
maintainers. I'd expect that relevant maintainers pick the range of patches
meant for them. I don't know who's exactly responsible for what, but I think,
this should work:

- 2 stmmac patches should go together via some networking tree (is there
  something specific for stmmac?)
- all DTS patches should go via sunxi
- hdmi patches via some drm tree

thank you and regards,
	o.
