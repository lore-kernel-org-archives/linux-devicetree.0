From: Mark Brown <broonie@kernel.org>
Subject: Re: linux-next: manual merge of the sound tree with the arm-soc tree
Date: Mon, 25 Feb 2019 16:43:38 +0000
Message-ID: <20190225164338.GB13898@sirena.org.uk>
References: <20190225123615.49bce7cd@canb.auug.org.au>
 <CAK8P3a3moJ12SDM3Ow-Hw3qBeTv9siswK+9pPiEA4JJ+7k4xvg@mail.gmail.com>
 <s5hr2bw2k7m.wl-tiwai@suse.de>
 <e2aaed45-0fb1-c9c8-76d4-3b97b36cada6@nvidia.com>
 <CAK8P3a2Q7OAAYCU01TNpHR2SM7N=YunyqZEihSESnQwxzL5=Vg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6153343474275666067=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAK8P3a2Q7OAAYCU01TNpHR2SM7N=YunyqZEihSESnQwxzL5=Vg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, DTML <devicetree@vger.kernel.org>, Takashi Iwai <tiwai@suse.de>, Sameer Pujar <spujar@nvidia.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Olof Johansson <olof@lixom.net>, Thierry Reding <treding@nvidia.com>, ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--===============6153343474275666067==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nVMJ2NtxeReIH9PS"
Content-Disposition: inline


--nVMJ2NtxeReIH9PS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 25, 2019 at 02:38:50PM +0100, Arnd Bergmann wrote:
> On Mon, Feb 25, 2019 at 12:24 PM Sameer Pujar <spujar@nvidia.com> wrote:

> > The motivation for adding custom sound card name is following,
> > 1. When for boards, multiple HDMI/DP ports are exposed, it is sometimes
> >     necessary to know the default port or any customization for that matter.
> >     Audio userspace can distinguish based on the sound card names.
> > 2. Multiple sound cards can coexist for a platform, the indication of
> > particular
> >     audio path is useful.
> > 3. It can help to customize audio paths.
> >     Generally people use "*,model" property in DT to name the sound complex.
> >     Ex: "samsung,model" [sound/soc/samsung/snow.c]
> >         "rockchip,model" [sound/soc/rockchip/rockchip_rt5645.c]

It's also useful since sound cards can be electically identical but
prefer different configuration due to the plastics (eg, a smaller
speaker was fitted, different outputs have different labels or playing
the speaker at full volume causes some models to have unpleasant effects
while others handle it fine).

> My impression here is that the idea of passing a model name
> through DT is well established, but for new stuff, we probably
> want to standardize on plain "model" rather than "$vendor,model".

Yes.

--nVMJ2NtxeReIH9PS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlx0GzoACgkQJNaLcl1U
h9AoGwf/YtZFwMpwHz3bSYXmaNlmUCq3Uy7LDrDc/RlsJnUIPnIlqhk69mWJ/FjZ
LGyNQ2nJs1m+car7QLiPKFcuQRJ5eh6wtS2kYPm2jT3uiXlDPoU7t8gf7YDgiCsY
kOZC5vJ7j/nvITZx9qqlEZYprw0EIaxPsnn9PiKeQKET/yeSNvs1WF0SDrWjqPB0
drXMv47kVwY5rmPwB0NttbbMx6uXehd3Z2mcoO2/c4FvJpJXNTTLcUrfcm7EWJ+r
qCgbexpCZBQWyAJ9oGUG7O5tDyGAxwOQUzsyKEM8I+h+cZQmdP9qN2BomI0FH5uS
XXbspx4qWUnZFgawxDq+IbuZ0A2zvg==
=iv2n
-----END PGP SIGNATURE-----

--nVMJ2NtxeReIH9PS--


--===============6153343474275666067==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6153343474275666067==--
