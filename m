From: Dinh Nguyen <dinguyen@kernel.org>
Subject: Re: [PATCH v3] arm64: dts: stratix10: fix multicast filtering
Date: Mon, 5 Nov 2018 13:14:27 -0600
Message-ID: <863ba5a2-0d4b-96a9-19c2-c4f08aa7d395@kernel.org>
References: <20181102191048.22657-1-aaro.koskinen@iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20181102191048.22657-1-aaro.koskinen@iki.fi>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Aaro Koskinen <aaro.koskinen@iki.fi>, Thor Thayer <thor.thayer@linux.intel.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, Aaro Koskinen <aaro.koskinen@nokia.com>
List-Id: devicetree@vger.kernel.org



On 11/2/18 2:10 PM, Aaro Koskinen wrote:
> From: Aaro Koskinen <aaro.koskinen@nokia.com>
> 
> On Stratix 10, the EMAC has 256 hash buckets for multicast filtering. This
> needs to be specified in DTS, otherwise the stmmac driver defaults to 64
> buckets and initializes the filter incorrectly. As a result, e.g. valid
> IPv6 multicast traffic ends up being dropped.
> 
> Fixes: 78cd6a9d8e15 ("arm64: dts: Add base stratix 10 dtsi")
> Signed-off-by: Aaro Koskinen <aaro.koskinen@nokia.com>
> ---
>  arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
> 

Applied!

Thanks,
Dinh
