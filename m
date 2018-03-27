From: Oliver <oohall-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 6/6] doc/devicetree: NVDIMM region documentation
Date: Wed, 28 Mar 2018 01:53:30 +1100
Message-ID: <CAOSf1CFpFwzLMx0xmM+JmbQCiOA=QU_S5g0uf-qx181vJ_Xc1w@mail.gmail.com>
References: <20180323081209.31387-1-oohall@gmail.com>
 <20180323081209.31387-6-oohall@gmail.com>
 <20180326222448.l7ukrslvccvrjnjf@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
In-Reply-To: <20180326222448.l7ukrslvccvrjnjf@rob-hp-laptop>
List-Unsubscribe: <https://lists.01.org/mailman/options/linux-nvdimm>,
 <mailto:linux-nvdimm-request-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.01.org/pipermail/linux-nvdimm/>
List-Post: <mailto:linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
List-Help: <mailto:linux-nvdimm-request-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org?subject=help>
List-Subscribe: <https://lists.01.org/mailman/listinfo/linux-nvdimm>,
 <mailto:linux-nvdimm-request-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org?subject=subscribe>
Errors-To: linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org
Sender: "Linux-nvdimm" <linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Device Tree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org" <linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 27, 2018 at 9:24 AM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Fri, Mar 23, 2018 at 07:12:09PM +1100, Oliver O'Halloran wrote:
>> Add device-tree binding documentation for the nvdimm region driver.
>>
>> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Signed-off-by: Oliver O'Halloran <oohall-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  .../devicetree/bindings/nvdimm/nvdimm-region.txt   | 45 ++++++++++++++++++++++
>>  1 file changed, 45 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/nvdimm/nvdimm-region.txt
>>
>> diff --git a/Documentation/devicetree/bindings/nvdimm/nvdimm-region.txt b/Documentation/devicetree/bindings/nvdimm/nvdimm-region.txt
>> new file mode 100644
>> index 000000000000..02091117ff16
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/nvdimm/nvdimm-region.txt
>> @@ -0,0 +1,45 @@
>> +Device-tree bindings for NVDIMM memory regions
>> +-----------------------------------------------------
>> +
>> +Non-volatile DIMMs are memory modules used to provide (cacheable) main memory
>
> Are DIMMs always going to be the only form factor for NV memory?
>
> And if you have multiple DIMMs, does each DT node correspond to a DIMM?

A nvdimm-region might correspond to a single NVDIMM, a set of
interleaved NVDIMMs, or it might just be a chunk of normal memory that
you want treated as a NVDIMM for some reason. The last case is useful
for provisioning install media on servers since it allows you do
download a DVD image, turn it into an nvdimm-region, and kexec into
the installer which can use it as a root disk. That may seem a little
esoteric, but it's handy and we're using a full linux environment for
our boot loader so it's easy to make use of.

> If not, then what if we want/need to provide power control to a DIMM?

That would require a DIMM (and probably memory controller) specific
driver. I've deliberately left out how regions are mapped back to
DIMMs from the binding since it's not really clear to me how that
should work. A phandle array pointing to each DIMM device (which could
be anything) would do the trick, but I've found that a bit awkward to
plumb into the model that libnvdimm expects.

>> +that retains its contents across power cycles. In more practical terms, they
>> +are kind of storage device where the contents can be accessed by the CPU
>> +directly, rather than indirectly via a storage controller or similar. The an
>> +nvdimm-region specifies a physical address range that is hosted on an NVDIMM
>> +device.
>> +
>> +Bindings for the region nodes:
>> +-----------------------------
>> +
>> +Required properties:
>> +     - compatible = "nvdimm-region"
>> +
>> +     - reg = <base, size>;
>> +             The system physical address range of this nvdimm region.
>> +
>> +Optional properties:
>> +     - Any relevant NUMA assocativity properties for the target platform.
>> +     - A "volatile" property indicating that this region is actually in
>> +       normal DRAM and does not require cache flushes after each write.
>> +
>> +A complete example:
>> +--------------------
>> +
>> +/ {
>> +     #size-cells = <2>;
>> +     #address-cells = <2>;
>> +
>> +     platform {
>
> Perhaps we need a more well defined node here. Like we have 'memory' for
> memory nodes.

I think treating it as a platform device is fine. Memory nodes are
special since the OS needs to know where it can allocate early in boot
and I don't see non-volatile memory as being similarly significant.
Fundamentally an NVDIMM is just a memory mapped storage device so we
should be able to defer looking at them until later in boot.

That said you might have problems with XIP kernels and what not. I
think that problem is better solved through other means though.

>> +             region@5000 {
>> +                     compatible = "nvdimm-region;
>> +                     reg = <0x00000001 0x00000000 0x00000000 0x40000000>
>> +
>> +             };
>> +
>> +             region@6000 {
>> +                     compatible = "nvdimm-region";
>> +                     reg = <0x00000001 0x00000000 0x00000000 0x40000000>
>
> Your reg property and unit-address don't match and you have overlapping
> regions.

Yep, those are completely screwed up.

>> +                     volatile;
>> +             };
>> +     };
>> +};
>> --
>> 2.9.5
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe devicetree" in
>> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
