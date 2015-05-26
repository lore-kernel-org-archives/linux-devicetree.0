From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v2 5/7] clocksource: Add Pistachio SoC general purpose
 timer binding document
Date: Tue, 26 May 2015 22:15:16 +0300
Message-ID: <5564C644.7040700@cogentembedded.com>
References: <1432665548-16024-1-git-send-email-ezequiel.garcia@imgtec.com> <1432665671-16102-1-git-send-email-ezequiel.garcia@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1432665671-16102-1-git-send-email-ezequiel.garcia@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ezequiel Garcia <ezequiel.garcia@imgtec.com>, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, Daniel Lezcano <daniel.lezcano@linaro.org>, devicetree@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Andrew Bresticker <abrestic@chromium.org>, James Hartley <james.hartley@imgtec.com>, Govindraj.Raja@imgtec.com, Damien.Horsley@imgtec.com, James Hogan <james.hogan@imgtec.com>
List-Id: devicetree@vger.kernel.org

Hello.

On 05/26/2015 09:41 PM, Ezequiel Garcia wrote:

> Add a device-tree binding document for the clocksource driver provided
> by Pistachio SoC general purpose timers.

> Reviewed-by: Andrew Bresticker <abrestic@chromium.org>
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
> ---
>   .../bindings/timer/img,pistachio-gptimer.txt       | 28 ++++++++++++++++++++++
>   1 file changed, 28 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/timer/img,pistachio-gptimer.txt

> diff --git a/Documentation/devicetree/bindings/timer/img,pistachio-gptimer.txt b/Documentation/devicetree/bindings/timer/img,pistachio-gptimer.txt
> new file mode 100644
> index 0000000..418379f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/img,pistachio-gptimer.txt
> @@ -0,0 +1,28 @@
> +* Pistachio general-purpose timer based clocksource
> +
> +Required properties:
> + - compatible: "img,pistachio-gptimer".
> + - reg: Address range of the timer registers.
> + - interrupts: An interrupt for each of the four timers
> + - clocks : Should contain a clock specifier for each entry in clock-names
> + - clock-names : Should contain the following entries:

    Could you please be consistent about the spacing before colon?

[...]

WBR, Sergei
