From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 1/9] of: add helper to lookup compatible child node
Date: Thu, 30 Aug 2018 10:51:09 -0500
Message-ID: <CAL_JsqLv8MBpFsictS9Ldm2y7L-v7RiSVJHFTNHSixFhzppaPA@mail.gmail.com>
References: <20180827082153.22537-1-johan@kernel.org> <20180827082153.22537-2-johan@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180827082153.22537-2-johan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 27, 2018 at 3:22 AM Johan Hovold <johan@kernel.org> wrote:
>
> Add of_get_compatible_child() helper that can be used to lookup
> compatible child nodes.
>
> Several drivers currently use of_find_compatible_node() to lookup child
> nodes while failing to notice that the of_find_ functions search the
> entire tree depth-first (from a given start node) and therefore can
> match unrelated nodes. The fact that these functions also drop a
> reference to the node they start searching from (e.g. the parent node)
> is typically also overlooked, something which can lead to use-after-free
> bugs.
>
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>  drivers/of/base.c  | 25 +++++++++++++++++++++++++
>  include/linux/of.h |  8 ++++++++
>  2 files changed, 33 insertions(+)

I've applied this one and plan to send to Linus tomorrow.

Rob
