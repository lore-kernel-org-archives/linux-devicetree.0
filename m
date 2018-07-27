From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] of/fdt: Remove PPC32 longtrail hack in memory scan
Date: Fri, 27 Jul 2018 11:12:50 -0600
Message-ID: <CAL_JsqK4GEPJSPg+sStvFyO=sQ0Fp49FKKTz0S9OGc1COOnp-g@mail.gmail.com>
References: <20180727053555.26596-1-mpe@ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <20180727053555.26596-1-mpe@ellerman.id.au>
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

On Thu, Jul 26, 2018 at 11:36 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> When the OF code was originally made common by Grant in commit
> 51975db0b733 ("of/flattree: merge early_init_dt_scan_memory() common
> code") (Feb 2010), the common code inherited a hack to handle
> PPC "longtrail" machines, which had a "memory@0" node with no
> device_type.
>
> That check was then made to only apply to PPC32 in b44aa25d20e2 ("of:
> Handle memory@0 node on PPC32 only") (May 2014).
>
> But according to Paul Mackerras the "longtrail" machines are long
> dead, if they were ever seen in the wild at all. If someone does still
> have one, we can handle this firmware wart in powerpc platform code.
>
> So remove the hack once and for all.

Yay. I guess Power Macs and other quirks will never die...

I'll queue this up.

Rob
