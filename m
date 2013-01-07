From: H Hartley Sweeten <hartleys@visionengravers.com>
Subject: RE: [PATCH 3.9] Driver for 7-segment displays connected over GPIOs
Date: Mon, 7 Jan 2013 11:56:19 -0600
Message-ID: <ADE657CA350FB648AAC2C43247A983F00206D6C98E38@AUSP01VMBX24.collaborationhost.net>
References: <1357576928-29133-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20130107164845.GA2911@kroah.com> <20130107180708.2ffc1540@skate>
 <20130107172340.GA32401@kroah.com> <20130107184022.72b23aa9@skate>
 <20130107184352.2e90abfb@skate>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20130107184352.2e90abfb@skate>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, Arnd Bergmann <arnd@arndb.de>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Gregory Clement <gregory.clement@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Monday, January 07, 2013 10:44 AM, Thomas Petazzoni wrote:
> On Mon, 7 Jan 2013 18:40:22 +0100, Thomas Petazzoni wrote:
>
>>>> Not having a kernel driver means that gazillions of applications
>>>> re-invent the same piece of code over and over again, have to hardcode
>>>> the GPIO numbers for a given piece of hardware, while the kernel
>>>> abstract all of this very nicely.
>>> 
>>> That sounds like a wonderful use of a userspace library to do this
>>> properly.  Much like libusb does, right?
>>> 
>>> I still think as this can be done in userspace, it probably should be.
>> 
>> Understood. Patches discarded.
>
> Thinking more about this. How would your userspace library know on which
> GPIOs your 7-seg segment device is connected? Should it parse the
> Device Tree from userspace? Given by the user-space application who
> would have to hardcode the GPIO numbers, completely defeating the
> hardware abstraction layer that the kernel intends to be?

Maybe an 'init' of 'config' function in the library should allow the user to
define the GPIOs that are connected to the 7-seg display? Or store the
GPIOs in some config file that the library parses when it's loaded.

This does require the user to know what GPIOs are connected and
forces then to do a bit of setup to use the display. But the actual use of
the display is still abstracted.

The library should also allow for multiple 7-seg displays. The old PC "post"
diagnostic boards usually had two displays on them.

Just my 2 cents....

Regards,
Hartley
