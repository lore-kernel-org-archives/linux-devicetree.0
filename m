From: Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH v2 1/3] clk: bcm2835: Add bindings for the auxiliary
 peripheral clock gates.
Date: Wed, 23 Dec 2015 12:46:08 -0800
Message-ID: <CAEG3pNCOO1F8+nwOQGSjUKxYCGbWW_Ripc6xUwDyg6ay66uL7w@mail.gmail.com>
References: <1450222559-22461-1-git-send-email-eric@anholt.net> <20151219041935.GS14936@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20151219041935.GS14936@rob-hp-laptop>
Sender: linux-clk-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Eric Anholt <eric@anholt.net>, linux-clk <linux-clk@vger.kernel.org>, "Stephen Boyd <sboyd@codeaurora.org>, Emilio Lopez
	<emilio@elopez.com.ar>, Hans de Goede <hdegoede@redhat.com>, linux-clk
	<linux-clk@vger.kernel.org>, linux-arm-kernel" <linux-arm-kernel@lists.infradead.org>, linux-rpi-kernel@lists.infradead.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>Stephen Boyd <sboyd@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Dec 18, 2015 at 8:19 PM, Rob Herring <robh@kernel.org> wrote:
> On Tue, Dec 15, 2015 at 03:35:57PM -0800, Eric Anholt wrote:
>> These will be used for enabling UART1, SPI1, and SPI2.
>>
>> Signed-off-by: Eric Anholt <eric@anholt.net>
>> ---
>>
>> v2: Make the binding cover both the IRQ and clock enable registers.
>>
>>  .../bindings/clock/brcm,bcm2835-aux-clock.txt      | 31 ++++++++++++++++++++++
>>  include/dt-bindings/clock/bcm2835-aux.h            | 17 ++++++++++++
>>  2 files changed, 48 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/clock/brcm,bcm2835-aux-clock.txt
>>  create mode 100644 include/dt-bindings/clock/bcm2835-aux.h
>
> Acked-by: Rob Herring <robh@kernel.org>

Applied to clk-next.

Next time if you put the header into the clk driver patch then we can
send the binding description through the DT tree and take the header
and C file through the clk tree in one patch.

Regards,
Mike

-- 
Michael Turquette
CEO
BayLibre - At the Heart of Embedded Linux
http://baylibre.com/
