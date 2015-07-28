From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v4 1/2] dt: cpufreq: st: Provide bindings for ST's
 CPUFreq implementation
Date: Tue, 28 Jul 2015 13:20:27 +0530
Message-ID: <20150728075027.GB13710@linux>
References: <1438010430-5802-1-git-send-email-lee.jones@linaro.org>
 <20150728022308.GA1229@linux>
 <20150728074104.GL21114@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150728074104.GL21114@x1>
Sender: linux-pm-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, rob.herring@linaro.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, rjw@rjwysocki.net, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, ajitpal.singh@st.com, sre@kernel.org, dbaryshkov@gmail.com
List-Id: devicetree@vger.kernel.org

Cc'ing Rob as well..

On 28-07-15, 08:41, Lee Jones wrote:
> I have two issues with that.  Firstly, although the driver uses the
> OPP API (it also uses the Regulator and Clock API too), it is
> fundamentally a CPUFreq driver, so I think it should have a CPUFreq
> DT entry.  Secondly, if someone doesn't know the history of the
> ST CPUFreq set, they will look here for an accompanying document.  I
> personally wouldn't think to look in power/*opp* for a CPUFreq
> binding.
> 
> Perhaps, as all of the CPUFreq drivers use the OPP API, everything
> should be moved to drivers/base/power or drivers/power?

Okay, looks fine :)

-- 
viresh
