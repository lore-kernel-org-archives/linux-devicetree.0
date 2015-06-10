From: Ludovic Desroches <ludovic.desroches@atmel.com>
Subject: Re: [PATCH 0/2] get pinctrl more flexible for per pin muxing
 controllers
Date: Wed, 10 Jun 2015 17:00:00 +0200
Message-ID: <20150610150000.GR25800@odux.rfo.atmel.com>
References: <1430729776-27797-1-git-send-email-ludovic.desroches@atmel.com>
 <556F01CC.8020305@atmel.com>
 <CACRpkdawFrfzHf+8vMLz07-r4J48bAVibV++K31dNQ+D-85ZMg@mail.gmail.com>
 <5578465A.9090503@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5578465A.9090503@wwwdotorg.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Nicolas Ferre <nicolas.ferre@atmel.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Ludovic Desroches <ludovic.desroches@atmel.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 10, 2015 at 08:14:50AM -0600, Stephen Warren wrote:
> On 06/10/2015 01:33 AM, Linus Walleij wrote:
> >On Wed, Jun 3, 2015 at 3:31 PM, Nicolas Ferre <nicolas.ferre@atmel.c=
om> wrote:
> >>Le 04/05/2015 10:56, Ludovic Desroches a =E9crit :
> >>>
> >>>The way pins, groups and functions are tied is too constraining fo=
r some
> >>>controllers. It concerns mainly the ones we don't care about group=
s and
> >>>functions, each pin can be muxed to any functions.
> >>>The goal of these two patches is too remove some of the constraint=
s.
> >>>
> >>>I have added the prototype of a pin controller and device tree to =
show the
> >>>way I want to use these changes. I couldn't test it on boards usin=
g generic
> >>>pinconf so I am not sure that I don't break something...
> >>>
> >>>
> >>>Ludovic Desroches (4):
> >>>   pinctrl: change function behavior for per pin muxing controller=
s
> >>>   pinctrl: introduce complex pin description
> >>
> >>Linus,
> >>
> >>Ludovic sent this series nearly one month ago. It was posted after =
a RFC
> >>series on the same topic two months ago. As we don't see any commen=
t on
> >>neither of them we assume that it's okay to include them.
> >
> >It's a quite big patch and I need help reviewing it and thinking of
> >some possible consequences.
> >
> >Stephen, can you give me a hand with this?
>=20
> I don't have the patch in my list archive, which goes back 60 days.
>=20
> Judging purely by the patch description, the patch sounds incorrect. =
There's
> nothing in pinctrl that prevents a particular pin controller from sup=
porting
> all mux functions on all pins or groups. Simply return the same list =
of
> functions for every pin.

Maybe my description is not accurate. I'll resend it.


Ludovic
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
