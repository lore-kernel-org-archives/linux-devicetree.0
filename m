From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCHv8 2/2] mailbox: Introduce framework for mailbox
Date: Wed, 16 Jul 2014 12:16:22 +0200
Message-ID: <5340858.B9CZUE8s0j@wuerfel>
References: <1405071167-14503-1-git-send-email-jaswinder.singh@linaro.org> <1405071325-14683-1-git-send-email-jaswinder.singh@linaro.org> <53C64883.2050709@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53C64883.2050709-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ks.giri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <ks.giri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "courtney.cavin-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org" <courtney.cavin-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, "mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org" <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>, "lftan.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <lftan.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "loic.pallardy-qxv4g6HH51o@public.gmane.org" <loic.pallardy-qxv4g6HH51o@public.gmane.org>, "s-anna-l0cyMroinI0@public.gmane.org" <s-anna-l0cyMroinI0@public.gmane.org>, "ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "bjorn-UYDU3/A3LUY@public.gmane.org" <bjorn-UYDU3/A3LUY@public.gmane.org>, "patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "Mollie.Wu-l16TxrwUIHTQFUHtdCDX3A@public.gmane.org" <Mollie.Wu-l16TxrwUIHTQFUHtdCDX3A@public.gmane.org>, t.takinishi-LsJlEDOdPhs@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wednesday 16 July 2014 10:40:19 Sudeep Holla wrote:
> > +
> > +Required property:
> > +- mbox: List of phandle and mailbox channel specifier.
> > +
> > +- mbox-names: List of identifier strings for each mailbox channel
> > +               required by the client.
> > +
> 
> IMO the mailbox names are more associated with the controller channels/
> mailbox rather than the clients using it. Does it make sense to move
> this under controller. It also avoid each client replicating the names.

I think it would be best to just make the mbox-names property optional,
like we have for other subsystems.

Doing it in the mbox-controller makes no sense at all, because the
mbox controller has (or should have) no idea what the attached devices are.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
