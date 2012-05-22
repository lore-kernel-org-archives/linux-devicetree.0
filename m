From: Dirk Brandewie <dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: bootloader support for DTB on x86
Date: Tue, 22 May 2012 09:17:33 -0700
Message-ID: <4FBBBC1D.9080307@gmail.com>
References: <20120522125622.GA21187@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120522125622.GA21187-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 05/22/2012 05:56 AM, Thierry Reding wrote:
> Hi,
>
> I was looking at booting an x86-based platform using DT. However I wasn't
> able to find a bootloader that supports this. There also doesn't seem to be a
> method to append the DTB to the zImage (which I wouldn't want to use anyway).
> Does anybody know of a bootloader that supports this?

>
> I'm currently using syslinux (specifically extlinux) and was looking at
> perhaps adding the support myself based on the information given in
> Documentation/x86/boot.txt. However I'm not overly familiar with syslinux
> code and this could prove more difficult than I anticipate.
>
> The only x86 platforms that use DT seem to be OLPC and CE4100 and according
> to the web the OLPC has a complete OF implementation. Does anyone know which
> bootloader the CE4100 uses?

The falcon falls CE4100 based board we used to do the DT support uses redboot
The code is available at git://gitorious.org/driver-work/redboot.git

I never got to the point where the bootloader was loading the FDT from storage.
I linked the FDT blobs(s) into the kernel and used a kernel command line option 
to specify the compat string for the blob the kernel should use.

You can see a snapshot of what I was using at:
https://gitorious.org/driver-work/linux/commits/base-ce4100.public

The command line parameter stuff did not get merged linking the DTB(s)
into the kernel did
aab9433 of: Add support for linking device tree blobs into vmlinux


>
> Thierry
>
>
>
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
