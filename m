From: Axel Haslam <ahaslam@baylibre.com>
Subject: Re: [PATCH/RFT v2 09/17] regulator: fixed: Add over current event
Date: Mon, 24 Oct 2016 19:53:22 +0200
Message-ID: <CAKXjFTONo6N5A2UDbk3HzpK-zCOa16yyww-RMj-+EAfe3dac7Q@mail.gmail.com>
References: <20161024164634.4330-1-ahaslam@baylibre.com> <20161024164634.4330-10-ahaslam@baylibre.com>
 <20161024174322.GN17252@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161024174322.GN17252@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, Johan Hovold <johan@kernel.org>, robh+dt@kernel.org, Sekhar Nori <nsekhar@ti.com>, Alan Stern <stern@rowland.harvard.edu>, Kevin Hilman <khilman@baylibre.com>, Sergei Shtylyov <sshtylyov@ru.mvista.com>, David Lechner <david@lechnology.com>, manjunath.goudar@linaro.org, Alexandre Bailon <abailon@baylibre.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Mark,

On Mon, Oct 24, 2016 at 7:43 PM, Mark Brown <broonie@kernel.org> wrote:
> On Mon, Oct 24, 2016 at 06:46:26PM +0200, ahaslam@baylibre.com wrote:
>> From: Axel Haslam <ahaslam@baylibre.com>
>>
>> Some regulator supplies have an over-current pin that is
>> activated when the hw detects an over current condition.
>> When this happens, the hardware enters a current limited
>> mode.
>
> Please don't mix random enhancements like this into bigger system
> specific RFC serieses, send them separately so they're easier to spot
> and there's no confusion with dependencies and then reference them from
> the system specific series when you post that.

Ok, sorry i had mixed feelings on how to post all of it.
 there are several dependencies on the series and i  kept
all together to give the context. Do you  want me to repost the regulator
changes seperatly? I can do that, but if you  don't agree with regulator
handling overcurrent, i will have to move the over current
gpio into the driver, and there is no point on re-posting that seperatly.

Regards
Axel
