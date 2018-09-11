From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH] dts: juno: Enable coresight tmc scatter gather in ETR
Date: Tue, 11 Sep 2018 16:23:36 +0100
Message-ID: <20180911152314.GA12052@e107155-lin>
References: <1536655641-26192-1-git-send-email-suzuki.poulose@arm.com>
 <20180911103509.GA770@e107155-lin>
 <CANLsYkzaHsi=V+GZaJ+hdzDODT-BRHU42fPJ1Vu-aX726E=grA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CANLsYkzaHsi=V+GZaJ+hdzDODT-BRHU42fPJ1Vu-aX726E=grA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: "Suzuki K. Poulose" <suzuki.poulose@arm.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, coresight@lists.linaro.org, Robert Walker <robert.walker@arm.com>, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, Mike Leach <mike.leach@linaro.org>, Liviu Dudau <liviu.dudau@arm.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Sudeep Holla <sudeep.holla@arm.com>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 11, 2018 at 08:47:27AM -0600, Mathieu Poirier wrote:
> On Tue, 11 Sep 2018 at 04:35, Sudeep Holla <sudeep.holla@arm.com> wrote:
> >
> > On 11/09/18 09:47, Suzuki K Poulose wrote:
> > > We do not enable scatter-gather mode in the TMC-ETR by default
> > > to prevent malfunctioning of systems where the ETR may not be
> > > properly connected to the memory subsystem to allow for simultaneous
> > > READ/WRITE transactions when used in SG mode. Instead we whitelist
> > > the platforms where we know that it is safe to use the mode.
> > >
> > > All revisions of Juno have a proper ETR connection and hence
> > > white list them.
> > >
> >
> > Applied conditionally, this conflicts with the patch Mathieu has in his
> > branch. He needs to drop that so that I can take both of them via ARM SoC.
> 
> As I communicated yesterday, I've already dropped that patch from my tree.

Thanks Mathieu, I have applied both the patches already.

--
Regards,
Sudeep
