From: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 4/5] ARM: vexpress: Initial RS1 memory map support
Date: Fri, 2 Dec 2011 20:06:19 +0100
Message-ID: <201112022006.20165.marek.vasut@gmail.com>
References: <1322579473-8804-1-git-send-email-pawel.moll@arm.com>
 <74CDBE0F657A3D45AFBB94109FB122FF174FDB01C6@HQMAIL01.nvidia.com>
 <74CDBE0F657A3D45AFBB94109FB122FF174FDB0539@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF174FDB0539-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Tixy <tixy-V7l+QrSAdiO1Qrn1Bg8BZw@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> Stephen Warren wrote at Thursday, December 01, 2011 9:20 AM:
> > Dave Martin wrote at Thursday, December 01, 2011 5:14 AM:
> > > On Thu, Dec 01, 2011 at 11:10:50AM +0000, Mark Brown wrote:
> > > > On Wed, Nov 30, 2011 at 04:38:26PM -0500, Nicolas Pitre wrote:
> > > > > On Wed, 30 Nov 2011, Mark Brown wrote:
> > > > > > Oh, dear.  Any pointers to the discussions on the u-boot side?
> > > > > 
> > > > > Certainly.  Many different threads actually.  Here's a few:
> > > > OK, thanks - I see Stephen just followed up and Wolfgang seems
> > > > moderately happy so hopefully there will be some progress.  It also
> > > > occurs to me that there's at least Qi also using uImages, hopefully
> > > > other bootloaders are going to be easier to deal with (or already
> > > > cope).
> > > 
> > > If Stephen's patches are heading for merge, that's great.
> > > 
> > > If this feature remains blocked though, could we support Wolfgang's
> > > preference for start-of-RAM-relative load and entry address?
> > 
> > It looks like my change is progressing to being checked in:
> > 
> > http://lists.denx.de/pipermail/u-boot/2011-December/111865.html
> 
> For the record, the changes are now in U-Boot master:
> 
> d510859 image: Don't detect XIP images as overlapping.
> b9b50e8 image: Implement IH_TYPE_KERNEL_NOLOAD
> 
> I should also note that Marek Vasut posted some patches to implement a
> bootz command in U-Boot. This turned out to be much less invasive than
> I originally thought, so once those patches are finalized, uImage might
> be irrelevant except for initrds (U-Boot already accepts a raw FDT
> without uImage wrapping for bootm and hence bootz).
> 
> http://www.mail-archive.com/u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org/msg69287.html

Hi guys,

I'm now cleaning up the PXA support in U-Boot and there's also a lot of 
university load. It's unlikely bootz will make it to .12, but 2012.03 seems 
real. Any help is welcome though.

M
