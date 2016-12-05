From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC] New Device Tree property - "bonding"
Date: Mon, 5 Dec 2016 08:18:34 -0600
Message-ID: <CAL_Jsq+-6v1z-MYHC8Lvvao+=SFhVn2XwBc3O6fSN_zNcrJ3kA@mail.gmail.com>
References: <KL1PR06MB1031872E5DC2C65F2A490D6BC3890@KL1PR06MB1031.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <KL1PR06MB1031872E5DC2C65F2A490D6BC3890-k6wCOA2IOKSdmgae6ZAqr20DtJ1/0DrXvxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Cc: "frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org" <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Chris Paterson <Chris.Paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, "laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org" <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 25, 2016 at 10:55 AM, Ramesh Shanmugasundaram
<ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org> wrote:
> Hello DT maintainers,
>
> In one of the Renesas SoCs we have a device called DRIF (Digital Radio Interface) controller. A DRIF channel contains 4 external pins - SCK, SYNC, Data pins D0 & D1.
>
> Internally a DRIF channel is made up of two SPI slave devices (also called sub-channels here) that share common CLK & SYNC signals but have their own resource set. The DRIF channel can have either one of the sub-channel active at a time or both. When both sub-channels are active, they need to be managed together as one device as they share same CLK & SYNC. We plan to tie these two sub-channels together with a new property called "renesas,bonding".

Is there no need to describe the master device? No GPIOs, regulators
or other sideband controls needed? If that's never needed (which seems
doubtful), then I would do something different here probably with the
master device as a child of one DRIF and then phandles to master from
the other DRIFs. Otherwise, this looks fine to me.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
