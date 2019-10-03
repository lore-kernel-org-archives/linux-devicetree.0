From: Evan Green <evgreen@chromium.org>
Subject: Re: [PATCH v3 3/5] memremap: Add support for read-only memory mappings
Date: Thu, 3 Oct 2019 13:05:53 -0700
Message-ID: <CAE=gft47g-mR0o5C=LG6b-OcVT=JDeNCfBH6R+CgPhLMnZpC=A@mail.gmail.com>
References: <20190910160903.65694-1-swboyd@chromium.org> <20190910160903.65694-4-swboyd@chromium.org>
 <CAE=gft6YdNszcJV67CwcY2gOgPHrJ1+SnKMLr63f2bix2aZXXA@mail.gmail.com> <5d964444.1c69fb81.121ce.d43b@mx.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5d964444.1c69fb81.121ce.d43b@mx.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: Dan Williams <dan.j.williams@intel.com>, LKML <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>, Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 3, 2019 at 11:56 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Evan Green (2019-09-18 12:37:34)
> > On Tue, Sep 10, 2019 at 9:09 AM Stephen Boyd <swboyd@chromium.org> wrote:
> > >
> > > @@ -53,6 +60,9 @@ static void *try_ram_remap(resource_size_t offset, size_t size,
> > >   * mapping types will be attempted in the order listed below until one of
> > >   * them succeeds.
> > >   *
> > > + * MEMREMAP_RO - establish a mapping whereby writes are ignored/rejected.
> > > + * Attempts to map System RAM with this mapping type will fail.
> >
> > Why should attempts to map RAM with this flag fail? MEMREMAP_WB will
> > allow RAM and quietly give you back the direct mapping, so it seems
> > like at least some values in this function allow RAM.
> >
> > Oh, I see a comment below about "Enforce that this mapping is not
> > aliasing System RAM". I guess this is worried about cache coloring?
> > But is that a problem with RO mappings? I guess the RO mappings could
> > get partially stale, so if the memory were being updated out from
> > under you, you might see some updates but not others. Was that the
> > rationale?
>
> Will Deacon, Dan Williams, and I talked about this RO flag at LPC and I
> believe we decided to mostly get rid of the flags argument to this
> function. The vast majority of callers pass MEMREMAP_WB, so I'll just
> make that be the implementation default and support the flags for
> encrpytion (MEMREMAP_ENC and MEMREMAP_DEC). There are a few callers that
> pass MEMREMAP_WC or MEMREMAP_WT (and one that passes all of them), but I
> believe those can be changed to MEMREMAP_WB and not care. There's also
> the efi framebuffer code that matches the memory attributes in the EFI
> memory map. I'm not sure what to do with that one to be quite honest.
> Maybe EFI shouldn't care and just use whatever is already there in the
> mapping?

I would guess that the folks mapping things like framebuffers would
care if their write-combined memory were changed to writeback. But I
suppose the better authorities on that are already here, so if they
think it's fine, I guess it's all good.

Whatever logic is used to defend that would likely apply equally well
to the EFI mappings.

>
> Either way, I'll introduce a memremap_ro() API that maps memory as read
> only if possible and return a const void pointer as well. I'm debating
> making that API fallback to memremap() if RO isn't supported for some
> reason or can't work because we're remapping system memory but that
> seems a little too nice when the caller could just as well decide to
> fail if memory can't be mapped as read only.

Sounds good. My small vote would be for the nicer fallback to
memremap(). I can't think of a case where someone would rather not
have their memory mapped at all than have it mapped writeable.
-Evan
