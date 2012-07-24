From: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Subject: Re: Forcing PIO mode instead of DMA via DT property
Date: Tue, 24 Jul 2012 07:55:55 -0700
Message-ID: <500EB77B.6050105@firmworks.com>
References: <201207222328.27008.marex@denx.de>
 <201207241319.45101.arnd@arndb.de>
 <20120724143533.080F5200247@gemini.denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120724143533.080F5200247-C2Gvrrd9BC/j/ljBK/0BTg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>
Cc: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, pavel-ynQEQJNshbs@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 7/24/2012 7:35 AM, Wolfgang Denk wrote:
> Dear Arnd,
> 
> In message <201207241319.45101.arnd-r2nGTMty4D4@public.gmane.org> you wrote:
>>
>>> I'm trying to implement a driver that can do both DMA and PIO, and it would be 
>>> nice if the user was able to select the mode (on a per-bus basis) using the DT. 
>>> The PIO mode can reduce the overhead in some cases and therefore be better 
>>> choice than the DMA (for example when most transfers move only very few data, or 
>>> when board-specific hardware properties kick in).
>>>
>>> I was thinking about using some "manf,use-pio" DT property, but I haven't found 
>>> any such example yet, so I wonder if this is a good idea.

I think it's okay to have such a property, especially in the case where
there are
specific hardware reasons for choosing PIO on that bus.

It would be even better to have a property that describes the specific
hardware
situation that leads to the conclusion.  The conclusion is "use PIO",
whereas the
situation might be "expected transfer length = 4".  Some such
"situations" might
apply to specific slaves, and thus might better be described in a child
node, with
the information processed in the child driver and passed to the bus
driver through
a callback - but that probably has tricky API implications.

The thing to avoid is properties that can't easily be tied to some
objectively-true
aspect of the system.

Write down what it is that causes the choice, then consider describing
that in
a property, letting the driver make the final decision based on that
information.


>>>
>>
>> What kind of device is this? We are currently working on the dmaengine
>> binding, so an easy way to do this would be (one that binding is complete)
>> to either provide or not provide the channel description depending on
>> what you want to do with the device. This is clearly a hack but might
>> fit your use case without adding any ugly code to the kernel.
>>
>> Another option would be to make it a runtime configuration option,
>> e.g. through sysfs, but that again depends a lot on what device you
>> are talking about.
> 
> At least in my example of the x86 system a sysfs interface would not
> help, as the kernel would crash during bootup before I can run user
> space code.
> 
> Best regards,
> 
> Wolfgang Denk
> 
