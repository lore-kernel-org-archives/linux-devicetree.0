From: "Olivier Martin" <olivier.martin-5wv7dgnIgG8@public.gmane.org>
Subject: UEFI port of Fdtlib
Date: Fri, 9 Sep 2011 11:16:17 +0100
Message-ID: <13966.7114512578$1316624781@news.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_00BC_01CC6EE1.E50EEF80"
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Language: en-gb
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is a multi-part message in MIME format.

------=_NextPart_000_00BC_01CC6EE1.E50EEF80
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello all,

I have ported the libfdt to Tianocore project [1] (under BSD license) which
is an implementation of UEFI specification supported by Intel, ARM Ltd and
other major companies.
I took the libfdt directory from the head revision of
git://git.jdl.com/software/dtc.git and ported it to the Tianocore project.
I had just needed to edit the libfdt_env.h to translate the POSIX types and
functions into their Tianocore equivalents.
I was advised to send my changes to this mailing-list (please find the
edited lifdt_env.h attached to this email).

I am using this libfdt library to add/update information to the Device Tree
(Linux kernel cmd line, etc) that is passed to the Linux kernel. I am
planning to push upstream my changes in the next couple of days.

Questions and comment are welcome !

Best Regards,
Olivier

[1] http://sourceforge.net/apps/mediawiki/tianocore/

------=_NextPart_000_00BC_01CC6EE1.E50EEF80
Content-Type: text/plain;
	name="libfdt_env.h"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="libfdt_env.h"

#ifndef _LIBFDT_ENV_H=0A=
#define _LIBFDT_ENV_H=0A=
=0A=
#include <Library/BaseLib.h>=0A=
#include <Library/BaseMemoryLib.h>=0A=
=0A=
typedef UINT8 uint8_t;=0A=
typedef UINT32 uint32_t;=0A=
typedef UINT64 uint64_t;=0A=
typedef UINTN uintptr_t;=0A=
typedef UINTN size_t;=0A=
=0A=
#define _B(n)	((unsigned long long)((uint8_t *)&x)[n])=0A=
static inline uint32_t fdt32_to_cpu(uint32_t x)=0A=
{=0A=
	return (_B(0) << 24) | (_B(1) << 16) | (_B(2) << 8) | _B(3);=0A=
}=0A=
#define cpu_to_fdt32(x) fdt32_to_cpu(x)=0A=
=0A=
static inline uint64_t fdt64_to_cpu(uint64_t x)=0A=
{=0A=
	return (_B(0) << 56) | (_B(1) << 48) | (_B(2) << 40) | (_B(3) << 32)=0A=
		| (_B(4) << 24) | (_B(5) << 16) | (_B(6) << 8) | _B(7);=0A=
}=0A=
#define cpu_to_fdt64(x) fdt64_to_cpu(x)=0A=
#undef _B=0A=
=0A=
static inline void* memcpy(void* dest, const void* src, size_t len) {=0A=
  return CopyMem (dest, src, len);=0A=
}=0A=
=0A=
static inline void *memmove(void *dest, const void *src, size_t n) {=0A=
  return CopyMem (dest, src, n);=0A=
}=0A=
=0A=
static inline void *memset(void *s, int c, size_t n) {=0A=
  return SetMem (s, n, c);=0A=
}=0A=
=0A=
static inline int memcmp(const void* dest, const void* src, int len) {=0A=
  return CompareMem (dest, src, len);=0A=
}=0A=
=0A=
static inline void *memchr(const void *s, int c, size_t n) {=0A=
  return ScanMem8 (s, n, c);=0A=
}=0A=
=0A=
static inline size_t strlen (const char* str) {=0A=
  return AsciiStrLen (str);=0A=
}=0A=
=0A=
static inline char *strchr(const char *s, int c) {=0A=
  char pattern[2];=0A=
  pattern[0] =3D c;=0A=
  pattern[1] =3D 0;=0A=
  return AsciiStrStr (s, pattern);=0A=
}=0A=
=0A=
#endif /* _LIBFDT_ENV_H */=0A=

------=_NextPart_000_00BC_01CC6EE1.E50EEF80
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

------=_NextPart_000_00BC_01CC6EE1.E50EEF80--
