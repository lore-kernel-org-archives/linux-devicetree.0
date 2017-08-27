From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: net: bluetooth: Add
 broadcom-bluetooth
Date: Sun, 27 Aug 2017 12:40:30 +0200 (CEST)
Message-ID: <1169267908.44062.1503830430635@email.1und1.de>
References: <1501576704-26423-1-git-send-email-loic.poulain@gmail.com>
 <20170822074726.e424lflqxn6mb4xd@flea.lan>
 <f2fcf522-cd1e-e748-0ee7-ad28bbf8ae5d@i2se.com>
 <4c23bcb6-1b90-c41e-6e47-7d8315e760ae@gmail.com>
 <9BD5C644-6B89-496C-B442-F276D7A99102@holtmann.org>
 <123116901.43777.1503827664160@email.1und1.de>
 <CF7BCF4E-A2BE-4D5D-9F3D-0490E75A0677@holtmann.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CF7BCF4E-A2BE-4D5D-9F3D-0490E75A0677-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marcel Holtmann <marcel-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org>
Cc: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Loic Poulain <loic.poulain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "open list:BLUETOOTH DRIVERS" <linux-bluetooth-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Johan Hedberg <johan.hedberg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Marcel,

> Marcel Holtmann <marcel-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org> hat am 27. August 2017 um 12:23 geschrieben:
> 
> 
> Hi Stefan,
> 
> >>>>> Thanks a lot for working on that, I've made a similar attempt a few
> >>>>> weeks ago but didn't manage to get it to work.
> >>>>> 
> >>>>> The way it's hooked in our boards is a bit more complex though, even
> >>>>> if it could be because we're using a different part.
> >>>>> 
> >>>>> In order to get it running we need:
> >>>>>  - two clocks, called in the broadcom datasheets lpo and tcxo.
> >>>>>  - three GPIOs, device wakeup, host wakeup and a shutdown GPIO (which
> >>>>>    might be the BT_ON you were discussing about)
> >>>>>  - two regulators called vbat and reg-en for us (I guess they're
> >>>>>    meant to power the chip, and its registers >>
> >>>>> Do you know if you're also using those? Or could it be that it's just
> >>>>> hardwired to some non-gatable crystal / regulator on the RPI?
> >>> 
> >>> Not on Pi3, but the three gpios and the clock are pretty common for
> >>> Broadcom bt controller (cf v4 of dt-bindings patch).
> >> 
> >> once we get the GPIO expander driver upstream, I think we also need this for RPI 3 and Zero W. Right now we can just not do anything about this.
> > 
> > AFAIK the Zero W doesn't have this GPIO expander. Would it be easier for you?
> 
> I don’t understand the question. In general you want the BT_ON and wakeup GPIOs to be available so that you can have good power savings. If they are not there, then it is always powered. It works of course as shown with RPI 3 where the boot loader enables the GPIOs. Which means it is like the current support that we have in net-next.

the question was related to the point that all SoC GPIOs should be directly connected to the 43438. So using Zero W for development could be easier, because you don't need the GPIO expander driver. But generally i agree that it should work with RPI 3. 

> 
> On the other hand, the hci_bcm.c support for RPI 3 is essentially a support for all Broadcom devices using DT. It should be extended to support all sorts of boards. And once ACPI becomes serdev support, we can unify ACPI, platform and DT devices into a single code path.
> 
> Regards
> 
> Marcel
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
