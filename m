From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH 2/3] mfd: twl6040: Add twl6040-gpio child
Date: Thu, 09 Aug 2012 15:10:22 +0300
Message-ID: <5023A8AE.5050300@ti.com>
References: <1342603220-13287-1-git-send-email-peter.ujfalusi@ti.com> <1342603220-13287-3-git-send-email-peter.ujfalusi@ti.com> <CACRpkdZJcy5HOZkjMCVJW5beExoCHOBb=BiB4GOGR7sM+5Xsww@mail.gmail.com> <5016967D.2020104@ti.com> <20120809115531.GB8474@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120809115531.GB8474@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, Sergio Aguirre <saaguirre@ti.com>, Linus Walleij <linus.walleij@stericsson.com>
List-Id: devicetree@vger.kernel.org

On 08/09/2012 02:55 PM, Mark Brown wrote:
> On Mon, Jul 30, 2012 at 05:13:17PM +0300, Peter Ujfalusi wrote:
>=20
>> If the board needs the gpo driver, but in the driver(s) I need to ch=
eck for
>> the existence of the "ti,twl6040-gpo" node and check if the status i=
s "okay".
>> I think it is easier to just get the value of "ti,use-gpo", if it ex=
ist and it
>> is 1 I enable the GPIO driver otherwise I don't.
>=20
> Will having the GPIO driver actually cause any problems if it's not i=
n
> use?  It's not like things like RTC which are directly visible to
> userspace and so can create problems if they're non-functional, unles=
s
> it does something like grab resources that might be needed by another
> subfunction driver there's not really a substantial cost in just
> instantiating it (people who are really space pressured probably won'=
t
> build the driver in in the first place).

=46air enough, I'll make the change for the v2.

--=20
P=E9ter
