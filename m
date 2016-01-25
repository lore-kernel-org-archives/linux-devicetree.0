From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2] dtc: create tool to diff device trees
Date: Mon, 25 Jan 2016 08:53:28 -0600
Message-ID: <CAL_Jsq+rWikE3-QHMYvaBVpaxetmj6sahy8=qEWRgOugY5GTgw@mail.gmail.com>
References: <568EB672.6060300@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <568EB672.6060300@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>
Cc: Grant Likely <grant.likely@linaro.org>, David Gibson <david@gibson.dropbear.id.au>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux Kernel list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 7, 2016 at 1:03 PM, Frank Rowand <frowand.list@gmail.com> wrote:
> From: Frank Rowand <frank.rowand@sonymobile.com>
>
> Create script to diff device trees.
>
> The device tree can be in any of the forms recognized by the dtc compiler:
>   - source
>   - binary blob
>   - file system tree (from /proc/devicetree)
>
> If the device tree is a source file, then it is pre-processed in the
> same way as it would be when built in the linux kernel source tree
> before diffing.
>
> Signed-off-by: Frank Rowand <frank.rowand@sonymobile.com>

Applied with setting permissions to 755. Thanks.

Rob
