From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC PATCH v2 02/12] of: Allow scripts/dtc/libfdt to be used from
	kernel code
Date: Fri, 4 Mar 2011 17:59:27 -0700
Message-ID: <AANLkTimHkOuO=wyyBNiPeMCq=JYMmT0_fsZ00yyDNNJn@mail.gmail.com>
References: <1299267744-17278-1-git-send-email-ddaney@caviumnetworks.com>
	<1299267744-17278-3-git-send-email-ddaney@caviumnetworks.com>
	<20110305005750.GC7579@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110305005750.GC7579-MrY2KI0G/OVr83L8+7iqerDks+cytr/Z@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, David Gibson <dwg-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

[actually cc'ing David Gibson this time]

On Fri, Mar 4, 2011 at 5:57 PM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wr=
ote:
> [cc'ing David Gibson]
> On Fri, Mar 04, 2011 at 11:42:14AM -0800, David Daney wrote:
>> Signed-off-by: David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
>> ---
>> =A0include/linux/libfdt.h =A0 =A0 =A0| =A0 =A03 +++
>> =A0lib/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A06 ++++++
>> =A0lib/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A02 ++
>> =A0lib/libfdt/Makefile =A0 =A0 =A0 =A0 | =A0 =A07 +++++++
>> =A0lib/libfdt/libfdt_env.h =A0 =A0 | =A0 21 +++++++++++++++++++++
>> =A0scripts/dtc/libfdt/libfdt.h | =A0 =A04 ++--
>> =A06 files changed, 41 insertions(+), 2 deletions(-)
>> =A0create mode 100644 include/linux/libfdt.h
>> =A0create mode 100644 lib/libfdt/Makefile
>> =A0create mode 100644 lib/libfdt/libfdt_env.h
>>
>> diff --git a/include/linux/libfdt.h b/include/linux/libfdt.h
>> new file mode 100644
>> index 0000000..10bce91
>> --- /dev/null
>> +++ b/include/linux/libfdt.h
>> @@ -0,0 +1,3 @@
>> +#include "../../lib/libfdt/libfdt_env.h"
>
> libfdt_env.h should be in include/linux
>
>> +#include "../../scripts/dtc/libfdt/fdt.h"
>> +#include "../../scripts/dtc/libfdt/libfdt.h"
>
> Hmmm... I wonder if there is a better way to do this. =A0I don't much
> care for the relative path references.
>
> Also, need to have #ifdef _INCLUDE_LIBFDT_H_ protection
>
>> diff --git a/lib/Kconfig b/lib/Kconfig
>> index 0ee67e0..e8a2638 100644
>> --- a/lib/Kconfig
>> +++ b/lib/Kconfig
>> @@ -219,4 +219,10 @@ config LRU_CACHE
>> =A0config AVERAGE
>> =A0 =A0 =A0 bool
>>
>> +#
>> +# The Flattened Device Tree manipulation library
>> +#
>> +config LIBFDT
>> + =A0 =A0 bool
>> +
>
> This should be in drivers/of/Kconfig
>
>> =A0endmenu
>> diff --git a/lib/Makefile b/lib/Makefile
>> index cbb774f..5840115 100644
>> --- a/lib/Makefile
>> +++ b/lib/Makefile
>> @@ -110,6 +110,8 @@ obj-$(CONFIG_ATOMIC64_SELFTEST) +=3D atomic64_test.o
>>
>> =A0obj-$(CONFIG_AVERAGE) +=3D average.o
>>
>> +obj-$(CONFIG_LIBFDT) +=3D libfdt/
>> +
>
> Ditto here; drivers/of/libfdt
>
>> =A0hostprogs-y =A0:=3D gen_crc32table
>> =A0clean-files =A0:=3D crc32table.h
>>
>> diff --git a/lib/libfdt/Makefile b/lib/libfdt/Makefile
>> new file mode 100644
>> index 0000000..6c1a496
>> --- /dev/null
>> +++ b/lib/libfdt/Makefile
>> @@ -0,0 +1,7 @@
>> +obj-y =3D fdt.o fdt_wip.o fdt_ro.o
>> +
>> +EXTRA_CFLAGS +=3D -include $(src)/libfdt_env.h -I$(src)/../../scripts/d=
tc/libfdt
>> +
>> +$(obj)/%.o: $(src)/../../scripts/dtc/libfdt/%.c FORCE
>> + =A0 =A0 $(call cmd,force_checksrc)
>> + =A0 =A0 $(call if_changed_rule,cc_o_c)
>> diff --git a/lib/libfdt/libfdt_env.h b/lib/libfdt/libfdt_env.h
>> new file mode 100644
>> index 0000000..d977b8b
>> --- /dev/null
>> +++ b/lib/libfdt/libfdt_env.h
>> @@ -0,0 +1,21 @@
>> +#ifndef _LIBFDT_ENV_H
>> +#define _LIBFDT_ENV_H
>> +
>> +#include <linux/string.h>
>> +
>> +#define _B(n) =A0 =A0 =A0 =A0((unsigned long long)((uint8_t *)&x)[n])
>> +static inline uint32_t fdt32_to_cpu(uint32_t x)
>> +{
>> + =A0 =A0 return (_B(0) << 24) | (_B(1) << 16) | (_B(2) << 8) | _B(3);
>> +}
>> +#define cpu_to_fdt32(x) fdt32_to_cpu(x)
>> +
>> +static inline uint64_t fdt64_to_cpu(uint64_t x)
>> +{
>> + =A0 =A0 return (_B(0) << 56) | (_B(1) << 48) | (_B(2) << 40) | (_B(3) =
<< 32)
>> + =A0 =A0 =A0 =A0 =A0 =A0 | (_B(4) << 24) | (_B(5) << 16) | (_B(6) << 8)=
 | _B(7);
>> +}
>> +#define cpu_to_fdt64(x) fdt64_to_cpu(x)
>> +#undef _B
>> +
>
> This isn't necessary, the kernel already has efficient architecture
> macros for converting endianess.
>
> #define fdt32_to_cpu(x) be32_to_cpu(x)
> #define cpu_to_fdt32(x) cpu_to_be32(x)
> #define fdt64_to_cpu(x) be64_to_cpu(x)
> #define cpu_to_fdt64(x) cpu_to_be64(x)
>
>> +#endif /* _LIBFDT_ENV_H */
>> diff --git a/scripts/dtc/libfdt/libfdt.h b/scripts/dtc/libfdt/libfdt.h
>> index ce80e4f..33a0c4d 100644
>> --- a/scripts/dtc/libfdt/libfdt.h
>> +++ b/scripts/dtc/libfdt/libfdt.h
>> @@ -51,8 +51,8 @@
>> =A0 * =A0 =A0 EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
>> =A0 */
>>
>> -#include <libfdt_env.h>
>> -#include <fdt.h>
>> +#include "libfdt_env.h"
>> +#include "fdt.h"
>
> This causes problems. =A0libfdt is an external library that is
> periodically copied into the kernel tree. =A0It would be better to add
> "-Iscripts/dtc/libfdt" to CFLAGS for .c files that want to call libfdt
> routines.
>
>>
>> =A0#define FDT_FIRST_SUPPORTED_VERSION =A00x10
>> =A0#define FDT_LAST_SUPPORTED_VERSION =A0 0x11
>> --
>> 1.7.2.3
>>
>



-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
