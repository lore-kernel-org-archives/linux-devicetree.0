From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 0/2] of: phandle_cache, fix refcounts, remove stale entry
Date: Tue, 18 Dec 2018 09:43:07 -0600
Message-ID: <CAL_JsqKZ=g16jZ_SZX2qi-ecE-hvQ+-UfUw40=+ztiM-Zpsq9A@mail.gmail.com>
References: <1545033396-24485-1-git-send-email-frowand.list@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1545033396-24485-1-git-send-email-frowand.list@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>
Cc: mwb@linux.vnet.ibm.com, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Michael Ellerman <mpe@ellerman.id.au>, Tyrel Datwyler <tyreld@linux.vnet.ibm.com>, tlfalcon@linux.vnet.ibm.com, minkim@us.ibm.com, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 17, 2018 at 1:56 AM <frowand.list@gmail.com> wrote:
>
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
> Changes since v1:
>   - make __of_free_phandle_cache() static
>   - add WARN_ON(1) for unexpected condition in of_find_node_by_phandle()
>
> Frank Rowand (2):
>   of: of_node_get()/of_node_put() nodes held in phandle cache
>   of: __of_detach_node() - remove node from phandle cache

I'll send this to Linus this week if I get a tested by. Otherwise, it
will go in for 4.21.

Rob
