From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 9/9] x86: OLPC: add OLPC device-tree support
Date: Mon, 30 Aug 2010 23:49:36 -0600
Message-ID: <AANLkTi=VZeYmBfp+0P+=Y8bV_zKW7bSU5PfXGM43SAa4@mail.gmail.com>
References: <20100628215407.2017bf2f@debian> <20100829235100.6dcedcb8@debxo>
 <20100830000751.2b845d05@debxo> <AANLkTi=EMkZLiAG7-ni8_7K=qtAriv=AfSUZ58661jNY@mail.gmail.com>
 <20100830144946.5c0bce22@debxo>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <sparclinux-owner@vger.kernel.org>
In-Reply-To: <20100830144946.5c0bce22@debxo>
Sender: sparclinux-owner@vger.kernel.org
To: Andres Salomon <dilinger@queued.net>
Cc: devicetree-discuss@lists.ozlabs.org, sparclinux@vger.kernel.org, x86@kernel.org, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, cjb@laptop.org, Mitch Bradley <wmb@laptop.org>, pgf@laptop.org, linux-kernel@vger.kernel.org, davem@davemloft.net, Stephen Neuendorffer <stephen.neuendorffer@xilinx.com>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 30, 2010 at 12:49 PM, Andres Salomon <dilinger@queued.net> =
wrote:
> On Mon, 30 Aug 2010 12:14:57 -0600
> Grant Likely <grant.likely@secretlab.ca> wrote:
>
>> On Sun, Aug 29, 2010 at 10:07 PM, Andres Salomon
>> <dilinger@queued.net> wrote:
>> >
>> > Make use of PROC_DEVICETREE to export the tree, and sparc's
>> > PROMTREE code to call into OLPC's Open Firmware to build the tree.
>> >
>> > This also adds an init hook to proc_device_tree_init so that we ca=
n
>> > ensure the device tree has been built prior to the proc_root_init
>> > stuff attempting to populate /proc/device-tree.
>>
>> I'm not clear as to why this is needed. =A0I would expect OLPC platf=
orm
>> setup code would take care of extracting the device tree well before
>> the kernel gets to setting up the representation in /proc/device-tre=
e.
>>
>> g.
>>
>
> For simplicity; the OLPC platform setup code runs very early during
> boot. =A0I preferred to keep that as minimal as possible, and defer
> device tree allocation until the x86 mm code has finished initializin=
g
> (this skipping all the fun bootmem/etc work that'll be happening for
> x86 soon).
>
> Of course, once it's done initializing, one can either hardcode an
> olpc_init_devtree call at the end of x86's setup_arch, or we can add =
a
> generic hook for late devtree initialization right before proc
> populates /proc/device-tree. =A0I chose the latter, but it could easi=
ly
> be changed to the former if folks feel strongly about it.
>
> I would've normally just used an initcall for it, but the proc_devtre=
e
> code runs prior to any of the initcall hooks.

Hmmm.  I wonder if proc_devtree initialization could be deferred to an
initcall.  That would make the problem go away.

g.
--
To unsubscribe from this list: send the line "unsubscribe sparclinux" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
