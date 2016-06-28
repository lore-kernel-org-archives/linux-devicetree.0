From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 1/6] firmware: Amlogic: Add secure monitor driver
Date: Tue, 28 Jun 2016 12:29:02 +0100
Message-ID: <20160628112901.GJ31744@leverpostej>
References: <1466339944-602-1-git-send-email-carlo@caione.org>
 <1466339944-602-2-git-send-email-carlo@caione.org>
 <20160627172805.GA30514@leverpostej>
 <20160628081057.GA3171@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20160628081057.GA3171@localhost>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Carlo Caione <carlo@caione.org>
Cc: devicetree@vger.kernel.org, narmstrong@baylibre.com, khilman@baylibre.com, bjdooks@googlemail.com, robh+dt@kernel.org, srinivas.kandagatla@linaro.org, matthias.bgg@gmail.com, linux-amlogic@lists.infradead.org, maxime.ripard@free-electrons.com, linux@endlessm.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, Jun 28, 2016 at 10:10:57AM +0200, Carlo Caione wrote:
> On 27/06/16 18:28, Mark Rutland wrote:
> > On Sun, Jun 19, 2016 at 02:38:59PM +0200, Carlo Caione wrote:
> > > +	np = of_find_matching_node_and_match(NULL, meson_sm_ids, &matched_np);
> > > +	if (!np) {
> > > +		pr_err("no matching node\n");
> > > +		return -EINVAL;
> > > +	}
> > > +
> > 
> > This is going to be pointlessly noisy on every non-amlogic board out
> > there.
> 
> ouch, right
> 
> > Please make this a platform driver, such that this is only called when a
> > node is present, avoiding some mess there.
> 
> Since Rob required this to be under /firmware (and using no "simple-bus"
> compatible to trigger the automatic creation) making it a platform
> driver just adds a lot of boilerplate code. If this doesn't mean a NACK
> on your side, I still would leave the code as is with the
> device_initcall() calling the init.

Ok. So long as this isn't noisy where the node is not present, that's
fine by me.

Thanks,
Mark.
