From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2 1/3] ARM: dts: rockchip: raise CPU trip point temperature for veyron to 100 degC
Date: Fri, 17 May 2019 12:44:15 +0200
Message-ID: <2157639.ILuVUxfVHr@phil>
References: <20190516162942.154823-1-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190516162942.154823-1-mka@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>
List-Id: devicetree@vger.kernel.org

Am Donnerstag, 16. Mai 2019, 18:29:40 CEST schrieb Matthias Kaehlcke:
> This value matches what is used by the downstream Chrome OS 3.14
> kernel, the 'official' kernel for veyron devices. Keep the temperature
> for 'speedy' at 90°C, as in the downstream kernel.
> 
> Increase the temperature for a hardware shutdown to 125°C, which
> matches the downstream configuration and gives the system a chance
> to shut down orderly at the criticial trip point.
> 
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>

applied all 3 for 5.3 with Doug's RB and did a small fix to the commit
message of patch2 ("thorse").

Thanks
Heiko
