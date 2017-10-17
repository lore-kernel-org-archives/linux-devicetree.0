From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 5/5] of/fdt: only store the device node basename in
 full_name
Date: Tue, 17 Oct 2017 16:51:34 -0700
Message-ID: <59E69786.2030406@gmail.com>
References: <20170821151651.25096-1-robh@kernel.org>
 <20170821151651.25096-6-robh@kernel.org>
 <CANk1AXTLT9gB_f0GZLODpppjkxqDAp1x1RZmQ8O1i+UHckimxw@mail.gmail.com>
 <CABGGisxU2OPZz-rrWYZYgCQ0iGM9w5vL9Ob9BTHALFN8JyxeJQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CABGGisxU2OPZz-rrWYZYgCQ0iGM9w5vL9Ob9BTHALFN8JyxeJQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alan Tull <atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, David Laight <David.Laight-JxhZ9S5GRejQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 10/17/17 14:46, Rob Herring wrote:
> On Tue, Oct 17, 2017 at 4:32 PM, Alan Tull <atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>> On Mon, Aug 21, 2017 at 10:16 AM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>>
>> Hi Rob,
>>
>>> With dependencies on a statically allocated full path name converted to
>>> use %pOF format specifier, we can store just the basename of node, and
>>> the unflattening of the FDT can be simplified.
>>>
>>> This commit will affect the remaining users of full_name. After
>>> analyzing these users, the remaining cases should only change some print
>>> messages. The main users of full_name are providing a name for struct
>>> resource. The resource names shouldn't be important other than providing
>>> /proc/iomem names.
>>>
>>> We no longer distinguish between pre and post 0x10 dtb formats as either
>>> a full path or basename will work. However, less than 0x10 formats have
>>> been broken since the conversion to use libfdt (and no one has cared).
>>> The conversion of the unflattening code to be non-recursive also broke
>>> pre 0x10 formats as the populate_node function would return 0 in that
>>> case.
>>>
>>> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>> ---
>>> v2:
>>> - rebase to linux-next
>>>
>>>  drivers/of/fdt.c | 69 +++++++++-----------------------------------------------
>>>  1 file changed, 11 insertions(+), 58 deletions(-)
>>
>> I've just updated to the latest next branch and am finding problems
>> applying overlays.   Reverting this commit alleviates things.  The
>> errors I get are:
>>
>> [   88.498704] OF: overlay: Failed to apply prop @/__symbols__/clk_0
>> [   88.513447] OF: overlay: apply failed '/__symbols__'
>> [   88.518423] create_overlay: Failed to create overlay (err=-12)
> 
> Frank's series with overlay updates should fix this.

Yes, it does:

  [PATCH v3 11/12] of: overlay: remove a dependency on device node full_name

-Frank

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
