From: Roland Stigge <stigge@antcom.de>
Subject: Re: [PATCHv4 1/2] drivers: input: keypad: Add device tree support
Date: Wed, 25 Apr 2012 13:38:43 +0200
Message-ID: <4F97E243.1040707@antcom.de>
References: <1335346004-18108-1-git-send-email-sourav.poddar@ti.com> <20120425105235.GV24211@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <20120425105235.GV24211@n2100.arm.linux.org.uk>
Sender: linux-input-owner@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Sourav Poddar <sourav.poddar@ti.com>, devicetree-discuss@lists.ozlabs.org, Benoit Cousson <b-cousson@ti.com>, Stephen Warren <swarren@wwwdotorg.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>, Randy Dunlap <rdunlap@xenotime.net>, Felipe Balbi <balbi@ti.com>, linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Russell and Sourav,

On 04/25/2012 12:52 PM, Russell King - ARM Linux wrote:
> I think you and Roland Stigge need to put your heads together and come
> up with a common DT binding for matrix keypad devices, rather than
> inventing N different platform specific bindings.
> 
>> +Required Board Specific Properties, in addition to those specified by
>> +the shared matrix-keyboard bindings:
>> +- keypad,num-rows: Number of row lines connected to the keypad
>> +  controller.
>> +
>> +- keypad,num-columns: Number of column lines connected to the
>> +  keypad controller.

Right - the LPC32xx key scanner always has a square matrix design (#rows
== #cols), but I'm fine with re-using properties "keypad,num-rows" and
"keypad,num-columns" instead of "nxp,matrix-size".

Besides, I still have "nxp,debounce-delay-ms" and "nxp,scan-delay-ms" -
do I need to change this to some default properties I don't know of (yet)?

And: I re-used the DT subnodes strategy for the keycodes ("linux,code")
of the samsung-keypad driver, see
Documentation/devicetree/bindings/input/samsung-keypad.txt - can I
continue using it?

Thanks in advance,

Roland
