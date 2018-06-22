From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH V2] ARM: dts: add Raspberry Pi Compute Module and IO board
Date: Thu, 21 Jun 2018 17:12:37 -0700
Message-ID: <87602bel1m.fsf@anholt.net>
References: <1529005804-3065-1-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0788552922314147658=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1529005804-3065-1-git-send-email-stefan.wahren@i2se.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>, Phil Elwell <phil@raspberrypi.org>, Alexander Graf <agraf@suse.de>, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--===============0788552922314147658==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Stefan Wahren <stefan.wahren@i2se.com> writes:

> The Raspberry Pi Compute Module (CM1) is a SoM which contains a
> BCM2835 processor, 512 MB RAM and a 4 GB eMMC. There is also a carrier
> board which is called Compute Module IO Board.
>
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>

Pulled to bcm2835-dt-next.  Thanks!

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlssPvUACgkQtdYpNtH8
nugMuxAApHXJ46SJFQY/gBcZx0mxbVj+uODNNONjSjtJOEUXr1cIJF/NtsodCVmF
hBbwiZhHLSgMuSRqzqHPKkWqlDRXKQRWtUl7xXMBn0LZLupuLyOOkg5/+aj76CRd
0Jn/3fTPHcFK9avnU2Oyv/qxQzKiP0dBBoFmsZ/qKHz0U5UMYHJLxVMdYgkPSIK/
qgOEMYiy75R//6ee1P2p1EpxD0/yFTM+yYNg+u/yriVZLroLcpJjwed5oCXUNAF+
vQSP6mXxWQlcStQaf+aJ++DE8echoe98V7DibBN8Pwj1Ue4PKf3HkV2v2IYSUJFu
LyiGpfaJ+lMs05AGlhc8Rdg0vIaiuD7098DBfa6egme9wcicG2JxfjdNExXrg6uP
RDFV9441YrQnxRvJfSc3bS1VcTY70gRRG/ZZ0Rab+giknkeRBT2fRIJ1QoQRQTpj
xv47qynwDERrVTU6CbaRhqwleKXLoIIkEyhk00bjbTTmoQosOozcqhEV8OgS/gBE
V7pU2gOxXIMR31xPci44JUCP154wM5/zHIpeDGCyB5//1VH+KaBvSDieJtXcg9oe
3KYEtMxjwRXjLrJdj128rjFwcZ3v6sraTlUzKiPq6liT1hrCAxuDSo52jL+UeyRJ
hoAmQVCHszcR5+RSyfL4WaKWwPGT/KCnxNqzahw0oDkxvylGBwI=
=xu2h
-----END PGP SIGNATURE-----
--=-=-=--


--===============0788552922314147658==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0788552922314147658==--
