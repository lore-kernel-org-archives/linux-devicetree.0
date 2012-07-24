From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: Forcing PIO mode instead of DMA via DT property
Date: Tue, 24 Jul 2012 13:19:44 +0000
Message-ID: <201207241319.45101.arnd@arndb.de>
References: <201207222328.27008.marex@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201207222328.27008.marex-ynQEQJNshbs@public.gmane.org>
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
To: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Cc: pavel-ynQEQJNshbs@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sunday 22 July 2012, Marek Vasut wrote:
> I'm trying to implement a driver that can do both DMA and PIO, and it would be 
> nice if the user was able to select the mode (on a per-bus basis) using the DT. 
> The PIO mode can reduce the overhead in some cases and therefore be better 
> choice than the DMA (for example when most transfers move only very few data, or 
> when board-specific hardware properties kick in).
> 
> I was thinking about using some "manf,use-pio" DT property, but I haven't found 
> any such example yet, so I wonder if this is a good idea.
> 

What kind of device is this? We are currently working on the dmaengine
binding, so an easy way to do this would be (one that binding is complete)
to either provide or not provide the channel description depending on
what you want to do with the device. This is clearly a hack but might
fit your use case without adding any ugly code to the kernel.

Another option would be to make it a runtime configuration option,
e.g. through sysfs, but that again depends a lot on what device you
are talking about.

	Arnd
