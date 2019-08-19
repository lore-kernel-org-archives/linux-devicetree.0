From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH RESEND V2 4/7] cpufreq: imx-cpufreq-dt: Add i.MX8MN
 support
Date: Mon, 19 Aug 2019 14:07:21 +0530
Message-ID: <20190819083721.w75clbpu2vtoeocx@vireshk-i7>
References: <1566109945-11149-1-git-send-email-Anson.Huang@nxp.com>
 <1566109945-11149-4-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1566109945-11149-4-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <Anson.Huang@nxp.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, rjw@rjwysocki.net, leonard.crestez@nxp.com, abel.vesa@nxp.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

On 18-08-19, 02:32, Anson Huang wrote:
> i.MX8MN has different speed grading definition as below, it has 4 bits
> to define speed grading, add support for it.
> 
>  SPEED_GRADE[3:0]    MHz
>     0000            2300
>     0001            2200
>     0010            2100
>     0011            2000
>     0100            1900
>     0101            1800
>     0110            1700
>     0111            1600
>     1000            1500
>     1001            1400
>     1010            1300
>     1011            1200
>     1100            1100
>     1101            1000
>     1110             900
>     1111             800
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> Reviewed-by: Leonard Crestez <leonard.crestez@nxp.com>
> ---
> No changes.
> ---
>  drivers/cpufreq/imx-cpufreq-dt.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

Applied. Thanks.

-- 
viresh
