From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/4] of: remove *phandle properties from expanded device
 tree
Date: Tue, 18 Apr 2017 14:08:26 -0700
Message-ID: <58F6804A.3080206@gmail.com>
References: <1492228520-12450-1-git-send-email-frowand.list@gmail.com>
 <58F19A75.80500@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <58F19A75.80500-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

Please do not apply this patch series.

The more context I look at, the less this approach seems good.

I hope to have a simpler version completed quickly.

Thanks,

- Frank


On 04/14/17 20:58, Frank Rowand wrote:
> Hi Stephen,
> 
> I left you off the distribution list, sorry...
> 
> On 04/14/17 20:55, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
>> From: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
>>
>> Remove "phandle" and "linux,phandle" properties from the internal
>> device tree.  The phandle will still be in the struct device_node
>> phandle field.
>>
>> This is to resolve the issue found by Stephen Boyd [1] when he changed
>> the type of struct property.value from void * to const void *.  As
>> a result of the type change, the overlay code had compile errors
>> where the resolver updates phandle values.
>>
>>   [1] http://lkml.iu.edu/hypermail/linux/kernel/1702.1/04160.html
>>
>> Patch 1 is the phandle related changes.
>>
>> Patches 2 - 4 are minor fixups for issues that became visible
>> while implementing patch 1.
>>
>> Frank Rowand (4):
>>   of: remove *phandle properties from expanded device tree
>>   of: make __of_attach_node() static
>>   of: be consistent in form of file mode
>>   of: detect invalid phandle in overlay
>>
>>  drivers/of/base.c       | 53 +++++++++++++++++++++++++++++++++++++++++++++----
>>  drivers/of/dynamic.c    | 31 ++++++++++++++++-------------
>>  drivers/of/fdt.c        | 40 ++++++++++++++++++++++---------------
>>  drivers/of/of_private.h |  1 -
>>  drivers/of/overlay.c    |  8 +++++---
>>  drivers/of/resolver.c   | 23 +--------------------
>>  include/linux/of.h      |  1 +
>>  7 files changed, 97 insertions(+), 60 deletions(-)

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
