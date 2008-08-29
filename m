From: Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>
Subject: Re: dtc
Date: Fri, 29 Aug 2008 02:26:23 -0500
Message-ID: <200808290226.24367.rob@landley.net>
References: <319b0ac50808080546w7bda0293ub9fb4a4160cfd17f@mail.gmail.com>
	<20080808125430.GA4243@pengutronix.de>
	<489C45AC.9080504@grandegger.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <489C45AC.9080504-5Yr1BZd7O62+XT7JhA+gdA@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Friday 08 August 2008 08:10:04 Wolfgang Grandegger wrote:
> If you want to make my-board.dtb, just type:
>
> $ make my-board.dtb
>
> You may need to specific DTS_FLAGS though, e.g.:
>
> $ export DTS_FLAGS="-p 0x1000"
> $ make my-board.dtb

What do those flags do, by the way?  (Is there documentation I should read on 
this?)

I've skimmed Documentation/powerpc/booting-without-of.txt a bit, but I don't 
recall it mentioning much about flags?  (A quick grep showed gpio flags and 
address allocation flags, but not what any of them actually _were_...)

> Wolfgang.

Rob
-- 
"One of my most productive days was throwing away 1000 lines of code."
  - Ken Thompson.
