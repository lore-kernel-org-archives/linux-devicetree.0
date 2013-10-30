From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/1] Documentation/watchdog: Add binding example in samsung-wdt
Date: Wed, 30 Oct 2013 10:57:25 +0530
Message-ID: <CAK9yfHyEB_jLqY7XXbVr+AsgRTCLsm1Xb2tHE5hEZS9kGOOGrQ@mail.gmail.com>
References: <1383109870-30297-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1383109870-30297-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-watchdog@vger.kernel.org
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Wim Van Sebroeck <wim@iguana.be>, Guenter Roeck <linux@roeck-us.net>, Sachin Kamat <sachin.kamat@linaro.org>
List-Id: devicetree@vger.kernel.org

On 30 October 2013 10:41, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> Added an example for reference.
>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  .../devicetree/bindings/watchdog/samsung-wdt.txt   |    9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.txt b/Documentation/devicetree/bindings/watchdog/samsung-wdt.txt
> index 2aa486c..7ddf461 100644
> --- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.txt
> @@ -12,3 +12,12 @@ Required properties:
>
>  Optional properties:
>  - timeout-sec : contains the watchdog timeout in seconds.
> +
> +Example:
> +
> +watchdog@101D0000 {
> +       compatible = "samsung,s3c2410-wdt";
> +       reg = <0x101D0000 0x100>;
> +       interrupts = <0 42 0>;
> +       status = "disabled";
> + };
> --
> 1.7.9.5
>

Reports whitespace errors while applying (undetected by checkpatch).
Please ignore this version.
Have resent the fixed up one.

-- 
With warm regards,
Sachin
