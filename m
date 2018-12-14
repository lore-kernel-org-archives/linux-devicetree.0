From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH 1/2] of: of_node_get()/of_node_put() nodes held in phandle
 cache
Date: Fri, 14 Dec 2018 14:47:50 -0800
Message-ID: <35cab334-0856-44e1-b18e-22668011b429@gmail.com>
References: <1544769771-5468-1-git-send-email-frowand.list@gmail.com>
 <1544769771-5468-2-git-send-email-frowand.list@gmail.com>
 <CAL_JsqKn8RpRmk7OQB9nEM6nZMfdyjgomqMqLU=u+q2qUzQQCg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqKn8RpRmk7OQB9nEM6nZMfdyjgomqMqLU=u+q2qUzQQCg@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: mwb@linux.vnet.ibm.com, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Michael Ellerman <mpe@ellerman.id.au>, Tyrel Datwyler <tyreld@linux.vnet.ibm.com>, tlfalcon@linux.vnet.ibm.com, minkim@us.ibm.com, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

On 12/14/18 9:15 AM, Rob Herring wrote:
> On Fri, Dec 14, 2018 at 12:43 AM <frowand.list@gmail.com> wrote:
>>
>> From: Frank Rowand <frank.rowand@sony.com>
>>
>> The phandle cache contains struct device_node pointers.  The refcount
>> of the pointers was not incremented while in the cache, allowing use
>> after free error after kfree() of the node.  Add the proper increment
>> and decrement of the use count.
> 
> Since we pre-populate the cache at boot, all the nodes will have a ref
> count and will never be freed unless we happen to repopulate the whole
> cache. That doesn't seem ideal. The node pointer is not "in use" just
> because it is in the cache.
> 
> Rob
> 

This patch also adds of_node_put() so that the refcount will go to zero
when the node is removed as part of an overlay remove, if the node was
added by an overlay.

Patch 2/2 adds the free cache entry call to __of_detach_node(), so the
refcount will go to zero when the node is removed for dynamic use cases
other than overlays.  (For overlays, all nodes are instead removed from
the cache before __of_detach_node() is called.)

-Frank
