From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 01/10] dt-bindings: pinctrl: Add bindings for Actions
 S900 SoC
Date: Mon, 19 Feb 2018 14:34:38 -0600
Message-ID: <20180219203438.4b6h5m3nzf3ity3u@rob-hp-laptop>
References: <20180217204433.3095-1-manivannan.sadhasivam@linaro.org>
 <20180217204433.3095-2-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180217204433.3095-2-manivannan.sadhasivam@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: devicetree@vger.kernel.org, daniel.thompson@linaro.org, linus.walleij@linaro.org, liuwei@actions-semi.com, linux-kernel@vger.kernel.org, amit.kucheria@linaro.org, linux-gpio@vger.kernel.org, mp-cs@actions-semi.com, 96boards@ucrobotics.com, afaerber@suse.de, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sun, Feb 18, 2018 at 02:14:24AM +0530, Manivannan Sadhasivam wrote:
> Add pinctrl bindings for Actions Semi S900 SoC
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  .../bindings/pinctrl/actions,s900-pinctrl.txt      | 171 +++++++++++++++++++++
>  1 file changed, 171 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/actions,s900-pinctrl.txt

Reviewed-by: Rob Herring <robh@kernel.org>
