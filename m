From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [RFC PATCH 2/2] ARM: DT: kernel: DT cpu node bindings update
Date: Mon, 15 Apr 2013 13:26:02 -0600
Message-ID: <516C544A.4090107@wwwdotorg.org>
References: <1366042402-8987-1-git-send-email-lorenzo.pieralisi@arm.com>
 <1366042402-8987-3-git-send-email-lorenzo.pieralisi@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1366042402-8987-3-git-send-email-lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jon Medhurst <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lennert Buytenhek <kernel-OLH4Qvv75CYX/NnBR394Jw@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Barry Song <baohua.song-kQvG35nSl+M@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Amit Kucheria <amit.kucheria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 04/15/2013 10:13 AM, Lorenzo Pieralisi wrote:
> In order to extend the current cpu nodes bindings to newer CPUs
> inclusive of AArch64 and to update support for older ARM CPUs this
> patch updates device tree documentation for the cpu nodes bindings.
> 

> diff --git a/Documentation/devicetree/bindings/arm/cpus.txt b/Documentation/devicetree/bindings/arm/cpus.txt

>  http://devicetree.org
>  
> -For the ARM architecture every CPU node must contain the following properties:
> -
...
> +with updates for 32-bit and 64-bit ARM systems provided in this document.
> +
> +In the bindings below:

That's a slightly odd change, since it removes the statement that a cpus
node must exist, and "in the bindings below" is not idiomatic for DT
binding definitions.

Perhaps replace that last list with:

The ARM architecture requires the following properties in the cpus and
cpu nodes contain the properties described below.

> +- square brackets define bitfields, eg reg[7:0] value of the bitfield in
> +  the reg property contained in bits 7 down to 0

Isn't that standard enough it's not even worth mentioning? If it is,
it's certainly not something that should be mentioned in the part of the
document that describes which properties are requried.

> +	- #address-cells
> +		Usage: required

"Usage" sounds more like what it's used for. "Presence" seems better to me.

> +			# On ARM architecture versions >= 7 based 32-bit
> +			  systems this property is required and matches the

Perhaps "On 32-bit ARMv7 or later systems, this property ..."

> +			# On ARM v8 64-bit systems, where the reg property

Should there be an explicit note here re: 32-bit SW running on a 64-bit
system?

Perhaps "on ARMv8 systems running 32-bit or 64- bit software, the reg
property ..."

> +			  is made up of two cells to accomodate the 64-bit
> +			  MPDIR_EL1 register this property is required and
> +			  matches:

s/matches/must contain/

> +	- enable-method
> +		Usage: required on ARM 64-bit systems, optional on ARM 32-bit
> +		       systems
> +		Value type: <string>
> +		Definition: On ARM 64-bit systems must be "spin-table" [1].

Can that be an integer instead? with dtc+cpp support, that shouldn't
hurt the eyes too much any more.

> +	- cpu-release-addr
> +		Usage: required on ARM 64-bit systems, optional on ARM 32-bit
> +		       systems
> +		Value type: <prop-encoded-array>
> +		Definition: On ARM 64-bit systems must be a two cell
> +			    property identifying a 64-bit zero-initialised
> +			    memory location [1].

Presumably that property is required, or not, based on the value of
enable-method, not based on the ARM architecture or bit-size?

> +[1] ARM Linux kernel documentation
> +    Documentation/devicetree/bindings/arm64/booting.txt

Is referencing Linux-specific documentation from a supposedly
OS-agnostic DT binding definition a good idea?
