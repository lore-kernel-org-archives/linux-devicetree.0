From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH v2] dtc: create tool to diff device trees
Date: Fri, 15 Jan 2016 15:14:17 -0800
Message-ID: <56997D49.6000203@gmail.com>
References: <568EB672.6060300@gmail.com>
Reply-To: frowand.list@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <568EB672.6060300@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Grant Likely <grant.likely@linaro.org>, david@gibson.dropbear.id.au, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux Kernel list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On 1/7/2016 11:03 AM, Frank Rowand wrote:
> From: Frank Rowand <frank.rowand@sonymobile.com>
> 
> Create script to diff device trees.
> 
> The device tree can be in any of the forms recognized by the dtc compiler:
>   - source
>   - binary blob
>   - file system tree (from /proc/devicetree)
> 
> If the device tree is a source file, then it is pre-processed in the
> same way as it would be when built in the linux kernel source tree
> before diffing.
> 
> Signed-off-by: Frank Rowand <frank.rowand@sonymobile.com>
> ---
> 
> Tools to develop and debug device tree are somewhat inadequate.  This is a
> small step in improving the situation.
> 
> Rationale for and examples of using the script are provided in slides
> 1 - 78 of the elce 2015 presentation "Solving Device Tree Issues",
> which can be found at:
> 
>    http://elinux.org/images/0/04/Dt_debugging_elce_2015_151006_0421.pdf
> 
> (The script was named dtdiff instead of dtx_diff in the presentation.)
> 
> Changes in v2:
>   - Remove dt-bindings from list of includes in cpp_flags
>   - Remove arch_dtc_flags, which were generated from the arch specific
>     dts makefile
>   - Reformat to 8 character tabs
>   - compile_to_dts(): added back missing return for binary blob
> 
> 
>  scripts/dtc/dtx_diff |  343 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 343 insertions(+)

< snip >

Did v2 resolve your issues, or would you like some additional changes?

Thanks,

Frank
