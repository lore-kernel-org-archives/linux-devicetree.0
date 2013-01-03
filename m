From: Rob Herring <rob.herring@calxeda.com>
Subject: Re: [PATCH] dtc: fdtdump, properly handle multi-string properties
Date: Thu, 03 Jan 2013 17:34:36 -0600
Message-ID: <50E6158C.3050700@calxeda.com>
References: <1357252332-6131-1-git-send-email-panto@antoniou-consulting.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1357252332-6131-1-git-send-email-panto@antoniou-consulting.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pantelis Antoniou <panto@antoniou-consulting.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, Matt Porter <mporter@ti.com>, Russ Dill <Russ.Dill@ti.com>, Jon Loeliger <jdl@jdl.com>
List-Id: devicetree@vger.kernel.org

On 01/03/2013 04:32 PM, Pantelis Antoniou wrote:
> Device tree can store multiple strings in a single property.
> We didn't handle that case properly.
> 
> Signed-off-by: Pantelis Antoniou <panto@antoniou-consulting.com>
> ---
>  scripts/dtc/fdtdump.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)

These need to be posted against the upstream dtc sources and to the dtc
maintainer Jon Loeliger.

Rob

> 
> diff --git a/scripts/dtc/fdtdump.c b/scripts/dtc/fdtdump.c
> index 207a46d..d4fa6d7 100644
> --- a/scripts/dtc/fdtdump.c
> +++ b/scripts/dtc/fdtdump.c
> @@ -21,13 +21,23 @@ static void print_data(const char *data, int len)
>  {
>  	int i;
>  	const char *p = data;
> +	const char *s;
>  
>  	/* no data, don't print */
>  	if (len == 0)
>  		return;
>  
>  	if (util_is_printable_string(data, len)) {
> -		printf(" = \"%s\"", (const char *)data);
> +		printf(" = ");
> +
> +		s = data;
> +		do {
> +			printf("\"%s\"", s);
> +			s += strlen(s) + 1;
> +			if (s < data + len)
> +				printf(", ");
> +		} while (s < data + len);
> +
>  	} else if ((len % 4) == 0) {
>  		printf(" = <");
>  		for (i = 0; i < len; i += 4)
> 
