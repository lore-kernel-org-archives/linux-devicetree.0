From: Walter Goossens <waltergoossens-CmkmPbn3yAE@public.gmane.org>
Subject: Re: Device tree flattening code not copying properties from blob
Date: Sat, 15 Jun 2013 20:59:53 +0200
Message-ID: <51BCB9A9.4040707@home.nl>
References: <8BE8E6569B96CE4AA5EDE9F8314B7FB1EEF696@corpatsmail4.corp.sensis.com>
 <CACxGe6sdsXp0g9MJ2npupQedXpnge7kp_v=BqnErf+J6oXnyeg@mail.gmail.com>
 <8BE8E6569B96CE4AA5EDE9F8314B7FB1EEF722@corpatsmail4.corp.sensis.com>
 <CACxGe6urthkotuwU2OtqEMn8WmBxU=hSmrKyffHR=Pbayo_HKg@mail.gmail.com>
 <51B8C827.7060704@home.nl> <20130615131432.287D23E0A2E@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130615131432.287D23E0A2E@localhost>
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
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, nios2-dev <nios2-dev-1eJk0qcHJCcaeqlQEoCUNoJY59XmG8rH@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 06/15/13 15:14, Grant Likely wrote:
> On Wed, 12 Jun 2013 21:12:39 +0200, Walter Goossens <waltergoossens-CmkmPbn3yAE@public.gmane.org> wrote:
>> On 06/12/13 20:23, Grant Likely wrote:
>>> On Wed, Jun 12, 2013 at 6:33 PM, Collins, Rod
>>> <Rod.Collins-eu1g02Y2shuDvotElmWtJA@public.gmane.org> wrote:
>>>> The blob is built into the zImage.initramfs.gz image which is put into
>>>> flash. The zImage.initramfs.gz is self copied from flash to RAM, then
>>>> uncompressed to the running area. I will dig into the location of the
>>>> blob in the image and report back.
>>> Thanks. If it is appended to the zImage wrapper, then things should be
>>> fine (this is the expected way to do when not passed in from the
>>> bootloader). If a *.dtb.o target has been used to embedded it into the
>>> kernel-proper (vmlinux) then you will have a problem. The *.dtb.S
>>> target puts the dtb data into the dtb.init.rodata section which gets
>>> discarded.
>>>
>>> g.
>> Hi Grant,
>>
>> you're right that's exactly what nios2 is doing...
>> I guess we could modify the section where it gets loaded but that sounds
>> to me a bit like a hack... What is the best target to look at for a
>> clean, similar solution? Arm with CONFIG_ARM_APPENDED_DTB?
> My first recommendation would be the way it is described in
> Documentation/arm/Booting and Documentation/devicetree/booting-without-of.txt,
> by which I mean passing the dtb into the kernel from the bootloader.
> This is the preferred approach on both PowerPC and ARM, but I do
> undertstand that doesn't work in all situations; such as if there is no
> bootloader.
Nios2 also supports passing a devicetree through u-boot if I'm not mistaken.
> The second choice is to attach it to the kernel image as a
> post-processing step. On ARM that is enabled by CONFIG_ARM_APPENDED_DTB
> which makes it possible to merely dd the DTB onto the end of the kernel
> image. PowerPC uses a slighly different approach where a script takes
> care of linking the DTB into the bootwrapper. See the
> arch/powerpc/boot/wrapper script for details.
dd-ing the dtb onto the end sounds nice.
> Either way, I don't think it is a good architectural decision to link
> the dtb directly into the kernel proper because doing so precludes ever
> having a single kernel image bootable on multiple platforms. On an FPGA
> platform it is particularly useful not having to rebuild the kernel
> every time the FPGA design changes.
Yes I know, it's just one of the supported ways of passing the
devicetree. It's just easier to explain to new users who might not have
much experience with linux/uboot.
Thanks for all the advice!

Walter

> g.
>
>
