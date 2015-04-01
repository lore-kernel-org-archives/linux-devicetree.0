From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 0/7] OPP: Introduce OPP bindings V2 and supporting code
Date: Wed, 1 Apr 2015 11:52:50 +0530
Message-ID: <CAKohpokDhHo1ftcB6b4b+hO125_sqjK0NKESt79GVcWEwiq04w@mail.gmail.com>
References: <cover.1423642246.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <cover.1423642246.git.viresh.kumar@linaro.org>
Sender: linux-pm-owner@vger.kernel.org
To: Rafael Wysocki <rjw@rjwysocki.net>, Rob Herring <rob.herring@linaro.org>
Cc: Linaro Kernel Mailman List <linaro-kernel@lists.linaro.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Arnd Bergmann <arnd.bergmann@linaro.org>, Grant Likely <grant.likely@linaro.org>, "olof@lixom.net" <olof@lixom.net>, Nishanth Menon <nm@ti.com>, Sudeep Holla <Sudeep.Holla@arm.com>, Stephen Boyd <sboyd@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, santosh shilimkar <santosh.shilimkar@oracle.com>, Mike Turquette <mike.turquette@linaro.org>, Abhilash Kesavan <kesavan.abhilash@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Thomas Abraham <ta.omasab@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Lucas Stach <l.stach@pengutronix.de>, Mark Brown <broonie@kernel.org>, Viswanath Puttagunta <viswanath.puttagunta@linaro.org>
List-Id: devicetree@vger.kernel.org

On 11 February 2015 at 13:46, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> Now that I have received an verbal Ack from Rob Herring (in a personal
> conversation) about the bindings, I am showing how the code looks like with
> these new bindings.
>
> Some part is still now done:
> - Interface for adding new detailed OPPs from platform code instead of DT
> - Providing cpufreq helpers for the next OPPs
> - Providing regulator helpers for the target/min/max ranges
>
> Please provide feedback on how this looks like..

@Rafael: Its been two months now since this was posted. Can we get this
merged please? If someone finds issues later, we can go fix them ..

And this *should* not break any existing stuff as this is mostly new stuff..

--
viresh
