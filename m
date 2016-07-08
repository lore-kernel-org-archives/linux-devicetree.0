From: Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH v3] xen/arm: enable clocks used by the hypervisor
Date: Fri, 08 Jul 2016 10:00:18 -0700
Message-ID: <146799721881.73491.4744041405633385644@resonance>
References: <1467963871-31556-1-git-send-email-dirk.behme@de.bosch.com>
 <577F73B3.8090807@arm.com>
 <437b5eff-4294-3493-b1b2-0ff2c10525e3@de.bosch.com> <577F853D.405@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <577F853D.405@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Julien Grall <julien.grall@arm.com>, Dirk Behme <dirk.behme@de.bosch.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, xen-devel@lists.xenproject.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Quoting Julien Grall (2016-07-08 03:49:33)
> 
> 
> On 08/07/16 11:40, Dirk Behme wrote:
> > Hi Michael and Julien,
> >
> > On 08.07.2016 11:34, Julien Grall wrote:
> >> Hi Dirk,
> >>
> >> On 08/07/16 08:44, Dirk Behme wrote:
> >>> Xen hypervisor drivers might replace native OS drivers. The result is
> >>> that some important clocks that are enabled by the OS in the non-Xen
> >>> case are not properly enabled in the presence of Xen. The clocks
> >>> property enumerates the clocks that must be enabled by the Xen clock
> >>> consumer.
> >>>
> >>> An example is a serial driver enabled by the hypervisor. Xen must
> >>
> >> I would say "An example is the UART used by the hypervisor."
> >>
> >>> consume and enable these clocks in the OS to ensure behavior continues
> >>> after firmware configures the UART hardware and corresponding clock
> >>> harder.
> >>
> >> What do you mean by "harder"?
> >>
> >> Also, relying on DOM0 to enable the clock looks very wrong to me and you
> >> give an example which prove that. The UART will be used before hand by
> >> Xen, however it will not be possible to use it if you expect DOM0 to
> >> enable the clock (or even modify the clock frequency).
> >>
> >> The clock should be enabled either by the firmware or Xen. But not DOM0.
> >> DOM0 should not touch this clock at all.
> >>
> >> Furthermore, this property could be used for clock associated to device
> >> that will be passthrough-ed to a guest. In this case, the clock would be
> >> enabled even if the device is not in use which will result more power
> >> consumption.
> >
> >
> > I took the description directly from Michael's proposal
> >
> > http://www.spinics.net/lists/arm-kernel/msg516576.html
> >
> > Would it be possible that you two experts agree on the exact wording you
> > like to see?
> 
> I think the wording suggested by Mark in [1] represents better what we 
> would like to achieve with this property.

Mark's copy is fine by me. The main thing is to avoid talking about
"unused" clocks being disabled by the OS. If you have need clocks to be
enabled, then you simply claim them and enable them. All of the other
stuff is just noise.

Regards,
Mike

> 
> Regards,
> 
> [1] https://www.spinics.net/lists/arm-kernel/msg516158.html
> 
> -- 
> Julien Grall
