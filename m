From: Carlo Caione <ccaione@baylibre.com>
Subject: Re: [PATCH v2 2/4] nvmem: meson-efuse: bindings: Add secure-monitor
 phandle
Date: Thu, 22 Aug 2019 09:36:33 +0100
Message-ID: <7c5307fe-2762-eefd-5c65-4ff7c4bd2f5d@baylibre.com>
References: <20190731082339.20163-1-ccaione@baylibre.com>
 <20190731082339.20163-3-ccaione@baylibre.com> <20190821181458.GA2886@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190821181458.GA2886@bogus>
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
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, narmstrong@baylibre.com, khilman@baylibre.com, srinivas.kandagatla@linaro.org, linux-amlogic@lists.infradead.org, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
List-Id: devicetree@vger.kernel.org

On 21/08/2019 19:14, Rob Herring wrote:
> On Wed, Jul 31, 2019 at 09:23:37AM +0100, Carlo Caione wrote:

> There's no need for 'secure-monitor' anyways. Just do
> 'of_find_compatible_node(NULL, NULL, "amlogic,meson-gxbb-sm")' or search
> for the driver directly. It's not like there's more than one secure
> monitor...

How is hardcoding the secure-monitor directly into the efuse driver 
better than having it referenced in the DT?

Yes, there is one single secure monitor but (even if this is not 
currently the case) several drivers can use it making the secure-monitor 
a resource to be potentially used by several devices.

--
Carlo Caione
