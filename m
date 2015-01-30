From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: mvebu: add ethernet to the cm-a510 board
Date: Fri, 30 Jan 2015 13:50:59 +0100
Message-ID: <54CB7E33.3080909@gmail.com>
References: <E1YH5bU-0005mG-3L@bombadil.infradead.org> <54CB5267.5060004@gmail.com> <20150130113118.5523ed68@armhf> <54CB6440.1010002@gmail.com> <20150130124144.501cf81d@armhf> <54CB732F.7010409@gmail.com> <20150130133913.083d1ade@armhf>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150130133913.083d1ade@armhf>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Gabriel Dobato <dobatog-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 30.01.2015 13:39, Jean-Francois Moine wrote:
> On Fri, 30 Jan 2015 13:03:59 +0100
> Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> Nope. The cm-a510 is just an add-on for a baseboard, it does not make
>> a working board. Just think of it as a feature-improved SoC.
>
> Well, I understand a bit, but I don't see clearly the physical system,
> nor how each part gets its configuration for booting.

TBH, I completely missed that the cm-a510 can come in different
configurations, e.g. with or without WiFi. Nevertheless, considering
that there are only a handful of configurations available, IMHO the
right thing would be a dtsi with all possible options described by
corresponding but disabled nodes.

The actual physical system has to be determined at runtime in any
way and it should be done by the bootloader. However, even the
bootloader would be happy to find the right nodes to enable instead
of creating them from scratch.

> As you know better than I, it seems that you are the right person to
> create the .dtsi/.dts's :) and to explain Gabriel how to use them!

Well, nothing that should stop you from improving your skills :)

I'd be happy to take over, but I admit that my current lack of spare
time would only allow me to support Gabriel and you.

Let's wait for Gabriel's response on how he can help improving
Dove mainline with his cm-a510 and baseboard.

Sebastian

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
