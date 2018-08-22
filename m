From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 0/9] of: fix compatible-child-node lookups
Date: Wed, 22 Aug 2018 16:46:55 +0200
Message-ID: <20180822144655.GO14967@localhost>
References: <20180822105547.9634-1-johan@kernel.org>
 <CABGGisx6CDoDqxTo=q=jKBAb19Xx38N6pR=XrwzBHuSDtp_Wcw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CABGGisx6CDoDqxTo=q=jKBAb19Xx38N6pR=XrwzBHuSDtp_Wcw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Johan <johan@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ck.hu@mediatek.com, p.zabel@pengutronix.de, Rob Clark <robdclark@gmail.com>, airlied@linux.ie, Ulf Hansson <ulf.hansson@linaro.org>, rainyfeeling@outlook.com, boris.brezillon@bootlin.com, opendmb@gmail.com, Florian Fainelli <f.fainelli@gmail.com>, davem@davemloft.net, peppe.cavallaro@st.com, alexandre.torgue@st.com, joabreu@synopsys.com, sameo@linux.intel.com, sre@kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 22, 2018 at 09:32:11AM -0500, Rob Herring wrote:
> On Wed, Aug 22, 2018 at 5:57 AM Johan Hovold <johan@kernel.org> wrote:
> >
> > Several drivers currently use of_find_compatible_node() to lookup child
> > nodes while failing to notice that the of_find_ functions search the
> > entire tree depth-first and therefore can match unrelated (non-child)
> > nodes.
> 
> That is not quite right. It searches all nodes following 'from', so
> not the entire tree unless 'from' is NULL. The purpose of 'from' is to
> iterate to find all compatible nodes. But you are correct that anyone
> calling of_find_compatible_node directly with from != NULL is wrong.

Yeah, sorry, I guess I could have been more specific. I just find
qualifying "searching the entire tree" with "starting from the node
specified in the first argument" to be too cumbersome to write. And it's
sort of implicit as the functions *are* iterators meant for searching
the entire tree (passing NULL as the first argument the first time).

> > This is related to the fixes I posted about a year ago, which addressed
> > a similar anti-pattern when looking up child nodes by name. Since it
> > took me more than a year to get all those fixes into Linus' tree (one
> > fix is still pending), and as these fixes depend on the new helper, I'm
> > suggesting that these all go in through Rob's or Greg's trees.
> 
> I'm happy to take them or apply the dependency now and then anything
> not picked up by sub-maintainers for 4.20.

Thanks, let's see if what the others prefer.

Johan
