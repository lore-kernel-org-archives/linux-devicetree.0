From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCHv8 2/2] mailbox: Introduce framework for mailbox
Date: Wed, 16 Jul 2014 14:45:43 +0200
Message-ID: <6436896.YqIi9fg7XW@wuerfel>
References: <1405071167-14503-1-git-send-email-jaswinder.singh@linaro.org> <5340858.B9CZUE8s0j@wuerfel> <CAJe_ZheAjhufEf3c72bwbvF11P070hxh0qZ9s5KDxwFUgH1ixg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAJe_ZheAjhufEf3c72bwbvF11P070hxh0qZ9s5KDxwFUgH1ixg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ks.giri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <ks.giri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "courtney.cavin-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org" <courtney.cavin-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, "mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org" <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>, "lftan.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <lftan.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "loic.pallardy-qxv4g6HH51o@public.gmane.org" <loic.pallardy-qxv4g6HH51o@public.gmane.org>, "s-anna-l0cyMroinI0@public.gmane.org" <s-anna-l0cyMroinI0@public.gmane.org>, "ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "bjorn-UYDU3/A3LUY@public.gmane.org" <bjorn-UYDU3/A3LUY@public.gmane.org>, "patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "Mollie.Wu-l16TxrwUIHTQFUHtdCDX3A@public.gmane.org" <Mollie.Wu-l16TxrwUIHTQFUHtdCDX3A@public.gmane.org>, t.takinishi-+CUm20s59er1P9xLtpHBDw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wednesday 16 July 2014 18:07:04 Jassi Brar wrote:
> On 16 July 2014 15:46, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> > On Wednesday 16 July 2014 10:40:19 Sudeep Holla wrote:
> >> > +
> >> > +Required property:
> >> > +- mbox: List of phandle and mailbox channel specifier.
> >> > +
> >> > +- mbox-names: List of identifier strings for each mailbox channel
> >> > +               required by the client.
> >> > +
> >>
> >> IMO the mailbox names are more associated with the controller channels/
> >> mailbox rather than the clients using it. Does it make sense to move
> >> this under controller. It also avoid each client replicating the names.
> >
> > I think it would be best to just make the mbox-names property optional,
> > like we have for other subsystems.
> >
> A very similar subsystem - DMAEngine also has 'dma-names' as a
> required property.
> 
> If a client is assigned only 1 mbox in DT, we can do without
> mbox-names. But I am not sure what to do if a client needs two or more
> differently capable mboxes? Simply allocating in order of mbox request
> doesn't seem very robust.

Traditionally, these things (regs, interrupts, ...) are just accessed
by index. The reason why dmaengine requires the name is that some machines
can use multiple DMA engine devices attached to the same request line,
so the dmaengine subsystem can pick any of them that has a matching
name. If you specify multiple channels with the same name, you can no
longer use the index to refer to multiple alternatives.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
