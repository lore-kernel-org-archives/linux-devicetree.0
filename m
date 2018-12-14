From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/2] of: of_node_get()/of_node_put() nodes held in phandle cache
Date: Fri, 14 Dec 2018 11:15:36 -0600
Message-ID: <CAL_JsqKn8RpRmk7OQB9nEM6nZMfdyjgomqMqLU=u+q2qUzQQCg@mail.gmail.com>
References: <1544769771-5468-1-git-send-email-frowand.list@gmail.com> <1544769771-5468-2-git-send-email-frowand.list@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544769771-5468-2-git-send-email-frowand.list@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>
Cc: mwb@linux.vnet.ibm.com, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Michael Ellerman <mpe@ellerman.id.au>, Tyrel Datwyler <tyreld@linux.vnet.ibm.com>, tlfalcon@linux.vnet.ibm.com, minkim@us.ibm.com, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 14, 2018 at 12:43 AM <frowand.list@gmail.com> wrote:
>
> From: Frank Rowand <frank.rowand@sony.com>
>
> The phandle cache contains struct device_node pointers.  The refcount
> of the pointers was not incremented while in the cache, allowing use
> after free error after kfree() of the node.  Add the proper increment
> and decrement of the use count.

Since we pre-populate the cache at boot, all the nodes will have a ref
count and will never be freed unless we happen to repopulate the whole
cache. That doesn't seem ideal. The node pointer is not "in use" just
because it is in the cache.

Rob
