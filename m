From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH 3/4] irqchip: Add documentation for the bcm2836 interrupt
 controller.
Date: Fri, 10 Jul 2015 23:01:01 -0700
Message-ID: <87io9r9qsi.fsf@eliezer.anholt.net>
References: <1436303617-17185-1-git-send-email-eric@anholt.net>
 <1436303617-17185-4-git-send-email-eric@anholt.net>
 <55A0A251.1010301@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7550412885018942103=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <55A0A251.1010301@wwwdotorg.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--===============7550412885018942103==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Stephen Warren <swarren@wwwdotorg.org> writes:

> On 07/07/2015 03:13 PM, Eric Anholt wrote:
>> This is a new per-cpu root interrupt controller on the Raspberry Pi 2,
>> which will chain to the bcm2835 interrupt controller for peripheral
>> interrupts.
>
>> diff --git a/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2836-l1-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2836-l1-intc.txt
>
>> +local_intc: local_intc {
>
>> +	interrupt-parent = <&local_intc>;
>
> I think that property shouldn't be there?

If you don't have it there, the core finds the interrupt-parent in the
parent node, and waits for that one before initializing (which is in
turn waiting for us).  Note that for original 2835, you're finding the
parent node as well.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJVoLEdAAoJELXWKTbR/J7ohTwP/RlmPgFsUsmc6bTsBL6b+A70
atiu0FQN0QHW0TkplPkuQPoUjpnnDaeaRcjtf3TTUWij5pjxm2KAIyloyAfmrnbi
H8W4L6BeWI9KRx8oZLwpkfsyPhyW/rkWerSGdycNJ+nJbs42smGGOkRMkcW9QG/D
4lOxhf+nKOYbmLNuWI6TUBsCwgOQHyg1FDhuRwk/IpHplSzeL376aGQjxMCsgfQV
CmB9r79BLA1bGVv5R92hZtRt//Gp49D3d4MQJjHNxXfYjJdSzkJ4GSPvBl6Zzulw
S0IDHGNuwfkVgn6+5v2i6jJi3lAQ7LpqCCDvwZJbJqnqEezwB6uU2PinCfK0GU1I
HD3D4Bc48kJkmq+2etwMPPZoIFnUt3zR2kBVCJDB9auV+onZ5Fudv0W2Hdk9BRSf
cwUk7q7m1wwtTJvkrETcRypX1CS1bmiezyUNLTiVUH2vMrHwZvY9DyxO/FBnkgfG
qrn23zITenqLlRENYLndfN3M3OJR/lY8lQ4+CJkcv7Am1UemqCDgL6snDhnibJgC
uRso14wMVarDT9ilAz7K70+5GpMSjs7JCmix65dhS5XZAjgznCwofa6AcyFGOTVA
yHhy2tagBOMpB0LlaBFv+tRqetfgG5yVkQKQVHTGPETW4ul7DiAlFQut7ksS9VFS
pKulzcjqiSZsW5ogNOL9
=Kqco
-----END PGP SIGNATURE-----
--=-=-=--


--===============7550412885018942103==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============7550412885018942103==--
