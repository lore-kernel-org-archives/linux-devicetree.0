From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v3 3/5] memremap: Add support for read-only memory mappings
Date: Thu, 03 Oct 2019 11:56:03 -0700
Message-ID: <5d964444.1c69fb81.121ce.d43b@mx.google.com>
References: <20190910160903.65694-1-swboyd@chromium.org> <20190910160903.65694-4-swboyd@chromium.org> <CAE=gft6YdNszcJV67CwcY2gOgPHrJ1+SnKMLr63f2bix2aZXXA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAE=gft6YdNszcJV67CwcY2gOgPHrJ1+SnKMLr63f2bix2aZXXA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Evan Green <evgreen@chromium.org>
Cc: Dan Williams <dan.j.williams@intel.com>, LKML <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>, Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>
List-Id: devicetree@vger.kernel.org

Quoting Evan Green (2019-09-18 12:37:34)
> On Tue, Sep 10, 2019 at 9:09 AM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > @@ -53,6 +60,9 @@ static void *try_ram_remap(resource_size_t offset, si=
ze_t size,
> >   * mapping types will be attempted in the order listed below until one=
 of
> >   * them succeeds.
> >   *
> > + * MEMREMAP_RO - establish a mapping whereby writes are ignored/reject=
ed.
> > + * Attempts to map System RAM with this mapping type will fail.
>=20
> Why should attempts to map RAM with this flag fail? MEMREMAP_WB will
> allow RAM and quietly give you back the direct mapping, so it seems
> like at least some values in this function allow RAM.
>=20
> Oh, I see a comment below about "Enforce that this mapping is not
> aliasing System RAM". I guess this is worried about cache coloring?
> But is that a problem with RO mappings? I guess the RO mappings could
> get partially stale, so if the memory were being updated out from
> under you, you might see some updates but not others. Was that the
> rationale?

Will Deacon, Dan Williams, and I talked about this RO flag at LPC and I
believe we decided to mostly get rid of the flags argument to this
function. The vast majority of callers pass MEMREMAP_WB, so I'll just
make that be the implementation default and support the flags for
encrpytion (MEMREMAP_ENC and MEMREMAP_DEC). There are a few callers that
pass MEMREMAP_WC or MEMREMAP_WT (and one that passes all of them), but I
believe those can be changed to MEMREMAP_WB and not care. There's also
the efi framebuffer code that matches the memory attributes in the EFI
memory map. I'm not sure what to do with that one to be quite honest.
Maybe EFI shouldn't care and just use whatever is already there in the
mapping?

Either way, I'll introduce a memremap_ro() API that maps memory as read
only if possible and return a const void pointer as well. I'm debating
making that API fallback to memremap() if RO isn't supported for some
reason or can't work because we're remapping system memory but that
seems a little too nice when the caller could just as well decide to
fail if memory can't be mapped as read only.
