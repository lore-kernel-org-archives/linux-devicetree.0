From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC] OF: make of_property_for_each_u32() use parameters if OF is
 not enabled
Date: Sat, 15 Jun 2013 15:00:18 +0100
Message-ID: <20130615140018.572793E0A2E@localhost>
References: <1371137331-4652-1-git-send-email-bigeasy@linutronix.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4070006964135201188=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1371137331-4652-1-git-send-email-bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--===============4070006964135201188==
Content-Type: text/plain

On Thu, 13 Jun 2013 17:28:51 +0200, Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org> wrote:
> I am getting a few
> |warning: unused variable ‘p’ [-Wunused-variable]
> |warning: unused variable ‘prop’ [-Wunused-variable]
> 
> in the case where CONFIG_OF is not defined and the parameters are only
> used in the loop macro.
> 
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
> ---
>  include/linux/of.h |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/of.h b/include/linux/of.h
> index 1fd08ca..5a89f3f 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -507,8 +507,8 @@ static inline int of_machine_is_compatible(const char *compat)
>  
>  #define of_match_ptr(_ptr)	NULL
>  #define of_match_node(_matches, _node)	NULL
> -#define of_property_for_each_u32(np, propname, prop, p, u) \
> -	while (0)
> +#define of_property_for_each_u32(np, propname, prop, p, u)	\

Unrelated whitespace change

> +	for (prop = NULL, p = NULL; 0; prop++, p++)

The prop++ and p++ bits should be dropped. It would probably be better
to move the of_property_for_each_* macros outside the #ifdef/#else block
and have an empty definition of of_prop_next_string/of_prop_next_u32.

g.


--===============4070006964135201188==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============4070006964135201188==--
