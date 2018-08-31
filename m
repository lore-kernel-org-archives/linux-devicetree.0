From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 1/7] clk: rockchip: improve rk3288 pll rates for better
 hdmi output
Date: Fri, 31 Aug 2018 10:05:31 +0200
Message-ID: <4726810.oPXn6dVjrD@diego>
References: <20180828185513.13216-1-urjaman@gmail.com>
 <20180828185513.13216-2-urjaman@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180828185513.13216-2-urjaman@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Urja Rannikko <urjaman@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Am Dienstag, 28. August 2018, 20:55:07 CEST schrieb Urja Rannikko:
> Add and correct PLL rates for better hdmi output.
> 
> This includes minimizing jitter on 213 MHz for better 71 MHz,
> 250.5 MHz for better 83.5 MHz, 428 MHz for better 25.175 Mhz,
> low jitter 273 MHz for better 68.25 mhz, 356 MHz for better 118.68 Mhz
> and 300MHz.
> 
> Increase the used Fvco for 308, 324 MHz, 292.5 MHz, 273.6 MHz,
> 238 MHz and 216 MHz.
> 
> And add some additional rates allowing to reach better hdmi-related
> rates in general.
> 
> These match the rates used by ChromeOS, so have been quite widely tested.
> 
> Signed-off-by: Urja Rannikko <urjaman@gmail.com>

applied for 4.20

Thanks
Heiko
