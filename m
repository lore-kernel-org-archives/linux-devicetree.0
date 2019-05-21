From: Nicolas Boichat <drinkcat@chromium.org>
Subject: Re: [PATCH v4 2/3] fdt: add support for rng-seed
Date: Tue, 21 May 2019 20:42:48 +0800
Message-ID: <CANMq1KA1YF6B=nFizS8nT4KREASaJuaztdBnh_t0V8i0Fb-e6A@mail.gmail.com>
References: <20190519160446.320-1-hsinyi@chromium.org>
 <20190519160446.320-2-hsinyi@chromium.org>
 <CANMq1KB7sh=UXaM4sMm_THjZ_wV3Thgr6_ona-TJFqA2QQHALA@mail.gmail.com>
 <CAJMQK-iZRHO6HBkycPt0yz_vndmmmqFL0duHOcQ8EFSdhhFZcQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAJMQK-iZRHO6HBkycPt0yz_vndmmmqFL0duHOcQ8EFSdhhFZcQ@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Yu Zhao <yuzhao@google.com>, Kees Cook <keescook@chromium.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, Stephen Boyd <swboyd@chromium.org>, Will Deacon <will.deacon@arm.com>, lkml <linux-kernel@vger.kernel.org>, Mike Rapoport <rppt@linux.ibm.com>, Jun Yao <yaojun8558363@gmail.com>, Miles Chen <miles.chen@mediatek.com>, Rob Herring <robh+dt@kernel.org>, James Morse <james.morse@arm.com>, Andrew Murray <andrew.murray@arm.com>, Andrew Morton <akpm@linux-foundation.org>, Laura Abbott <labbott@redhat.com>, Frank Rowand <frowand.list@gmail.com>, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, Robin Murphy <robin.murphy@arm.com>
List-Id: devicetree@vger.kernel.org

On Tue, May 21, 2019 at 12:10 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> On Mon, May 20, 2019 at 7:54 AM Nicolas Boichat <drinkcat@chromium.org> wrote:
>
> > Alphabetical order.
> Original headers are not sorted, should I sort them here?
> >
>
> >
> > I'm a little bit concerned about this, as we really want the rng-seed
> > value to be wiped, and not kept in memory (even if it's hard to
> > access).
> >
> > IIUC, fdt_delprop splices the device tree, so it'll override
> > "rng-seed" property with whatever device tree entries follow it.
> > However, if rng-seed is the last property (or if the entries that
> > follow are smaller than rng-seed), the seed will stay in memory (or
> > part of it).
> >
> > fdt_nop_property in v2 would erase it for sure. I don't know if there
> > is a way to make sure that rng-seed is removed for good while still
> > deleting the property (maybe modify fdt_splice_ to do a memset(.., 0)
> > of the moved chunk?).
> >
> So maybe we can use fdt_nop_property() back?

Yes I prefer fdt_nop_property, if we don't want to modify delprop or
splice. But it'd be good if others can chime in.
