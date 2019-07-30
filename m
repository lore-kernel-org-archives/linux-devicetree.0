From: Carlo Caione <ccaione@baylibre.com>
Subject: Re: [PATCH 5/5] arm64: dts: meson: Link nvmem and secure-monitor nodes
Date: Tue, 30 Jul 2019 10:36:45 +0100
Message-ID: <8a979ed2-ee55-010a-d9f4-51a374456e55@baylibre.com>
References: <20190729183941.18164-1-ccaione@baylibre.com>
 <20190729183941.18164-6-ccaione@baylibre.com>
 <1jpnlr27w2.fsf@starbuckisacylon.baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1jpnlr27w2.fsf@starbuckisacylon.baylibre.com>
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

On 30/07/2019 10:23, Jerome Brunet wrote:
> On Mon 29 Jul 2019 at 19:39, Carlo Caione <ccaione@baylibre.com> wrote:
> 
>> The former is going to use the latter to retrieve the efuses data.
> 
> Actually, if you really want to not break bisect, this change must be
> merged before the driver change (patch 4).
> 
> I'm a bit surpised to see only the axg and g12a here ?
> Doesn't it apply to gxbb/gxl as well ?

Ah, it does indeed. Fix coming, thanks.

--
Carlo Caione
