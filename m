From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 01/11] Documentation: dts: Update coresight binding
 examples
Date: Mon, 17 Sep 2018 01:45:33 -0400
Message-ID: <5b9f3f7e.1c69fb81.ba4c4.0282@mx.google.com>
References: <1536661032-30481-1-git-send-email-suzuki.poulose@arm.com>
 <1536661032-30481-2-git-send-email-suzuki.poulose@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1536661032-30481-2-git-send-email-suzuki.poulose@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
Cc: robh@kernel.org, mathieu.poirier@linaro.org, devicetree@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>, linux-kernel@vger.kernel.org, arm@kernel.org, sudeep.holla@arm.com, frowand.list@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, 11 Sep 2018 11:17:02 +0100, Suzuki K Poulose wrote:
> While we updated the coresight DT bindings, some of the
> new examples were not updated due to the order in which they
> were merged. Let us update all the missed out ones to the
> new bindings to avoid confusion.
> 
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>  Documentation/devicetree/bindings/arm/coresight.txt | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
