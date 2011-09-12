From: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: Appended devicetree with Torvalds' HEAD
Date: Mon, 12 Sep 2011 09:25:26 -0400 (EDT)
Message-ID: <alpine.LFD.2.00.1109120922140.20358@xanadu.home>
References: <CACRpkdb1iD2RkpmMkN1d5VNVr-M3KgrkE7Xg-Bxcr-xd2fcuPw@mail.gmail.com>
	<alpine.LFD.2.00.1109061347410.20358@xanadu.home>
	<CACRpkdaVL5L2-DR8gshN9b0sOn5rDY5QyP4fwZggXjFPmFr9-g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CACRpkdaVL5L2-DR8gshN9b0sOn5rDY5QyP4fwZggXjFPmFr9-g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 12 Sep 2011, Linus Walleij wrote:

> So it appears that the appended device tree does not
> show up.
> 
> I don't quite know how to debug this further...

I'm in the process of refreshing those patches, bringing them forward 
and cleaning up the parts that I dislike in the process.  I will 
certainly look at your failure case.

> Given that the appended approach is generally
> frowned upon maybe we are better off trying to fix
> our U-Boot, getting a combo that is known to work
> with device tree, than trying to get appended device
> trees to work?

It still has to minimally work as some bootloaders out there simply 
can't be updated at all.


Nicolas
