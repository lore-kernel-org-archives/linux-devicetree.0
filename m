From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Subject: Re: [PATCH v2] libfdt: Add fdt_next_subnode() to permit easy subnode
 iteration
Date: Sun, 28 Apr 2013 07:33:17 -0500
Message-ID: <E1UWQn7-0005yQ-Kd@jdl.com>
References: <1366914176-28684-1-git-send-email-sjg@chromium.org>
 <1366980211-30077-1-git-send-email-sjg@chromium.org>
 <20130426231345.GA20202@truffula.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <20130426231345.GA20202-W9XWwYn+TF0XU02nzanrWNbf9cGiqdzd@public.gmane.org>
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
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


> On Fri, Apr 26, 2013 at 05:43:31AM -0700, Simon Glass wrote:
> > Iterating through subnodes with libfdt is a little painful to write as we
> > need something like this:
> >
> > for (depth = 0, count = 0,
> > 	offset = fdt_next_node(fdt, parent_offset, &depth);
> >      (offset >= 0) && (depth > 0);
> >      offset = fdt_next_node(fdt, offset, &depth)) {
> > 	if (depth == 1) {
> > 		/* code body */
> > 	}
> > }
> >
> > Using fdt_next_subnode() we can instead write this, which is shorter and
> > easier to get right:
> >
> > for (offset = fdt_first_subnode(fdt, parent_offset);
> >      offset >= 0;
> >      offset = fdt_next_subnode(fdt, offset)) {
> > 	/* code body */
> > }
> >
> > Also, it doesn't require two levels of indentation for the loop body.
> >
> > Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>
> Nice!
>
> Acked-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
>
> Jon, please apply.

Applied.

Thanks,
jdl
