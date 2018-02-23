Return-Path: <SRS0=iPQ4=FR=google.com=dianders@kernel.org>
MIME-Version: 1.0
Sender: dianders@google.com
In-Reply-To: <1515805547-22816-8-git-send-email-kramasub@codeaurora.org>
References: <1515805547-22816-8-git-send-email-kramasub@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 23 Feb 2018 11:05:00 -0800
Message-ID: <CAD=FV=XAoWQV2WwHk48GCsxHKOpm0GH0SN03tN7bZWqtZY3wcw@mail.gmail.com>
Subject: Re: [v2, 7/7] tty: serial: msm_geni_serial: Add serial driver support
 for GENI based QUP
Content-Type: text/plain; charset="UTF-8"
To: Jonathan Corbet <corbet@lwn.net>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Wolfram Sang <wsa@the-dreams.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Karthikeyan Ramasubramanian <kramasub@codeaurora.org>, linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>, Girish Mahadevan <girishm@codeaurora.org>, Sagar Dharia <sdharia@codeaurora.org>, Guenter Roeck <groeck@chromium.org>
List-ID: <devicetree@vger.kernel.org>

Hi,

On Fri, Jan 12, 2018 at 5:05 PM, Karthikeyan Ramasubramanian
<kramasub@codeaurora.org> wrote:
> This driver supports GENI based UART Controller in the Qualcomm SOCs. The
> Qualcomm Generic Interface (GENI) is a programmable module supporting a
> wide range of serial interfaces including UART. This driver support console
> operations using FIFO mode of transfer.
>
> Signed-off-by: Girish Mahadevan <girishm@codeaurora.org>
> Signed-off-by: Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
> Signed-off-by: Sagar Dharia <sdharia@codeaurora.org>
> ---
>  drivers/tty/serial/Kconfig            |   10 +
>  drivers/tty/serial/Makefile           |    1 +
>  drivers/tty/serial/qcom_geni_serial.c | 1414 +++++++++++++++++++++++++++++++++
>  3 files changed, 1425 insertions(+)
>  create mode 100644 drivers/tty/serial/qcom_geni_serial.c
>
> diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
> index b788fee..1be30e5 100644
> --- a/drivers/tty/serial/Kconfig
> +++ b/drivers/tty/serial/Kconfig
> @@ -1098,6 +1098,16 @@ config SERIAL_MSM_CONSOLE
>         select SERIAL_CORE_CONSOLE
>         select SERIAL_EARLYCON
>
> +config SERIAL_QCOM_GENI
> +       tristate "QCOM on-chip GENI based serial port support"

Should this be bool instead of tristate?  Guenter noticed that we'll
get link errors if we try building this as a module.  Specifically, he
noted that the "qcom_geni_serial.c" file refers to
"uart_console_device" and "uart_console_device" is not exported (and
shouldn't be since a console has to be available before modules are
loaded).


-Doug
