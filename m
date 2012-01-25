From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFCv2 00/14]
Date: Wed, 25 Jan 2012 12:51:08 -0600
Message-ID: <4F204F1C.70908@gmail.com>
References: <1327352870-14687-1-git-send-email-grant.likely@secretlab.ca>
 <4F1DD6DF.4080706@gmail.com> <4F200DFD.7070407@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4F200DFD.7070407-l0cyMroinI0@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: "Cousson, Benoit" <b-cousson-l0cyMroinI0@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Milton Miller <miltonm-ogEGBHC/i9Y@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 01/25/2012 08:13 AM, Cousson, Benoit wrote:
> On 1/23/2012 10:53 PM, Rob Herring wrote:
>> On 01/23/2012 03:07 PM, Grant Likely wrote:
>>>
>>> Hey everyone,
>>>
>>> Here's the second RFC for the irq_domain patches.  I could use some
>>> help testing now.  I still expect there will be a few bugs.  The
>>> series is based on v3.3-rc1, and I've pushed it out to my git server:
>>>
>>> git://git.secretlab.ca/git/linux-2.6.git irqdomain/next
>>
>> Can you post to linux-arm-kernel too so people are aware of this work
>> and stop posting dead-end irqdomain patches.
> 
> Good point, I have two pending series that are using the
> irq_domain_add() so far, so it will be good to have that branch pulled
> in arm-soc.
> 
>> I tested what you had as of this morning and it works fine for me. Looks
>> like the only diff is the VExpress code. I'm working on rebasing my
>> domain support for generic irqchip now.
> 
> In fact your generic irqchip should even avoid us to use
> irq_domain_add_legacy() since both GPIO and OMAP3 intc are already using
> the irqchip.
> 
> I guess you are not going to change the interface so the patches I did
> on your previous branch to try them should be good already, isn't it?

I've got it rebased on top of Grant's tree. I will send it out soon.

One problem that still remains is it breaks x86 and any platform using
generic irq chip, but not selecting IRQ_DOMAIN. Grant, do you plan to
enable IRQ_DOMAIN for x86 in your series? MIPS may also need fixing.

Rob
