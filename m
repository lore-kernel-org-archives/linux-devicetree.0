From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH 0/2] of: phandle_cache, fix refcounts, remove stale entry
Date: Thu, 13 Dec 2018 22:46:32 -0800
Message-ID: <84933c5e-04b1-df82-daec-cbae1017a830@gmail.com>
References: <1544769771-5468-1-git-send-email-frowand.list@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544769771-5468-1-git-send-email-frowand.list@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, Michael Bringmann <mwb@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: Michael Ellerman <mpe@ellerman.id.au>, Tyrel Datwyler <tyreld@linux.vnet.ibm.com>, Thomas Falcon <tlfalcon@linux.vnet.ibm.com>, Juliet Kim <minkim@us.ibm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Michael Bringmann,

On 12/13/18 10:42 PM, frowand.list@gmail.com wrote:
> From: Frank Rowand <frank.rowand@sony.com>
> 
> Non-overlay dynamic devicetree node removal may leave the node in
> the phandle cache.  Subsequent calls to of_find_node_by_phandle()
> will incorrectly find the stale entry.  This bug exposed the foloowing
> phandle cache refcount bug.
> 
> The refcount of phandle_cache entries is not incremented while in
> the cache, allowing use after free error after kfree() of the
> cached entry.
> 
> Frank Rowand (2):
>   of: of_node_get()/of_node_put() nodes held in phandle cache
>   of: __of_detach_node() - remove node from phandle cache
> 
>  drivers/of/base.c       | 99 ++++++++++++++++++++++++++++++++++++-------------
>  drivers/of/dynamic.c    |  3 ++
>  drivers/of/of_private.h |  4 ++
>  3 files changed, 81 insertions(+), 25 deletions(-)
> 

Can you please test that these patches fix the problem that you
reported in:

    [PATCH v03] powerpc/mobility: Fix node detach/rename problem

Thanks,

Frank
