MIME-Version: 1.0
Date: Fri, 26 Apr 2019 09:04:29 -0500
References: <1554795924-12053-1-git-send-email-shubhrajyoti.datta@gmail.com>
	<1554795924-12053-2-git-send-email-shubhrajyoti.datta@gmail.com>
In-Reply-To: <1554795924-12053-2-git-send-email-shubhrajyoti.datta@gmail.com>
Message-ID: <CAL_Jsq+GenS+jZ_N_1Usjq7QbPKWDf7+L-OXrperi9F=zbhz=A@mail.gmail.com>
Subject: Re: [PATCHv3 1/2] dt-bindings: xilinx-uartps: Add support for cts-override
From: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Cc: devicetree@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>, Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
List-ID: <devicetree@vger.kernel.org>

On Tue, Apr 9, 2019 at 2:45 AM <shubhrajyoti.datta@gmail.com> wrote:
>
> From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
>
> Flow control is configurable in xilinx-uartps
> Add a dt binding to check for the same.
>
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> ---
> v2:
> Change the node binding name as suggested Rob.
>
>  Documentation/devicetree/bindings/serial/cdns,uart.txt | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
