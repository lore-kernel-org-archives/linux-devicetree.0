From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Flattened Device Tree
Date: Thu, 21 Jan 2010 14:22:45 -0700
Message-ID: <fa686aa41001211322o64c956dfg90b4b780722a3204@mail.gmail.com>
References: <7f9d9abf1001180924o5b587b54i737d60467e3c878@mail.gmail.com>
	<33307c791001191410r6430bb81wbfee8f9e82c5cbf9@mail.gmail.com>
	<fa686aa41001210833v7ac9c0a1gd5b40d0ff5bfdc32@mail.gmail.com>
	<fa686aa41001210838k1fff33fbndf98e9d5a99dec2c@mail.gmail.com>
	<85F0BAED-9E81-4C1D-ABA4-CE4EFF8198BD@semihalf.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <85F0BAED-9E81-4C1D-ABA4-CE4EFF8198BD-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rafal Jaworowski <raj-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 21, 2010 at 1:58 PM, Rafal Jaworowski <raj-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org> wrote:
>
> On 2010-01-21, at 17:38, Grant Likely wrote:
> Hi Grant,
> I'm glad you bring this up as I was about to ask a couple of questions on=
 FDT for ARM, not actually about the boot i/f (mine are more bindings-relat=
ed), but we can discuss that separately.
>
>> I'm also working on adding Linux FDT support to the ARM architecture,
>> and I think we need to coordinate. =A0Specifically, I'd like to agree on
>> a common boot interface for FDT booting on ARM (and PowerPC for that
>> matter).
>>
>> For PowerPC, I assume you're adopting the boot interface specified in
>> ePAPR and are using r3 to pass the FDT blob pointer (page 53 of
>> ePAPR). =A0Correct?
>>
>> What are you using for the ARM boot interface? =A0For the experiments
>> performed to date, the dtb is getting passed to the kernel in a new
>> ATAG, but I thing ATAGs are Linux specific. =A0Ideally, I'd like to have
>
> We are a bit different. For both ARM and PowerPC platforms we're initiall=
y bringing FDT for, we have full FreeBSD booting environment which means us=
ing the native loader(8) -- it is the last stage boot loader running on top=
 of BIOS/U-Boot/whatever. loader(8) from end-user perspective has uniform t=
ouch and feel accross various architectures FreeBSD supports, and it's main=
 goal is loading kernel, preparing environment for it, setting flags, loadi=
ng dynamic modules (yes, before kernel is run) and so on. All these supplem=
entary items for the kernel are called metadata, and the kernel is provided=
 with the metadata pointer when executed. Now, for FDT-oriented platforms, =
in the presence of loader(8) the DT blob is just part of our metadata. You =
can see a couple of use examples here: http://wiki.freebsd.org/FlattenedDev=
iceTree/loader

It sounds like the loader-->freebsd interface is pretty much
effectively a freebsd internal thing.  Is loader ever expected to boot
anything outside of FreeBSD?  This says to me that the interesting bit
as far as boot interface is the method that a dtb gets handed from
firmware to the loader.  How the loader interacts with the FreeBSD
kernel has little bearing.

> However, there are many embedded platforms, where loader(8) cannot be run=
 or is undesired. For these we'll need to have a way to embed the DTB someh=
ow with the kernel, although this is rather the problem of a wrapper techni=
que much like there's a couple of approaches in Linux right now.

Even in this case I could still see it being useful to have a
standardized method for firmware to pass a dtb blob to the kernel or
the kernel wrapper.

>> exactly one method of passing the dtb to the kernel, and I don't see
>> any good reason for Linux, FreeBSD, or any other OS to use different
>> methods. =A0However, I also don't want to break booting older operating
>> system images that don't support FDT. =A0The ATAG approach is nice for
>> Linux because it just adds an additional data item in a backwards
>> compatible way.
>>
>> Thoughts?
>
>
> As you can observe, we could mostly get away from these kind of questions=
 so far :-) In general I'm all for having a unified convention for ARM FDT,=
 but am not familiar with ATAG too closely, so I need to dig into it first.

ATAGs are a simple list of data values passed to the kernel via r2.  see he=
re:

http://www.arm.linux.org.uk/developer/booting

ATAGs were designed well before the fdt, and the fdt certainly
supersedes them in terms of functionality, but they have the advantage
of being trivial to implement and already widely in use.

g.

-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
