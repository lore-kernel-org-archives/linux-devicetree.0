From: Scott Wood <scottwood@freescale.com>
Subject: Re: [PATCH v3 4/7] tegra: fdt: Add NAND controller binding
	and definitions
Date: Tue, 17 Apr 2012 15:49:08 -0500
Message-ID: <4F8DD744.1080702@freescale.com>
References: <1334688614-4977-1-git-send-email-sjg@chromium.org>
	<1334688614-4977-5-git-send-email-sjg@chromium.org>
	<4F8DBF50.5060700@freescale.com>
	<CAPnjgZ16bJJiq7qmTQ3br3kSmdTpZfcdtPDPNJ1=s1DPeDwE2g@mail.gmail.com>
	<4F8DD31D.3040304@freescale.com>
	<CAPnjgZ2OESUgpMb-L0AdJ3EbOzO2Y1GRykuudKpPu2Yyjsh_NA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <CAPnjgZ2OESUgpMb-L0AdJ3EbOzO2Y1GRykuudKpPu2Yyjsh_NA@mail.gmail.com>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree@theia.denx.de, Discuss <devicetree-discuss@lists.ozlabs.org>, Jim Lin <jilin@nvidia.com>, U-Boot Mailing List <u-boot@lists.denx.de>, Jerry Van Baren <vanbaren@cideas.com>, Tom Warren <twarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

On 04/17/2012 03:36 PM, Simon Glass wrote:
> Hi Scott,
> 
> On Tue, Apr 17, 2012 at 1:31 PM, Scott Wood <scottwood@freescale.com> wrote:
>> On 04/17/2012 03:18 PM, Simon Glass wrote:
>>> On Tue, Apr 17, 2012 at 12:06 PM, Scott Wood <scottwood@freescale.com> wrote:
>>>> Doesn't the number of cells depend on the GPIO controller binding?
>>>
>>> Yes, but this is the binding Tegra uses.
>>
>> Still, it doesn't belong in the NAND binding.  Maybe a future chip wants
>> to use this NAND binding but a different GPIO binding.  If nothing else,
>> people tend to copy-and-paste such descriptions.  We've still got people
>> adding bindings for Freescale devices saying interrupts are encoded as a
>> pair of cells, even though the interrupt controller now uses four cells
>> per interrupt.
> 
> OK I see - are you are saying that we should just say something like:
> 
> "nvidia,wp-gpios : GPIO of write-protect line, as defined by gpio bindings"

Yes.  If there were more than one GPIO line, you'd specify which one is
which, similar to reg and interrupts.

-Scott
