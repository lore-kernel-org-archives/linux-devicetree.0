From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH 00/11] pinctrl: mvebu: pinctrl driver
Date: Thu, 20 Sep 2012 12:32:22 +0200
Message-ID: <20120920123222.7f58ee4c@skate>
References: <1344689809-6223-1-git-send-email-sebastian.hesselbarth@gmail.com>
	<CACRpkda+Kav6RGstSQ9+BCgVV+pR6ca_HmoueODYubX_xYM8Jw@mail.gmail.com>
	<505AD103.8050004@gmail.com>
	<20120920110424.3cb4daff@skate>
	<20120920100254.GE21928@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20120920100254.GE21928@lunn.ch>
Sender: linux-doc-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, Lior Amsalem <alior@marvell.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Ben Dooks <ben.dooks@codethink.co.uk>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Dear Andrew Lunn,

On Thu, 20 Sep 2012 12:02:54 +0200, Andrew Lunn wrote:

> > Hum, which patches are stalling the integration into the Marvell tr=
ee?
>=20
> l2 cache, I think.
>=20
> The trees Jason built for pull requests in the direction of arm-soc
> had the l2 cache patch as the very first in the series. Now that thes=
e
> patches have run into some trouble, its blocking all the patches that
> followed.
>=20
> Jason is re-building his trees, throwing out l2 cache for the
> moment. That should allow Olof/Arnd to pull these trees into arm-soc,
> and then Jason will work on integrating the remaining patches not
> already in his trees.

Ok, thanks. Regarding the L2 cache patches, Gr=C3=A9gory has replied to
Russell comments, and will most likely post an updated version late
next week. So it would be good if the pinctrl/gpio patches could get
merged.

Also, Andrew, could you look at the address decoding patch set I have
sent? I really would like to see that in 3.7 if possible. Thanks!

Best regards,

Thomas
--=20
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
