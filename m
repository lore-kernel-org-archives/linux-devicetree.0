From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: ACPI vs DT at runtime
Date: Mon, 18 Nov 2013 16:46:18 +0100
Message-ID: <201311181646.19070.arnd@arndb.de>
References: <CAOesGMjKeRb=fFJM0MabDihbEiCGM4EqW9D5i_6-RFxTnpB4Qw@mail.gmail.com>
 <201311181605.37300.arnd@arndb.de>
 <20131118151900.GF16735@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20131118151900.GF16735@n2100.arm.linux.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Olof Johansson <olof@lixom.net>, Mark Rutland <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Grant Likely <grant.likely@secretlab.ca>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Monday 18 November 2013, Russell King - ARM Linux wrote:
> > Can you point to specific patches?
> 
> No, because they weren't publically posted, so I don't feel that I can
> say all that much; they were from quite a large company though.

I see.

> > I can't say I'm an expert on this, but everything I've seen with ACPI
> > is tables of binary data with four-letter identifiers that are defined
> > by the ACPI group, but not using strings in a similar manner to DT.
> 
> They are using strings which are the same as the DT properties, but
> without the vendor prefix - but yes, to only retrieve things like
> booleans, u32s and such like.  They also have support for fixed-rate
> clocks via the clk API too...
> 
> I'd like them to post the patches publically so a more open discussion
> could occur.

I'd definitely like that too, especially since managing clocks etc.
is (as multiple people have pointed out in this thread) a very
un-ACPI-like thing to do and it would be important for them to have
the debate whether that has a chance of getting accepted in the kernel
(or the ACPI spec, for that matter) or not.

	Arnd
