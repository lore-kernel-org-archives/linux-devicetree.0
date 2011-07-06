From: Shawn Guo <shawn.guo@freescale.com>
Subject: Re: [PATCH 1/2] gpio/mxc: get rid of the uses of cpu_is_mx()
Date: Wed, 6 Jul 2011 13:21:53 +0800
Message-ID: <20110706052152.GB26324@S2100-06.ap.freescale.net>
References: <1309681017-22970-2-git-send-email-shawn.guo@linaro.org>
	<20110704064603.GW6069@pengutronix.de>
	<20110704092800.GG10245@S2100-06.ap.freescale.net>
	<20110704094921.GG6069@pengutronix.de>
	<20110704102008.GH10245@S2100-06.ap.freescale.net>
	<20110704164457.GJ6069@pengutronix.de>
	<20110705030121.GB10594@S2100-06.ap.freescale.net>
	<CACxGe6vHF-k+xCXAYwuQnuRXceD9eJC4ZpSbNXey8cnkX1J2-Q@mail.gmail.com>
	<20110705033227.GC10594@S2100-06.ap.freescale.net>
	<20110705164238.GA26347@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20110705164238.GA26347@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Grant Likely <grant.likely@secretlab.ca>, devicetree-discuss@lists.ozlabs.org, Shawn Guo <shawn.guo@linaro.org>, linux-arm-kernel@lists.infradead.org, patches@linaro.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 05, 2011 at 06:42:38PM +0200, Sascha Hauer wrote:
> On Tue, Jul 05, 2011 at 11:32:28AM +0800, Shawn Guo wrote:
> > On Mon, Jul 04, 2011 at 09:04:55PM -0600, Grant Likely wrote:
> > > On Mon, Jul 4, 2011 at 9:01 PM, Shawn Guo <shawn.guo@freescale.com> w=
rote:
> > > > On Mon, Jul 04, 2011 at 06:44:57PM +0200, Sascha Hauer wrote:
> > > >> Read again. We have three different types of gpio irq controllers,=
 they
> > > >> are first seen in the imx1, imx21 and imx31. So all others can be =
made
> > > >> compatible with these three. No need for imx-gpio, imx25-gpio and
> > > >> imx27-gpio. The mxc_gpio_devtype would look like this:
> > > >>
> > > >> static struct platform_device_id mxc_gpio_devtype[] =3D {
> > > >> =A0 =A0 =A0 {
> > > >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =3D "imx1-gpio",
> > > >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .driver_data =3D IMX1_GPIO,
> > > >> =A0 =A0 =A0 }, {
> > > >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =3D "imx21-gpio",
> > > >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .driver_data =3D IMX21_GPIO,
> > > >> =A0 =A0 =A0 }, {
> > > >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =3D "imx31-gpio",
> > > >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .driver_data =3D IMX31_GPIO,
> > > >> =A0 =A0 =A0 }, {
> > > >> =A0 =A0 =A0 }
> > > >> };
> > > >>
> > > > This is really what I want to do with dt match table. =A0But before=
 we
> > > > totally remove platform device probe and switch it over to dt, I'm
> > > > unsure we want to do this. =A0It will require the following changes=
 on
> > > > platform device code registration right now. =A0I guess this is
> > > > something you do not want, right?
> > > =

> > > What is the problem with the below changes?  I see no issue with
> > > changing the static platform_device registrations in this way.
> > > =

> > We end up to register "imx21-gpio" in imx27_soc_init, and "imx31-gpio"
> > in imx25/35/50/51/53 per-soc-init function.  The may confuse people
> > who only look at platform device registration code.  This is something
> > may concern Sascha.  Let's see what he thinks.
> =

> If we vote for doing this in the device tree then I see no problem doing
> so in the platform registration code aswell.
> =

That's great.  Will do so in the v3.

-- =

Regards,
Shawn
