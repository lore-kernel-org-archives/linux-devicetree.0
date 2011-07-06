From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2] ARM: CSR: Adding CSR SiRFprimaII board support
Date: Wed, 6 Jul 2011 09:40:34 +0200
Message-ID: <201107060940.34452.arnd@arndb.de>
References: <1309231954-23260-1-git-send-email-bs14@csr.com>
	<20110706062838.GI9978@ponder.secretlab.ca>
	<CAGsJ_4xUsw21EM2GXMt4i27MGjCP_h46tCzhDqo-MCZkAVsEiw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAGsJ_4xUsw21EM2GXMt4i27MGjCP_h46tCzhDqo-MCZkAVsEiw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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

On Wednesday 06 July 2011 09:03:45 Barry Song wrote:
> but it seems we will still add "sirf,alsta6-intc" in intc driver if
> that really happen in the future. in my understanding, drivers should
> explicitly claim all chips or ip cores they can support.

I don't think there is a need for that. I'd only add the second
one if there is a need in the driver to tell the difference.
In that case, you can add a data field to the device_id and use
that for making decisions in the driver.

	Arnd
