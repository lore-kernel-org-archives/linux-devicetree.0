From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v2 28/34] dt-bindings: arm: Convert SPEAr board/soc
 bindings to json-schema
Date: Tue, 4 Dec 2018 10:20:12 +0530
Message-ID: <20181204045012.gy6xs7nggtcurdu5@vireshk-i7>
References: <20181203213223.16986-1-robh@kernel.org>
 <20181203213223.16986-29-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181203213223.16986-29-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Sean Hudson <darknighte@darknighte.com>, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Grant Likely <grant.likely@arm.com>, Kumar Gala <kumar.gala@linaro.org>, arm@kernel.org, Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On 03-12-18, 15:32, Rob Herring wrote:
> Convert SPEAr SoC bindings to DT schema format using json-schema.
> 
> Cc: Viresh Kumar <vireshk@kernel.org>
> Cc: Shiraz Hashim <shiraz.linux.kernel@gmail.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/arm/spear.txt         | 26 -------------------
>  .../devicetree/bindings/arm/spear.yaml        | 25 ++++++++++++++++++
>  2 files changed, 25 insertions(+), 26 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/spear.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/spear.yaml

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
