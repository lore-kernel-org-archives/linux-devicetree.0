From: Will Deacon <will.deacon@arm.com>
Subject: Re: [PATCH 3/7] ARM: perf_event: Add basic support for Krait CPU PMUs
Date: Fri, 10 Jan 2014 11:01:14 +0000
Message-ID: <20140110110114.GC10455@mudshark.cambridge.arm.com>
References: <1389221984-10973-1-git-send-email-sboyd@codeaurora.org>
 <1389221984-10973-4-git-send-email-sboyd@codeaurora.org>
 <20140109110440.GC17838@mudshark.cambridge.arm.com>
 <52CEFF18.2070501@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <52CEFF18.2070501@codeaurora.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: mark.rutland@arm.com, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Ashwin Chaugule <ashwinc@codeaurora.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, Neil Leeder <nleeder@codeaurora.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 09, 2014 at 07:57:12PM +0000, Stephen Boyd wrote:
> (Adding DT reviewers)
> 
> On 01/09/14 03:04, Will Deacon wrote:
> > On Wed, Jan 08, 2014 at 10:59:40PM +0000, Stephen Boyd wrote:
> >
> >> +static int krait_pmu_init(struct arm_pmu *cpu_pmu)
> >> +{
> >> +	u32 id = read_cpuid_id() & 0xffffff00;
> >> +
> >> +	armv7pmu_init(cpu_pmu);
> >> +	cpu_pmu->name		= "ARMv7 Krait";
> >> +	/* Some early versions of Krait don't support PC write events */
> >> +	if (id == 0x511f0400 || id == 0x510f0600)
> >> +		cpu_pmu->map_event	= krait_map_event_no_branch;
> > Hmm, I'd really rather this information came via the DT. In fact, you could
> > just drop the branch event from your main map_event_function and keep things
> > simple. It depends how badly you want to advertise it in perf list :)
> >
> 
> Not every version of Krait is missing support for this event, so I'd
> like to keep it so things like perf stat show branch counts. How about I
> add a bool property to the pmu node indicating that this PMU is missing
> support for the PC write events? Something like "no-pc-write"?

Perhaps, although I think it should be qualcomm-specific, so something like
"qcom,krait-no-pc-write"? Again, I'd be glad to hear something from a DT
reviewer on this.

Will
