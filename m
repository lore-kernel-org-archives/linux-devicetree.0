From: "Albrecht Dreﬂ" <albrecht.dress@arcor.de>
Subject: Aw: Re: [PATCH 3/3] mpc52xx/wdt: WDT uses GPT api
Date: Wed, 11 Nov 2009 09:32:22 +0100 (CET)
Message-ID: <16246194.1257928342802.JavaMail.ngmail@webmail19.ha2.local>
References: <fa686aa40911101307p12bba31s491ef1d8812ca033@mail.gmail.com>
	<fa686aa40911101159y7bef3f9bte74e9aeb5c6e864b@mail.gmail.com>
	<1257884778.14374.5@antares>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <fa686aa40911101307p12bba31s491ef1d8812ca033@mail.gmail.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org
To: grant.likely@secretlab.ca
Cc: linuxppc-dev@ozlabs.org, devicetree-discuss@lists.ozlabs.org, wim@iguana.be
List-Id: devicetree@vger.kernel.org

Hi Grant:

O.k., thanks for your comments.  If Wim doesn't have any objections to it, =
I will provide a merged patch.  One consequence I forgot to mention is that=
 we loose the ability to build the wdt support as module, but I don't think=
 it's a real problem.

I think we still should keep the kernel config option enable/disable the wd=
t support, which would mask out the wdt code if disabled.  Is that ok for y=
ou?

Thanks, Albrecht.


----- Original Nachricht ----
Von:     Grant Likely <grant.likely@secretlab.ca>
An:      Albrecht Dre=DF <albrecht.dress@arcor.de>
Datum:   10.11.2009 22:07
Betreff: Re: [PATCH 3/3] mpc52xx/wdt: WDT uses GPT api

> On Tue, Nov 10, 2009 at 1:26 PM, Albrecht Dre=DF <albrecht.dress@arcor.de>
> wrote:
> > Hi Grant:
> >
> > Am 10.11.09 20:59 schrieb(en) Grant Likely:
> >>
> >> On Tue, Nov 10, 2009 at 12:43 PM, Albrecht Dre=DF
> <albrecht.dress@arcor.de>
> >> wrote:
> >> > Use the MPC5200 GPT api for the WDT which drastically simplifies this
> >> > file.
> >> >
> >> > Signed-off-by: Albrecht Dre=DF <albrecht.dress@arcor.de>
> >> > ---
> >> >
> >> > =A0drivers/watchdog/mpc5200_wdt.c | =A0246
> >> > +++++++++++-----------------------------
> >> > =A01 files changed, 65 insertions(+), 181 deletions(-)
> >>
> >>
> >> Can the WDT functionality just be merged entirely into
> >> arch/powerpc/platforms/52xx/mpc52xx_gpt.c, eliminating the need for
> >> this file entirely? =A0I think I'd rather have all the GPT "built in"
> >> behaviour handled by a single driver.
> >
> > I also thought about it, as it has IMHO the cleaner code, and it would
> have
> > the extra benefit that the gpt-wdt api doesn't need to be public.
> >
> > However, the reasons I hesitated to do so are:
> > - I don't want to remove a file someone else wrote (even it doesn't
> work);
> =

> Shouldn't be a problem, and I'll handle the fallout if it is.
> =

> > - WDT code is shifted from drivers/watchdog to
> arch/powerpc/platforms/52xx
> > which might not be the "logical" place from the directory layout's pov;
> =

> There is precedence of this in the past, particularly on arch or
> platform specific hardware drivers and multifunction devices.  (Heck,
> that's almost entirely what arch/powerpc/sysdev is).  I'm not
> concerned.
> =

> > - a file living in arch/powerpc/platforms/52xx depends upon config
> options
> > set from drivers/watchdog/Kconfig which may be confusing.
> =

> I'm not concerned about this either.
> =

> > You see these are more political/cosmetical questions, so I would prefer
> to
> > leave the decision to the maintainers (i.e. you and Wim). =A0Preparing a
> fully
> > merged driver is actually a matter of minutes!
> =

> Do it.  I'll champion getting it in.  Wim, do you have any issues with
> this?
> =

> g.
> =

> -- =

> Grant Likely, B.Sc., P.Eng.
> Secret Lab Technologies Ltd.
> _______________________________________________
> Linuxppc-dev mailing list
> Linuxppc-dev@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/linuxppc-dev
> =


Jetzt NEU: Do it youself E-Cards bei Arcor.de!
Stellen Sie Ihr eigenes Unikat zusammen und machen Sie dem Empf=E4nger eine=
 ganz pers=F6nliche Freude!
E-Card Marke Eigenbau: HIER KLICKEN: http://www.arcor.de/rd/footer.ecard
