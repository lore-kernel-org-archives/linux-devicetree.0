From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: net: btusb: add QCA6174A IDs
Date: Tue, 26 Feb 2019 16:32:41 -0600
Message-ID: <20190226223241.GA2365@bogus>
References: <20190222225345.69084-1-briannorris@chromium.org>
 <20190222225345.69084-2-briannorris@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190222225345.69084-2-briannorris@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Heiko Stuebner <heiko@sntech.de>, Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>, Rajat Jain <rajatja@google.com>, Robin Murphy <robin.murphy@arm.com>, Brian Norris <briannorris@chromium.org>
List-Id: devicetree@vger.kernel.org

On Fri, 22 Feb 2019 14:53:44 -0800, Brian Norris wrote:
> There are two USB PID/VID variations I've seen for this chip, and I want
> to utilize the 'interrupts' property defined here already.
> 
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> ---
> v2:
>  * drop leading zeroes from VID
> ---
>  Documentation/devicetree/bindings/net/btusb.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
