From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 1/3] ARM: dts: rockchip: Move cros-ec-sbs to
 rk3288-veyron-chromebook-sbs
Date: Wed, 24 May 2017 12:55:45 +0200
Message-ID: <4982356.1SMNiM4AyO@phil>
References: <20170430183054.24563-1-contact@paulk.fr>
 <CAD=FV=V_s0TE_2vUvDBYfmbt2VS0nk5gmSPLi+mh2sqGauj6dg@mail.gmail.com>
 <1494180042.13734.4.camel@paulk.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1494180042.13734.4.camel@paulk.fr>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Paul Kocialkowski <contact@paulk.fr>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Brian Norris <briannorris@chromium.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Doug Anderson <dianders@chromium.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Am Sonntag, 7. Mai 2017, 20:00:42 CEST schrieb Paul Kocialkowski:
> Hi,
> =

> Le lundi 01 mai 2017 =E0 08:49 -0700, Doug Anderson a =E9crit :
> > On Mon, May 1, 2017 at 7:07 AM, Heiko Stuebner <heiko@sntech.de> wrote:
> > > Am Sonntag, 30. April 2017, 22:56:52 CEST schrieb Paul Kocialkowski:
> > > > Le dimanche 30 avril 2017 =E0 22:37 +0200, Heiko Stuebner a =E9crit=
 :
> > > > > Hi Paul,
> > > > > =

> > > > > Am Sonntag, 30. April 2017, 20:30:52 CEST schrieb Paul Kocialkows=
ki:
> > > > > > This moves the cros-ec-sbs dtsi to a new rk3288-veyron-chromebo=
ok-sbs
> > > > > > dtsi since it only concerns rk3288 veyron Chromebooks.
> > > > > > =

> > > > > > Other Chromebooks (such as the tegra124 nyans) also have sbs ba=
tteries
> > > > > > and don't use this dtsi, that only makes sense when used with
> > > > > > rk3288-veyron-chromebook anyway.
> > > > > =

> > > > > That isn't true. The gru series (rk3399-based) also uses the
> > > > > sbs-battery [0]. And while it is currently limited to Rockchip-ba=
sed
> > > > > Chromebooks it is nevertheless used on more than one platform, so
> > > > > the probability is high that it will be used in future series as =
well.
> > > > =

> > > > That's good to know, but as pointed out, other cros devices are usi=
ng a
> > > > sbs
> > > > battery without this header, so such a generic name isn't really a =
good
> > > > fit.
> > =

> > It would be interesting to know if the "retry-count" ought to be the
> > same across all Chromebooks.  I guess you could argue that maybe
> > someone found it needed to be 10 in all "nyan" variants and needed to
> > be 1 in all "veyron" variants, but it seems more likely that the
> > difference is arbitrary, or that one of the two values would work for
> > everyone.  It sure looks like we've just been copying values from
> > device to device.  Given that all the "veyron" devices have vastly
> > different batteries (and probably all the nyan ones too), it seems
> > likely there ought to be one value.
> =

> Well, the retry-count is a maximum number of retries to detect a status c=
hange
> on external power connection/disconnection. From my experience, it seems =
that
> nyans do indeed more retries to detect the change than veyrons, on averag=
e.
> =

> I don't think setting this value to 1 is very reasonable (in the end, tha=
t's a
> number of seconds), because power supply status changes tend to take a few
> seconds to reflect on the battery status.
> =

> I think setting a high value (like 10) would always work and either way, =
the
> status detection mechanism stops itself as soon as a change is detected (=
it
> turns out this is not a good idea for bq27xxx batteries, because they go =
from
> charging to full in the first seconds after AC connection instead of dire=
ctly
> reporting full, when full), but let's assume this is okay for sbs (and ma=
ybe
> change it later).
> =

> > In terms of setting the "charger", that also could potentially be
> > something that could be for all Chromebooks, or at least older ones
> > that don't have their charger implemented by the type C driver.  ...or
> > nyan devices could simply have a line in their dts like:
> > =

> > &battery {
> >   power-supplies =3D <&charger>;
> > };
> =

