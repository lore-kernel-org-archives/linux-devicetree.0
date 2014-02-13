From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH] ARM: dts: imx6qdl-sabresd: Do not place regulator nodes
 under simple-bus
Date: Thu, 13 Feb 2014 09:59:59 +0800
Message-ID: <20140213015958.GC950@S2101-09.ap.freescale.net>
References: <1392165078-25794-1-git-send-email-festevam@gmail.com>
 <20140212092227.GA24834@S2101-09.ap.freescale.net>
 <20140212095450.GB21992@e106331-lin.cambridge.arm.com>
 <20140212122837.GD24834@S2101-09.ap.freescale.net>
 <20140212135736.GB25957@e106331-lin.cambridge.arm.com>
 <20140212152050.GA28749@S2101-09.ap.freescale.net>
 <CAOMZO5DMbmh56AOZjRSB062o6u6y3TrFFk507ufd_QL9nr8gSQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CAOMZO5DMbmh56AOZjRSB062o6u6y3TrFFk507ufd_QL9nr8gSQ@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Fabio Estevam <fabio.estevam@freescale.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 12, 2014 at 03:22:05PM -0200, Fabio Estevam wrote:
> On Wed, Feb 12, 2014 at 1:20 PM, Shawn Guo <shawn.guo@linaro.org> wrote:
> > On Wed, Feb 12, 2014 at 01:57:36PM +0000, Mark Rutland wrote:
> >> As it stands, the dts are buggy. I can appreciate that you don't feel
> >> this is important, but I do. It's not just an IMX issue, there is
> >> widespread misunderstanding and abuse of simple-bus.
> >>
> >> Said abuse is relying on current Linux implementation details, and that
> >> can and will create problems if and when probing code is changed.
> >
> > The reality is the code already gets no chance to change on this regard,
> > considering the requirement that we need to maintain the interface
> > between kernel and DT as ABI.  The dts have been there like this for
> > 10 kernel releases or so.
> 
> What breakage do you see with this patch?

I'm not talking about this patch.  I'm replying to Mark's comment saying
some day the kernel probing code is changed.

Shawn
