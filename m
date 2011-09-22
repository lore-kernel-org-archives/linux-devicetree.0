From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 2/3] dtc: Add data_append_literal function
Date: Thu, 22 Sep 2011 12:33:28 +1000
Message-ID: <20110922023328.GF22223@yookeroo.fritz.box>
References: <1316637731-21872-1-git-send-email-robotboy@chromium.org>
	<1316637731-21872-3-git-send-email-robotboy@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1316637731-21872-3-git-send-email-robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Anton Staaf <robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 21, 2011 at 01:42:10PM -0700, Anton Staaf wrote:
> This function deals with appending literals of various sizes (8, 16
> 32, and 64 bit currently).  It handles endianess conversions and
> verifies that the given literal is not larger than the specified
> size.
> 
> Signed-off-by: Anton Staaf <robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
> Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
> Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> ---
>  data.c |   33 +++++++++++++++++++++++++++++++++
>  dtc.h  |    1 +
>  2 files changed, 34 insertions(+), 0 deletions(-)
> 
> diff --git a/data.c b/data.c
> index b5f3066..37acd6a 100644
> --- a/data.c
> +++ b/data.c
> @@ -175,6 +175,39 @@ struct data data_append_cell(struct data d, cell_t word)
>  	return data_append_data(d, &beword, sizeof(beword));
>  }
>  
> +struct data data_append_literal(struct data d, uint64_t value, int len)

I'd prefer to call this data_append_integer() since there are string
and character literals too.  Plus by the time we get to the struct
data level, it's not really relevant any more that this came from a
literal in the parser.

And perhaps call it 'bits' or 'size' rather than 'len'.  'len' to me
suggests a byte size rather than a bit size.

> +{
> +	uint8_t value_8;
> +	uint16_t be_value_16;
> +	uint32_t be_value_32;
> +	uint64_t be_value_64;

I'd remove the 'be_', it doesn't really add anything of value.  Plus
I've mostly avoided explicit references to BE (hence fdtXX_to_cpu() on
the off chance that someone one day is stupid enough to use an LE
variant of the fdt format.

> +
> +	if ((len < 64) && (value >= (1ULL << len)))
> +		die("Literal value 0x%x too large to fit in %d-bit cell\n",
> +		    value, len);

This really shouldn't be a die().  In general bad input should not
directly trigger a die() during parse - it should give an error but
continue parse as best it can and only drop out afterwards.

In this case, I think the semantics of an overflow are clear enough
that it shouldn't even be an error per se.  Just print a warning, and
mask the number down to the relevant size.


> +
> +	switch (len) {
> +	case 8:
> +		value_8 = value;
> +		return data_append_data(d, &value_8, 1);
> +
> +	case 16:
> +		be_value_16 = cpu_to_fdt16(value);
> +		return data_append_data(d, &be_value_16, 2);
> +
> +	case 32:
> +		be_value_32 = cpu_to_fdt32(value);
> +		return data_append_data(d, &be_value_32, 4);
> +
> +	case 64:
> +		be_value_64 = cpu_to_fdt64(value);
> +		return data_append_data(d, &be_value_64, 8);
> +
> +	default:
> +		die("Invalid literal size (%d)\n", len);

This on the other hand is fine to be a die(), since it's essentially
an assertion that should only be triggered by bad code elsewhere in
dtc itself, not by bad input.

> +	}
> +}
> +
>  struct data data_append_re(struct data d, const struct fdt_reserve_entry *re)
>  {
>  	struct fdt_reserve_entry bere;
> diff --git a/dtc.h b/dtc.h
> index f37c97e..50433f6 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -109,6 +109,7 @@ struct data data_insert_at_marker(struct data d, struct marker *m,
>  				  const void *p, int len);
>  struct data data_merge(struct data d1, struct data d2);
>  struct data data_append_cell(struct data d, cell_t word);
> +struct data data_append_literal(struct data d, uint64_t word, int len);
>  struct data data_append_re(struct data d, const struct fdt_reserve_entry *re);
>  struct data data_append_addr(struct data d, uint64_t addr);
>  struct data data_append_byte(struct data d, uint8_t byte);

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
