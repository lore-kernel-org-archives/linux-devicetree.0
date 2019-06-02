From: Luca Weiss <luca@z3ntu.xyz>
Subject: Re: [PATCH 3/8] dt-bindings: net: bluetooth: Add rtl8723bs-bluetooth
Date: Sun, 02 Jun 2019 11:33:19 +0200
Message-ID: <3444508.DTbMFtmaYk@g550jk>
References: <20190118170232.16142-1-anarsoul@gmail.com>
 <CA+E=qVdq5GORg-t-vVXM3zBxy3Aq93iCE+zmcGgLFBMcnTDgfw@mail.gmail.com>
 <CAL_Jsq+kqFrY3DoHG_TJCCSxVHRkin4OwM+F9qm6W0w5YfjPQQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4891794949723689328=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAL_Jsq+kqFrY3DoHG_TJCCSxVHRkin4OwM+F9qm6W0w5YfjPQQ@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Johan Hedberg <johan.hedberg@gmail.com>, Maxime Ripard <maxime.ripard@bootlin.com>, netdev@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>, "open list:BLUETOOTH DRIVERS" <linux-bluetooth@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>, "David S. Miller" <davem@davemloft.net>, arm-linux <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

--===============4891794949723689328==
Content-Type: multipart/signed; boundary="nextPart8714085.0COXUpWfup"; micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart8714085.0COXUpWfup
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Dienstag, 19. Februar 2019 15:14:01 CEST Rob Herring wrote:
> > > How is this used?
> > 
> > rtl8723bs-bt needs 2 firmware binaries -- one is actual firmware,
> > another is firmware config which is specific to the board. If
> > firmware-postfix is specified, driver appends it to the name of config
> > and requests board-specific config while loading firmware. I.e. if
> > 'pine64' is specified as firmware-postfix driver will load
> > rtl8723bs_config-pine64.bin.
> 
> We already have 'firmware-name' defined and I'd prefer not to have
> another way to do things. The difference is just you have to give the
> full filename.
> 

Hi Rob,

I'm working on a v2 for this patchset and I've looked on how using "firmware-
name" with the full filename would be possible but as David Summers has already 
written [1], the existing code [2] takes this "postfix" as parameter and 
basically fills it into a filename template ("${CFG_NAME}-${POSTFIX}.bin"). So 
either we stay with the "firmware-postfix" property or the existing code would 
have to be modified to accomodate the full filename; but if using firmware-postfix 
is unacceptable, I can rework the existing code.

Luca

[1] https://lore.kernel.org/netdev/d06e3c30-a34a-bd84-9cdf-535f253843e3@davidjohnsummers.uk/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/
drivers/bluetooth/btrtl.c#n566
--nextPart8714085.0COXUpWfup
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE66ocILd+OiPORlvAOY2pEqPLBhkFAlzzl98ACgkQOY2pEqPL
BhnnFA//VC5cSighumkwqn1tDlKT2am98yezWEof4TyDc9ep57nBLBfxfVi/J9o7
S3uuBW876kpDuh5jCZ9jc7ajY/HOVk2kP63WklFmCPrFSatDw8JGaNV03cnbgV4z
NFZh3Vgnouz+9ELHRG6o2gQiQgu4FLHrQZWzHoccDS5RmerDEFN+1/LYEQuPuFay
WzXUcwNW4STqqQrw0AqfR61Gws1JarHMqShEmvI/5OEdfCFBlVu7uEkyMhQgurNO
dz6Nc6KQQKPV6xBHDAHnTtXKauBENpAe8GSZyIcqpDdIIMzLm/xP1uSG7E9W2yQ8
8YI62hXxCuKcLqNhMmmlxtnR4zQPpqV8b0bMlTHqZ/xdMsiksx/dgagafvPorvRs
U76IRzgrye43KpLQQEmYZxCVjrvtI6RAPY764AfdwoUpo17VEUrmT40W1NkmsPyQ
zo8m3Sl8DIvbxPTOSivZeMpN5GdgkCBT9mEQbYEkdMlDf+mUVOJBqZSNyfimwqL5
mvtTWXneuQmpRrrIhugsO0T0fLEUqTzddawDOgA3r3f6KjQQ6JnGA7FOfF8eJNeO
8uwK36whihKCYqUaUJaWSayF6VZVV4uurjyOMccHD+h1dYiNRBOLxcEns2XiWftw
fcKG10h3MfKscapGVYL6HegnxTnmTSDdeb3CD+v7aP57RIqLb0g=
=np+i
-----END PGP SIGNATURE-----

--nextPart8714085.0COXUpWfup--





--===============4891794949723689328==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============4891794949723689328==--
