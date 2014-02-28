From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v5 01/11] of: document bindings for reserved-memory nodes
Date: Fri, 28 Feb 2014 11:01:50 +0100
Message-ID: <53105E8E.1040504@gmail.com>
References: <1392985527-6260-1-git-send-email-m.szyprowski@samsung.com>
 <1392985527-6260-2-git-send-email-m.szyprowski@samsung.com>
 <20140226115108.211D2C40A89@trevor.secretlab.ca>
 <53105CC6.1090902@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <53105CC6.1090902@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, Grant Likely <grant.likely@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linaro-mm-sig@lists.linaro.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Laura Abbott <lauraa@codeaurora.org>, Pawel Moll <pawel.moll@arm.com>, Arnd Bergmann <arnd@arndb.de>, Stephen Warren <swarren@wwwdotorg.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Tomasz Figa <t.figa@samsung.com>, Will Deacon <will.deacon@arm.com>, Michal Nazarewicz <mina86@mina86.com>, Marc <marc.ceeeee@gmail.com>, Nishanth Peethambaran <nishanth.p@gmail.com>, Rob Herring <robh+dt@kernel.org>, Paul Mackerras <paulus@samba.org>, Catalin Marinas <catalin.marinas@arm.com>, Kumar Gala <galak@codeaurora.org>, Olof Johansson <olof@lixom.net>, Josh Cartwright <joshc@codeaurora.org>, Sascha Hauer <s.hauer@pengutronix.de>, Ian Campbell <ian.campbell@citrix.com>
List-Id: devicetree@vger.kernel.org

On 28.02.2014 10:54, Marek Szyprowski wrote:
> Hello,
>
> On 2014-02-26 12:51, Grant Likely wrote:
>> On Fri, 21 Feb 2014 13:25:17 +0100, Marek Szyprowski
>> <m.szyprowski@samsung.com> wrote:
>> > From: Grant Likely <grant.likely@linaro.org>
>> >
>> > Reserved memory nodes allow for the reservation of static (fixed
>> > address) regions, or dynamically allocated regions for a specific
>> > purpose.
>> >
>> > Signed-off-by: Grant Likely <grant.likely@linaro.org>
>> > [joshc: Based on binding document proposed (in non-patch form) here:
>> >
>> http://lkml.kernel.org/g/20131030134702.19B57C402A0@trevor.secretlab.ca
>> >  adapted to support #memory-region-cells]
>> > Signed-off-by: Josh Cartwright <joshc@codeaurora.org>
>> > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> > ---
>> >  .../bindings/reserved-memory/reserved-memory.txt   |  138
>> ++++++++++++++++++++
>> >  1 file changed, 138 insertions(+)
>> >  create mode 100644
>> Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
>> >
>> > diff --git
>> a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
>>
>> > new file mode 100644
>> > index 000000000000..a606ce90c9c4
>> > --- /dev/null
>> > +++
>> b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
>> > @@ -0,0 +1,138 @@
>> > +*** Reserved memory regions ***
>> > +
>> > +Reserved memory is specified as a node under the /reserved-memory
>> node.
>> > +The operating system shall exclude reserved memory from normal usage
>> > +one can create child nodes describing particular reserved (excluded
>> from
>> > +normal use) memory regions. Such memory regions are usually
>> designed for
>> > +the special usage by various device drivers.
>> > +
>> > +Parameters for each memory region can be encoded into the device tree
>> > +with the following nodes:
>> > +
>> > +/reserved-memory node
>> > +---------------------
>> > +#address-cells, #size-cells (required) - standard definition
>> > +    - Should use the same values as the root node
>> > +#memory-region-cells (required) - dictates number of cells used in
>> the child
>> > +                                  nodes memory-region specifier
>>
>> I still don't like this portion of the binding. I'm not convinced that
>> it is necessary in the majority of cases and it is going to be very
>> driver specific. I would rather drop it entirely from the common
>> binding. If a specific driver needs to do something like the above then
>> it can have a driver specific binding. Otherwise I think the default
>> should be a simple phandle with no arguments to a single reserved memory
>> node.
>>
>> Ben, can you weigh in on the current state of this document. I'm mostly
>> happy with it aside from my comment above. Do you think this is ready to
>> be merged?
>>
>> > +ranges (required) - standard definition
>> > +    - Should be empty
>> > +
>> > +/reserved-memory/ child nodes
>> > +-----------------------------
>> > +Each child of the reserved-memory node specifies one or more
>> regions of
>> > +reserved memory. Each child node may either use a 'reg' property to
>> > +specify a specific range of reserved memory, or a 'size' property with
>> > +optional constraints to request a dynamically allocated block of
>> memory.
>> > +
>> > +Following the generic-names recommended practice, node names should
>> > +reflect the purpose of the node (ie. "framebuffer" or "dma-pool").
>> Unit
>> > +address (@<address>) should be appended to the name if the node is a
>> > +static allocation.
>> > +
>> > +Properties:
>> > +Requires either a) or b) below.
>> > +a) static allocation
>> > +   reg (required) - standard definition
>> > +b) dynamic allocation
>> > +   size (required) - length based on parent's #size-cells
>> > +                   - Size in bytes of memory to reserve.
>> > +   alignment (optional) - length based on parent's #size-cells
>> > +                        - Address boundary for alignment of
>> allocation.
>> > +   alloc-ranges (optional) - prop-encoded-array (address, length
>> pairs).
>> > +                           - Specifies regions of memory that are
>> > +                             acceptable to allocate from.
>> > +
>> > +If both reg and size are present, then the reg property takes
>> precedence
>> > +and size is ignored.
>> > +
>> > +Additional properties:
>> > +compatible (optional) - standard definition
>> > +    - may contain the following strings:
>> > +        - shared-dma-pool: This indicates a region of memory meant
>> to be
>> > +          used as a shared pool of DMA buffers for a set of
>> devices. It can
>> > +          be used by an operating system to instanciate the
>> necessary pool
>> > +          management subsystem if necessary.
>> > +        - vendor specific string in the form
>> <vendor>,[<device>-]<usage>
>>
>> Add "Use vendor strings to identify regions dedicates for a specific
>> vendor device. For example: 'acme,framebuffer'. Platform code can use
>> vendor
>> strings to identify device specific regions"
>
> So do you want to completely drop phandle based links between device
> nodes and
> memory regions?

Huh? How this would work with regions that have to be used for multiple 
(but not all - not a default region) devices?

Best regards,
Tomasz
