From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH v2] ARM: DT: Add binding for GIC virtualization extentions
 (VGIC)
Date: Fri, 11 May 2012 09:10:42 -0600
Message-ID: <CACxGe6u+4qZ=6qW8P8LPyQAABv4GS5TXvs+azfX7v--HVLqCBw@mail.gmail.com>
References: <1336586277-28454-1-git-send-email-marc.zyngier@arm.com>
 <201205092027.50059.arnd@arndb.de>
 <37e096905f891fc6abdccf8977bd7447@localhost>
 <201205092047.06852.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201205092047.06852.arnd-r2nGTMty4D4@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, david.vrabel-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, May 9, 2012 at 2:47 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Wednesday 09 May 2012, Marc Zyngier wrote:
>> Ah, I see what you mean. But these registers and interrupt are actually
>> only visible on the hypervizor side. The guest shouldn't see any of this.
>
> Rihgt, that makes sense.
>
>> I suppose we could have a "arm,has-virt-extensions" property in devices
>> that implement the virtualization extensions (GIC, timers...).
>>
>> What do you think?
>
> Sounds good. I don't have a strong preference whether that should be a
> property like you suggest or a separate "compatible" value, maybe Rob or
> Grant can comment on what they prefer.

I don't have a strong opinion either way.  This approach looks fine.

g.
