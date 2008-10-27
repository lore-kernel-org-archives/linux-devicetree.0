From: Matt Sealey <matt-sEEEE4iEDtaXzmuOJsdVMQ@public.gmane.org>
Subject: Re: GPIO - marking individual pins (not) available in device tree
Date: Mon, 27 Oct 2008 16:56:57 -0500
Message-ID: <49063929.3060900@genesi-usa.com>
References: <4901032F.3090805@genesi-usa.com> <49011C42.2020101@firmworks.com>
	<20081024032944.GE4267@yookeroo.seuss>
	<49014C69.8020408@firmworks.com>
	<20081024044511.GI4267@yookeroo.seuss>
	<490248C2.9020104@genesi-usa.com>
	<20081026234747.GD22339@yookeroo.seuss>
	<4905E0DC.104@genesi-usa.com>
	<20081027183421.GA1009@oksana.dev.rtsoft.ru>
	<49060EC3.1070704@genesi-usa.com>
	<20081027201023.GA18642@oksana.dev.rtsoft.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <20081027201023.GA18642-wnGakbxT3iijyJ0x5qLZdcN33GVbZNy3@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: avorontsov-hkdhdckH98+B+jHODAdFcQ@public.gmane.org
Cc: linuxppc-dev list <linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, devicetree-discuss list <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Anton Vorontsov wrote:
> Can you _simply_ describe the problem you're trying to solve,
> w/o that much emotions? Can you give examples of what
> you've tried, and describe why you don't like it?

I've not tried anything because I don't feel confident that the
documentation or device tree examples explain the situation at
all.

Here's the basic premise;

MPC5200B has three GPIO banks, one for standard, one for wakeups,
one for timer GPIO. They're all implemented as 32-bit registers
(but each bank does not necessarily have 32 pins escaping the
chip). Several of the GPIO are multiplexed with other devices
which can and does leave gaping holes of GPIO in the 32-bit
register where anything up to 7 pins are given over to another
device and therefore are no longer GPIO (this example is held
up by the implementation of ethernet on the MPC5200B).

Given GPIO functionality where you need more pins than a single
device mux can offer, and some device muxing making those holes
splitting up a contiguous allocation of pins that can be defined
by a base pin number and a count of pins to assign, you may have
to allocate several GPIO pins out of the register which are NOT
contiguous.

So in a 32-bit register, let's say 0 is a GPIO we don't need (or
available but used for some other GPIO peripheral), and X is a
GPIO muxed to another device (therefore not GPIO anymore) and 1
is one we do want to use:

00011XXXXXXX111XX1111XXX00000XX1

(imagine them routed to a 12-pin connector with VCC and GND
and 10 data pins. This may be an LCD display controller such
as you can buy from Sparkfun or CrystalFontz, if you need a
physical example)

A bunch of things spring to mind:

*   How do you define a GPIO bank in a device tree, not a controller
     but a grouping of pins which fit that pattern, of which there
     may be multiple groupings for multiple peripheral functions

(for instance an LED controller, and an IR receiver, and a bitbang
SPI implemented using these GPIO pins)?

*   How do you stop GPIOLIB from blindly approving requests to use
     pins marked X, without making it "controller-specific"? GPIOLIB
     can be as controller-specific as it likes, but having 20 different
     ways to define "X pins" or "available pins" complicates a
     device tree unnecessarily.

(I've been implementing a "gpio-mask" property in MY device trees
because I thought of this problem ages ago but just never had any
reason to make use of it. But it's very controller-specific, and
therefore pretty useless (and actually on other GPIO controllers
which use a register-per-pin is not actually any use at all, but
the question above remains!))

*   Since we're looking at an example where we interface a fairly
     complex device which is technically a bus, with a subordinate
     device which may or may not be probe-able, could you define
     that GPIO configuration in such a way that it is a device node
     of it's own, that the pins are marked for their purpose

(on such an LCD example, 8 data pins in a group, 1 for r/w selection
and 1 for data/control selection, it would be nice for the
software to know which pin is which and, slightly unrelated,
which way around the data pins went - MSB first or LSB first
- from the device tree, as this is a BOARD LEVEL DESIGN DECISION
which is what the device tree is meant to abstract - in the same
way we define i2c controllers and clients?)

*   At the end of the day the GPIO device tree binding is barely
     20 lines at the bottom of a file that has been superceded by
     the ePAPR standard now, so where do we stand on this anyway?

(I will ask that same last question of the i2c guys, I have never
seen the Linux i2c device binding in the tree - maybe I am not
looking hard enough - and the Sun binding seems to be a secret
that only special people are allowed to see)


I don't feel the current spec actually takes this into account
and the patch submission the other day from Wolfgang made me
think that if a "base" register is the obvious solution to some
problem, then it either can't be that clear to others (i.e. it
is not just me being stupid) or it is simply not possible under
the current binding.

At the very least it needs documenting better, worst case is
it needs a damn good rethink taking into account a set of
controllers which comprise a representative number of GPIO
controller types and potential uses. I actually saw the voltage
controller framework go into 2.6.27 and they have designed it
around the operation of two PMUI chips which are pretty much
the industry standard. GPIO device tree does not seem to have
gotten the same amount of attention.

Yes, your idea, Mitch's discussion was great, I just don't think
anything will get done about it (emotional moment) as usual.

-- 
Matt Sealey <matt-sEEEE4iEDtaXzmuOJsdVMQ@public.gmane.org>
Genesi, Manager, Developer Relations
