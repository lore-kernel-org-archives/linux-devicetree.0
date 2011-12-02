From: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 4/5] ARM: vexpress: Initial RS1 memory map support
Date: Sat, 3 Dec 2011 00:03:19 +0100
Message-ID: <201112030003.20003.marek.vasut@gmail.com>
References: <1322579473-8804-1-git-send-email-pawel.moll@arm.com>
 <74CDBE0F657A3D45AFBB94109FB122FF174FDB0539@HQMAIL01.nvidia.com>
 <alpine.LFD.2.02.1112021739420.2357@xanadu.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <alpine.LFD.2.02.1112021739420.2357-QuJgVwGFrdf/9pzu0YdTqQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Tixy <tixy-V7l+QrSAdiO1Qrn1Bg8BZw@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> On Fri, 2 Dec 2011, Stephen Warren wrote:
> > For the record, the changes are now in U-Boot master:
> > 
> > d510859 image: Don't detect XIP images as overlapping.
> > b9b50e8 image: Implement IH_TYPE_KERNEL_NOLOAD
> 
> Yay!  Thank you Stephen for driving this to a successful resolution.
> 
> Of course, boards won't be updated to the latest u-boot right away

Though we should demand it on the new boards at least.

> , nor
> will the enhanced mkimage tool be commonly available.

Why not, just tell people to use up-to-date tools, otherwise you can't support 
them. It's really easy.

> 
> > I should also note that Marek Vasut posted some patches to implement a
> > bootz command in U-Boot. This turned out to be much less invasive than
> > I originally thought, so once those patches are finalized, uImage might
> > be irrelevant except for initrds (U-Boot already accepts a raw FDT
> > without uImage wrapping for bootm and hence bootz).
> > 
> > http://www.mail-archive.com/u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org/msg69287.html
> 
> Excellent!
> 
Nico, please see my other mail. This is really going to 2012.03 release 
earliest. 2011.12 release is definitelly missed, sorry.

> 
> Nicolas

M
