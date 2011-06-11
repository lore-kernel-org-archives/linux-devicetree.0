From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5] drivers/amba: create devices from device tree
Date: Fri, 10 Jun 2011 20:10:50 -0500
Message-ID: <4DF2C09A.7000805@gmail.com>
References: <20110610232246.30375.44324.stgit@ponder>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110610232246.30375.44324.stgit@ponder>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rob Herring <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 06/10/2011 06:26 PM, Rob Herring wrote:
> Add a function to create amba_devices (i.e. primecell peripherals)
> from device tree nodes. The device tree scanning is done by the
> of_platform_populate() function which can call of_amba_device_create
> based on a match table entry.
>
> Nodes with a "arm,primecell-periphid" property can override the h/w
> peripheral id value.
>
> Based on the original work by Jeremy Kerr.
>
> v5: - restored Jeremy's original s-o-b line
>      - changed to using arm,primecell compatible value
>      - moved all code to driver/of/platform.c so platform and amba
>        devices are created in the same way.
> (v4 was posted by Rob Herring)
>
> Signed-off-by: Jeremy Kerr<jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
> Acked-by: Linus Walleij<linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Signed-off-by: Rob Herring<rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> Reviewed-by: Arnd Bergmann<arnd-r2nGTMty4D4@public.gmane.org>
> [grant.likely: add Jeremy's original s-o-b line, changes from review
>                 comments, and moved all code to drivers/of/platform.c]
> Signed-off-by: Grant Likely<grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> ---
>
> Hey Rob.  I took a good look at the patches you posted, and how all
> this stuff was being done, and it turns out to be a lot less impact if
> all of it is rolled into driver/of/platform.c.  Take a look and let me
> know what you think.

Looks good. I will test it out on my tree.

Rob
