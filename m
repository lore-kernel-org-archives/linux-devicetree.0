From: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH v2 02/17] fdt: Add functions to access phandles,
 arrays and bools
Date: Mon, 5 Dec 2011 15:56:45 -0800
Message-ID: <CAPnjgZ34xwvRKmUGEH7FAb5sSUb5GCYz2KVZRLh8hvp06o4yyQ@mail.gmail.com>
References: <1322878300-5551-1-git-send-email-sjg@chromium.org>
	<1322878300-5551-3-git-send-email-sjg@chromium.org>
	<4EDD3EDE.4000609@nvidia.com>
	<CAPnjgZ30Bmxp4eGCgYss9GHt=SN5X5-sSHrPJpZFjVjprpa_Ag@mail.gmail.com>
	<4EDD4781.6060301@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <4EDD4781.6060301@nvidia.com>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Stephen Warren <swarren@nvidia.com>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>, Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, Tom Warren <TWarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

Hi Stephen,

On Mon, Dec 5, 2011 at 2:36 PM, Stephen Warren <swarren@nvidia.com> wrote:
> On 12/05/2011 03:07 PM, Simon Glass wrote:
>> On Mon, Dec 5, 2011 at 1:59 PM, Stephen Warren <swarren@nvidia.com> wrot=
e:
>>> On 12/02/2011 07:11 PM, Simon Glass wrote:
>>>> +int fdtdec_get_bool(const void *blob, int node, const char *prop_name)
>>>> +{
>>>> + =A0 =A0 const s32 *cell;
>>>> + =A0 =A0 int len;
>>>> +
>>>> + =A0 =A0 debug("%s: %s\n", __func__, prop_name);
>>>> + =A0 =A0 cell =3D fdt_getprop(blob, node, prop_name, &len);
>>>> + =A0 =A0 if (!cell)
>>>> + =A0 =A0 =A0 =A0 =A0 =A0 return 0;
>>>> + =A0 =A0 if (len >=3D sizeof(u32) && *cell =3D=3D 0)
>>>> + =A0 =A0 =A0 =A0 =A0 =A0 return 0;
>>>> +
>>>> + =A0 =A0 return 1;
>>>> +}
>>>
>>> I'm still slightly worried that this implementation may interpret the
>>> FDT differently to the kernel. At least the code I've written for
>>> boolean properties /only/ looks at the presence of the property, and
>>> never at the contents even if there is one.
>>>
>>> That said, the ePAPR specification does only say that boolean properties
>>> /might/ have an empty value, thus implying that a non-zero length is
>>> permissible. so, perhaps this is fine.
>>
>> OK
>>
>>>
>>> Actually no, I'm more than worried now I think it through. You'd argued
>>> for being able to write 0/1 to the property so that U-Boot could modify
>>> the value in-place without having to add/remove nodes to/from the FDT
>>> image, but rather just change their content. However, if this modified
>>> FDT is then passed to the kernel (rather than some other fresh FDT),
>>> then it's imperative that U-Boot and the kernel represent boolean
>>> properties in the exact same way. Hence, we either can't have U-Boot use
>>> this edit-in-place optimization, or U-Boot needs some "cleanup" of the
>>> FDT image before passing it to the kernel. However, the latter is
>>> impossible, since by then since the boot-the-kernel code has no idea
>>> whether a property is a boolean or not, and hence implementing such a
>>> cleanup is impossible.
>>
>> Hang on - this fdt cannot be passed to the kernel! It is for U-Boot's
>> use, for it's own configuration. There is no mechanism to fix up
>> U-Boot's internal fdt and pass it to the kernel. U-Boot scripts can't
>> even find its address!
>>
>> That side of U-Boot is a complete different use of fdt and I have been
>> careful (so far) to keep them apart.
>
> Yes, that's certainly the way it is right now.
>
> I'd heard some discussion on changing that, and allowing U-Boot to pass
> its internal configuration FDT to the kernel instead of loading it from
> disk a second time. However, it looks like that discussion was purely
> internal to NVIDIA and might have been motivated by some confusion
> rather than actual intent.
>
> As such, my comments about fixing stuff up to pass to the kernel don't
> apply.

OK

>
> Still, I think we should be able pass the same FDT to U-Boot and the
> kernel, and as such they should both interpret boolean properties in the
> same way. This patch doesn't do that.

OK, I will change it, and start a separate thread on
devicetree-discuss about fdtget/put.

Regards,
Simon

>
> --
> nvpublic
