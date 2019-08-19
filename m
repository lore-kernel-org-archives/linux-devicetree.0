From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] arm64: dts: imx8mm: Enable cpu-idle driver
Date: Mon, 19 Aug 2019 15:25:21 +0200
Message-ID: <20190819132520.GK5999@X250>
References: <1565950383-589-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1565950383-589-1-git-send-email-Anson.Huang@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Anson Huang <Anson.Huang@nxp.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, abel.vesa@nxp.com, daniel.baluta@nxp.com, s.hauer@pengutronix.de, linux-kernel@vger.kernel.org, jun.li@nxp.com, robh+dt@kernel.org, Linux-imx@nxp.com, kernel@pengutronix.de, leonard.crestez@nxp.com, festevam@gmail.com, linux-arm-kernel@lists.infradead.org, ping.bai@nxp.com
List-Id: devicetree@vger.kernel.org

On Fri, Aug 16, 2019 at 06:13:03AM -0400, Anson Huang wrote:
> Enable i.MX8MM cpu-idle using generic ARM cpu-idle driver, 2 states
> are supported, details as below:
> 
> root@imx8mmevk:~# cat /sys/devices/system/cpu/cpu0/cpuidle/state0/name
> WFI
> root@imx8mmevk:~# cat /sys/devices/system/cpu/cpu0/cpuidle/state0/usage
> 3973
> root@imx8mmevk:~# cat /sys/devices/system/cpu/cpu0/cpuidle/state1/name
> cpu-pd-wait
> root@imx8mmevk:~# cat /sys/devices/system/cpu/cpu0/cpuidle/state1/usage
> 6647
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>

Applied, thanks.
