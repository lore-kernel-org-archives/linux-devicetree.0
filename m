From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 0/9] of: fix compatible-child-node lookups
Date: Wed, 22 Aug 2018 09:32:11 -0500
Message-ID: <CABGGisx6CDoDqxTo=q=jKBAb19Xx38N6pR=XrwzBHuSDtp_Wcw@mail.gmail.com>
References: <20180822105547.9634-1-johan@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180822105547.9634-1-johan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Johan <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ck.hu@mediatek.com, p.zabel@pengutronix.de, Rob Clark <robdclark@gmail.com>, airlied@linux.ie, Ulf Hansson <ulf.hansson@linaro.org>, rainyfeeling@outlook.com, boris.brezillon@bootlin.com, opendmb@gmail.com, Florian Fainelli <f.fainelli@gmail.com>, davem@davemloft.net, peppe.cavallaro@st.com, alexandre.torgue@st.com, joabreu@synopsys.com, sameo@linux.intel.com, sre@kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 22, 2018 at 5:57 AM Johan Hovold <johan@kernel.org> wrote:
>
> Several drivers currently use of_find_compatible_node() to lookup child
> nodes while failing to notice that the of_find_ functions search the
> entire tree depth-first and therefore can match unrelated (non-child)
> nodes.

That is not quite right. It searches all nodes following 'from', so
not the entire tree unless 'from' is NULL. The purpose of 'from' is to
iterate to find all compatible nodes. But you are correct that anyone
calling of_find_compatible_node directly with from != NULL is wrong.

I'd really like to make of_find_compatible_node() function as
searching all of the sub-tree as that should be what all the callers
want (unless they've open coded for_each_compatible_node). Though
maybe 2 functions to search the whole tree and just immediate children
is best.

Also, it would be good to remove the type parameter as device_type is
deprecated (mostly). It looks like most if not all callers setting
type could drop it and just match on compatible. It seems to just
serve as additional validation of the DT.

> The fact that these functions also drop a reference to the node they
> start searching from (e.g. the parent node) is typically also
> overlooked, something which can lead to use-after-free bugs (e.g. after
> probe deferrals).
>
> This series adds a new helper, similar to of_get_child_by_name(),
> that can be used to lookup compatible child nodes, and uses the new
> helper to fix child-node lookups throughout the tree.
>
> This is related to the fixes I posted about a year ago, which addressed
> a similar anti-pattern when looking up child nodes by name. Since it
> took me more than a year to get all those fixes into Linus' tree (one
> fix is still pending), and as these fixes depend on the new helper, I'm
> suggesting that these all go in through Rob's or Greg's trees.

I'm happy to take them or apply the dependency now and then anything
not picked up by sub-maintainers for 4.20.

Rob
