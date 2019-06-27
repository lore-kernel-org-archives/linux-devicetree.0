From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: allwinner: properly connect USB
 PHY to port 0
Date: Thu, 27 Jun 2019 11:34:09 +0800
Message-ID: <CAGb2v67woLtn4bdD8YbCN9CyLPm_9r9+wd_Cxp8AUeVed0O-pA@mail.gmail.com>
References: <20190620010127.12071-1-andre.przywara@arm.com>
 <CAGb2v66WOTFvXWSSGwtLh3hD+N4CeJkFEPnCMXp0FuU2h=LS9Q@mail.gmail.com>
 <20190624135806.7bc78378@donnerap.cambridge.arm.com> <CAGb2v66vNndnXXfQfF4tnkEfqPjom7e=kuWVzWggjcTSeDPWsA@mail.gmail.com>
Reply-To: wens-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBPXS2DUAKGQE6JKUA7A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAGb2v66vNndnXXfQfF4tnkEfqPjom7e=kuWVzWggjcTSeDPWsA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 24, 2019 at 9:03 PM Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> wrote:
>
> On Mon, Jun 24, 2019 at 8:58 PM Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org> wrote:
> >
> > On Mon, 24 Jun 2019 16:25:47 +0800
> > Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> wrote:
> >
> > Hi,
> >
> > > On Thu, Jun 20, 2019 at 9:02 AM Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org> wrote:
> > > >
> > > > In recent Allwinner SoCs the first USB host controller (HCI0) shares
> > > > the first PHY with the MUSB controller. Probably to make this sharing
> > > > work, we were avoiding to declare this in the DT. This has two
> > > > shortcomings:
> > > > - U-Boot (which uses the same .dts) cannot use this port without a PHY
> > > >   linked, so we were loosing one USB port there.
> > > > - It requires the MUSB driver to be enabled and loaded, although we
> > > >   don't actually use it.
> > > >
> > > > For those (64-bit) boards which use an USB-A socket for HCI0/MUSB, add
> > > > a "phys" property pointing to the USB PHY 0.
> > > >
> > > > This makes it work in U-Boot, also improves compatiblity when no MUSB
> > > > driver is loaded (for instance in distribution installers).
> > > >
> > > > Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
> > > > ---
> > > > Hi,
> > > >
> > > > I have the feeling this belongs into the .dtsi, but cant't tell for sure
> > > > how this interacts with the MUSB driver. If need be, we can always pull
> > > > this up later, I guess.
> > >
> > > Have you tried if gadget mode and switching between gadget/host mode on
> > > an otg port still works? AFAICT that would be the main thing to worry
> > > about.
> >
> > I briefly tried gadget mode on a BPi-M64, and that still seemed to work,
> > but I couldn't switch it to host mode. IIRC that didn't even work without
> > this patch, but I didn't find the time to investigate yet.
> >
> > Is it supposed to switch automatically when the ID pin changes state? Do
> > you know a board/kernel combination which is known to work?
>
> Yes it's supposed to switch automatically when you insert or remove the
> OTG host mode cable.
>
> I think it worked during the last release cycle while I was adding support
> for VBUS polling. I'll do some tests on the current sunxi-next tomorrow
> and let you know.

So it works properly for me on the Bananapi M64 with the latest sunxi-next
branch. I have the gadget drivers built-in.

ChenYu
