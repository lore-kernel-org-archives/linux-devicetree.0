From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [REPOST RFC PATCH 0/3] New "gpio-poweroff" driver to turn off
 platform devices with GPIOs
Date: Tue, 20 Dec 2011 14:38:58 +0000
Message-ID: <20111220143857.GU2866@opensource.wolfsonmicro.com>
References: <1323800614-12642-1-git-send-email-Kyle.D.Moffett@boeing.com>
 <4EE7A31E.7080301@gmail.com>
 <895CF182-4BF7-4DF5-A467-944EC008DBC3@boeing.com>
 <20111214120240.GC25088@sirena.org.uk>
 <E30C4693-0D31-4A9A-9E9D-0FC03C5F6B8A@boeing.com>
 <20111217092044.GC2833@opensource.wolfsonmicro.com>
 <D482A908-020C-43E0-ADFC-33AE213D7257@boeing.com>
 <20111220013819.GV2860@opensource.wolfsonmicro.com>
 <B187B965-8671-485E-9CAB-7CF3468D2ED6@boeing.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <B187B965-8671-485E-9CAB-7CF3468D2ED6-X8CqP27nNzzQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: "Moffett, Kyle D" <Kyle.D.Moffett-X8CqP27nNzzQT0dZR+AlfA@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 19, 2011 at 07:53:06PM -0600, Moffett, Kyle D wrote:
> On Dec 19, 2011, at 20:38, Mark Brown wrote:

> > Well, it depends what you need to do.  In the ST-Ericsson case what they
> > needed to do was collapse the core supplies for the CPU.  But previously
> > you were talking about power domains, not whole system poweroff.
> > Usually a power domain is a subset of the full system power.

> Well, I have control of 3 separate power domains in the sense that
> there are 6 physically separate computers sharing a single supply,
> with 2 in each domain (and only 1 of the 6 controlling the shared
> supply).

OK, that's really not what people commonly understand by "power domain".
This is really only about system powerdown sequencing so a custom driver
is probably fine.
