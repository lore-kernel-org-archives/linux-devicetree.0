From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH v7 2/7] mailbox: arm_mhu: add driver for ARM MHU controller
Date: Thu, 26 Mar 2015 11:43:21 +0000
Message-ID: <5513F0D9.5080807@arm.com>
References: <1425466367-30556-1-git-send-email-vincent.yang@socionext.com>
 <1425466884-30648-1-git-send-email-vincent.yang@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1425466884-30648-1-git-send-email-vincent.yang@socionext.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "jaswinder.singh@linaro.org" <jaswinder.singh@linaro.org>
Cc: Mark Rutland <Mark.Rutland@arm.com>, "andy.green@linaro.org" <andy.green@linaro.org>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, Pawel Moll <Pawel.Moll@arm.com>, "arnd@arndb.de" <arnd@arndb.de>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Tetsuya Nuriya <nuriya.tetsuya@socionext.com>, "arm@kernel.org" <arm@kernel.org>, "patches@linaro.org" <patches@linaro.org>, Vincent Yang <vincent.cw.yang@gmail.com>, Sudeep Holla <sudeep.holla@arm.com>, "olof@lixom.net" <olof@lixom.net>, Vincent Yang <vincent.yang@socionext.com>
List-Id: devicetree@vger.kernel.org



On 04/03/15 11:01, Vincent Yang wrote:
> From: Jassi Brar <jaswinder.singh@linaro.org>
>
> Add driver for the ARM Primecell Message-Handling-Unit(MHU) controller.
>
> Signed-off-by: Jassi Brar <jaswinder.singh@linaro.org>
> Signed-off-by: Andy Green <andy.green@linaro.org>
> Signed-off-by: Vincent Yang <vincent.yang@socionext.com>
> Signed-off-by: Tetsuya Nuriya <nuriya.tetsuya@socionext.com>
> ---
>   .../devicetree/bindings/mailbox/arm-mhu.txt        |  43 +++++
>   drivers/mailbox/Kconfig                            |   9 +
>   drivers/mailbox/Makefile                           |   2 +
>   drivers/mailbox/arm_mhu.c                          | 195 +++++++++++++++++++++
>   4 files changed, 249 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/mailbox/arm-mhu.txt
>   create mode 100644 drivers/mailbox/arm_mhu.c
>
> diff --git a/Documentation/devicetree/bindings/mailbox/arm-mhu.txt b/Documentation/devicetree/bindings/mailbox/arm-mhu.txt
> new file mode 100644
> index 0000000..4971f03
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/arm-mhu.txt
> @@ -0,0 +1,43 @@
> +ARM MHU Mailbox Driver
> +======================
> +
> +The ARM's Message-Handling-Unit (MHU) is a mailbox controller that has
> +3 independent channels/links to communicate with remote processor(s).
> + MHU links are hardwired on a platform. A link raises interrupt for any
> +received data. However, there is no specified way of knowing if the sent
> +data has been read by the remote. This driver assumes the sender polls
> +STAT register and the remote clears it after having read the data.
> +The last channel is specified to be a 'Secure' resource, hence can't be
> +used by Linux running NS.
> +
> +Mailbox Device Node:
> +====================
> +
> +Required properties:
> +--------------------
> +- compatible:		Shall be "arm,mhu" & "arm,primecell"
> +- reg:			Contains the mailbox register address range (base
> +			address and length)
> +- #mbox-cells		Shall be 1 - the index of the channel needed.
> +- interrupts:		Contains the interrupt information corresponding to
> +			each of the 3 links of MHU.
> +

I tried using this driver and found that AMBA driver expects apb_clk
without which probe fails. Though your example have it, it's not
explicit from the binding. Also AMBA binding expects the primecell id in
the binding.

Regards,
Sudeep
