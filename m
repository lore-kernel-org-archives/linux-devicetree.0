From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v4 1/4] dt: check root nodes for match on
	of_platform_populate
Date: Fri, 10 Jun 2011 23:06:48 +0200
Message-ID: <201106102306.48426.arnd@arndb.de>
References: <1307738923-7564-1-git-send-email-robherring2@gmail.com>
	<1307738923-7564-2-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1307738923-7564-2-git-send-email-robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Friday 10 June 2011 22:48:40 Rob Herring wrote:
> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index 9b785be..dc56a77 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -318,6 +318,8 @@ int of_platform_populate(struct device_node *root,
>                 return -EINVAL;
>  
>         for_each_child_of_node(root, child) {
> +               if (!of_match_node(matches, child))
> +                       continue;
>                 rc = of_platform_bus_create(child, matches, parent, true);
>                 if (rc)
>                         break;


Why doesn't of_platform_populate just call of_platform_bus_create on the
root node? That should normally take care of matching all children.

	Arnd
