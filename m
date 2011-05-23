From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 2/2] drivers/amba: probe via device tree
Date: Mon, 23 May 2011 09:23:54 -0600
Message-ID: <BANLkTi=3vQHoUaUmaDsrton_DrckDcHJ4w@mail.gmail.com>
References: <1305829704-11774-1-git-send-email-robherring2@gmail.com>
 <20110519233958.GB18181@ponder.secretlab.ca> <4DD66B8A.5040404@gmail.com>
 <201105201621.03801.arnd@arndb.de> <4DD68614.6090209@gmail.com>
 <a42f0c27-2811-4b68-bedf-7dfaa7bff6ff@VA3EHSMHS025.ehs.local>
 <BANLkTi=8vX1Cs_fzpQXZBuuDuLYLu1FGmg@mail.gmail.com> <20110521234725.GB17672@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110521234725.GB17672@n2100.arm.linux.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Stephen Neuendorffer <stephen.neuendorffer@xilinx.com>, Kevin Hilman <khilman@ti.com>, Segher Boessenkool <segher@kernel.crashing.org>, Arnd Bergmann <arnd@arndb.de>, devicetree-discuss@lists.ozlabs.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Rafael J. Wysocki" <rjw@sisk.pl>, Jeremy Kerr <jeremy.kerr@canonical.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sat, May 21, 2011 at 5:47 PM, Russell King - ARM Linux
<linux@arm.linux.org.uk> wrote:
> On Sat, May 21, 2011 at 11:42:34AM -0600, Grant Likely wrote:
>> Russell, it seems to me that the primary behaviour that amba_bus has
>> over platform_bus is the clock management, and secondarily
>> verification of the type of device by the device id. =A0Am I correct=
, or
>> am I missing something?
>
> It matches by vendor/device ID just like PCI does, and does the bus
> clock management and power management in a really nice way, which I
> doubt platform devices will ever do.
>
> The way this discussion is going, I'm going to suggest that we also
> convert PCI stuff to being platform devices too. =A0I don't see the
> point of PCI existing for all the same reasons being given in this
> thread.

I certainly don't see that as being the direction this discussion is go=
ing.

I see a serious question about how best to model AMBA primecell
devices in the device tree, and a similarly serious question about
whether to instantiate them as platform_devices or amba_devices.
Modelled behaviour in this case (clock/power management) is
particularly important, and you're right, platform_devices will never
implement that behaviour in the core code (this issue has already been
pushed back on; see discussions about omap_device).

g.
