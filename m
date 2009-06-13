From: Pierre Ossman <pierre-vCPtPcF4ZGuHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH] sdhci: Add support for hosts that are
 only capable of 1-bit transfers
Date: Sat, 13 Jun 2009 13:05:31 +0200
Message-ID: <20090613130531.59d4e733@mjolnir.ossman.eu>
References: <20090611201545.GA15942@oksana.dev.rtsoft.ru>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6739089136409550705=="
Return-path: <sdhci-devel-bounces-qjLDD68F18NoYZYVwN2jqg@public.gmane.org>
In-Reply-To: <20090611201545.GA15942-wnGakbxT3iijyJ0x5qLZdcN33GVbZNy3@public.gmane.org>
List-Unsubscribe: <http://list.drzeus.cx/mailman/options/sdhci-devel>,
	<mailto:sdhci-devel-request-qjLDD68F18NoYZYVwN2jqg@public.gmane.org?subject=unsubscribe>
List-Archive: <http://list.drzeus.cx/pipermail/sdhci-devel>
List-Post: <mailto:sdhci-devel-qjLDD68F18NoYZYVwN2jqg@public.gmane.org>
List-Help: <mailto:sdhci-devel-request-qjLDD68F18NoYZYVwN2jqg@public.gmane.org?subject=help>
List-Subscribe: <http://list.drzeus.cx/mailman/listinfo/sdhci-devel>,
	<mailto:sdhci-devel-request-qjLDD68F18NoYZYVwN2jqg@public.gmane.org?subject=subscribe>
Sender: sdhci-devel-bounces-qjLDD68F18NoYZYVwN2jqg@public.gmane.org
Errors-To: sdhci-devel-bounces-qjLDD68F18NoYZYVwN2jqg@public.gmane.org
To: Anton Vorontsov <avorontsov-hkdhdckH98+B+jHODAdFcQ@public.gmane.org>
Cc: linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, sdhci-devel-qjLDD68F18NoYZYVwN2jqg@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is a MIME-formatted message.  If you see this text it means that your
E-mail software does not support MIME-formatted messages.

--===============6739089136409550705==
Content-Type: multipart/signed; micalg=PGP-SHA1; protocol="application/pgp-signature"; boundary="=_freyr.ossman.eu-24962-1244891135-0001-2"

This is a MIME-formatted message.  If you see this text it means that your
E-mail software does not support MIME-formatted messages.

--=_freyr.ossman.eu-24962-1244891135-0001-2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 12 Jun 2009 00:15:45 +0400
Anton Vorontsov <avorontsov-hkdhdckH98+B+jHODAdFcQ@public.gmane.org> wrote:

> Some hosts (hardware configurations, or particular SD/MMC slots) may
> not support 4-bit bus. For example, on MPC8569E-MDS boards we can
> switch between serial (1-bit only) and nibble (4-bit) modes, thought
> we have to disable more peripherals to work in 4-bit mode.
>=20
> Along with some small core changes, this patch modifies sdhci-of
> driver, so that now it looks for "mode" property in the device-tree.
>=20
> Signed-off-by: Anton Vorontsov <avorontsov-hkdhdckH98+B+jHODAdFcQ@public.gmane.org>
> ---
>=20
> Pierre, I'm not sure if a quirk would be appropriate here. If so,
> I can redo the patch with FORCE_1_BIT_DATA quirk.
>=20

I'd prefer a quirk, yes. 4-bit support is mandated so this would be a
deviation from the spec and such should always be handled by quirks for
clarity.

(I do think it is silly that they made it mandatory though considering
the embedded market)

Rgds
--=20
     -- Pierre Ossman

  WARNING: This correspondence is being monitored by the
  Swedish government. Make sure your server uses encryption
  for SMTP traffic and consider using PGP for end-to-end
  encryption.

--=_freyr.ossman.eu-24962-1244891135-0001-2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.11 (GNU/Linux)

iEYEARECAAYFAkozh/8ACgkQ7b8eESbyJLiHfQCfTcehGZGmEuEnPGhP7MbD5oCD
UiIAn27D4I3tNJONmxJb0aqMPBxC8fKP
=1svL
-----END PGP SIGNATURE-----

--=_freyr.ossman.eu-24962-1244891135-0001-2--

--===============6739089136409550705==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============6739089136409550705==--
