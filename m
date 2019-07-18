From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v2 3/5] memremap: Add support for read-only memory mappings
Date: Thu, 18 Jul 2019 11:00:07 -0700
Message-ID: <5d30b3a8.1c69fb81.8c54.63a6@mx.google.com>
References: <20190614203717.75479-1-swboyd@chromium.org> <20190614203717.75479-4-swboyd@chromium.org> <20190710141433.7ama3gncss3y6dcx@willie-the-truck>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190710141433.7ama3gncss3y6dcx@willie-the-truck>
Sender: linux-kernel-owner@vger.kernel.org
To: Will Deacon <will@kernel.org>
Cc: Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Evan Green <evgreen@chromium.org>, Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>, Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>
List-Id: devicetree@vger.kernel.org

Quoting Will Deacon (2019-07-10 07:14:34)
> On Fri, Jun 14, 2019 at 01:37:15PM -0700, Stephen Boyd wrote:
> > @@ -84,7 +91,10 @@ void *memremap(resource_size_t offset, size_t size, =
unsigned long flags)
> >       }
> > =20
> >       /* Try all mapping types requested until one returns non-NULL */
> > -     if (flags & MEMREMAP_WB) {
> > +     if ((flags & MEMREMAP_RO) && is_ram !=3D REGION_INTERSECTS)
> > +             addr =3D arch_memremap_ro(offset, size);
> > +
> > +     if (!addr && (flags & MEMREMAP_WB)) {
> >               /*
> >                * MEMREMAP_WB is special in that it can be satisfied
> >                * from the direct map.  Some archs depend on the
> > @@ -103,7 +113,8 @@ void *memremap(resource_size_t offset, size_t size,=
 unsigned long flags)
> >        * address mapping.  Enforce that this mapping is not aliasing
> >        * System RAM.
> >        */
> > -     if (!addr && is_ram =3D=3D REGION_INTERSECTS && flags !=3D MEMREM=
AP_WB) {
> > +     if (!addr && is_ram =3D=3D REGION_INTERSECTS &&
> > +         (flags !=3D MEMREMAP_WB || flags !=3D MEMREMAP_RO)) {
> >               WARN_ONCE(1, "memremap attempted on ram %pa size: %#lx\n",
> >                               &offset, (unsigned long) size);
> >               return NULL;
>=20
> This function seems a little confused about whether 'flags' is really a
> bitmap of flags, or whether it is equal to exactly one entry in the enum.
> Given that I think it's sensible for somebody to specify 'MEMREMAP_RO |
> MEMREMAP_WT', then we probably need to start checking these things a bit
> more thoroughly so we can reject unsupported combinations at the very lea=
st.
>=20

I'm also confused about the same thing. I thought it was a "getting
worse via best effort" type of thing based on the comment above the
function.

 * In the case of multiple flags, the different
 * mapping types will be attempted in the order listed below until one of
 * them succeeds.

(I now realize I should have documented the new flag so that this order
would be known. I'll resend this series again with the documentation
fix.)

I also thought that the combination of read-only and write through would
be OK because the flags are more of a best effort approach to making a
mapping. Given that, is there anything to reject? Or do we just keep
trying until we can't try anymore?
