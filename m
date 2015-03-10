From: Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] libfdt: Add fdt_path_offset_namelen()
Date: Tue, 10 Mar 2015 09:47:44 -0400
Message-ID: <54FEF600.50402@hurleysoftware.com>
References: <1425654758-2575-1-git-send-email-peter@hurleysoftware.com> <20150310001711.GB30335@voom.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150310001711.GB30335-RXTfZT5YzpxwFLYp8hBm2A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi David,

On 03/09/2015 08:17 PM, David Gibson wrote:
> On Fri, Mar 06, 2015 at 10:12:38AM -0500, Peter Hurley wrote:
>> Properties may contain path names which are not NUL-terminated.
>> For example, the 'stdout-path' property allows the form 'path:options',
>> where the ':' character terminates the path specifier.
>>
>> Allow these path names to be used in-place for path descending;
>> add fdt_path_offset_namelen(), which limits the path name to 'namelen'
>> characters.
>>
>> Reimplement fdt_path_offset() as a trivial wrapper.
>>
>> Signed-off-by: Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
> 
> I think this function is a good idea, however I would like to see a
> testcase for it.

Sure, I can do that.

I assume you mean a path name with non-NUL termination because
the fdt_path_offset() tests are already exercising the
fdt_path_offset_name() implementation.

Is there a readme somewhere regarding the test matrix (ie.,
which dts files go with which tests)?

Regards,
Peter Hurley
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
