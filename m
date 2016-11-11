From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH v5 03/23] usb: ulpi: Support device discovery via DT
Date: Fri, 11 Nov 2016 13:02:48 +0200
Message-ID: <20161111110248.GA22706@kuha.fi.intel.com>
References: <20161018015636.11701-1-stephen.boyd@linaro.org>
 <20161018015636.11701-4-stephen.boyd@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161018015636.11701-4-stephen.boyd@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <stephen.boyd@linaro.org>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Andy Gross <andy.gross@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Neil Armstrong <narmstrong@baylibre.com>, Arnd Bergmann <arnd@arndb.de>, Felipe Balbi <balbi@kernel.org>, Peter Chen <peter.chen@nxp.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 17, 2016 at 06:56:16PM -0700, Stephen Boyd wrote:
> The qcom HSIC ULPI phy doesn't have any bits set in the vendor or
> product ID registers. This makes it impossible to make a ULPI
> driver match against the ID registers. Add support to discover
> the ULPI phys via DT help alleviate this problem. In the DT case,
> we'll look for a ULPI bus node underneath the device registering
> the ULPI viewport (or the parent of that device to support
> chipidea's device layout) and then match up the phy node
> underneath that with the ULPI device that's created.
> 
> The side benefit of this is that we can use standard properties
> in the phy node like clks, regulators, gpios, etc. because we
> don't have firmware like ACPI to turn these things on for us. And
> we can use the DT phy binding to point our phy consumer to the
> phy provider.
> 
> The ULPI bus code supports native enumeration by reading the
> vendor ID and product ID registers at device creation time, but
> we can't be certain that those register reads will succeed if the
> phy is not powered up. To avoid any problems with reading the ID
> registers before the phy is powered we fallback to DT matching
> when the ID reads fail.
> 
> If the ULPI spec had some generic power sequencing for these
> registers we could put that into the ULPI bus layer and power up
> the device before reading the ID registers. Unfortunately this
> doesn't exist and the power sequence is usually device specific.
> By having the device matched up with DT we can avoid this
> problem.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: <devicetree@vger.kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Stephen Boyd <stephen.boyd@linaro.org>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

-- 
heikki
