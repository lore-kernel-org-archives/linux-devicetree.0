From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 1/2] regulator: core: add
 regulator_has_continuous_voltage_range()
Date: Fri, 17 Mar 2017 21:15:47 +0000
Message-ID: <20170317211547.22jrqud5np4ve2jk@sirena.org.uk>
References: <20170308200246.126331-1-mka@chromium.org>
 <20170309102819.bx5paxtffvmvmuov@sirena.org.uk>
 <20170309194054.GA15095@google.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="4die3l3bpjqcnc6q"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170309194054.GA15095@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, Brian Norris <briannorris@chromium.org>, Guenter Roeck <groeck@chromium.org>, Dmitry Torokhov <dtor@chromium.org>
List-Id: devicetree@vger.kernel.org


--4die3l3bpjqcnc6q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 09, 2017 at 11:40:54AM -0800, Matthias Kaehlcke wrote:
> El Thu, Mar 09, 2017 at 11:28:19AM +0100 Mark Brown ha dit:
> > On Wed, Mar 08, 2017 at 12:02:45PM -0800, Matthias Kaehlcke wrote:

> > > The new function allows consumers to determine if a regulator is
> > > continuous or discrete, and whether the results of

> > Why?  As we discussed at ELC this is an implementation detail of the
> > regulator and it's to an extent a taste decision if the regulator is
> > represented as a linear range or a continuous range (in fact given
> > improvements in the core we could probably just update all continuous
> > range regulators to linear ones).

> The second patch of this series is a driver for voltage controlled
> regulators (vctrl), ie the output voltage of a vctrl regulator is
> controlled through the voltage of another regulator. The control
> regulator can be continuous or discrete and I think it makes sense for
> the vctrl regulator to mirror its control regulator in this aspect.
> Why should it pretend to have a continuous range when it is actually
> discrete due to the control regulator?

I don't think we should be providing a consumer facing API which invites
consumers to peer into the implementation details of regulators, or
gives them the idea that these concepts exist.  Consumers can already
enumerate the set of supported voltages via _list_voltage() and so on,
I'd expect consumers to be able to get what they need from those.  You
have an incrediblity specialist use case here but this is just a general
consumer interface that's being added.

> For continuous control regulators we can simply calculate a "safe"
> voltage for the next step and pass it to the control regulator. In
> case of a discrete control regulator this calculated voltage may not
> be directly available, without knowing the available steps the vctrl
> driver has to try different voltage ranges until it finds one that is
> accepted by the control regulator. Obviously this can be done but it
> adds code complexity and runtime overhead which is not necessary if we
> know the available steps (and regulator_list_voltage() is already
> there to provide them).

I'm not seeing how knowing if a regulator is continuous is helpful for
regulators with discrete voltages?

> > > regulator_count_voltages() and regulator_list_voltage() correspond
> > > to the regulator itself or its supply.

> > Why?

> Please see my explication above on why the vctrl driver needs to know
> this.

I'm seeing nothing in the above that addresses my question, you don't
even seem to have mentioned supplies. =20

> In general I think the behavior of these APIs can be confusing for
> users without intimate knowledge of the regulator core. For me (as a
> possibly naive user) it isn't clear why regulator_count_voltages() of
> a continuous regulator would return the voltage count of its supply,
> instead of a value like 0 or -EINVAL that indicates that it is
> continuous. Similar for regulator_list_voltage(). I'm sure there are
> reasons for it, but it's not really intuitive.

This is happening because continuous regulators are an infrequently used
hack and not every case where they are relevant has been caught.  If the
abstractions are confusing or not working then let's improve them, not
just punch holes in the abstraction layers and make the problem worse.
What you're effectively saying is "I don't really understand what's
going on but this seems to work for me" which is a fairly big warning
sign that the solution isn't great.

The reason we report properties of the parent supply if the child supply
has no control is so that we can pass operations on up to the parent to
implement them there, supporting things like dumb power switches.  We
shouldn't be leaking details of the parent regulator for anything that
does actually regulate.

> Above you characterize discrete vs. continuous as an implementation
> detail. Aren't we already exposing large parts of it through
> regulator_count_voltages() and regulator_list_voltage()?

What we should be doing for continuous regulators is allowing people to
list the supported voltages as they would for other regulators.

--4die3l3bpjqcnc6q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAljMUgMACgkQJNaLcl1U
h9BKIwf+Mt+FsMSnhkiq/pOL2LoepkfIO79azGhBawcuPlGdNl+1hQa1ii89soTn
pTWH51/+Nc7GE786JfzmYKj9YUNhEwK06wXuNgmSWN9fEfgYSQcEkTHdSQ9Vfu0x
YeDYn3xwFI1idRBrs+EFl8sfIMxpLfZXQNMLnZgqX2trqkp0x8q7VXcGOmDPi3ew
UlyTSgwz0qgoiykI6WiAREnXxTKnwZii+/o/ejnXYujGm7SGpa9skFY+9ZDPh/4F
PtABOcYg+1kwH/U67yRwbYlYB/NgqZKNdHaD+yQOCX6jtpyHzAbXTJTymk2u6VHG
veZuxLdCm+xq/6JX8thSRu02dMKqRw==
=Anj8
-----END PGP SIGNATURE-----

--4die3l3bpjqcnc6q--
