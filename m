From: Felipe Balbi <felipe.balbi@linux.intel.com>
Subject: Re: [PATCHv2 0/7] Add support for USB OTG on STM32F7
Date: Wed, 11 Oct 2017 14:50:10 +0300
Message-ID: <87vajllx8t.fsf@linux.intel.com>
References: <1503930018-536-1-git-send-email-amelie.delaunay@st.com>
 <878tgim24i.fsf@linux.intel.com>
 <04a49088-b615-d7b8-0387-e7bfa32ee19f@st.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6999587004264812452=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <04a49088-b615-d7b8-0387-e7bfa32ee19f@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Alexandre Torgue <alexandre.torgue@st.com>, Amelie Delaunay <amelie.delaunay@st.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, John Youn <johnyoun@synopsys.com>
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Benjamin Gaignard <benjamin.gaignard@st.com>
List-Id: devicetree@vger.kernel.org

--===============6999587004264812452==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Alexandre Torgue <alexandre.torgue@st.com> writes:
> Hi Felip
>
> On 10/11/2017 12:04 PM, Felipe Balbi wrote:
>>=20
>> Hi,
>>=20
>> Amelie Delaunay <amelie.delaunay@st.com> writes:
>>> The STM32F7 MCU family embeds two DWC2 USB OTG cores. One core is USB
>>> OTG FS and the other is USB OTG HS. The USB FS core only works with its
>>> internal phy whilst the USB HS core can work in HS with external ULPI p=
hy
>>> or in FS/LS with the on-chip FS phy.
>>>
>>> Amelie Delaunay (7):
>>>    dt-bindings: usb: Document the STM32F7 DWC2 USB OTG HS core binding
>>>    usb: dwc2: add support for STM32F7 USB OTG HS
>>>    ARM: dts: stm32: Add USB HS support for STM32F746 MCU
>>=20
>> I have applied these three patches. Should I take the rest? They seems
>> like they could go upstream through the ARM maintainers.
>>=20
>
> I will take other DT patches in my PR.
>
> Concerning "ARM: dts: stm32: Add USB HS support for STM32F746 MCU" patch=
=20
> I prefer also to take it. This patch adds some pinctrl groups but stm32=20
> pinctrl bindings will change in my next PR (we will use a macro to=20
> define pins instead of using defined values). So if you push the DT=20
> patch through your pull request there will be a merge issue.
> It is possible that I take also this one ?

In that case, it's best if you take them all :-) Here's my Ack:

Acked-by: Felipe Balbi <felipe.balbi@linux.intel.com>

I'll drop them from my tree now

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlneBXIACgkQzL64meEa
mQZmqhAA1qFxb9/dvSAfQ5oXcSSAq5wpeVNcTvkGmG68m4+BnbIMq/J2oPdx4MdX
AIiVL6DxeyPJP7ldfdlbz6RmwoVdhi9fYhLiMxWH/n4gtsXKLo8O+OeXcQvj167h
qJkY5ilDakMln5hdsZJywpNaAWlzPb8EV+jZ8ELUHXPVyKpMbvndZwPkNoiHl/79
E+W1pYa0klJbI9JcysPXeTd25SLrKDY5AirxxfxKJfJEAbuVl+2okIZu7vE23KIs
uPubwkVk1bPVdof1P88LLfkU+hzBkDo3ZVokx0EiNQtnjrAlyDUFd2bYxpbqxCR9
/VVabCHQi72iC5XOlYAw6XJ7S6qQ21ROlIA5IWdoHyStNYeSGQaqHqRylMTZE9/a
HsyLtqKeQuCiBxMag82nMLVpC/25j7HqORg6o3+ckqcfQ+HwrR5WPaSTXDtNtmxy
MFZRMK3fc/YMq0TJRqeAqo71F7xYgVQqB2PjkVT+LRQezflUFimjrf12MCv8FZ89
8QouguQlHat7/1u1LjWWGNglXwLO5x932lhgFK8FFbWDLrAPhzZ+TRheYErDqfWQ
9GSsNgJDqH6GcC+kxocQF6TKmX9hmRbkarqFFaQs4LL7QHWQsRXcTaAF2qaG/l2z
X4BK1BEJwLZe+QW598rWdVvRuxGTxfA716eBLZAzgmU+QLBcQaI=
=s1rb
-----END PGP SIGNATURE-----
--=-=-=--


--===============6999587004264812452==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6999587004264812452==--
