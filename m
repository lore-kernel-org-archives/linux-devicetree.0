From: Corey Minyard <minyard@acm.org>
Subject: Re: [PATCH v4] MAINTAINERS: Add file patterns
 for ipmi device tree bindings
Date: Fri, 22 Jun 2018 08:04:19 -0500
Message-ID: <307ab976-6e1c-275d-8fb7-cd9b99255115@acm.org>
References: <20180622100815.29221-1-geert@linux-m68k.org>
Reply-To: minyard@acm.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <openipmi-developer-bounces@lists.sourceforge.net>
In-Reply-To: <20180622100815.29221-1-geert@linux-m68k.org>
Content-Language: en-GB
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/openipmi-developer>,
 <mailto:openipmi-developer-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=openipmi-developer>
List-Post: <mailto:openipmi-developer@lists.sourceforge.net>
List-Help: <mailto:openipmi-developer-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/openipmi-developer>,
 <mailto:openipmi-developer-request@lists.sourceforge.net?subject=subscribe>
Errors-To: openipmi-developer-bounces@lists.sourceforge.net
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, openipmi-developer@lists.sourceforge.net, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 06/22/2018 05:08 AM, Geert Uytterhoeven wrote:
> Submitters of device tree binding documentation may forget to CC
> the subsystem maintainer if this is missing.
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> v3:
>    - Update for next-20180622,
>
> v2:
>    - New.

Thanks, I have this queue.

-corey

> Impact on "scripts/get_maintainer.pl -f Documentation/devicetree/bindings/ipmi/":
>
> +Corey Minyard <minyard@acm.org> (supporter:IPMI SUBSYSTEM)
>   Rob Herring <robh+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
>   Mark Rutland <mark.rutland@arm.com> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
> -Corey Minyard <cminyard@mvista.com> (commit_signer:2/2=100%)
> -Haiyue Wang <haiyue.wang@linux.intel.com> (commit_signer:2/2=100%,authored:2/2=100%)
> -Avi Fishman <avifishman70@gmail.com> (commit_signer:1/2=50%)
> +openipmi-developer@lists.sourceforge.net (moderated list:IPMI SUBSYSTEM)
>   devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
>   linux-kernel@vger.kernel.org (open list)
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 76b5dd65291f9650..321fbaa7e7d273a2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7463,6 +7463,7 @@ M:	Corey Minyard <minyard@acm.org>
>   L:	openipmi-developer@lists.sourceforge.net (moderated for non-subscribers)
>   W:	http://openipmi.sourceforge.net/
>   S:	Supported
> +F:	Documentation/devicetree/bindings/ipmi/
>   F:	Documentation/IPMI.txt
>   F:	drivers/char/ipmi/
>   F:	include/linux/ipmi*



------------------------------------------------------------------------------
Check out the vibrant tech community on one of the world's most
engaging tech sites, Slashdot.org! http://sdm.link/slashdot
