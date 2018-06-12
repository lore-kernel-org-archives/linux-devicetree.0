From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH 10/20] dts: juno: Update coresight bindings for hw port
Date: Tue, 12 Jun 2018 11:42:21 +0100
Message-ID: <20180612104221.GA26029@e107155-lin>
References: <1528235011-30691-1-git-send-email-suzuki.poulose@arm.com>
 <1528235011-30691-11-git-send-email-suzuki.poulose@arm.com>
 <20180608214946.GI30587@xps15>
 <CANLsYkxNakRGCWT6O0JRKz+N1OTU3-XreC_FiB8Fiv+jEoPEbQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CANLsYkxNakRGCWT6O0JRKz+N1OTU3-XreC_FiB8Fiv+jEoPEbQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, arm@kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Matt Sealey <matt.sealey@arm.com>, John Horley <john.horley@arm.com>, Charles Garcia-Tobin <charles.garcia-tobin@arm.com>, coresight@lists.linaro.org, devicetree@vger.kernel.org, Mike Leach <mike.leach@linaro.org>, Liviu Dudau <liviu.dudau@arm.com>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 08, 2018 at 03:52:58PM -0600, Mathieu Poirier wrote:
> On 8 June 2018 at 15:49, Mathieu Poirier <mathieu.poirier@linaro.org> wrote:
> > On Tue, Jun 05, 2018 at 10:43:21PM +0100, Suzuki K Poulose wrote:
> >> Switch to updated coresight bindings for hw ports.
> >>
> >> Cc: Sudeep Holla <sudeep.holla@arm.com>
> >> Cc: Liviu Dudau <liviu.dudau@arm.com>
> >> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> >> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> >> ---
> >> Changes since V1:
> >>   - Add support Juno for r1 & r2.
> >> ---
> >
> > Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>
> Sudeep please hold on before applying this as there is more work to be
> done on this set.
>
Sure, I plan to apply the DT changes only after the driver changes are
queued by you or whichever tree it's channelled through. I was already
told the same to Suzuki.

--
Regards,
Sudeep
