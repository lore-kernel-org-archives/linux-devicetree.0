From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2] ARM: CSR: Adding CSR SiRFprimaII board support
Date: Tue, 5 Jul 2011 13:10:14 +0200
Message-ID: <201107051310.14405.arnd@arndb.de>
References: <1309231954-23260-1-git-send-email-bs14@csr.com>
	<201107041653.50962.arnd@arndb.de>
	<CAGsJ_4wf0Lhe2yHg1fE2QAF40=J6ZoubpfLFWQ6X9o3db0O8LQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAGsJ_4wf0Lhe2yHg1fE2QAF40=J6ZoubpfLFWQ6X9o3db0O8LQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Barry Song <21cnbao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, workgroup.linux-kQvG35nSl+M@public.gmane.org, weizeng.he-kQvG35nSl+M@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday 05 July 2011, Barry Song wrote:
> > If your hardware can do that, you can replace the msleep() with a
> > single readl or a readl()/msleep(1) loop?
> 
> i can't agree more. if there is such a register in chip, we would have
> used it. ic guys confirmed there isn't such a register. so..delay...

Ok, fair enough. Maybe add a comment then to provide an explanation
why you are waiting for exactly 10ms. This will show up when people
try to optimize boot time, so it's good to know for the reader if it
can be made shorter or not.

	Arnd
