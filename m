From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2 2/3] ARM: dts: rockchip: Use the GPU to cool CPU thermal zone of veyron mickey
Date: Wed, 22 May 2019 11:14:55 +0200
Message-ID: <3939310.vedCpJl8Cg@phil>
References: <20190520220051.54847-1-mka@chromium.org> <20190520220051.54847-2-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190520220051.54847-2-mka@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>
List-Id: devicetree@vger.kernel.org

Am Dienstag, 21. Mai 2019, 00:00:50 CEST schrieb Matthias Kaehlcke:
> On rk3288 the CPU and GPU temperatures are correlated. Limit the GPU
> frequency on veyron mickey to 400 MHz for CPU temperatures >= 65°C
> and to 300 MHz for CPU temperatures >= 85°C.
> 
> This matches the configuration of the downstream Chrome OS 3.14 kernel,
> the 'official' kernel for mickey.
> 
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>

applied patches 2+3 for 5.3

Thanks
Heiko
