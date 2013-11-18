From: Jon Masters <jonathan@jonmasters.org>
Subject: Re: ACPI vs DT at runtime
Date: Mon, 18 Nov 2013 12:47:40 -0500
Message-ID: <A1500B03-BE9F-413D-AB2C-A15A8F0C6103@jonmasters.org>
References: <CAOesGMjKeRb=fFJM0MabDihbEiCGM4EqW9D5i_6-RFxTnpB4Qw@mail.gmail.com>
 <20131115095717.GC1709@e106331-lin.cambridge.arm.com>
 <20131115175241.GB27174@quad.lixom.net>
Mime-Version: 1.0 (Mac OS X Mail 6.6 \(1510\))
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20131115175241.GB27174@quad.lixom.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Olof Johansson <olof@lixom.net>
Cc: Mark Rutland <mark.rutland@arm.com>, Grant Likely <grant.likely@secretlab.ca>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


On Nov 15, 2013, at 12:52 PM, Olof Johansson <olof@lixom.net> wrote:

> On Fri, Nov 15, 2013 at 09:57:17AM +0000, Mark Rutland wrote:
>> On Fri, Nov 15, 2013 at 01:44:10AM +0000, Olof Johansson wrote:
>>> The more I start to see early UEFI/ACPI code, the more I am certain
>>> that we want none of that crap in the kernel. It's making things
>>> considerably messier, while we're already very busy trying to convert
>>> everything over and enable DT -- we'll be preempting that effort just
>>> to add even more boilerplate everywhere and total progress will be
>>> hurt.
>> 
>> We are certainly under a lot of pressure with the device tree migration,
>> and I agree that adding another information source is going to be a
>> source of pain. However, I'd argue that we're going to encounter pain
>> regardless of which approach we take.
>> 
>> I'm of the opinion that the only way we should support ACPI is as a
>> first-class citizen. We don't need to modify every driver and subsystem
>> to support ACPI, only those necessary to support the minimal set of
>> platforms using ACPI. ACPI is new in the arm space, and we can enforce
>> quality standards on ACPI _now_ above what we're allowing for DT, and
>> avoid future problems.
> 
> It's obvious from the very first submission, from a vendor that has worked
> closely with "the community" (i.e. one enterprise distro at least), that this
> is completely new territory for _everyone_ involved. There's no way that we can
> enforce quality standards for ACPI yet -- we don't know what they look like!
> Nobody knows how to design a good ACPI implementation or binding.
> 
> Oh wait, there's people who have been doing this for years. Microsoft. They
> should be the ones driving this and taking the pain for it. Once the platform
> is enabled for their needs, we'll sort it out at our end. After all, that has
> worked reasonably well for x86 platforms.

For the record, Red Hat's position is to fully back ACPI on ARMv8. This is not to say that you ever will see a commercial product from Red Hat (I have nothing to say there of any kind), but in saying the above you do attempt to preclude the possibility that someone might want to ship a real Enterprise grade OS for the next few years (no offense to others who are shipping today). I would suggest a more pragmatic solution is to leverage the opportunity to be involved in the steering of ACPI on ARMv8 from the ground up, rather than just waiting for others to do it as has happened in the past (isn't that a sad reality? waiting for Microsoft to do the lifting?). It's going to happen either way. Too many silicon companies have billions on the line, and most of them are already on the ACPI train 
 at this point - along with the major OEMs. Now if people said "sure, we'd love to join UEFI Forum but we can't afford it" or something tangible I could take back to others to secure funds or support for such involvement to proceed, then we'd be usefully advancing this :)

Jon.
