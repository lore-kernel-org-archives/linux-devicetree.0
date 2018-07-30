From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 9/9] dts: juno: Update coresight bindings
Date: Mon, 30 Jul 2018 17:14:40 -0600
Message-ID: <20180730231440.GA7782@rob-hp-laptop>
References: <1532686537-12380-1-git-send-email-suzuki.poulose@arm.com>
 <1532686537-12380-10-git-send-email-suzuki.poulose@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1532686537-12380-10-git-send-email-suzuki.poulose@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, mathieu.poirier@linaro.org, mike.leach@linaro.org, robert.walker@arm.com, coresight@lists.linaro.org, frowand.list@gmail.com, devicetree@vger.kernel.org, matt.sealey@arm.com, charles.garcia-tobin@arm.com, john.horley@arm.com, al.grant@arm.com, Sudeep Holla <sudeep.holla@arm.com>, Liviu Dudau <liviu.dudau@arm.com>
List-Id: devicetree@vger.kernel.org

On Fri, Jul 27, 2018 at 11:15:37AM +0100, Suzuki K Poulose wrote:
> Switch to updated coresight bindings for Juno platforms.
> 
> Cc: Sudeep Holla <sudeep.holla@arm.com>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
> Changes since V2:
>   - Update to new format.
> ---
>  arch/arm64/boot/dts/arm/juno-base.dtsi    | 161 +++++++++++++++---------------
>  arch/arm64/boot/dts/arm/juno-cs-r1r2.dtsi |  52 ++++------
>  arch/arm64/boot/dts/arm/juno.dts          |  13 +--
>  3 files changed, 105 insertions(+), 121 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
