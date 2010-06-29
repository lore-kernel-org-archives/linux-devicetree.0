From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 3/4] proc: unify PROC_DEVICETREE config
Date: Tue, 29 Jun 2010 00:33:59 -0700
Message-ID: <AANLkTil30jVU79NGdPdAw516-_AOTzbX6DQdwahv4evx@mail.gmail.com>
References: <20100628215407.2017bf2f@debian> <20100628220048.6a07c5ee@debian>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <sparclinux-owner@vger.kernel.org>
In-Reply-To: <20100628220048.6a07c5ee@debian>
Sender: sparclinux-owner@vger.kernel.org
To: Andres Salomon <dilinger@queued.net>
Cc: devicetree-discuss@lists.ozlabs.org, sparclinux@vger.kernel.org, x86@kernel.org, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, cjb@laptop.org, Mitch Bradley <wmb@laptop.org>, pgf@laptop.org, linux-kernel@vger.kernel.org, davem@davemloft.net
List-Id: devicetree@vger.kernel.org

On Mon, Jun 28, 2010 at 7:00 PM, Andres Salomon <dilinger@queued.net> w=
rote:
>
> Microblaze and PPC both use PROC_DEVICETREE, and OLPC will as well.. =
put
> the Kconfig option into fs/ rather than in arch/*/Kconfig.
>
> Signed-off-by: Andres Salomon <dilinger@queued.net>
> ---
> =A0arch/microblaze/Kconfig | =A0 =A08 --------
> =A0arch/powerpc/Kconfig =A0 =A0| =A0 =A08 --------
> =A0fs/proc/Kconfig =A0 =A0 =A0 =A0 | =A0 =A08 ++++++++
> =A03 files changed, 8 insertions(+), 16 deletions(-)
>
> diff --git a/arch/microblaze/Kconfig b/arch/microblaze/Kconfig
> index 76818f9..b66c962 100644
> --- a/arch/microblaze/Kconfig
> +++ b/arch/microblaze/Kconfig
> @@ -128,14 +128,6 @@ config OF
> =A0 =A0 =A0 =A0def_bool y
> =A0 =A0 =A0 =A0select OF_FLATTREE
>
> -config PROC_DEVICETREE
> - =A0 =A0 =A0 bool "Support for device tree in /proc"
> - =A0 =A0 =A0 depends on PROC_FS
> - =A0 =A0 =A0 help
> - =A0 =A0 =A0 =A0 This option adds a device-tree directory under /pro=
c which contains
> - =A0 =A0 =A0 =A0 an image of the device tree that the kernel copies =
from Open
> - =A0 =A0 =A0 =A0 Firmware or other boot firmware. If unsure, say Y h=
ere.
> -
> =A0endmenu
>
> =A0menu "Advanced setup"
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 328774b..8a56e8b 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -578,14 +578,6 @@ config SCHED_SMT
> =A0 =A0 =A0 =A0 =A0when dealing with POWER5 cpus at a cost of slightl=
y increased
> =A0 =A0 =A0 =A0 =A0overhead in some places. If unsure say N here.
>
> -config PROC_DEVICETREE
> - =A0 =A0 =A0 bool "Support for device tree in /proc"
> - =A0 =A0 =A0 depends on PROC_FS
> - =A0 =A0 =A0 help
> - =A0 =A0 =A0 =A0 This option adds a device-tree directory under /pro=
c which contains
> - =A0 =A0 =A0 =A0 an image of the device tree that the kernel copies =
from Open
> - =A0 =A0 =A0 =A0 Firmware or other boot firmware. If unsure, say Y h=
ere.
> -
> =A0config CMDLINE_BOOL
> =A0 =A0 =A0 =A0bool "Default bootloader kernel arguments"
>
> diff --git a/fs/proc/Kconfig b/fs/proc/Kconfig
> index 50f8f06..858a859 100644
> --- a/fs/proc/Kconfig
> +++ b/fs/proc/Kconfig
> @@ -39,6 +39,14 @@ config PROC_VMCORE
> =A0 =A0 =A0 =A0 help
> =A0 =A0 =A0 =A0 Exports the dump image of crashed kernel in ELF forma=
t.
>
> +config PROC_DEVICETREE
> + =A0 =A0 =A0 bool "Support for device tree in /proc"
> + =A0 =A0 =A0 depends on PROC_FS && (PPC || MICROBLAZE)
> + =A0 =A0 =A0 help
> + =A0 =A0 =A0 =A0 This option adds a device-tree directory under /pro=
c which contains
> + =A0 =A0 =A0 =A0 an image of the device tree that the kernel copies =
from Open
> + =A0 =A0 =A0 =A0 Firmware or other boot firmware. If unsure, say Y h=
ere.
> +

Looks good to me.  However, I've changed the depends line to the follow=
ing.

depends on PROC_FS && OF && !SPARC

Cheers,
g.
--
To unsubscribe from this list: send the line "unsubscribe sparclinux" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
