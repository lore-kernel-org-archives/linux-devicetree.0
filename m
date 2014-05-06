From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: ACPI vs DT at runtime
Date: Tue, 06 May 2014 16:37:05 +0100
Message-ID: <20140506153705.75C55C40A19@trevor.secretlab.ca>
References: <20131115095717.GC1709@e106331-lin.cambridge.arm.com>
 <97692EF2-013E-4E4B-BC16-E0915D67EFEC@antoniou-consulting.com>
 <53673866.9000105@ahsoftware.de> <69387177.zGLDjZS0ln@wuerfel>
 <5367AE6B.3010105@ahsoftware.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5367AE6B.3010105@ahsoftware.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Alexander Holler <holler@ahsoftware.de>, Arnd Bergmann <arnd@arndb.de>
Cc: devicetree@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Richard Cochran <richardcochran@gmail.com>, Pantelis Antoniou <panto@antoniou-consulting.com>, Jon Masters <jonathan@jonmasters.org>, Mark Brown <broonie@kernel.org>, Olof Johansson <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, 05 May 2014 17:29:47 +0200, Alexander Holler <holler@ahsoftware.de> wrote:
> Am 05.05.2014 16:41, schrieb Arnd Bergmann:
> > On Monday 05 May 2014 09:06:14 Alexander Holler wrote:
> >>
> >> A bit late (I don't follow the ML (or what happens in the ARM world)
> >> closely, but as I've recently read that ARM64 will go UEFI and ACPI, I
> >> wonder what was the reasoning behind that decision.
> >>
> >> Does anyone really assume we will become high quality UEFI and ACPI
> >> blobs from vendors? And such with reasonable support/update periods?
> >>
> >> For me that sounds like someone asked dreamers and was unable to adjust
> >> those answers in regard to reality.
> >
> > Where did you read that? It's simply not true and we should make sure
> > people stop spreading dangerous misinformation.
> 
> I've recently read Grant Likely's blog entry about armv8 servers: 
> http://www.secretlab.ca/archives/27 (I've read the disclaimer too ;) )

The purpose of that blog post was to address the questions around ARM
server architecture requirements including ACPI and UEFI, but there is a
big gap between the requrement and what actually works now. ARM server
hardware is going to be available well before UEFI and ACPI
(especially ACPI) infrastructure has stablized. I was trying to lay a
roadmap that acknowledges the gap and provides a way for vendors to ship
hardware now that is supported by the mainline kernel.

The constraints that are driving all of this on servers simply don't
exist on embedded and mobile. There really is zero advantage to using
ACPI if the only OS that will ever run on the device is Linux.

g.
