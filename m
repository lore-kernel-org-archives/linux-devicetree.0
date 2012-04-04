From: Josh Boyer <jwboyer@gmail.com>
Subject: Re: [PATCH 3/5] powerpc: dts: klondike: Add UART nodes
Date: Tue, 3 Apr 2012 20:49:40 -0400
Message-ID: <CA+5PVA4_PJ2T7LGM_N_WemQKY2u6bLg0QFk4wPpd=FGESx7eiQ@mail.gmail.com>
References: <1333348747-12713-1-git-send-email-tinamdar@apm.com>
	<1333348747-12713-2-git-send-email-tinamdar@apm.com>
	<1333348747-12713-3-git-send-email-tinamdar@apm.com>
	<20120403155703.3B0593E053F@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120403155703.3B0593E053F@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Tanmay Inamdar <tinamdar@apm.com>, benh@kernel.crashing.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Tue, Apr 3, 2012 at 11:57 AM, Grant Likely <grant.likely@secretlab.c=
a> wrote:
> On Mon, =A02 Apr 2012 12:09:05 +0530, Tanmay Inamdar <tinamdar@apm.co=
m> wrote:
>> Adding UART nodes in Klondike device tree file.
>>
>> Signed-off-by: Tanmay Inamdar <tinamdar@apm.com>
>> ---
>> :100644 100644 4ff2852... d5bf2e1... M =A0 =A0 =A0 =A0arch/powerpc/b=
oot/dts/klondike.dts
>> =A0arch/powerpc/boot/dts/klondike.dts | =A0 24 +++++++++++++++++++++=
+++
>> =A01 files changed, 24 insertions(+), 0 deletions(-)
>>
>> diff --git a/arch/powerpc/boot/dts/klondike.dts b/arch/powerpc/boot/=
dts/klondike.dts
>> index 4ff2852..d5bf2e1 100644
>> --- a/arch/powerpc/boot/dts/klondike.dts
>> +++ b/arch/powerpc/boot/dts/klondike.dts
>> @@ -222,6 +222,30 @@
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #size-ce=
lls =3D <1>;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ranges;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-fr=
equency =3D <0>;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 UART0: ser=
ial@50001000 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0device_type =3D "serial";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0compatible =3D "ns16550";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0reg =3D <0x50001000 0x00000100>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0virtual-reg =3D <0x50001000>;
>
> Why do you need virtual-reg? =A0The kernel should handle all iomappin=
g
> properly without this.

Right.  It's been used for platforms that actually use the
zImage/treeImage wrapper for printf support, but this uses u-boot as
far as I know.  It shouldn't need it.

josh
