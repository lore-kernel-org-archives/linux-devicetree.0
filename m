From: Rafal Jaworowski <raj-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>
Subject: Re: Flattened Device Tree
Date: Thu, 21 Jan 2010 21:58:39 +0100
Message-ID: <85F0BAED-9E81-4C1D-ABA4-CE4EFF8198BD@semihalf.com>
References: <7f9d9abf1001180924o5b587b54i737d60467e3c878@mail.gmail.com>
	<33307c791001191410r6430bb81wbfee8f9e82c5cbf9@mail.gmail.com>
	<fa686aa41001210833v7ac9c0a1gd5b40d0ff5bfdc32@mail.gmail.com>
	<fa686aa41001210838k1fff33fbndf98e9d5a99dec2c@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v1077)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <fa686aa41001210838k1fff33fbndf98e9d5a99dec2c-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On 2010-01-21, at 17:38, Grant Likely wrote:

> Oops, originally bcc'd the mailing list instead of cc'd.  resend.
> 
> ---------- Forwarded message ----------
> 
> Hey Rafal,
> 
> A friend pointed this status update out to me on the FreeBSD mailing
> list.  I'm thrilled to see that you're making progress.

Hi Grant,
I'm glad you bring this up as I was about to ask a couple of questions on FDT for ARM, not actually about the boot i/f (mine are more bindings-related), but we can discuss that separately.

> I'm also working on adding Linux FDT support to the ARM architecture,
> and I think we need to coordinate.  Specifically, I'd like to agree on
> a common boot interface for FDT booting on ARM (and PowerPC for that
> matter).
> 
> For PowerPC, I assume you're adopting the boot interface specified in
> ePAPR and are using r3 to pass the FDT blob pointer (page 53 of
> ePAPR).  Correct?
> 
> What are you using for the ARM boot interface?  For the experiments
> performed to date, the dtb is getting passed to the kernel in a new
> ATAG, but I thing ATAGs are Linux specific.  Ideally, I'd like to have

We are a bit different. For both ARM and PowerPC platforms we're initially bringing FDT for, we have full FreeBSD booting environment which means using the native loader(8) -- it is the last stage boot loader running on top of BIOS/U-Boot/whatever. loader(8) from end-user perspective has uniform touch and feel accross various architectures FreeBSD supports, and it's main goal is loading kernel, preparing environment for it, setting flags, loading dynamic modules (yes, before kernel is run) and so on. All these supplementary items for the kernel are called metadata, and the kernel is provided with the metadata pointer when executed. Now, for FDT-oriented platforms, in the presence of loader(8) the DT blob is just part of our metadata. You can see a couple of use examples here: http://wiki.f
 reebsd.org/FlattenedDeviceTree/loader

However, there are many embedded platforms, where loader(8) cannot be run or is undesired. For these we'll need to have a way to embed the DTB somehow with the kernel, although this is rather the problem of a wrapper technique much like there's a couple of approaches in Linux right now.

> exactly one method of passing the dtb to the kernel, and I don't see
> any good reason for Linux, FreeBSD, or any other OS to use different
> methods.  However, I also don't want to break booting older operating
> system images that don't support FDT.  The ATAG approach is nice for
> Linux because it just adds an additional data item in a backwards
> compatible way.
> 
> Thoughts?


As you can observe, we could mostly get away from these kind of questions so far :-) In general I'm all for having a unified convention for ARM FDT, but am not familiar with ATAG too closely, so I need to dig into it first. 

Rafal
