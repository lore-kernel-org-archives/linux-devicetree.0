From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH v2] dtc: create tool to diff device trees
Date: Sun, 10 Jan 2016 23:56:49 -0800
Message-ID: <56936041.2080104@gmail.com>
References: <568EB672.6060300@gmail.com> <20160111023742.GA22925@voom.redhat.com>
Reply-To: frowand.list@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160111023742.GA22925@voom.redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Rob Herring <robh+dt@kernel.org>, Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux Kernel list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 1/10/2016 6:37 PM, David Gibson wrote:
> On Thu, Jan 07, 2016 at 11:03:14AM -0800, Frank Rowand wrote:
>> From: Frank Rowand <frank.rowand@sonymobile.com>
>>
>> Create script to diff device trees.
>>
>> The device tree can be in any of the forms recognized by the dtc compiler:
>>   - source
>>   - binary blob
>>   - file system tree (from /proc/devicetree)
>>
>> If the device tree is a source file, then it is pre-processed in the
>> same way as it would be when built in the linux kernel source tree
>> before diffing.
>>
>> Signed-off-by: Frank Rowand <frank.rowand@sonymobile.com>
>> ---
>>
>> Tools to develop and debug device tree are somewhat inadequate.  This is a
>> small step in improving the situation.
>>
>> Rationale for and examples of using the script are provided in slides
>> 1 - 78 of the elce 2015 presentation "Solving Device Tree Issues",
>> which can be found at:
>>
>>    http://elinux.org/images/0/04/Dt_debugging_elce_2015_151006_0421.pdf
>>
>> (The script was named dtdiff instead of dtx_diff in the presentation.)
>>
>> Changes in v2:
>>   - Remove dt-bindings from list of includes in cpp_flags
>>   - Remove arch_dtc_flags, which were generated from the arch specific
>>     dts makefile
>>   - Reformat to 8 character tabs
>>   - compile_to_dts(): added back missing return for binary blob
>>
>>
>>  scripts/dtc/dtx_diff |  343 +++++++++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 343 insertions(+)
>>
>> Index: b/scripts/dtc/dtx_diff
> 
> I think this is probably the wrong directory to put this in.  Because
> it preprocesses in the style of the kernel, this script belongs in the
> kernel tree, not the upstream dtc tree.  However, basically everything
> else in this directory is imported directly from upstream dtc.
> 
> Putting this kernel-specific file in here will probably make updates
> to newer upstream dtc versions more complicated.

I agree with the concern (and had the same concern when I made the choice).

One thing that makes me more comfortable with the location is that the files
in the directory are updated with scripts/dtc/update-dtc-source.sh, which
explicitly lists which files it copies into the Linux tree.  But even with
that, I still admit to some discomfort with the location.

Without getting too deeply into bike shedding, does anyone have a better
location?  And keep in mind that there are several more tools coming in
the pipeline that would likely end up in the same location.

< snip >

-Frank
