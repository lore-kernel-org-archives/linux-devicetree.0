From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: Re: Using DT overlays for adding virtual hardware
Date: Wed, 8 Jun 2016 17:27:26 +0200
Message-ID: <5758395E.4000508@siemens.com>
References: <575828C0.5000008@siemens.com>
 <20160608151745.GB13355@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <jailhouse-dev+bncBCJI7SMNV4NBBYXS4C5AKGQEKOUYLJY@googlegroups.com>
Sender: jailhouse-dev@googlegroups.com
In-Reply-To: <20160608151745.GB13355@leverpostej>
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>
To: Mark Rutland <mark.rutland@arm.com>
Cc: devicetree <devicetree@vger.kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jailhouse <jailhouse-dev@googlegroups.com>, =?UTF-8?B?TcOlbnMgUnVsbGfDpXJk?= <mans@denx.de>, Antonios Motakis <antonios.motakis@huawei.com>
List-Id: devicetree@vger.kernel.org

On 2016-06-08 17:17, Mark Rutland wrote:
> On Wed, Jun 08, 2016 at 04:16:32PM +0200, Jan Kiszka wrote:
>> Hi all,
>>
>> already started the discussion off-list with Pantelis, but it's better
>> done in public:
>>
>> I'm currently exploring ways to make Linux recognize dynamically added
>> virtual hardware when running under the Jailhouse hypervisor [1]. We
>> need to load drivers for inter-partition communication devices that only
>> appear after Jailhouse started (which is done from within Linux, i.e.
>> long after boot) or when a partition was added later on. Probably, we
>> will simply add a virtual PCI host bridge on systems without physical
>> PCI and let the IPC device be explored that way (already works on x86).
>> Still, that leaves us with hotplug and unplug on hypervisor activation
>> and deactivation.
> 
> If I've understood correctly you want to use overlays to inject the
> virtual PCI host bridge?
> 
> Given that you know precisely what you want to inject, I'm not sure I
> see the value of using an overlay. 
> 
> Is there some reason you can't just create a device without having to go
> via an intermediate step? As I understand it, Xen does that for (some)
> virtual devices provided to Dom0 and DomU.

I don't want to write yet another virtual driver but ideally reuse
pci-host-generic. Possibly a dumb question, but bow can I make Linux
instantiate a device node compatible with that driver and with the
desired resources? That's what made me think of overlays.

Thanks,
Jan

-- 
Siemens AG, Corporate Technology, CT RDA ITP SES-DE
Corporate Competence Center Embedded Linux
