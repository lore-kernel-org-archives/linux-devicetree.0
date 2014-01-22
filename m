From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: randconfig build error with next-20140122, in arch/x86/kernel/devicetree.c
Date: Wed, 22 Jan 2014 09:06:47 -0800
Message-ID: <52DFFAA7.40008@infradead.org>
References: <CA+r1Zhjiw3Cv8AnsAhT==nkAYN2dxVXcWABpiVhtHXsW52YRkg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
In-Reply-To: <CA+r1Zhjiw3Cv8AnsAhT==nkAYN2dxVXcWABpiVhtHXsW52YRkg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
To: Jim Davis <jim.epost@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 01/22/2014 08:34 AM, Jim Davis wrote:
> Building with the attached random configuration file,
>=20
> warning: (X86_INTEL_MID) selects INTEL_SCU_IPC which has unmet direct
> dependencies (X86 && X86_PLATFORM_DEVICES && X86_INTEL_MID)
> warning: (USB_OTG_FSM && FSL_USB2_OTG && USB_MV_OTG) selects USB_OTG
> which has unmet direct dependencies (USB_SUPPORT && USB && PM_RUNTIME=
)
> warning: (X86_INTEL_MID) selects INTEL_SCU_IPC which has unmet direct
> dependencies (X86 && X86_PLATFORM_DEVICES && X86_INTEL_MID)
> warning: (USB_OTG_FSM && FSL_USB2_OTG && USB_MV_OTG) selects USB_OTG
> which has unmet direct dependencies (USB_SUPPORT && USB && PM_RUNTIME=
)
>=20
> arch/x86/kernel/devicetree.c:67:1: warning: data definition has no
> type or storage class [enabled by default]
>  module_init(add_bus_probe);
>  ^

=46or linux-next, devicetree.c needs to #include <linux/module.h>.
=46or mainline, it would have needed to #include <linux/init.h>.
However, it does neither of those.

See Documentation/SubmitChecklist #1:

1: If you use a facility then #include the file that defines/declares
   that facility.  Don't depend on other header files pulling in ones
   that you use.


> arch/x86/kernel/devicetree.c:67:1: error: type defaults to =E2=80=98i=
nt=E2=80=99 in
> declaration of =E2=80=98module_init=E2=80=99 [-Werror=3Dimplicit-int]
> arch/x86/kernel/devicetree.c:67:1: warning: parameter names (without
> types) in function declaration [enabled by default]
> arch/x86/kernel/devicetree.c:60:19: warning: =E2=80=98add_bus_probe=E2=
=80=99 defined
> but not used [-Wunused-function]
>  static int __init add_bus_probe(void)
>                    ^
> cc1: some warnings being treated as errors
> make[2]: *** [arch/x86/kernel/devicetree.o] Error 1
>=20


--=20
~Randy
