From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: dtc: import latest upstream dtc
Date: Mon, 01 Oct 2012 12:56:22 -0500
Message-ID: <5069D946.1060502@gmail.com>
References: <1348867559-2495-1-git-send-email-swarren@wwwdotorg.org>
 <5069C042.40209@gmail.com> <5069C11C.6040505@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <5069C11C.6040505-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
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
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Michal Marek <mmarek-AlSwsSmVLrQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/01/2012 11:13 AM, Stephen Warren wrote:
> On 10/01/2012 10:09 AM, Rob Herring wrote:
>> On 09/28/2012 04:25 PM, Stephen Warren wrote:
>>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>
>>> This updates scripts/dtc to commit 317a5d9 "dtc: zero out new label
>>> objects" from git://git.jdl.com/software/dtc.git.
>>>
>>> This adds features such as:
>>> * /bits/ syntax for cell data.
>>> * Math expressions within cell data.
>>> * The ability to delete properties or nodes.
>>> * Support for #line directives in the input file, which allows the use of
>>>   cpp on *.dts.
>>> * -i command-line option (/include/ path)
>>> * -W/-E command-line options for error/warning control.
>>> * Removal of spew to STDOUT containing the filename being compiled.
>>> * Many additions to the libfdt API.
>>>
>>> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> Seems dtc doesn't really have a maintainer. Probably makes more sense
>> for me to take this unless there are objections.
> 
> Will you also take the two kbuild patches I posted that depend on this
> (e.g. "kbuild: introduce cmd_dtc_cpp")? I'd assumed that Michal Marek
> would take this given the dependencies and that he's take a fair number
> of dtc patches recently.

No. I think whether we use the cpp preprocessor or not needs more time
to discuss and some level of agreement. So I don't think it is 3.7 material.

Rob
