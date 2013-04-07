From: Matt Sealey <matt-sEEEE4iEDtaXzmuOJsdVMQ@public.gmane.org>
Subject: Re: [RFC PATCH] CLK: Allow parent clock and rate to be configured in
 DT.
Date: Sun, 7 Apr 2013 11:23:25 -0500
Message-ID: <CAKGA1bnt_wrNPg2JdAu=ac+WiUm8pVaGh3Tjrt3NvgdFeLxB8A@mail.gmail.com>
References: <20130319170933.28337.50448.stgit@localhost>
 <CAOMZO5ASkvquyzPCEGObvB5Xh9bDPTJ2zx26eOUJT_Vb36Bn3Q@mail.gmail.com>
 <CAKGA1bkWLrOs15ni=8D__BvuG6kvqkeeLZGOLrVZY9g0q0z4Bg@mail.gmail.com>
 <6581638.FPkNsv6peb@flatron> <20130407132623.GP1906@pengutronix.de>
 <CAKGA1b=AcQsA-P-pR+in+9CzqW=XfEBhdoR+AC7QCLYfUhQqJg@mail.gmail.com>
 <CAOMZO5ARwOLdSg4Np_HB2m7zvTNE94bJBUh3R-oG=xcP4R6Y-Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAOMZO5ARwOLdSg4Np_HB2m7zvTNE94bJBUh3R-oG=xcP4R6Y-Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Martin Fuzzey <mfuzzey-mB3Nsq4MPf1BDgjK7y7TUQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Linux ARM Kernel ML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mike Turquette <mturquette-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Apr 7, 2013 at 11:00 AM, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Sun, Apr 7, 2013 at 12:50 PM, Matt Sealey <matt-sEEEE4iEDtaXzmuOJsdVMQ@public.gmane.org> wrote:
>
>> If we're dealing with audio codecs, fix the audio codec to accept a
>> *table* of possible clock values and if that hardware operates
>> differently per clock value, then add that data in there too (like the
>> cs42l52 audio codec). Where the software and hardware is a little more
>> dynamic, the same binding works here - and the usual trick is just
>> force one configuration possible out of many. The board designer can
>> look at all the possibilities and choose the one or two or all that
>> will work with the design, and it can go into the device tree.
>
> Sorry, but I have a hard time following a so long response.
>
> Can't you just send patches to the list with your proposal so that we
> can move forward with the idea?

Sure.

-- 
Matt Sealey <matt-sEEEE4iEDtaXzmuOJsdVMQ@public.gmane.org>
Product Development Analyst, Genesi USA, Inc.
