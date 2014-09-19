From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH 1/2] devicetree: cadence_ttc: Document binding for timer
 width
Date: Fri, 19 Sep 2014 08:17:15 +0200
Message-ID: <add05eb7-2998-495a-b9c3-f95333b06c7a@BN1BFFO11FD040.protection.gbl>
References: <3537996136ec435ea660da869102d0a019214979.1410964243.git.michal.simek@xilinx.com>
 <20140917161737.GA7983@leverpostej>
 <db43281a-06bc-436b-a082-212d1f95d974@BL2FFO11FD034.protection.gbl>
 <20140918183626.GB10911@leverpostej>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============9135838139077028507=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20140918183626.GB10911@leverpostej>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Rutland <mark.rutland@arm.com>, Michal Simek <michal.simek@xilinx.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Peter Crosthwaite <peter.crosthwaite@xilinx.com>, Pawel Moll <Pawel.Moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Michal Simek <monstr@monstr.eu>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

--===============9135838139077028507==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="fn4GrOUcwGX7vwgBrIGGM4VN8OVUwfIBf"

--fn4GrOUcwGX7vwgBrIGGM4VN8OVUwfIBf
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 09/18/2014 08:36 PM, Mark Rutland wrote:
> On Thu, Sep 18, 2014 at 06:07:40AM +0100, Michal Simek wrote:
>> On 09/17/2014 06:17 PM, Mark Rutland wrote:
>>> On Wed, Sep 17, 2014 at 03:30:49PM +0100, Michal Simek wrote:
>>>> From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
>>>>
>>>> Modern TTC implementations can extend the timer width to 32 bit. Thi=
s
>>>> feature is not self identifying so the driver needs to be made aware=

>>>> via device tree.
>>>>
>>>> Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
>>>> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
>>>> ---
>>>>
>>>>  Documentation/devicetree/bindings/timer/cadence,ttc-timer.txt | 4 +=
+++
>>>>  1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/timer/cadence,ttc-tim=
er.txt b/Documentation/devicetree/bindings/timer/cadence,ttc-timer.txt
>>>> index 993695c659e1..5439976eca6b 100644
>>>> --- a/Documentation/devicetree/bindings/timer/cadence,ttc-timer.txt
>>>> +++ b/Documentation/devicetree/bindings/timer/cadence,ttc-timer.txt
>>>> @@ -6,6 +6,9 @@ Required properties:
>>>>  - interrupts : A list of 3 interrupts; one per timer channel.
>>>>  - clocks: phandle to the source clock
>>>>
>>>> +Optional properties:
>>>> +- timer-width: Bit width of the timer. Either 16 or 32 (default 16)=
=2E
>>>
>>> Are we expecting TTC implementations with widths other than 16 or 32?=

>>
>> IRC if you use 32bit timer and setup for example 24bit width it should=
 work
>> too and you are just ignoring that upper bits.
>=20
> Sure, but what I'd like to know is whether we expect HW implementations=

> other than 16 or 32 bit rather than whether or not the driver will work=

> in that case. I'm not saying no to this patch; I'm just curious.

We are trying to find this information.


>>> This looks sane to me, but we might be able to just have a 32-bit-tim=
er
>>> property if we don't expect arbitrary widths.
>>
>> Definitely model different timer width is easily possible to do in qem=
u
>> that's why I think having more generic property timer-width is just be=
tter than
>> having property used just for one case.
>=20
> Ok, so if you want to support that can we change the documentation
> wording to be:
>=20
> - timer-width: Bit width of the timer, necessary if not 16.
>=20
> That implies support for other bit widths, and when the property needs
> to be set (IMO 'default' sounds too much like a driver description than=

> a contract description).

Default one is just option which is used for origin configuration
and we should be backward compatible.
I am OK with this description. Will send v2.

> Does this apply to one timer register, or are multiple registers
> affected?

It applies for all 3 timers. All of them are 16 or 32.

Thanks,
Michal


--fn4GrOUcwGX7vwgBrIGGM4VN8OVUwfIBf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAlQbymsACgkQykllyylKDCGDEACeIfOroHglokgkE2ZsRIP/QX/a
fc4An0mG7d5LuUjCiicgoZN9PKQVc1lj
=A1jw
-----END PGP SIGNATURE-----

--fn4GrOUcwGX7vwgBrIGGM4VN8OVUwfIBf--


--===============9135838139077028507==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============9135838139077028507==--
