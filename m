From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH] of: add node name compare helper functions
Date: Tue, 4 Sep 2018 20:20:22 -0700
Message-ID: <ef6c5e8c-4a73-4035-0dc3-bda9b35fa8cc@gmail.com>
References: <20180830185216.20054-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180830185216.20054-1-robh@kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 08/30/18 11:52, Rob Herring wrote:
> In preparation to remove device_node.name pointer, add helper functions
> for node name comparisons which are a common pattern throughout the kernel.
> 
> Cc: Frank Rowand <frowand.list@gmail.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/of/base.c  | 22 ++++++++++++++++++++++
>  include/linux/of.h | 13 +++++++++++++
>  2 files changed, 35 insertions(+)
> 
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 466e3c8582f0..185bfe077d0a 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -54,6 +54,28 @@ DEFINE_MUTEX(of_mutex);
>   */
>  DEFINE_RAW_SPINLOCK(devtree_lock);
>  
> +bool of_node_name_eq(const struct device_node *np, const char *name)
> +{
> +	const char *node_name;
> +	size_t len;
> +
> +	if (!np)
> +		return false;
> +
> +	node_name = kbasename(np->full_name);
> +	len = strchrnul(node_name, '@') - node_name;
> +
> +	return (strlen(name) == len) && (strncmp(node_name, name, len) == 0);
> +}
> +
> +bool of_node_name_prefix(const struct device_node *np, const char *prefix)

        of_node_name_prefix_eq() would be more clear and consistent.

of_node_name_prefix() sounds like it would return the prefix of *np.


> +{
> +	if (!np)
> +		return false;
> +
> +	return strncmp(kbasename(np->full_name), prefix, strlen(prefix)) == 0;
> +}
> +
>  int of_n_addr_cells(struct device_node *np)
>  {
>  	u32 cells;
> diff --git a/include/linux/of.h b/include/linux/of.h
> index 4d25e4f952d9..a40f63a36afa 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -256,6 +256,9 @@ static inline unsigned long of_read_ulong(const __be32 *cell, int size)
>  #define OF_IS_DYNAMIC(x) test_bit(OF_DYNAMIC, &x->_flags)
>  #define OF_MARK_DYNAMIC(x) set_bit(OF_DYNAMIC, &x->_flags)
>  
> +extern bool of_node_name_eq(const struct device_node *np, const char *name);
> +extern bool of_node_name_prefix(const struct device_node *np, const char *prefix);
> +
>  static inline const char *of_node_full_name(const struct device_node *np)
>  {
>  	return np ? np->full_name : "<no-node>";
> @@ -561,6 +564,16 @@ static inline struct device_node *to_of_node(const struct fwnode_handle *fwnode)
>  	return NULL;
>  }
>  
> +static inline bool of_node_name_eq(const struct device_node *np, const char *name)
> +{
> +	return false;
> +}
> +
> +static inline bool of_node_name_prefix(const struct device_node *np, const char *prefix)
> +{
> +	return false;
> +}
> +
>  static inline const char* of_node_full_name(const struct device_node *np)
>  {
>  	return "<no-node>";
> 
