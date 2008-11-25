From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Subject: Re: [PATCH 1/2] libfdt: Add version.lds file
Date: Tue, 25 Nov 2008 10:50:32 -0600
Message-ID: <E1L517Q-0001Is-Fh@jdl.com>
References: <20081125142149.GB2340@yoda.jdub.homelinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-reply-to: <20081125142149.GB2340-JVa43G0qJ78RlTYtMZUE4cJ8OCA1ciLf@public.gmane.org> 
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Josh Boyer <jwboyer-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

> Add the initial symbol versioning file as groundwork for creating
> a libfdt shared library
> 
> Signed-off-by: Josh Boyer <jwboyer-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
> ---
>  libfdt/version.lds |   48 ++++++++++++++++++++++++++++++++++++++++++++++++
>  1 files changed, 48 insertions(+), 0 deletions(-)
>  create mode 100644 libfdt/version.lds
> 
> diff --git a/libfdt/version.lds b/libfdt/version.lds
> new file mode 100644
> index 0000000..7d90672
> --- /dev/null
> +++ b/libfdt/version.lds
> @@ -0,0 +1,48 @@
> +LIBFDT_1.2 {
> +	global:
> +		fdt_next_node;
> +		fdt_check_header;
> +		fdt_move;
> +		fdt_string;

Oh wow....  Any mechanism for making this a NOT hard-coded list?
Some in-source macro-doo-dad-flag-setup-section-list thing?

jdl
