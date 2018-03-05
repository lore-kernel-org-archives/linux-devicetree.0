Return-Path: <SRS0=PZ0u=F3=gmail.com=festevam@kernel.org>
MIME-Version: 1.0
In-Reply-To: <4e2a63d3-9011-24fb-15b7-d021748931ac@mleia.com>
References: <20180305222100.29351-1-vz@mleia.com> <20180305222100.29351-3-vz@mleia.com>
 <CAOMZO5DmtaAoZ5CEJDHjLSc4dwjHB4p1uO69-x8KNJ6bvvT7Dw@mail.gmail.com> <4e2a63d3-9011-24fb-15b7-d021748931ac@mleia.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 5 Mar 2018 20:58:11 -0300
Message-ID: <CAOMZO5AVdcXy-z6Zked_EuSzDY0OWRnmmixcyewSzL=M3uq72A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] hwrng: mxc-rnga - add driver support on boards
 with device tree
Content-Type: text/plain; charset="UTF-8"
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Matt Mackall <mpm@selenic.com>, Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-crypto@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Vladimir,

On Mon, Mar 5, 2018 at 8:44 PM, Vladimir Zapolskiy <vz@mleia.com> wrote:

> Yes, I have a pretty good i.MX31 dtsi change (tested everything but USB
> and multimedia, and that notorious watchdog problem still has to be
> agreed with Uwe and solved), but I'm trying to save my time a little, and
> my plan is to send everything altogether as a single imx31.dtsi update
> (without instant pinctrl though). And basically RNGA support is the only
> missing part at the moment.

Ok, that's good news.

> Yes, I have a complete and well tested i.MX31 pinctrl driver, it is done
> similarly to all known Freescale pin controller drivers.

It would be nice if you could post it even in the current form.

> I sort of dislike it, and my preference is to "upgrade" it to utilize
> generic pin multiplexing with groups, functions and pin configuration
> as it is described in pinctrl-bindings.txt, then hopefully some ideas

On i.MX8M there was a recent discussion about using the new generic
pinctl versus the old method where we encode the pinmux value in dts.

i.MX maintainers are in favor of the old method, so that we can have
this same scheme for all i.MX variants.

Well, that is a topic for another mailing list :-)

Thanks
