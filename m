From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2] vsprintf: Add %p extension "%pOF" for device tree
Date: Thu, 22 Jun 2017 15:44:10 -0700
Message-ID: <d22444aa-39da-ec74-42a1-63f1fa40c7d3@infradead.org>
References: <20170614203025.7581-4-robh@kernel.org>
 <20170622204445.14930-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170622204445.14930-1-robh@kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Grant Likely <glikely@secretlab.ca>, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Joe Perches <joe@perches.com>
Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 06/22/2017 01:44 PM, Rob Herring wrote:
> From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
> 
> 90% of the usage of device node's full_name is printing it out in a
> kernel message. However, storing the full path for every node is
> wasteful and redundant. With a custom format specifier, we can generate
> the full path at run-time and eventually remove the full path from every
> node.
> 
> For instance typical use is:
> 	pr_info("Frobbing node %s\n", node->full_name);
> 
> Which can be written now as:
> 	pr_info("Frobbing node %pOF\n", node);


isn't OF for flags -- and Of for full name?
Typo or a change in the last 2 years?

> More fine-grained control of formatting includes printing the name,
> flags, path-spec name and others, explained in the documentation entry.
> 
> Originally written by Pantelis, but pretty much rewrote the core
> function using existing string/number functions. The 2 passes were
> unnecessary and have been removed. Also, updated the checkpatch.pl
> check. The unittest code was written by Grant Likely.
> 
> Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> I missed some comments and changes Grant had done and incorporated them.
> 
> v2:
> - Change subject
> - Rewrite device_node_gen_full_name() to avoid recursion.
> - Avoid using sprintf.
> - Add unittests Grant L. wrote. 
> - Drop ref count printing (from discussion 2 years ago).
> - Remove fmtp local var.
> 
> 
>  Documentation/printk-formats.txt             |  30 ++++++
>  drivers/of/unittest-data/tests-platform.dtsi |   4 +-
>  drivers/of/unittest.c                        |  58 +++++++++++
>  lib/vsprintf.c                               | 140 +++++++++++++++++++++++++++
>  scripts/checkpatch.pl                        |   2 +-
>  5 files changed, 232 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/printk-formats.txt b/Documentation/printk-formats.txt
> index 5962949944fd..c7af38188f12 100644
> --- a/Documentation/printk-formats.txt
> +++ b/Documentation/printk-formats.txt
> @@ -275,6 +275,36 @@ struct va_format:
>  
>  	Passed by reference.
>  
> +Device tree nodes:
> +
> +	%pOn[fnpPcCF]
> +
> +	For printing device tree nodes. The optional arguments are:
> +	    f device node full_name
> +	    n device node name
> +	    p device node phandle
> +	    P device node path spec (name + @unit)
> +	    F device node flags
> +	    c major compatible string
> +	    C full compatible string
> +	Without any arguments prints full_name (same as %pOFf)
> +	The separator when using multiple arguments is ':'
> +
> +	Examples:
> +
> +	%pOn	/foo/bar@0			- Node full name
> +	%pOnf	/foo/bar@0			- Same as above
> +	%pOnfp	/foo/bar@0:10			- Node full name + phandle
> +	%pOnfcF	/foo/bar@0:foo,device:--P-	- Node full name +
> +	                                          major compatible string +
> +						  node flags
> +							D - dynamic
> +							d - detached
> +							P - Populated
> +							B - Populated bus
> +
> +	Passed by reference.
> +
>  struct clk:
>  
>  	%pC	pll1

-- 
~Randy
