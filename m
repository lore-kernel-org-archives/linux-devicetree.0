From: Carlo Caione <ccaione@baylibre.com>
Subject: Re: [PATCH 1/5] nvmem: meson-efuse: Move data to a container struct
Date: Tue, 30 Jul 2019 10:29:06 +0100
Message-ID: <5b6825f9-22dc-1656-b5f8-4f785103f827@baylibre.com>
References: <20190729183941.18164-1-ccaione@baylibre.com>
 <20190729183941.18164-2-ccaione@baylibre.com>
 <1jy30f28rr.fsf@starbuckisacylon.baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1jy30f28rr.fsf@starbuckisacylon.baylibre.com>
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
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: devicetree@vger.kernel.org, narmstrong@baylibre.com, khilman@baylibre.com, robh+dt@kernel.org, srinivas.kandagatla@linaro.org, linux-amlogic@lists.infradead.org, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 30/07/2019 10:04, Jerome Brunet wrote:
> On Mon 29 Jul 2019 at 19:39, Carlo Caione <ccaione@baylibre.com> wrote:

/cut
>> +struct meson_efuse {
>> +	struct nvmem_device *nvmem;
>> +	struct nvmem_config config;
>> +	struct clk *clk;
> 
> since this driver uses devm_add_action_or_reset, I don't think you need
> to keep the clk pointer around, unless you plan to do something with it
> later on ?

Good point about the clk pointer.

> It is kind of the same the other structure members, do we need to keep
> them around ? We could just let devm deal with it ?
> 
> If you have a plan, could you share it ?

No plan. In the PATCH 4/5 I was going to add struct meson_sm_firmware to 
the bundle and to me it's a bit more elegant to have all the auxiliary 
structs together in a single container.

For the sake of keeping the diff size low I'm going to rework this in V2.

--
Carlo Caione
