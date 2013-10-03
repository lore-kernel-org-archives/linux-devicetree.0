From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v2 4/5] cpufreq: arm_big_little_dt: enhance OPP error checking
Date: Thu, 3 Oct 2013 10:25:12 +0530
Message-ID: <CAKohpon+b1rAYj2+UDhm=abAy7a1XOc1GhLd=RkPVKP-d8fPeQ@mail.gmail.com>
References: <1380634382-15609-1-git-send-email-Sudeep.KarkadaNagesha@arm.com>
	<1380634382-15609-5-git-send-email-Sudeep.KarkadaNagesha@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <1380634382-15609-5-git-send-email-Sudeep.KarkadaNagesha@arm.com>
Sender: linux-pm-owner@vger.kernel.org
To: Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha@arm.com>
Cc: "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Rafael J. Wysocki" <rjw@sisk.pl>
List-Id: devicetree@vger.kernel.org

On 1 October 2013 19:03, Sudeep KarkadaNagesha
<Sudeep.KarkadaNagesha@arm.com> wrote:
> From: Sudeep KarkadaNagesha <sudeep.karkadanagesha@arm.com>
>
> Since the OPPs can be specified either through 'operating-points'
> as tuples or through 'operating-points-phandle' as phandle to the
> node containing tuples, we need to check for both the properties.
>
> Cc: "Rafael J. Wysocki" <rjw@sisk.pl>
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> Signed-off-by: Sudeep KarkadaNagesha <sudeep.karkadanagesha@arm.com>
> ---
>  drivers/cpufreq/arm_big_little_dt.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
