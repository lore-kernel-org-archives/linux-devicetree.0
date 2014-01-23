From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: randconfig build error with next-20140122, in arch/x86/kernel/devicetree.c
Date: Wed, 22 Jan 2014 19:26:12 -0500
Message-ID: <CAP=VYLq_rhAUqyfPAPYTwAH5zjR4OtpULGPh6dBQJDbGtG8ZcA@mail.gmail.com>
References: <CA+r1Zhjiw3Cv8AnsAhT==nkAYN2dxVXcWABpiVhtHXsW52YRkg@mail.gmail.com>
 <52DFFAA7.40008@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
In-Reply-To: <52DFFAA7.40008@infradead.org>
Sender: linux-next-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Jim Davis <jim.epost@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>, mingo@redhat.com, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 22, 2014 at 12:06 PM, Randy Dunlap <rdunlap@infradead.org> =
wrote:
> On 01/22/2014 08:34 AM, Jim Davis wrote:
>> Building with the attached random configuration file,
>>
>> warning: (X86_INTEL_MID) selects INTEL_SCU_IPC which has unmet direc=
t
>> dependencies (X86 && X86_PLATFORM_DEVICES && X86_INTEL_MID)
>> warning: (USB_OTG_FSM && FSL_USB2_OTG && USB_MV_OTG) selects USB_OTG
>> which has unmet direct dependencies (USB_SUPPORT && USB && PM_RUNTIM=
E)
>> warning: (X86_INTEL_MID) selects INTEL_SCU_IPC which has unmet direc=
t
>> dependencies (X86 && X86_PLATFORM_DEVICES && X86_INTEL_MID)
>> warning: (USB_OTG_FSM && FSL_USB2_OTG && USB_MV_OTG) selects USB_OTG
>> which has unmet direct dependencies (USB_SUPPORT && USB && PM_RUNTIM=
E)
>>
>> arch/x86/kernel/devicetree.c:67:1: warning: data definition has no
>> type or storage class [enabled by default]
>>  module_init(add_bus_probe);
>>  ^
>
> For linux-next, devicetree.c needs to #include <linux/module.h>.
> For mainline, it would have needed to #include <linux/init.h>.
> However, it does neither of those.

Thanks guys; I've already queued a fix for this.

http://git.kernel.org/cgit/linux/kernel/git/paulg/init.git/commit/?id=3D=
3d83b6b84210066f0886b0916136fa49ca61704d

Paul.
--

>
> See Documentation/SubmitChecklist #1:
>
> 1: If you use a facility then #include the file that defines/declares
>    that facility.  Don't depend on other header files pulling in ones
>    that you use.http://git.kernel.org/cgit/linux/kernel/git/paulg/ini=
t.git/commit/?id=3D3d83b6b84210066f0886b0916136fa49ca61704d
>
>
>> arch/x86/kernel/devicetree.c:67:1: error: type defaults to =91int=92=
 in
>> declaration of =91module_init=92 [-Werror=3Dimplicit-int]
>> arch/x86/kernel/devicetree.c:67:1: warning: parameter names (without
>> types) in function declaration [enabled by default]
>> arch/x86/kernel/devicetree.c:60:19: warning: =91add_bus_probe=92 def=
ined
>> but not used [-Wunused-function]
>>  static int __init add_bus_probe(void)
>>                    ^
>> cc1: some warnings being treated as errors
>> make[2]: *** [arch/x86/kernel/devicetree.o] Error 1
>>
>
>
> --
> ~Randy
> --
> To unsubscribe from this list: send the line "unsubscribe linux-next"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
