From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 02/14] fdt: Add functions to access phandles, arrays and
 bools
Date: Tue, 29 Nov 2011 16:12:05 +1100
Message-ID: <20111129051205.GI3508@truffala.fritz.box>
References: <1322106896-23054-2-git-send-email-sjg@chromium.org>
 <1322106896-23054-3-git-send-email-sjg@chromium.org>
 <4ED3D5DC.10502@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4ED3D5DC.10502-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
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
Cc: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Albert ARIBAUD <albert.u.boot-LhW3hqR2+23R7s880joybQ@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 28, 2011 at 11:41:32AM -0700, Stephen Warren wrote:
> On 11/23/2011 08:54 PM, Simon Glass wrote:
> > Add a function to lookup a property which is a phandle in a node, and
> > another to read a fixed-length integer array from an fdt property.
> > Also add a function to read boolean properties.
> > 
> > Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> 
> Looking at the U-Boot custodians web page, you need to send the core DT
> changes (well, probably anything DT related) to Jerry Van Baren.
> 
> > +/**
> > + * Look up a property in a node and return its contents in an integer
> > + * array of given length. The property must have at least enough data for
> > + * the array (4*count bytes). It may have more, but this will be ignored.
> > + *
> > + * @param blob		FDT blob
> > + * @param node		node to examine
> > + * @param prop_name	name of property to find
> > + * @param array		array to fill with data
> > + * @param count		number of array elements
> > + * @return 0 if ok, or -FDT_ERR_NOTFOUND if the property is not found,
> > + *		or -FDT_ERR_BADLAYOUT if not enough data
> > + */
> > +int fdtdec_get_int_array(const void *blob, int node, const char *prop_name,
> > +		int *array, int count);
> 
> The kernel's equivalent of this function retrieves an array of U32s. Is
> one version more correct than the other?

Using u32 is a better idea.  The property formats are all defined in
terms of fixed width elements, so using a vague width type like int to
interact with it is a bad idea.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
