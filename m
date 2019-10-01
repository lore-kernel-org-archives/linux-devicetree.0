From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH 1/2] arm64: dts: juno: add GPU subsystem
Date: Tue, 1 Oct 2019 15:34:07 +0100
Message-ID: <20191001143350.GA404@bogus>
References: <88dc6386929b3dcd7a65ba8063628c62b66b330c.1569856049.git.robin.murphy@arm.com>
 <CAL_JsqKUP6qG6PVL47RQ5A5OcBhpdOA_0VL1YeYDuyVSVcRqCQ@mail.gmail.com>
 <20191001085954.GA10443@bogus>
 <2a3b2fe1-b08a-bc21-6f3b-4a595b51463c@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <2a3b2fe1-b08a-bc21-6f3b-4a595b51463c@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Robin Murphy <robin.murphy@arm.com>
Cc: Rob Herring <robh@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, devicetree@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>, dri-devel <dri-devel@lists.freedesktop.org>, Steven Price <steven.price@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 01, 2019 at 01:45:30PM +0100, Robin Murphy wrote:
> On 01/10/2019 09:59, Sudeep Holla wrote:
> > On Mon, Sep 30, 2019 at 12:46:33PM -0500, Rob Herring wrote:
> > > On Mon, Sep 30, 2019 at 10:25 AM Robin Murphy <robin.murphy@arm.com> wrote:
> > > > 
> > > > Since we now have bindings for Mali Midgard GPUs, let's use them to
> > > > describe Juno's GPU subsystem, if only because we can. Juno sports a
> > > > Mali-T624 integrated behind an MMU-400 (as a gesture towards
> > > > virtualisation), in their own dedicated power domain with DVFS
> > > > controlled by the SCP.
> > > > 
> > > > CC: Liviu Dudau <liviu.dudau@arm.com>
> > > > CC: Sudeep Holla <sudeep.holla@arm.com>
> > > > CC: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> > > > Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> > > > ---
> > > >   .../bindings/gpu/arm,mali-midgard.yaml        |  5 +++-
> > > >   arch/arm64/boot/dts/arm/juno-base.dtsi        | 27 +++++++++++++++++++
> > > >   2 files changed, 31 insertions(+), 1 deletion(-)
> > > 
> > > Reviewed-by: Rob Herring <robh@kernel.org>
> > 
> > If you plan to take it along with driver change,
> > 
> > Acked-by: Sudeep Holla <sudeep.holla@arm.com>
> > 
> > If not, please let us know. I can take it for v5.5
> 
> The driver change is debatable and not strictly necessary, so it probably
> makes more sense to take this one through the VExpress tree on its own. I
> wouldn't suggest flipping the status to "enabled" just yet, but it seems

Sure, make sense.

> worth putting the basic description in place as a jumping-off point for
> folks to hack on (e.g. it's another 'interesting' case for devfreq OPP
> stuff).

IIUC, the devfreq support in panfrost driver should work fine with SCPI
as it has clock provider for GPU DVFS.

With SCMI, we don't want to hook to clock framework, but I am yet to come
up with a sane generic way to add SCMI devfreq and integrate it with the
panfrost devfreq.

--
Regards,
Sudeep
