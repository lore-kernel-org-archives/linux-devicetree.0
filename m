From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 4/7] dt-bindings: gnss: add u-blox binding
Date: Mon, 7 May 2018 12:07:50 +0200
Message-ID: <20180507100750.GT2285@localhost>
References: <20180424163458.11947-5-johan@kernel.org>
 <CAL_Jsq+mCp=geT8t_j+0fuTxAB7C9RYn6pESRpLc2GH273fM1Q@mail.gmail.com>
 <20180426091018.GU4615@localhost>
 <CAL_JsqK=xQBx2YCd0kDP0zLn_LAZb6Mi5UfSTQf2soooVz2unQ@mail.gmail.com>
 <20180502081637.GE2285@localhost>
 <5242FCAD-3139-4A9C-B9FA-7BBAA0E6AE57@goldelico.com>
 <20180503205037.7be552c1@aktux>
 <44A0BC7C-67C7-4116-849F-90FF7CF2B1F0@goldelico.com>
 <20180504114213.3xlzqxe74n55tk5s@earth.universe>
 <FC3D0AF4-66EB-48A9-8E81-EC78DE43E105@goldelico.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <FC3D0AF4-66EB-48A9-8E81-EC78DE43E105@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Sebastian Reichel <sre@kernel.org>, Andreas Kemnade <andreas@kemnade.info>, Johan Hovold <johan@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Pavel Machek <pavel@ucw.cz>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Tony Lindgren <tony@atomide.com>
List-Id: devicetree@vger.kernel.org

On Fri, May 04, 2018 at 02:04:15PM +0200, H. Nikolaus Schaller wrote:

> It should be possible to cover this by a timer that is started
> in this case. If there is serdev data received after assuming the module
> is turned off, the driver has detected the wrong case - and can safely
> close the serdev until we want to have it powered on again.
> 
> If there is no response after turing off, the module power state is already
> in sync and we can close the serdev as well - after the timeout (let's say
> 30 seconds). Then, the serdev UART can idle. We should open the serdev
> and start this timer also in the probe function to catch an initially wrong
> state.

Right, the only thing that worried me about that was that we cannot
really delay system suspend for 30 seconds even if a somewhat shorter
delay should be probably be sufficient (still a number of seconds).

Configuring the serial controller as a wakeup source which aborts
suspend or resumes if the driver gets it wrong might be preferred to
draining the battery in suspend however.

Johan
