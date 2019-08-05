From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v2 0/4] Rework secure-monitor driver
Date: Mon, 05 Aug 2019 14:34:15 -0700
Message-ID: <7hftmfguug.fsf@baylibre.com>
References: <20190731082339.20163-1-ccaione@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190731082339.20163-1-ccaione@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: srinivas.kandagatla@linaro.org
Cc: devicetree@vger.kernel.org, narmstrong@baylibre.com, Carlo Caione <ccaione@baylibre.com>, robh+dt@kernel.org, linux-amlogic@lists.infradead.org, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
List-Id: devicetree@vger.kernel.org

Srinivas,

Carlo Caione <ccaione@baylibre.com> writes:

> The secure-monitor driver is currently in really bad shape, not my 
> proudest piece of code (thanks Jerome for pointing that out ;). I tried 
> to rework it a bit to make it a bit more tolerable.
>
> I needed to change a bit the APIs and consequently adapt the only user 
> we have, that is the nvmem/efuses driver. To not break bisectability I 
> added one single commit to change both the drivers.

With your ack on the nvmem bindings and nvmem part of patch 4/4, I can
take the series take the rest of this series through my tree for Amlogic
SoCs.

Kevin
