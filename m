From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v4 2/5] drivers/of: do not add memory for unavailable nodes
Date: Tue, 11 Oct 2016 08:58:43 -0500
Message-ID: <CAL_JsqJmqaH8p2fUyZN8EdHNfshfdyUHKsaT8JN_G1AQuua_Qg@mail.gmail.com>
References: <1475778995-1420-1-git-send-email-arbab@linux.vnet.ibm.com> <1475778995-1420-3-git-send-email-arbab@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1475778995-1420-3-git-send-email-arbab@linux.vnet.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Reza Arbab <arbab@linux.vnet.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Frank Rowand <frowand.list@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Bharata B Rao <bharata@linux.vnet.ibm.com>, Nathan Fontenot <nfont@linux.vnet.ibm.com>, Stewart Smith <stewart@linux.vnet.ibm.com>, Alistair Popple <apopple@au1.ibm.com>, Balbir Singh <bsingharora@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>, Tang Chen <tangchen@cn.fujitsu.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 6, 2016 at 1:36 PM, Reza Arbab <arbab@linux.vnet.ibm.com> wrote:
> Respect the standard dt "status" property when scanning memory nodes in
> early_init_dt_scan_memory(), so that if the node is unavailable, no
> memory will be added.
>
> The use case at hand is accelerator or device memory, which may be
> unusable until post-boot initialization of the memory link. Such a node
> can be described in the dt as any other, given its status is "disabled".
> Per the device tree specification,
>
> "disabled"
>         Indicates that the device is not presently operational, but it
>         might become operational in the future (for example, something
>         is not plugged in, or switched off).
>
> Once such memory is made operational, it can then be hotplugged.
>
> Signed-off-by: Reza Arbab <arbab@linux.vnet.ibm.com>
> ---
>  drivers/of/fdt.c | 3 +++
>  1 file changed, 3 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
