From: michal.bachraty-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: Re: [PATCH v3] clk: add si5351 i2c common clock driver
Date: Wed, 20 Mar 2013 06:55:35 -0700 (PDT)
Message-ID: <6e120226-8a3c-415f-90f2-c44e7b6bbf96@googlegroups.com>
References: <fa.WZVD0OA/Ooajh6BejiLf7TwBsJ8@ifi.uio.no>
 <fa.iIqrS6k+Vb5mLqAeL7iTsNsbKyo@ifi.uio.no>
 <fa.L0b41q+fYFZG0WOFTGKLhn/cGPA@ifi.uio.no>
 <fa.XCuSmq9Zwp3+wqFO8NEjpwADVZ0@ifi.uio.no>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <fa.XCuSmq9Zwp3+wqFO8NEjpwADVZ0-6miFZF/5cTBuMpJDpNschA@public.gmane.org>
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
To: fa.linux.kernel-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Dom Cobley <popcornmix-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Rabeeh Khoury <rabeeh-UBr1pzP51AyaMJb+Lgu22Q@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Sebastian,

Thanks for writing this driver!
I have tested your si5351 clock driver and his tuning capabilities. It works well, it generates proper clock frequency, but when new frequency is generated, little clock gap (1ms) is generated. Si5351 datasheet and WP claims, clock tuning can be without gaps - http://www.silabs.com/Support%20Documents/TechnicalDocs/Si5350-51-Frequency-Shifting-WP.pdf
I made some tests with Si5351A chip and I found that when tuning touch only Multisynth registers, it can tune without gaps. There is no need for soft PLL reset. I found also, accessing Multisynth registers is not atomic, so there can be another frequency at output, while not all registers are written. Writing only to one register seems to be atomic.
I'm using this chip for master audio clock frequency generator and tuning about +-50ppm. The question is, if driver you made has capability for tuning without gaps in +-50pmm (or any other) range with about 1ppm step and if not, it is possible to add this functionality? 

Thanks,

Michal
