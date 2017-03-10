From: Felipe Balbi <balbi@kernel.org>
Subject: RE: [PATCH v4 3/3] USB3/DWC3: Enable undefined length INCR burst type
Date: Fri, 10 Mar 2017 13:26:48 +0200
Message-ID: <87tw71xthj.fsf@linux.intel.com>
References: <1484727138-3264-1-git-send-email-jerry.huang@nxp.com>
 <1484727138-3264-3-git-send-email-jerry.huang@nxp.com>
 <DB5PR0401MB1813965DDC8CC6CD0BD85980FE440@DB5PR0401MB1813.eurprd04.prod.outlook.com>
 <87y3xeqvsl.fsf@linux.intel.com>
 <DB5PR0401MB1813AAB5AA84B0B310ED1B10FE440@DB5PR0401MB1813.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3726794455629985080=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <DB5PR0401MB1813AAB5AA84B0B310ED1B10FE440@DB5PR0401MB1813.eurprd04.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jerry Huang <jerry.huang@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rajesh Bhagat <rajesh.bhagat@nxp.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

--===============3726794455629985080==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Jerry Huang <jerry.huang@nxp.com> writes:
>> >> --
>> >> 1.7.9.5
>> > Hi, Balbi and all guys,
>> > Any comment for these patches? Can they be accepted?
>>=20
>> Rob had comments which you didn't reply yet. I cannot take this patchset
>> yet ;-)
>>=20
> Balbi,
>
> I look into his mail again, which was based v3, and I replied it.
>
> He had different understanding for undefined length burst mode.
>
> It seems he think for this mode, just setting bit[0] (INCRBrstEna) and
> don't need to set other field.
>
> However, according to the DWC USB3.0 controller databook, when it is
> undefined length INCR burst mode, we still need to set one max burst
> type, such as INCR8, which means controller will use any length less
> than or equal to this INCR8.

Rob, do you agree with the patch now?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAljCjXgACgkQzL64meEa
mQY2gA/7BFDbV28zV9R97vP1N0SzmtmbBGuK65utrix6W6Nn6Q66czmQmU+j0a8/
txHQuD3SledolgY8mAm6k8mIArwmRYfJaYIejfaNJLMGBkNxaTzHawvLDDgpZd7e
rFhLASCoDCCtHlJMV8Rb/E8h6nnzw5xnwAgufyGRTrXvUbQilwLH5mcBeK9wTL7W
Juha58MBzm3qQ6YG/lZb7KRucN9JJd68u8PfhyuAq94HxjFrD5pa6+Qrkv3fItRd
Lwva4I2QwbugNrIEwpE8EZ+yHFU2S9CFBWd5pX1tTaK75ufIFmeJApMCwT3E3DM9
oAudgFE5+YbnT5suaQfV/j27lQGWK3CezI3v2k+s0W7qlCUnfzE0Nw71Wii0IqVq
q85MGaRABb/LYBc0GVvaIosWTvU/ehl/ulVgDBHJQLG0LpCJw3U6qpHCRcHQJsMO
pHTarKFxZNm1s/J8xqa4ordetQPavJKNpkJI+k1oN+9eMgqv/Vr33VaaySCUhqwZ
oGnrd2s7PhmB5HijEM33j+XH000/u2lmolJSfYp9QdkU4zxuDlf0YDGN1JzQUAxh
ktCLM8qrSf3Z5FyMfuzgqbXHC2joVrWx0RKm985HleD1g8NMtfHJqu5+poRHcfuM
gLzLhqRqGRDJUka4EWmlNt+HydsgCXb27w8cKFA0K21WPl7jwgs=
=BSnO
-----END PGP SIGNATURE-----
--=-=-=--


--===============3726794455629985080==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============3726794455629985080==--
