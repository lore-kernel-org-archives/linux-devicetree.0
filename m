From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 4/8] Add header files for new Internal Representation form.
Date: Wed, 24 Sep 2008 14:17:48 -0500
Message-ID: <48DA925C.6030604@freescale.com>
References: <1222196652-13811-1-git-send-email-jdl@jdl.com>	<1222196652-13811-2-git-send-email-jdl@jdl.com>	<1222196652-13811-3-git-send-email-jdl@jdl.com>	<1222196652-13811-4-git-send-email-jdl@jdl.com>
	<1222196652-13811-5-git-send-email-jdl@jdl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <1222196652-13811-5-git-send-email-jdl-CYoMK+44s/E@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Jon Loeliger wrote:
> +struct ir {
> +	ir_type ir_type;
> +	srcpos *ir_srcpos;
> +
> +	long long ir_literal;
> +	char *ir_lit_str;
> +	char *ir_label_name;
> +	irb_id ir_builtin_id;
> +
> +	struct ir *ir_name;
> +	struct ir *ir_label;
> +	struct ir *ir_expr1;
> +	struct ir *ir_expr2;
> +	struct ir *ir_expr3;
> +
> +	struct ir *ir_mem_reserves;
> +	struct ir *ir_statements;
> +	struct ir *ir_statements2;
> +	struct ir *ir_declarations;
> +
> +	struct ir *ir_first;
> +	struct ir *ir_last;
> +	struct ir *ir_prev;
> +	struct ir *ir_next;
> +};

Could we skip the redundant "ir_" prefix?  Structs have had their own 
namespaces for a *loooooong* time now.

> +extern struct ir *the_ir_tree;

s/the_//

> +struct irb_entry {
> +	irb_id irb_id;
> +	char *irb_name;
> +	irb_impl_func irb_implementation;
> +};

How about "struct builtin_func" or similar?  Let's not pack the 
meaningful bits of the name into an obscure acronym.

-Scott
