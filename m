From: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: Regarding hw irq to Linux irq mapping on ARM
Date: Tue, 21 Sep 2010 23:45:47 +0200 (CEST)
Message-ID: <alpine.LFD.2.00.1009212342580.2416@localhost6.localdomain6>
References: <AANLkTi=6nCJnfLB1uc0uLGOvOm0CX_R=j-8GQWTzmmep@mail.gmail.com>
	<AANLkTimp7+BLNBwZyBiPS0JgB_mno+gp8+mK=VdOd3+_@mail.gmail.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="-1463795968-2018660781-1285105551=:2416"
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <AANLkTimp7+BLNBwZyBiPS0JgB_mno+gp8+mK=VdOd3+_-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Eric Miao <eric.miao-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463795968-2018660781-1285105551=:2416
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, 21 Sep 2010, Grant Likely wrote:
> On Tue, Sep 21, 2010 at 7:25 AM, Shaju Abraham <shaju.abraham-QSEj5FYQhm5QFI55V6+gNQ@public.gmane.org=
g> wrote:
> > Hi Grant
> >
> > Since there does not exist a mechanism to map the hw irq to linux irq
> > on ARM (device tree), I would like to discuss =A0with you the plans o=
r
> > ideas to implement the same.
>=20
> I don't have any immediate plans, but this topic has come up a lot in
> the last two weeks, so I guess I need to focus on it.  :-)  [cc'ing
> devicetree-discuss and linux-arm-kernel as well as Lorenzo and Eric
> since this is a conversation that should be had publically]
>=20
> > Can you share with me your thoughts on it?
> > I have browsed through the power pc code for the same. But not sure
> > the same approach is usable on ARM as well.
>=20
> I haven't thought deeply about the powerpc implementation of virqs to
> determine if it is suitable for other architectures or not, but the
> concept behind it is sound.  We need a method of mapping controller
> specific IRQ (or hw irq) numbers into the global Linux irq space
> (referred to a virqs from this point on).  First it requires a
> per-controller reference which can be a pointer to a per-controller
> data structure, or any other unique identifier.  It could even be the
> interrupt controller device tree node pointer.  Just so long as there
> is a reliable method to derive the virq from the controller reference
> + hw irq number.
>=20
> There also needs to be a method for each interrupt controller to
> register itself and allocate a portion of the virq range.  This
> shouldn't be too hard.  PowerPC handles this with the irq_map[] flat
> table.  This approach is limited to whatever NR_IRQs is set to, and
> could potentially be limited by that, but on the other hand the number
> of discrete IRQ sources in a system is limited so a flat table
> (instead of a dynamic hash table) is probably sufficient.  It is
> certainly simpler to implement.
>=20
> I think the first step is to simply try generalizing the code in
> arch/powerpc/kernel/irq.c.  It isn't very complex and it would give a
> better impression of what needs to be done.  The ARM interrupt
> controller drivers would need to be modified to register with the virq
> infrastructure.  None of this is either ARM or OF specific; it would
> be useful for any system than need to dynamically allocate IRQ
> numbers.  I could see some x86 use cases (Xilinx FPGAs) where this
> would be useful.

Add all the I2C, SPI based irq extenders to that list. They seem to
pop up all over the place in rapid speed even in x86. We are happy
citizens of the embedded horror^Wuniverse now.

Thanks,

	tglx
---1463795968-2018660781-1285105551=:2416
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

---1463795968-2018660781-1285105551=:2416--
