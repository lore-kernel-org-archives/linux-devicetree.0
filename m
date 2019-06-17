From: Georgi Djakov <georgi.djakov@linaro.org>
Subject: Re: [PATCH v2 11/11] interconnect: Add devfreq support
Date: Mon, 17 Jun 2019 18:43:53 +0300
Message-ID: <5dc6c820-ead8-d0dc-44de-4d13f86df042@linaro.org>
References: <20190614041733.120807-1-saravanak@google.com>
 <20190614041733.120807-12-saravanak@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190614041733.120807-12-saravanak@google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Saravana Kannan <saravanak@google.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>
Cc: Rajendra Nayak <rnayak@codeaurora.org>, Jordan Crouse <jcrouse@codeaurora.org>, vincent.guittot@linaro.org, bjorn.andersson@linaro.org, amit.kucheria@linaro.org, seansw@qti.qualcomm.com, daidavid1@codeaurora.org, evgreen@chromium.org, sibis@codeaurora.org, kernel-team@android.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Saravana,

On 6/14/19 07:17, Saravana Kannan wrote:
> Add a icc_create_devfreq() and icc_remove_devfreq() to create and remove
> devfreq devices for interconnect paths. A driver can create/remove devfreq
> devices for the interconnects needed for its device by calling these APIs.
> This would allow various devfreq governors to work with interconnect paths
> and the device driver itself doesn't have to actively manage the bandwidth
> votes for the interconnects.

Thanks for the patches, but creating devfreq devices for each interconnect path
seems odd to me - at least for consumers that already use a governor. So for DDR
scaling for example, are you suggesting that we add a devfreq device from the
cpufreq driver in order to scale the interconnect between CPU<->DDR? Also if the
GPU is already using devfreq, should we add a devfreq per each interconnect
path? What would be the benefit in this case - using different governors for
bandwidth scaling maybe?

Thanks,
Georgi
