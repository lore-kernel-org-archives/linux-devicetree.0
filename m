From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] of/fdt: Remove PPC32 longtrail hack in memory scan
Date: Mon, 30 Jul 2018 11:19:42 -0600
Message-ID: <CAL_JsqJQKb-0V0rHnonE5QfCrJwf8APiLNoRtEYei+H_YiC4qA@mail.gmail.com>
References: <20180727053555.26596-1-mpe@ellerman.id.au>
 <CAL_JsqK4GEPJSPg+sStvFyO=sQ0Fp49FKKTz0S9OGc1COOnp-g@mail.gmail.com>
 <87in4xhufu.fsf@concordia.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <87in4xhufu.fsf@concordia.ellerman.id.au>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, Paul Mackerras <paulus@samba.org>, linuxppc-dev <linuxppc-dev@ozlabs.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 30, 2018 at 4:47 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Rob Herring <robh+dt@kernel.org> writes:
> > On Thu, Jul 26, 2018 at 11:36 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
> >> When the OF code was originally made common by Grant in commit
> >> 51975db0b733 ("of/flattree: merge early_init_dt_scan_memory() common
> >> code") (Feb 2010), the common code inherited a hack to handle
> >> PPC "longtrail" machines, which had a "memory@0" node with no
> >> device_type.
> >>
> >> That check was then made to only apply to PPC32 in b44aa25d20e2 ("of:
> >> Handle memory@0 node on PPC32 only") (May 2014).
> >>
> >> But according to Paul Mackerras the "longtrail" machines are long
> >> dead, if they were ever seen in the wild at all. If someone does still
> >> have one, we can handle this firmware wart in powerpc platform code.
> >>
> >> So remove the hack once and for all.
> >
> > Yay. I guess Power Macs and other quirks will never die...
>
> Not soon.
>
> In base.c I see:
>  - the hack in arch_find_n_match_cpu_physical_id()
>    - we should just move that into arch code, it's a __weak arch hook
>      after all.

Except then we'd have to export __of_find_n_match_cpu_property. I
somewhat prefer it like it is because arch specific functions tend to
encourage duplication. But if the implementation is completely
different like sparc, then yes, a separate implementation makes sense.

>  - a PPC hack in of_alias_scan(), I guess we need to retain that
>    behaviour, but it's pretty minor anyway.

It would be nice to know what platform(s) needs this as I don't have a
clue. It would also be nice if I had some dumps of DTs for some of
these OpenFirmware systems.

Rob
