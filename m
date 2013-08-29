From: Jean-Francois Moine <moinejf@free.fr>
Subject: Re: [PATCH 0/2] ARM: Dove: Add audio to the DT
Date: Thu, 29 Aug 2013 11:27:01 +0200
Message-ID: <20130829112701.3bd32fa0@armhf>
References: <20130828113438.0a77fd54@armhf>
	<20130828164829.14256ce2@skate>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130828164829.14256ce2@skate>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Jason Cooper <jason@lakedaemon.net>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Ian Campbell <ian.campbell@citrix.com>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

On Wed, 28 Aug 2013 16:48:29 +0200
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> On Wed, 28 Aug 2013 11:34:38 +0200, Jean-Francois Moine wrote:
> > This patch series adds audio DT to the Dove boards and activates th=
e
> > Cubox audio device.
> >=20
> > Full audio in the Cubox will work when the DT extension of the gene=
ric
> > simple audio card will be complete. =20
>=20
> What is the status of this generic simple audio card effort? I've see=
n
> the patch you had posted at https://lkml.org/lkml/2013/7/20/128 and t=
he
> following discussion. Has anyone picked up the work of Kuninori
> Morimoto?

Hi Thomas,

I don't feel able yet to enter the ALSA internals.
Otherwise, there is this message from Lars:

http://mailman.alsa-project.org/pipermail/alsa-devel/2013-August/064951=
=2Ehtml

--=20
Ken ar c'henta=C3=B1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/
