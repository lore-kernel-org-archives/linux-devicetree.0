From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 4/4] firmware: meson_sm: Rework driver as a proper
 platform driver
Date: Tue, 6 Aug 2019 09:23:24 +0100
Message-ID: <0a4f48fa-0110-78b5-75d9-091849ab4691@linaro.org>
References: <20190731082339.20163-1-ccaione@baylibre.com>
 <20190731082339.20163-5-ccaione@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190731082339.20163-5-ccaione@baylibre.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Carlo Caione <ccaione@baylibre.com>, khilman@baylibre.com, narmstrong@baylibre.com, robh+dt@kernel.org, tglx@linutronix.de, jbrunet@baylibre.com, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 31/07/2019 09:23, Carlo Caione wrote:
> The secure monitor driver is currently a frankenstein driver which is
> registered as a platform driver but its functionality goes through a
> global struct accessed by the consumer drivers using exported helper
> functions.
> 
> Try to tidy up the driver moving the firmware struct into the driver
> data and make the consumer drivers referencing the secure-monitor using
> a new property in the DT.
> 
> Currently only the nvmem driver is using this API so we can fix it in
> the same commit.
> 
> Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
> ---
>   drivers/firmware/meson/meson_sm.c       | 94 +++++++++++++++++--------
>   drivers/nvmem/meson-efuse.c             | 24 ++++++-

Acked-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