> That's true, but I think it makes as much sense to keep the whole binding.
> =

> In my opinion, the only reason to have a separate dtsi for this binding i=
s that
> veyrons have another dtsi for chromebooks where this binding should be. H=
owever,
> it cannot be there because of minnie using another battery IC.
> =

> So my approach here would be to make it common for devices where other ma=
jor
> parts are also common, so we can avoid duplication when most of the devic=
e-tree
> is already common. In cases where most of the device-tree is specific to a
> device, I think the binding should be duplicated. This is done already fo=
r lots
> of other components that could be made (somewhat) common anyway.
> =

> > =

> > > > Note that &charger has to be defined (after my subsequent patches),=
 which
> > > > it is
> > > > for devices that also include rk3288-veyron-chromebook, but not
> > > > necessarily
> > > > others.
> > > > =

> > > > Overall, I think having one -sbs dtsi file makes sense here because=
 there
> > > > is
> > > > already a rk3288-veyron-chromebook dtsi that veyron chromebooks use=
. That
> > > > file
> > > > cannot contain the battery bindings because minnie has a different =
one and
> > > > it
> > > > would be a bit silly to copy it over all devices. That definitely m=
akes
> > > > sense.
> > > > =

> > > > As for other devices, I don't see why we should have a separate inc=
lude
> > > > file for
> > > > the battery instead of having it in the device's dts. I think this =
should
> > > > be the
> > > > case on gru/kevin.
> > > > =

> > > > Also maybe not *all* gru-based devices will turn out to use a SBS b=
attery,
> > > > so it
> > > > seems early to include this header in the gru dtsi.
> > =

> > For gru devices, we've moved to a "virtual sbs battery" provided by
> > the EC.  I'm not 100% positive that everything will just magically
> > work and be converted in the EC if we put a non-sbs battery on a board
> > with this EC feature, but I would hope we'd convert everything
> > properly.
> =

> Interesting and good to know!
> =

> > > > One last point, gru/kevin
> > > > currently don't define a charger, which will break my subsequent pa=
tch
> > > > (that is
> > > > however needed for the veyrons that use this file).
> > =

> > Arguably this should be fixed.  On veyron-chromebook we just use
> > "gpio-charger".  We didn't add a special charger driver w/ a property
> > like "ti,external-control" since the only piece of information that
> > Linux really needed from the charger was whether or not AC was
> > connected.
> =

> Thanks for taking that choice, it indeed makes things easier on the kerne=
l side
> whith no drawbacks.
> =

> > =

> > > > To me, it seems that there's little advantage and major drawbacks in
> > > > keeping
> > > > this file the way it is.
> > > =

> > > I don't have any set opinion right now but after looking through the
> > > other uses of the sbs-battery the cros-ec-sbs.dtsi snippet really see=
ms
> > > somewhat veyron/gru-specific - especially wrt. the retry-count values.
> > > =

> > > What I'm not sure about is whether it is actually better to keep the =
include
> > > around under a new name or just move the (rather tiny) sbs-battery no=
de
> > > into the relevant devicetrees directly, when there aren't that many u=
sers
> > > anyway.
> > =

> > I'm fine with whatever you guys choose to do here.  It's nice not to
> > have copied "code", but with device tree sometimes copies are cleaner
> > than trying to share something.
> =

> I definitely agree. I think copies are a good fit here because overall, w=
e have
> enough disparity in the possible configurations among different SoC platf=
orms to
> justify having one per device. So I believe it would make sense to make t=
hat
> binding common *among the same SoC family*.

ok, so if I'm not mistaken it really looks like moving away from
cros-sbs-battery might be the easiest solution and with seeing the
different usages of the sbs-battery I tend to agree now :-) .

On the include vs. copy question it looks like we're tied as well with
mickey, minnie (and fievel + tiger from 2017) not using the sbs-battery
having local copies of the sbs-node in the affected devices really looks
like the best option.

So I guess we should get gru + the sbs veyron-devices their own sbs-battery
and then just drop te cros-ec-sbs.dtsi so that nobody else gets the idea
of using it.


Heiko
