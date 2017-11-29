From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [RFC V7 0/2] OPP: Allow OPP table to be used for power-domains
Date: Wed, 29 Nov 2017 09:44:35 +0530
Message-ID: <20171129041435.GG11413@vireshk-i7>
References: <cover.1509453284.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cover.1509453284.git.viresh.kumar@linaro.org>
Sender: linux-pm-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>, robh+dt@kernel.org
Cc: Rafael Wysocki <rjw@rjwysocki.net>, linux-pm@vger.kernel.org, Nishanth Menon <nm@ti.com>, Vincent Guittot <vincent.guittot@linaro.org>, rnayak@codeaurora.org, sudeep.holla@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Viresh Kumar <vireshk@kernel.org>, ulf.hansson@linaro.org, Kevin Hilman <khilman@kernel.org>
List-Id: devicetree@vger.kernel.org

On 31-10-17, 18:17, Viresh Kumar wrote:
> Hi,
> 
> Now that the performance state of PM domains are supported by the kernel
> (merged in linux-next), I am trying once again to define the bindings
> which we dropped until the code is merged first.

@Rob/Stephen: Can I get Ack from you guys on this series, before I
apply them? Ulf has already reviewed these.

-- 
viresh
