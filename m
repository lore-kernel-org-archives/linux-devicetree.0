From: Sergei Shtylyov <sshtylyov-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC PATCH v3 2/6] of: Make of_find_node_by_path() traverse
	/aliases for relative paths.
Date: Fri, 06 May 2011 14:17:13 +0400
Message-ID: <4DC3CAA9.5040203@mvista.com>
References: <1304614949-30460-1-git-send-email-ddaney@caviumnetworks.com>
	<1304614949-30460-3-git-send-email-ddaney@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1304614949-30460-3-git-send-email-ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello.

On 05-05-2011 21:02, David Daney wrote:

> Currently all paths passed to of_find_node_by_path() must begin with a
> '/', indicating a full path to the desired node.

> Augment the look-up code so that if a path does *not* begin with '/',
> the path is used as the name of an /aliases property.  The value of
> this alias is then used as the full node path to be found.

> Signed-off-by: David Daney<ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
> ---
>   drivers/of/base.c |   41 ++++++++++++++++++++++++++++++++++++++++-
>   1 files changed, 40 insertions(+), 1 deletions(-)

> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 632ebae..1a0a83e 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
[...]
> @@ -348,14 +351,50 @@ EXPORT_SYMBOL(of_get_next_child);
>   struct device_node *of_find_node_by_path(const char *path)
>   {
>   	struct device_node *np = allnodes;
> +	struct device_node *aliases = NULL;
> +	char *alias = NULL;
> +	char *new_path = NULL;
>
>   	read_lock(&devtree_lock);
> +
> +	if (path[0] != '/') {
> +		const char *ps;
> +		aliases = of_find_node_by_path("/aliases");
> +		if (!aliases)
> +			goto out;
> +
> +		ps = strchr(path, '/');
> +		if (ps) {
> +			size_t len = ps - path;
> +			alias = kmalloc(len + 1, GFP_KERNEL);
> +			strncpy(alias, path, len);
> +			alias[len] = 0;

    BTW, you could use kstrndup() (from mm/util.c) instead of the above 3 lines.

WBR, Sergei
