From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 02/14] fdt: Add functions to access phandles, arrays and
 bools
Date: Mon, 28 Nov 2011 11:41:32 -0700
Message-ID: <4ED3D5DC.10502@nvidia.com>
References: <1322106896-23054-2-git-send-email-sjg@chromium.org>
 <1322106896-23054-3-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1322106896-23054-3-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Albert ARIBAUD <albert.u.boot-LhW3hqR2+23R7s880joybQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/23/2011 08:54 PM, Simon Glass wrote:
> Add a function to lookup a property which is a phandle in a node, and
> another to read a fixed-length integer array from an fdt property.
> Also add a function to read boolean properties.
> 
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Looking at the U-Boot custodians web page, you need to send the core DT
changes (well, probably anything DT related) to Jerry Van Baren.

> +/**
> + * Look up a property in a node and return its contents in an integer
> + * array of given length. The property must have at least enough data for
> + * the array (4*count bytes). It may have more, but this will be ignored.
> + *
> + * @param blob		FDT blob
> + * @param node		node to examine
> + * @param prop_name	name of property to find
> + * @param array		array to fill with data
> + * @param count		number of array elements
> + * @return 0 if ok, or -FDT_ERR_NOTFOUND if the property is not found,
> + *		or -FDT_ERR_BADLAYOUT if not enough data
> + */
> +int fdtdec_get_int_array(const void *blob, int node, const char *prop_name,
> +		int *array, int count);

The kernel's equivalent of this function retrieves an array of U32s. Is
one version more correct than the other?

> +/**
> + * Look up a boolean property in a node and return it.
> + *
> + * A boolean properly is true if present in the device tree and false if not
> + * present, or present with a 0 value.
> + *
> + * @param blob	FDT blob
> + * @param node	node to examine
> + * @param prop_name	name of property to find
> + * @return 1 if the properly is present; 0 if it isn't present or is 0
> + */
> +int fdtdec_get_bool(const void *blob, int node, const char *prop_name);

Does U-Boot allow use of the "bool" type here?


> +/**
> + * Look up a property in a node and check that it has a minimum length.
> + *
> + * @param blob		FDT blob
> + * @param node		node to examine
> + * @param prop_name	name of property to find
> + * @param min_len	minimum property length in bytes
> + * @param err		0 if ok, or -FDT_ERR_NOTFOUND if the property is not
> +			found, or -FDT_ERR_BADLAYOUT if not enough data
> + * @return pointer to cell, which is only valid if err == 0
> + */
> +static const void *get_prop_len(const void *blob, int node,
> +		const char *prop_name, int min_len, int *err)

Based on the function name, I'd expect it to return the length of the
property; perhaps get_prop_check_min_len?

> +/**
> + * Look up a boolean property in a node and return it.
> + *
> + * A boolean properly is true if present in the device tree and false if not
> + * present, or present with a 0 value.
> + *
> + * @param blob	FDT blob
> + * @param node	node to examine
> + * @param prop_name	name of property to find
> + * @return 1 if the properly is present; 0 if it isn't present or is 0
> + */
> +int fdtdec_get_bool(const void *blob, int node, const char *prop_name)
> +{
> +	const s32 *cell;
> +	int len;
> +
> +	debug("%s: %s\n", __func__, prop_name);
> +	cell = fdt_getprop(blob, node, prop_name, &len);
> +	if (!cell)
> +		return 0;
> +	if (len >= sizeof(u32) && *cell == 0)
> +		return 0;
> +
> +	return 1;
> +}

In the kernel, I believe that property existence is all that's usually
checked. Is that wrong? Did the definition of a boolean property's value
in the function description above come from the specification? If a
property had a length of 0/1/2/3 with a zero value, it seems very odd to
treat that as true.

-- 
nvpublic
