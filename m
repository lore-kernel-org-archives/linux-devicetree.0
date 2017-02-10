From: Felipe Balbi <balbi@kernel.org>
Subject: RE: [PATCH v4 3/3] USB3/DWC3: Enable undefined length INCR burst type
Date: Fri, 10 Feb 2017 10:44:58 +0200
Message-ID: <87y3xeqvsl.fsf@linux.intel.com>
References: <1484727138-3264-1-git-send-email-jerry.huang@nxp.com>
 <1484727138-3264-3-git-send-email-jerry.huang@nxp.com>
 <DB5PR0401MB1813965DDC8CC6CD0BD85980FE440@DB5PR0401MB1813.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============9213522630935644038=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <DB5PR0401MB1813965DDC8CC6CD0BD85980FE440@DB5PR0401MB1813.eurprd04.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jerry Huang <jerry.huang@nxp.com>Jerry Huang <jerry.huang@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rajesh Bhagat <rajesh.bhagat@nxp.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

--===============9213522630935644038==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Jerry Huang <jerry.huang@nxp.com> writes:
>> @@ struct dwc3 {
>>  	enum usb_phy_interface	hsphy_mode;
>>=20
>>  	u32			fladj;
>> +	/*
>> +	 * For INCR burst type.
>> +	 * First field: for undefined length INCR burst type enable.
>> +	 * Second field: for INCRx burst type enable
>> +	 */
>> +	u32			incrx_type[2];
>>  	u32			irq_gadget;
>>  	u32			nr_scratch;
>>  	u32			u1u2;
>> --
>> 1.7.9.5
> Hi, Balbi and all guys,
> Any comment for these patches? Can they be accepted?

Rob had comments which you didn't reply yet. I cannot take this patchset
yet ;-)

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlidfYoACgkQzL64meEa
mQbK4BAAmWPo5tXxnlIgJ9Do5HWRen6iInH1QZWZaD3VjrZFnupZTHzmSNIUsLwy
TPJxWEX8orJmBqGwgX8udl2Lu+2fNiCI+6SHalaLkqdeYRKjxFRK1xQgxkqmXSTu
4KlJK9wD2C72apoAWm2JsfzRvduSj8+uQ2Aq/bXWQ7rkUs0RP0ft2aGIN2P6Lue9
sHLF2vq8FLHhP3Hwk2N8rvf3OVX2OF0APapBmROtczgdrLY2dgGB7pX8ipbH5XmI
uO5d1koaMx5J9YZN1xJkX3lfTlsnXhYCR2Vy63RlZC8QimdwJYeea+xVN0SXmvRC
9KP+0VVKtQA+ZNjYuAozYVl15d/hiJQaav0q5bDJjO8fxYv1lc9CkvhjnfYj8gEY
QsH+UNCpAHFzhFmOlOtHCO+ToUBSUdHAzd8yCdKYCPzBFR5gPX2U8S/QiLS+nGpA
42TXYpuyY3qah5NR9sJDn+FsNccxgtambPCkwdOsr3KRMdhJLns7vGLiv5K7chPX
2tOdUsiTyPZSkOcBUobdRwVWJENFRNcq8lFMvkKnEx3ojP003TRHUlfV5TfG7vMC
orN7iy9jnXURTkshWMu+0RmDhnvvnDPVQeTwjDayn14PgTP7QI4T5J4p4eub8O75
hZTd66/khP9Ho24wbmvnwlqI1ePqM9PJOaZ7qG0YCEZ6mAFR/ag=
=wQE0
-----END PGP SIGNATURE-----
--=-=-=--


--===============9213522630935644038==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============9213522630935644038==--
