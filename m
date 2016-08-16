From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH V2 RFC 1/6] usb: dwc2: core: Avoid nonsense error in
 gadget mode
Date: Tue, 16 Aug 2016 09:22:56 -0700
Message-ID: <874m6kel9b.fsf@eliezer.anholt.net>
References: <1469559213-16160-1-git-send-email-stefan.wahren@i2se.com>
 <1469559213-16160-2-git-send-email-stefan.wahren@i2se.com>
 <92280b0f-4dd3-bcf5-57ed-277a9f91653d@synopsys.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6807236721778493195=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <92280b0f-4dd3-bcf5-57ed-277a9f91653d@synopsys.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: John Youn <John.Youn@synopsys.com>, Stefan Wahren <stefan.wahren@i2se.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>John Youn <John.Youn@synopsys.com>
Cc: Felipe Balbi <balbi@kernel.org>, Stephen Warren <swarren@wwwdotorg.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-rpi-kernel@lists.infradead.org" <linux-rpi-kernel@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

--===============6807236721778493195==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

John Youn <John.Youn@synopsys.com> writes:

> On 7/26/2016 11:54 AM, Stefan Wahren wrote:
>> In gadget mode On bcm2835 platform the host tx fifo size could be zero.
>> So add zero to range and avoid such nonsense errors:
>>=20
>> dwc2 20980000.usb: 0 invalid for host_nperio_tx_fifo_size.
>> dwc2 20980000.usb: Setting host_nperio_tx_fifo_size to 0
>> dwc2 20980000.usb: 0 invalid for host_perio_tx_fifo_size.
>> dwc2 20980000.usb: Setting host_perio_tx_fifo_size to 0
>
> Hi Stefan,
>
> Are those the power on reset values of GNPTXFSIZ and HPTXFSIZ?
>
> If these values can be 0, I think the patch is ok. But I'm not sure
> about that. I can check with some hardware engineers to see under what
> conditions this is possible.

FWIW, I don't see the firmware software doing any conditional setting of
these registers.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJXsz3hAAoJELXWKTbR/J7ot6kP+gMsFVj7Z/v2br83bRSCi8MJ
97pV07P3b9T3aDr7AcnFWXGL9dFqFwWEfVzeu/V0y3u5mmoI56NvUXkuqer0JiC6
BFZGF2Z73PI9PN0GiUOdfPDm/SeDUIbWILlcYtQXBiM9X6hkDXwW79TwvFDNXMV6
QymbD5nYuVIz/4ti4FkRGuPcMeJatswyB1dAlACtcn4spQgysyHIlmMr08DwJ63X
cV+1V35heCzcRmIHUaXMTxe/p3IxO43A+rexcy30DpTRb2XajuBBsEcufO7kYMbN
VkR3vE7lCBkX2Bzpx4Xc7Kuts+F7LLUA531btEcYaNprjORSVECYKoukucD35Lq+
8P4vC4VQH3/rhQhT67oFoW2h0JpMDmIGxJh4M7zLh888W7oRE5B/qnT10pqaS2Kh
2wdxP2w7vtNRUiZ3h0uF7sx/wPXOqVFLBVL3SxbcIU/RBm2+rtAk9lX6v072dJLH
KAi+QRgiNoE0F0AG1H/9+to3Q8+A4wMzkai4FFEDoMJINP/ncapFoVpm3OZYBxcf
12w6cOXPVSdsEFLlAleCaeuZOcz78UsAiPw/eUEcXzstqaQbLCkFnVwFMUNakkxi
zZyzBTbvPIr3tPrqlo4fv6yFPkd2t/yTr12t9ERCaNDxocqpRcxcOjL03jNScvN3
hfBYmKQb0Brjt47kiJSr
=ypMr
-----END PGP SIGNATURE-----
--=-=-=--


--===============6807236721778493195==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6807236721778493195==--
