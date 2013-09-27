Return-Path: <Vineet.Gupta1@synopsys.com>
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH 00/21] of: prom.h clean-up and removal
Date: Fri, 27 Sep 2013 04:56:37 +0000
Message-ID: <C2D7FE5348E1B147BCA15975FBA2307514EA98@IN01WEMBXA.internal.synopsys.com>
References: <1380221456-11192-1-git-send-email-robherring2@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Rob Herring <robherring2@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Anatolij Gustschin <agust@denx.de>, "Aurelien Jacquiot  <a-jacquiot@ti.com>, Benjamin Herrenschmidt" <benh@kernel.crashing.org>, Catalin Marinas <catalin.marinas@arm.com>, Chris Zankel <chris@zankel.net>, "David S. Miller" <davem@davemloft.net>, "H. Peter Anvin  <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, James Hogan" <james.hogan@imgtec.com>, Jonas Bonn <jonas@southpole.se>, Kumar Gala <galak@kernel.crashing.org>, Marc Kleine-Budde <mkl@pengutronix.de>, "Mark Salter  <msalter@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>, Michal Simek" <monstr@monstr.eu>, Olof Johansson <olof@lixom.net>, Paul Mackerras <paulus@samba.org>, Ralf Baechle <ralf@linux-mips.org>, Richard Kuo <rkuo@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, "Santosh Shilimkar  <santosh.shilimkar@ti.com>, Thomas Gleixner <tglx@linutronix.de>, Vineet Gupta" <Vineet.Gupta1@synopsys.com>, Will Deacon <will.deacon@arm.com>, Wolfgang Grandegger <wg@grandegger.com>, "x86@kernel.org" <x86@kernel.org>
List-ID: <devicetree@vger.kernel.org>

On 09/27/2013 12:21 AM, Rob Herring wrote:=0A=
> From: Rob Herring <rob.herring@calxeda.com>=0A=
>=0A=
> This is the second series of clean-up for architecture DT code. The first=
=0A=
> series is here [1].=0A=
>=0A=
> As the number of DT enabled architectures has grown, there has been a lot=
=0A=
> of copy/paste duplication of prom.h. The include ordering for prom.h is=
=0A=
> complex and has resulted in many implicit includes. This series cleans up=
=0A=
> prom.h and removes the dependency of prom.h includes in the core DT code=
=0A=
> on all architectures except sparc. This removes prom.h on several=0A=
> architectures and makes it an architecture specific include on the rest.=
=0A=
>=0A=
> Compiled on arm, arm64, microblaze, mips, openrisc, powerpc, sparc,=0A=
> xtensa. Mostly defconfigs and some allyesconfigs. The 0-day builder has=
=0A=
> also caught some issues.=0A=
>=0A=
> A branch with both series is available here:=0A=
> git://sources.calxeda.com/kernel/linux.git dt-cleanup=0A=
>=0A=
=0A=
I gave the latest branch a spin - everything looks good except for a build =
warning=0A=
- and given the const qualifier in the API, I reckon most (if not all) woul=
d see that.=0A=
=0A=
It seems this was introduced in first series but maybe I failed to notice t=
hen as=0A=
I'm sure I booted that code too.=0A=
=0A=
------------------>8-----------------------------=0A=
  CC      arch/arc/kernel/devtree.o=0A=
arch/arc/kernel/devtree.c: In function =91setup_machine_fdt=92:=0A=
arch/arc/kernel/devtree.c:50:8: warning: assignment discards =91const=92 qu=
alifier=0A=
from pointer target type [enabled by default]=0A=
  mdesc =3D of_flat_dt_match_machine(NULL, arch_get_next_mach);=0A=
        ^=0A=
------------------>8-----------------------------=0A=
=0A=
ARM propagates the const to callers - upto setup_arch(), but that might not=
 work=0A=
for us as we use it to setup a global @machine_desc which is then used to d=
ispatch=0A=
the callbacks in platform APIs. Semantically it's good if it is const but t=
hat=0A=
would require making it local and propagating to all the users - not worth =
the=0A=
trouble I suppose.=0A=
=0A=
What say you !=0A=
=0A=
Thx,=0A=
-Vineet=0A=
