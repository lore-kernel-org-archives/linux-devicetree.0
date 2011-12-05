From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 02/17] fdt: Add functions to access phandles, arrays
 and bools
Date: Mon, 05 Dec 2011 15:36:49 -0700
Message-ID: <4EDD4781.6060301@nvidia.com>
References: <1322878300-5551-1-git-send-email-sjg@chromium.org>	<1322878300-5551-3-git-send-email-sjg@chromium.org>	<4EDD3EDE.4000609@nvidia.com>
 <CAPnjgZ30Bmxp4eGCgYss9GHt=SN5X5-sSHrPJpZFjVjprpa_Ag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAPnjgZ30Bmxp4eGCgYss9GHt=SN5X5-sSHrPJpZFjVjprpa_Ag-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Albert ARIBAUD <albert.u.boot-LhW3hqR2+23R7s880joybQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 12/05/2011 03:07 PM, Simon Glass wrote:
> On Mon, Dec 5, 2011 at 1:59 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> On 12/02/2011 07:11 PM, Simon Glass wrote:
>>> +int fdtdec_get_bool(const void *blob, int node, const char *prop_name)
>>> +{
>>> +     const s32 *cell;
>>> +     int len;
>>> +
>>> +     debug("%s: %s\n", __func__, prop_name);
>>> +     cell = fdt_getprop(blob, node, prop_name, &len);
>>> +     if (!cell)
>>> +             return 0;
>>> +     if (len >= sizeof(u32) && *cell == 0)
>>> +             return 0;
>>> +
>>> +     return 1;
>>> +}
>>
>> I'm still slightly worried that this implementation may interpret the
>> FDT differently to the kernel. At least the code I've written for
>> boolean properties /only/ looks at the presence of the property, and
>> never at the contents even if there is one.
>>
>> That said, the ePAPR specification does only say that boolean properties
>> /might/ have an empty value, thus implying that a non-zero length is
>> permissible. so, perhaps this is fine.
> 
> OK
> 
>>
>> Actually no, I'm more than worried now I think it through. You'd argued
>> for being able to write 0/1 to the property so that U-Boot could modify
>> the value in-place without having to add/remove nodes to/from the FDT
>> image, but rather just change their content. However, if this modified
>> FDT is then passed to the kernel (rather than some other fresh FDT),
>> then it's imperative that U-Boot and the kernel represent boolean
>> properties in the exact same way. Hence, we either can't have U-Boot use
>> this edit-in-place optimization, or U-Boot needs some "cleanup" of the
>> FDT image before passing it to the kernel. However, the latter is
>> impossible, since by then since the boot-the-kernel code has no idea
>> whether a property is a boolean or not, and hence implementing such a
>> cleanup is impossible.
> 
> Hang on - this fdt cannot be passed to the kernel! It is for U-Boot's
> use, for it's own configuration. There is no mechanism to fix up
> U-Boot's internal fdt and pass it to the kernel. U-Boot scripts can't
> even find its address!
> 
> That side of U-Boot is a complete different use of fdt and I have been
> careful (so far) to keep them apart.

Yes, that's certainly the way it is right now.

I'd heard some discussion on changing that, and allowing U-Boot to pass
its internal configuration FDT to the kernel instead of loading it from
disk a second time. However, it looks like that discussion was purely
internal to NVIDIA and might have been motivated by some confusion
rather than actual intent.

As such, my comments about fixing stuff up to pass to the kernel don't
apply.

Still, I think we should be able pass the same FDT to U-Boot and the
kernel, and as such they should both interpret boolean properties in the
same way. This patch doesn't do that.

-- 
nvpublic
