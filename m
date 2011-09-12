From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: UEFI port of Fdtlib
Date: Mon, 12 Sep 2011 11:39:30 +1000
Message-ID: <20110912013930.GL9025@yookeroo.fritz.box>
References: <00cd01cc6f23$0c9f5990$25de0cb0$@martin@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <00cd01cc6f23$0c9f5990$25de0cb0$@martin-5wv7dgnIgG8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Olivier Martin <olivier.martin-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Sep 09, 2011 at 08:02:40PM +0100, Olivier Martin wrote:
> Hello all,
> 
> I have ported the libfdt to Tianocore project [1] (under BSD license) which
> is an implementation of UEFI specification supported by Intel, ARM Ltd and
> other major companies.
> I took the libfdt directory from the head revision of
> git://git.jdl.com/software/dtc.git and ported it to the Tianocore project.
> I had just needed to edit the libfdt_env.h to translate the POSIX types and
> functions into their Tianocore equivalents.
> I was advised to send my changes to this mailing-list (please find the
> edited lifdt_env.h attached to this email).
> 
> I am using this libfdt library to add/update information to the Device Tree
> (Linux kernel cmd line, etc) that is passed to the Linux kernel. I am
> planning to push upstream my changes in the next couple of days.
> 
> Questions and comment are welcome !
> 
> Best Regards,
> Olivier
> 
> [1] http://sourceforge.net/apps/mediawiki/tianocore/

> #ifndef _LIBFDT_ENV_H
> #define _LIBFDT_ENV_H
> 
> #include <Library/BaseLib.h>
> #include <Library/BaseMemoryLib.h>
> 
> typedef UINT8 uint8_t;
> typedef UINT32 uint32_t;
> typedef UINT64 uint64_t;
> typedef UINTN uintptr_t;
> typedef UINTN size_t;
> 
> #define _B(n)	((unsigned long long)((uint8_t *)&x)[n])
> static inline uint32_t fdt32_to_cpu(uint32_t x)
> {
> 	return (_B(0) << 24) | (_B(1) << 16) | (_B(2) << 8) | _B(3);
> }
> #define cpu_to_fdt32(x) fdt32_to_cpu(x)
> 
> static inline uint64_t fdt64_to_cpu(uint64_t x)
> {
> 	return (_B(0) << 56) | (_B(1) << 48) | (_B(2) << 40) | (_B(3) << 32)
> 		| (_B(4) << 24) | (_B(5) << 16) | (_B(6) << 8) | _B(7);
> }
> #define cpu_to_fdt64(x) fdt64_to_cpu(x)
> #undef _B

Tianocore really doesn't have any byte swapping functions?  I only
used these nasty versions, because they're portable, whereas very
little about userspace endian.h/bytesex.h is.

> static inline void* memcpy(void* dest, const void* src, size_t len) {
>   return CopyMem (dest, src, len);
> }
> 
> static inline void *memmove(void *dest, const void *src, size_t n) {
>   return CopyMem (dest, src, n);
> }

Ok, I take it that Tianocore's CopyMem can operate on overlapping
source and destination, like memmove()?


-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
