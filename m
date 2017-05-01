From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: dts: rockchip: Move cros-ec-sbs to rk3288-veyron-chromebook-sbs
Date: Mon, 1 May 2017 08:49:02 -0700
Message-ID: <CAD=FV=V_s0TE_2vUvDBYfmbt2VS0nk5gmSPLi+mh2sqGauj6dg@mail.gmail.com>
References: <20170430183054.24563-1-contact@paulk.fr> <2369975.a4dWayqU5d@phil>
 <1493585812.6493.4.camel@paulk.fr> <2337202.q9Cdx8Nyxy@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2337202.q9Cdx8Nyxy@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Mon, May 1, 2017 at 7:07 AM, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> wrote:
> Am Sonntag, 30. April 2017, 22:56:52 CEST schrieb Paul Kocialkowski:
>> Le dimanche 30 avril 2017 =C3=A0 22:37 +0200, Heiko Stuebner a =C3=A9cri=
t :
>> > Hi Paul,
>> >
>> > Am Sonntag, 30. April 2017, 20:30:52 CEST schrieb Paul Kocialkowski:
>> > > This moves the cros-ec-sbs dtsi to a new rk3288-veyron-chromebook-sb=
s
>> > > dtsi since it only concerns rk3288 veyron Chromebooks.
>> > >
>> > > Other Chromebooks (such as the tegra124 nyans) also have sbs batteri=
es
>> > > and don't use this dtsi, that only makes sense when used with
>> > > rk3288-veyron-chromebook anyway.
>> >
>> > That isn't true. The gru series (rk3399-based) also uses the
>> > sbs-battery [0]. And while it is currently limited to Rockchip-based
>> > Chromebooks it is nevertheless used on more than one platform, so
>> > the probability is high that it will be used in future series as well.
>>
>> That's good to know, but as pointed out, other cros devices are using a =
sbs
>> battery without this header, so such a generic name isn't really a good =
fit.

It would be interesting to know if the "retry-count" ought to be the
same across all Chromebooks.  I guess you could argue that maybe
someone found it needed to be 10 in all "nyan" variants and needed to
be 1 in all "veyron" variants, but it seems more likely that the
difference is arbitrary, or that one of the two values would work for
everyone.  It sure looks like we've just been copying values from
device to device.  Given that all the "veyron" devices have vastly
different batteries (and probably all the nyan ones too), it seems
likely there ought to be one value.

In terms of setting the "charger", that also could potentially be
something that could be for all Chromebooks, or at least older ones
that don't have their charger implemented by the type C driver.  ...or
nyan devices could simply have a line in their dts like:

&battery {
  power-supplies =3D <&charger>;
};


>> Note that &charger has to be defined (after my subsequent patches), whic=
h it is
>> for devices that also include rk3288-veyron-chromebook, but not necessar=
ily
>> others.
>>
>> Overall, I think having one -sbs dtsi file makes sense here because ther=
e is
>> already a rk3288-veyron-chromebook dtsi that veyron chromebooks use. Tha=
t file
>> cannot contain the battery bindings because minnie has a different one a=
nd it
>> would be a bit silly to copy it over all devices. That definitely makes =
sense.
>>
>> As for other devices, I don't see why we should have a separate include =
file for
>> the battery instead of having it in the device's dts. I think this shoul=
d be the
>> case on gru/kevin.
>>
>> Also maybe not *all* gru-based devices will turn out to use a SBS batter=
y, so it
>> seems early to include this header in the gru dtsi.

For gru devices, we've moved to a "virtual sbs battery" provided by
the EC.  I'm not 100% positive that everything will just magically
work and be converted in the EC if we put a non-sbs battery on a board
with this EC feature, but I would hope we'd convert everything
properly.


>> One last point, gru/kevin
>> currently don't define a charger, which will break my subsequent patch (=
that is
>> however needed for the veyrons that use this file).

Arguably this should be fixed.  On veyron-chromebook we just use
"gpio-charger".  We didn't add a special charger driver w/ a property
like "ti,external-control" since the only piece of information that
Linux really needed from the charger was whether or not AC was
connected.


>> To me, it seems that there's little advantage and major drawbacks in kee=
ping
>> this file the way it is.
>
> I don't have any set opinion right now but after looking through the
> other uses of the sbs-battery the cros-ec-sbs.dtsi snippet really seems
> somewhat veyron/gru-specific - especially wrt. the retry-count values.
>
> What I'm not sure about is whether it is actually better to keep the incl=
ude
> around under a new name or just move the (rather tiny) sbs-battery node
> into the relevant devicetrees directly, when there aren't that many users
> anyway.

I'm fine with whatever you guys choose to do here.  It's nice not to
have copied "code", but with device tree sometimes copies are cleaner
than trying to share something.

-Doug
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
