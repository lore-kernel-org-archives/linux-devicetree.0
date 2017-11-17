From: Dave Stevenson <dave.stevenson@raspberrypi.org>
Subject: Re: [PATCH] ARM: dts: bcm2835-rpi: Avoid conflicts on i2c0
Date: Fri, 17 Nov 2017 18:30:23 +0000
Message-ID: <CAAoAYcPz6urucU1r_uNk1kvjsGg0p7VUrZwa5GZSDeDgsD=5Fw@mail.gmail.com>
References: <1510779424-642-1-git-send-email-stefan.wahren@i2se.com>
 <87a7zmq7wy.fsf@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <87a7zmq7wy.fsf@anholt.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Eric Anholt <eric@anholt.net>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, Mark Rutland <mark.rutland@arm.com>, Scott Branden <sbranden@broadcom.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 16 November 2017 at 20:34, Eric Anholt <eric@anholt.net> wrote:
> Stefan Wahren <stefan.wahren@i2se.com> writes:
>
>> The GPU firmware of the Raspberry Pi 3 uses i2c0 to communicate to
>> the FXL6408 gpio expander. It's a bad idea to use the same interface
>> from the ARM side. Since this interface isn't used by the other
>> RPi boards, it's save to remove the complete node and avoid this
>> conflict.
>
> It's not used by other kernel drivers currently, but should we leave it
> in for the pi0/1/2 folks that might have userspace I2C stuff using it?
> That's a thing people do, right?  I actually don't know.

The firmware hasn't used BSC0 for the GPIO expander since the end of
January. It now bit bashes it. Sorry if that information hadn't
filtered through.

I've got a patch I was about to send to rpi-linux for comment which
sets up the i2c-mux-pinctrl driver on BSC0 so that it can be used
either on GPIOs 0&1, or the GPIOs connected to the DSI and CSI
connectors (I want it to talk to the camera module, and I guess Eric
won't complain for talking to the DSI display). I'll aim to sort it on
Monday.

  Dave
