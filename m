From: Grant Likely <glikely@secretlab.ca>
Subject: Re: [PATCH 0/6] Shrinking DT memory usage
Date: Fri, 6 Oct 2017 14:55:27 +0100
Message-ID: <CACxGe6sVwOZLXf8Zp1zO6-+WsVYtvLRkVUL=XRizWSqrq3it2Q@mail.gmail.com>
References: <20171005194422.26224-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171005194422.26224-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Nicolas Pitre <nico@linaro.org>, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 5, 2017 at 8:44 PM, Rob Herring <robh@kernel.org> wrote:
> On kernels with a minimal config and a RAM target in the 100s of KB, DT
> is quite a hog of runtime memory usage. How much is dependent on how many
> nodes and properties in the DT which have a corresponding struct device_node
> and struct property in the kernel. Just skipping disabled nodes saves a
> lot by not creating the device_nodes in the first place[1], but there's
> more low hanging fruit by making some of the fields in struct property and
> struct device_node optional. With the changes here, the memory usage goes
> from 17KB to under 8KB on QEMU's ARM virt machine which is a relatively
> small DT.
>
> The majority of the diffstat here is just moving all the kobject/sysfs
> related code to its own file so we can avoid adding a bunch of ifdefs.
>
> There's more drastic approaches we could take such as doing the
> unflattening at build time and storing the bulk of the unflattened tree
> as const data. Grant also has some ideas on storing properties as ids
> instead. He's explained it to me, but I still don't understand it.

It was a two part idea. The first part is to start using numerical IDs
for property names instead of strings. The DTB format kind of already
does this because all the property names are stored in the string
table at the end of the dtb. The actual properties just reference an
offset into the string table. If we predefined ids for some property
names (reg, compatible, status, etc.), then we could have a variant of
the of_property_* API to find properties by numerical ID instead of by
strcmp().

The second idea is to eliminate struct property entirely and always
store a node's properties as a single DTB tagged list blob. It would
reduce the space required at the expense of processing time when
parsing the blob. The upshot is the property list could be left in a
flash-resident copy of the DTB.

Details need to be investigated, and it would be much more invasive
than what Rob has been able to do here. It may not be worth the
effort.

g.
