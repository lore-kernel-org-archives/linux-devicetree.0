From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: mtd concat OF question
Date: Mon, 24 Jan 2011 09:04:40 -0700
Message-ID: <20110124160440.GB16370@angua.secretlab.ca>
References: <AANLkTikuK6_=RoFkGxX8=0SciSnsivW9-NV3UDitojF_@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <AANLkTikuK6_=RoFkGxX8=0SciSnsivW9-NV3UDitojF_-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: "Stanislav O. Bezzubtsev" <stas.bezzubtsev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jan 24, 2011 at 03:37:49PM +0300, Stanislav O. Bezzubtsev wrote:
> Hello all.
> 
> 1) Is there an ability to specify in .dts an mtd_concat partition that
> consists of several parts of a same flash drive?
> For example, let there be 2MB flash drive and for some hardware limitations
> u-boot can be stored only at 1MB offset. So, can I specify an mtd device to
> own [0 -- 1MB] and [1.5MB -- 2MB]? As far as I can see (from
> the drivers/mtd/ofpart.c) there is no support for such a feature.

I don't think so, no.

> 2) If the answer on the previous question is "no". What shall be the most
> natural way to enhance the dts format? As for me it seems to be reasonable
> to allow partition regs description to consists more then of 2 values (N
> pairs). Example is below:
> 
> nor-flash@0,0 {
>     compatible = "amd,s29gl01gp", "cfi-flash";
>     bank-width = <2>;
>     reg = <0x0 0x200000>;
>     #address-cells = <1>;
>     #size-cells = <1>;

BTW, you're missing a 'ranges' property here (It appears that the
documentation is missing it too, which definitely needs to be fixed).

>     partition@100000 {
>         label = "uboot";
>         reg = <0x100000 0x80000>;
>         read-only;
>     };
> 
>     partition@0 {
>         label = "user";
>         reg = <0x000000 0x100000
>                   0x180000 0x80000>;

Yes, I think this sounds reasonable, but the devil is in the
implementation.  Write a patch adding support for this binding, and
amend the documentation, and we'll see what it looks like.

g.
