From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 1/3] regulator: DT: Add DT property for operation mode
 configuration
Date: Fri, 3 Jun 2016 01:16:00 +0100
Message-ID: <20160603001600.GX2282@sirena.org.uk>
References: <1463987611-32139-1-git-send-email-henryc.chen@mediatek.com>
 <1463987611-32139-2-git-send-email-henryc.chen@mediatek.com>
 <20160523104703.GB26992@leverpostej>
 <20160523112856.GR8206@sirena.org.uk>
 <1464682835.25847.3.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5580408761027932725=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1464682835.25847.3.camel@mtksdaap41>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Fan Chen <fan.chen@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Liam Girdwood <lgirdwood@gmail.com>, Henry Chen <henryc.chen@mediatek.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Kumar Gala <galak@codeaurora.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============5580408761027932725==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fzb4MfPSWK/5QThu"
Content-Disposition: inline


--fzb4MfPSWK/5QThu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 31, 2016 at 04:20:35PM +0800, Fan Chen wrote:
> On Mon, 2016-05-23 at 12:28 +0100, Mark Brown wrote:

> > Henry, *please* look at how the existing mode support in the bindings is
> > done and consider how a consumer would use this given that it doesn't
> > know anything about the regulator...

> In the case of svs[1], which Henry mentioned in cover letter, it can be
> regarded as a special consumer who requires very accurate voltage for
> calibration the hardware in its initialization stage. So, this kinds of
> consumers know their regulator very well and only need to switch to the
> modes they want in the particular conditions.

So what you're trying to do here is not so much set a specific mode as
set maximum regulation accuracy for a period of time.

> However, IIUC, you want a proposal to provide a sort of QoS framework
> which can cover most of use cases who care about the regular quality in
> runtime, is that correct?

Well, we want a coherent general use case that doesn't require a user to
know the specific details of the regulator they're working with since we
need to hide that knowledge from the user.

> IMHO, some quality index can be considered, for example:
> Minimum Current Requirement (mA): If a user specified this constraint in
> runtime, it means that he cares more about the supplying quality like
> transient voltage drop, ripple above certain load.
> Maximum Current Requirement (mA): If a user specified this constraint in
> runtime, it means that he cares more about the power consumption under
> certain load.
> It could be a flexible way instead to tie the operation modes directly.

I'm not sure I really understand these distinctions to be honest,
and specifying minimum loads seems very tricky from a robustness point
of view.

If all you need right now is a way to maximize regulation quality that's
probably a lot easier than anything based on absolute loads or on
multiple "normal operation" modes - it takes a lot of the complexity out
of things as there's no need to consider things like the distinctions
between modes.  We just need a standard operating mode and to know the
highest available mode.  I'm not sure exactly how to do that as an API
though, let me think about it...  your use case isn't one I'd come
across before.

> BTW, we should encourage people here to share more use cases related to
> regulator quality issues, especially in runtime, so we can evaluate the
> most suitable index to fit the requirements.

More common use cases are around manually doing adaptive mode switching
for regulators that are poor at automatically adjusting performance and
handling of very low standby current situations where the adaption can
consume enough power to register.

--fzb4MfPSWK/5QThu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXUMw/AAoJECTWi3JdVIfQF2UH/Ax7oGIBX7s//dMSG5ILVtnn
FL+jdP4xWsUsQRv8kXziSJDUFYn2sj/tGXGunFVqaFlbpeEsrglXYXrUdQm+Z/Y3
cm+v1XnTVlgjF7+UUlxP1ALVqEgo2R9Chlyni0B8vXj0CRVWf2+hBauuok9Vkz7m
e0Gnv0Mb07K8tBt4Qa0Rfi0+ZrCSNlhNlDr+e4mV+Z+xgMAghR5Pdj221QVHTztD
3Uqr9vzH0t+WDjs0J48SUYP86LRhV97MPUFOctSXo5jN9LIihCm25Z4YE/bAOc1p
peSwyMURNjv23vaF10c7//o75bHDm6s6W7Fp1lS2fjfO4BTBcdopBAlJYvWTj84=
=jAXD
-----END PGP SIGNATURE-----

--fzb4MfPSWK/5QThu--


--===============5580408761027932725==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5580408761027932725==--
