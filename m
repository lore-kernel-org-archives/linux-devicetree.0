From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 2/2] regulator: fixed: dt: support for input supply
Date: Wed, 4 Jul 2012 11:58:39 +0100
Message-ID: <20120704105838.GM4111@opensource.wolfsonmicro.com>
References: <1341223645-7817-1-git-send-email-ldewangan@nvidia.com>
 <1341223645-7817-2-git-send-email-ldewangan@nvidia.com>
 <20120703191704.GE29030@opensource.wolfsonmicro.com>
 <4FF3EA70.307@nvidia.com>
 <20120704102144.GE4111@opensource.wolfsonmicro.com>
 <4FF41E2D.30104@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1059119339086881862=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4FF41E2D.30104-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "lrg-l0cyMroinI0@public.gmane.org" <lrg-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--===============1059119339086881862==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OQhbRXNHSL5w/5po"
Content-Disposition: inline


--OQhbRXNHSL5w/5po
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 04, 2012 at 04:12:53PM +0530, Laxman Dewangan wrote:
> On Wednesday 04 July 2012 03:51 PM, Mark Brown wrote:
> >On Wed, Jul 04, 2012 at 12:32:08PM +0530, Laxman Dewangan wrote:

> >>In non-DT, the input supply is passed with the regulator_init_data
> >>through the fixed voltage config and it is filled in board files.

> >No, this is a legacy way of doing things.  All regulators should be
> >moving to specifying the name in their descriptor except for supplies
> >that are power roots (which are often fixed voltage regulators).

> Then the input_supply should be set through the regulator init data
> "init_data->supply_regulator" rather than the desc? If yes then also
> I need to change the forthcoming patch for tps65910 and tps6586x to
> pass the supply_regulator through init_data.

No, exactly the opposite way round - it should be being set in the
descriptor.  The issue with your patch was that it only allowed DT
systems to do this.

--OQhbRXNHSL5w/5po
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJP9CHWAAoJEBus8iNuMP3d2vgP/2DTF0mMPyXfN9tfrqLxl/Y5
RbxZf2xgJ3ypPQTHXEKRLiab4o6LgFg/fG86buKcQAQuZbNkR9jdQZfB9AY72UKM
Lxld4uIySgorjTv4GOzYUNs4HfUpXJLDru13K68wmCFkGOiyqATb4DvuHSWd3pej
zflySzuqaqvIfo/XeDXv5z5IIPrJ5qNMiDHEQnjYW5HyXVksP4P9Mlr8POTGzxgI
KrJVTwRDr5AuWFvZEDqMumQuYMgF/sU0A7VO0ai3Mre4VoN9l5QHhINzxxc5TAVc
4NId2AmQA5p/71ObhWZ7RVuLglJ6UU33cD3aAIE9eaC26pLwtuT7MEEdNyyMSVEf
/CqRg6/WxdO4o7PecGlCS+ebitaWtpoX/37GydgLyxTorbnGvwsg0EUSGh7NC5hT
sF2L1wDyWIto4FfiVRds77L+i57M9bLAkuBeRSD471h0z/rCRNAfuNxwzsy1vkHT
+nVlsaY9DfPVJaZL5+lvu3fNJZzR48BeWMP5RQZE/sFBry/ZH7aAhSjWlQ05wEVx
IaI678ynTF2tPX25POl7Nkb/BBtOrYLwgV8BsdL6iJd37nCyPFHknZRk/xgViWtB
4PEXrzK54TOR0cIdei35GU96AaH82rg3yFrK1+nMwzgbAH654M0nW3W/j5xdiVx+
kYmz39mpm+wiFqyyLtdQ
=JXoL
-----END PGP SIGNATURE-----

--OQhbRXNHSL5w/5po--

--===============1059119339086881862==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============1059119339086881862==--
