From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH] scripts/dtc: Simplify condition in get_node_by_path
Date: Tue, 27 Aug 2019 11:46:31 -0700
Message-ID: <1b896532-006b-b729-35cc-03f5c58748ef@gmail.com>
References: <20190827145727.16791-1-efremov@linux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190827145727.16791-1-efremov@linux.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Denis Efremov <efremov@linux.com>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Denis,

On 8/27/19 7:57 AM, Denis Efremov wrote:
> The strlen && strprefixeq check in get_node_by_path is
> excessive, since strlen is checked in strprefixeq macro
> internally. Thus, 'strlen(child->name) == p-path'
> conjunct duplicates after macro expansion and could
> be removed.
> 
> Signed-off-by: Denis Efremov <efremov@linux.com>
> ---
>  scripts/dtc/livetree.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/scripts/dtc/livetree.c b/scripts/dtc/livetree.c
> index 0c039993953a..032df5878ccc 100644
> --- a/scripts/dtc/livetree.c
> +++ b/scripts/dtc/livetree.c
> @@ -526,8 +526,7 @@ struct node *get_node_by_path(struct node *tree, const char *path)
>  	p = strchr(path, '/');
>  
>  	for_each_child(tree, child) {
> -		if (p && (strlen(child->name) == p-path) &&
> -		    strprefixeq(path, p - path, child->name))
> +		if (p && strprefixeq(path, p - path, child->name))
>  			return get_node_by_path(child, p+1);
>  		else if (!p && streq(path, child->name))
>  			return child;
> 

livetree.c is maintained in the upstream dtc project.  We pull changes
from that project into the Linux kernel source tree.

Info on submitting patches is in the upstream file "Documentation/manual.txt":

   1) Sources

   Source code for the Device Tree Compiler can be found at git.kernel.org.

   The upstream repository is here:

       git://git.kernel.org/pub/scm/utils/dtc/dtc.git
       https://git.kernel.org/pub/scm/utils/dtc/dtc.git

   The gitweb interface for the upstream respository is:

       https://git.kernel.org/cgit/utils/dtc/dtc.git/

   1.1) Submitting Patches

   Patches should be sent to the maintainers:
           David Gibson <david@gibson.dropbear.id.au>
           Jon Loeliger <jdl@jdl.com>
   and CCed to <devicetree-compiler@vger.kernel.org>.
