From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH] ARM: dts: stm32: Enable high resolution timer
Date: Fri, 27 Sep 2019 13:59:12 +0100
Message-ID: <20190927125912.GB8704@bogus>
References: <20190927084819.645-1-benjamin.gaignard@st.com>
 <da48ce9633441cd0186518fa7ce1d528@www.loen.fr>
 <341949c8-7864-5d65-2797-988022724a4c@st.com>
 <ff11797da8f049b354797689754fde52@www.loen.fr>
 <69af57d1-13a9-9e35-78f2-4a0d17bdaf6d@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <69af57d1-13a9-9e35-78f2-4a0d17bdaf6d@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin GAIGNARD <benjamin.gaignard@st.com>
Cc: Marc Zyngier <maz@kernel.org>, Alexandre TORGUE <alexandre.torgue@st.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 27, 2019 at 12:44:55PM +0000, Benjamin GAIGNARD wrote:

[...]
>
> Even in low-power modes this timer is always powered and clocked so it
> is working fine.
>

Is that tested ? I see only cpu_{on,off} available on this platform with
PSCI v0.1. Did you add cpu_suspend, idle-states and then gave it a spin ?
Or do you have some other idle driver with which this is tested ?

Also I don't understand how "always-on" is linked to hrtimer. Always on
timers are just selected to be broadcast timer without sacrificing(simply
keeping) a cpu to be always active for broadcast purposes.

--
Regards,
Sudeep
