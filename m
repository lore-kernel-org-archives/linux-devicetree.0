From: Jon Loeliger <jdl@jdl.com>
Subject: Re: [PATCH] dtc: Use quotes to include header files
Date: Tue, 16 Dec 2014 08:44:44 -0600
Message-ID: <E1Y0tMi-0006IS-Bu@mylo>
References: <7947240.7yktm8fT2X@wuerfel>
 <1418696004-12829-1-git-send-email-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1418696004-12829-1-git-send-email-chris.packham@alliedtelesis.co.nz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: devicetree@vger.kernel.org, arnd@arndb.de, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Grant Likely <grant.likely@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

So, like, Chris Packham said:
> Hi,
> 
> This probably should come via git://git.jdl.com/software/dtc.git however
> this appears to be inaccessible at the moment. Is this still the
> canonical source for the device tree compiler and libfdt or has it been
> moved? How much deviation from the canonical source are we prepared to
> live with in the kernel?

That is because the official DTC repository has moved to git.kernel.org!



> Currently in arch and driver code that needs early access to the
> flattened device tree it is necessary to add specific CFLAGS so that
> when scripts/dtc/libfdt/libfdt.h is included the C preprocessor is able
> to locate the libfdt versions of libfdt_env.h and fdt.h without
> generating an error.
> 
> We already provide an alternative linux-specific
> version of libfdt_env.h and directly include scripts/dtc/libfdt/fdt.h
> so the inclusion by scripts/dtc/libfdt/libfdt.h is a no-op thanks to the
> inclusion guards.
> 
> By using quotes in scripts/dtc/libfdt/libfdt.h it picks up fdt.h and
> libfdt_env.h from the source directory without needing to add CFLAGS for
> the sources that happen to include linux/libfdt.h.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---

and:

> diff --git a/scripts/dtc/libfdt/libfdt.h b/scripts/dtc/libfdt/libfdt.h
> index 73f4975..ea1ddcd 100644
> --- a/scripts/dtc/libfdt/libfdt.h
> +++ b/scripts/dtc/libfdt/libfdt.h
> @@ -51,8 +51,8 @@
>   *     EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
>   */
>  
> -#include <libfdt_env.h>
> -#include <fdt.h>
> +#include "libfdt_env.h"
> +#include "fdt.h"
>  
>  #define FDT_FIRST_SUPPORTED_VERSION	0x10
>  #define FDT_LAST_SUPPORTED_VERSION	0x11


Hmm.  I seem to recall that the use of angle brackets was intentional.
I believe that was predicated on installing the FDT library on some
target machine and needing it to be able to find the other header
files in an installation, not source, directory.

Minor repository spelunking suggests that the angle brackets have
been around since Day Zero:

    commit 3da0f9a10dfa9b615d06c350c7b9fe29f360a6e0

David?

HTH?,
jdl
