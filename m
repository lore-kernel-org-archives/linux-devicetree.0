From: Kevin Hilman <khilman@kernel.org>
Subject: Re: [PATCH 2/4] soc: Mediatek: Add SCPSYS power domain driver
Date: Wed, 11 Mar 2015 10:14:23 -0700
Message-ID: <7hbnjzxxqo.fsf@deeprootsystems.com>
References: <1425888603-25800-1-git-send-email-s.hauer@pengutronix.de>
	<1425888603-25800-3-git-send-email-s.hauer@pengutronix.de>
	<7h61a94zy0.fsf@deeprootsystems.com>
	<20150310094142.GD24885@pengutronix.de>
	<1426043791.24243.9.camel@mtksdaap41>
	<20150311090345.GR24885@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150311090345.GR24885@pengutronix.de> (Sascha Hauer's message
	of "Wed, 11 Mar 2015 10:03:45 +0100")
Sender: linux-kernel-owner@vger.kernel.org
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: James Liao <jamesjj.liao@mediatek.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, kernel@pengutronix.de
List-Id: devicetree@vger.kernel.org

Sascha Hauer <s.hauer@pengutronix.de> writes:

> On Wed, Mar 11, 2015 at 11:16:31AM +0800, James Liao wrote:
>> Hi,
>>=20
>> On Tue, 2015-03-10 at 10:41 +0100, Sascha Hauer wrote:
>> > On Mon, Mar 09, 2015 at 02:35:03PM -0700, Kevin Hilman wrote:
>> > > Sascha Hauer <s.hauer@pengutronix.de> writes:
>> > >=20
>> > > > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
>> > >=20
>> > > A bit of a changelog here would be useful describing this driver=
, that
>> > > it's only covering part of the device (e.g. power controller) wi=
th more
>> > > to come, dependency on the syscon driver, etc.
>> > >=20
>> > > > +/*
>> > > > + * The Infracfg unit has bus protection bits. We enable the b=
us protection
>> > > > + * for disabled power domains so that the system does not han=
g when some unit
>> > > > + * accesses the bus while in power down.
>> > > > + */
>> > >=20
>> > > Hmm, why don't you want to know if some device is accessing anot=
her
>> > > device which is in a domain that is powered down?   Seems like t=
his is a
>> > > good way to hide real bugs.
>> >=20
>> > How I understand it the system just hangs on erroneous accesses wi=
thout
>> > these protection bits enabled, so enabling them at least makes sur=
e we
>> > can output something.
>> > I must admit though that my understanding of these bits is quite l=
imited
>> > and the only user of this driver I have available here (audio) doe=
sn't
>> > make use of these protection bits, so I can't test here.
>> >=20
>> > James, could you shed some light on this issue?
>>=20
>> I asked our designer about the bus protection feature, here is his
>> response:
>>=20
>> "
>> It's for unexpected signal glitch in Power switch process.
>>=20
>> During Power switch process, we have clock switch, reset, isolation
>> enable/disable and  power switch involved where the transition of
>> asynchronous reset and  isolation is the most critical one,  which h=
ave
>> risk to introduce a unexpected short period signal transition from
>> MTCMOS=E2=80=99s interface to other alive HW .=20
>> "
>>=20
>> That means it protects unexpected bus accessing from HW, not from SW=
=2E So
>> it will not hide bugs from wrong SW access.
>
> Ok, thanks for clarifying. This means we should enable this feature
> sooner or later. Since the audio driver which is likely the first use=
r
> of this driver doesn't need the protection bits I think we have some
> time and can add the protection bits once the clock patches have been
> merged.

Sounds OK to me.

But I still think it belongs in the infracfg layer, and not in the PM
domain layer.

Kevin
