From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 11/13] arm64: dts: qcom: qcs404: Add CPR and populate OPP
 table
Date: Tue, 23 Jul 2019 07:26:35 +0530
Message-ID: <20190723015635.rl5a2isjnjn23fzh@vireshk-i7>
References: <20190705095726.21433-1-niklas.cassel@linaro.org>
 <20190705095726.21433-12-niklas.cassel@linaro.org>
 <20190710090303.tb5ue3wq6r7ofyev@vireshk-i7>
 <20190715132405.GA5040@centauri>
 <20190716103436.az5rdk6f3yoa3apz@vireshk-i7>
 <20190716105318.GA26592@centauri>
 <20190717044923.ccmebeewbinlslkm@vireshk-i7>
 <20190719154558.GA32518@centauri>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190719154558.GA32518@centauri>
Sender: linux-kernel-owner@vger.kernel.org
To: Niklas Cassel <niklas.cassel@linaro.org>
Cc: Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org, jorge.ramirez-ortiz@linaro.org, sboyd@kernel.org, vireshk@kernel.org, bjorn.andersson@linaro.org, ulf.hansson@linaro.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 19-07-19, 17:45, Niklas Cassel wrote:
> Hello Viresh,
> 
> Could you please have a look at the last two patches here:
> https://git.linaro.org/people/niklas.cassel/kernel.git/log/?h=cpr-opp-hz

There is no sane way of providing review comments with a link to the
git tree :)

I still had a look and I see that you don't search for max frequency
but just any OPP that has required-opps set to the level u want. Also,
can't there be multiple phandles in required-opps in your case ?

> If you like my proposal then I could send out the first patch (the one to
> OPP core) as a real patch (with an improved commit message), and
> incorporate the second patch into my CPR patch series when I send out a V2.

Send them both in your series only, otherwise the first one is useless
anyway.

-- 
viresh
