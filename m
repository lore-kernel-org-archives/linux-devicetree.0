From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH v4 6/7] ARM: zynq: DT: Add pinctrl information
Date: Wed, 28 Jan 2015 15:22:55 +0100
Message-ID: <41babf16a78d4d48855d80d61262e39a@BL2FFO11FD033.protection.gbl>
References: <1420818231-13451-1-git-send-email-soren.brinkmann@xilinx.com>
 <1420818231-13451-7-git-send-email-soren.brinkmann@xilinx.com>
 <CACRpkdZ1jfTUqfLKonJxar2Jn25+4wTF-D4XUXOszSsoJrA07w@mail.gmail.com>
 <1a749692196d406a8229d4891f3563f4@BN1BFFO11FD016.protection.gbl>
 <54C6D510.6090105@suse.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6258704590180122145=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <54C6D510.6090105@suse.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>, Michal Simek <michal.simek@xilinx.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Heiko Stuebner <heiko@sntech.de>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "Ivan T. Ivanov" <iivanov@mm-sol.com>, Linus Walleij <linus.walleij@linaro.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Beniamino Galvani <b.galvani@gmail.com>, "ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Alessandro Rubini <rubini@unipv.it>, Soren Brinkmann <soren.brinkmann@xilinx.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.or>
List-Id: devicetree@vger.kernel.org

--===============6258704590180122145==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="g11hhdKa1kOVO1p0GTnEo7Gkr3KLNnS9k"

--g11hhdKa1kOVO1p0GTnEo7Gkr3KLNnS9k
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 01/27/2015 01:00 AM, Andreas F=C3=A4rber wrote:
> Am 12.01.2015 um 08:27 schrieb Michal Simek:
>> On 01/11/2015 10:38 PM, Linus Walleij wrote:
>>> On Fri, Jan 9, 2015 at 4:43 PM, Soren Brinkmann
>>> <soren.brinkmann@xilinx.com> wrote:
>>>
>>>> Add pinctrl descriptions to the zc702 and zc706 device trees.
>>>>
>>>> Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
>>>> Tested-by: Andreas F=C3=A4rber <afaerber@suse.de>
>>>
>>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>>>
>>> Beautiful and in line with how I want things to look.
>>>
>>> Yours,
>>> Linus Walleij
>>>
>>
>> Applied to zynq/dt.
>=20
> Did you maybe forget to push?
>=20
> https://github.com/Xilinx/linux-xlnx/commits/zynq/dt doesn't have it.

Ah sorry - I have pushed it now.

Thanks,
Michal



--g11hhdKa1kOVO1p0GTnEo7Gkr3KLNnS9k
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAlTI8L8ACgkQykllyylKDCF0DQCdHsx8Riz6BWAsBfKkzbn+Qats
QuIAoJrLL3ZvczibjyujdweDn64rBb7w
=0WFN
-----END PGP SIGNATURE-----

--g11hhdKa1kOVO1p0GTnEo7Gkr3KLNnS9k--


--===============6258704590180122145==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6258704590180122145==--
