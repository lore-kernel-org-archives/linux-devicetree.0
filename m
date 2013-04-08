From: Martin Fuzzey <mfuzzey-mB3Nsq4MPf1BDgjK7y7TUQ@public.gmane.org>
Subject: Re: [RFC PATCH] CLK: Allow parent clock and rate to be configured
 in DT.
Date: Mon, 08 Apr 2013 11:35:29 +0200
Message-ID: <51628F61.9000300@parkeon.com>
References: <20130319170933.28337.50448.stgit@localhost>
 <CAOMZO5ASkvquyzPCEGObvB5Xh9bDPTJ2zx26eOUJT_Vb36Bn3Q@mail.gmail.com>
 <CAKGA1bkWLrOs15ni=8D__BvuG6kvqkeeLZGOLrVZY9g0q0z4Bg@mail.gmail.com>
 <6581638.FPkNsv6peb@flatron> <20130407132623.GP1906@pengutronix.de>
Reply-To: mfuzzey-mB3Nsq4MPf1BDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130407132623.GP1906-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
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
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mike Turquette <mturquette-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 07/04/13 15:26, Sascha Hauer wrote:
>
> Honestly I'm annoyed by this aswell. The devicetree contains a nice and
> complete hardware description and it seems convenient to put hardware
> related configuration data there aswell.
Yes
> The problem is that hardware description and configuration data are two
> completely different sets of data. The hardware description is static
> for a given board and should (ideally) never change. The configuration
> data instead is often usecase specific and changes over the lifetime of
> a board. The configuration data can only handle a single (or maybe a
> table of) static setup(s). It's a good way to specify a sane default or
> a very special setup, but doesn't handle the case when some OS (or
> version thereof) wants to have a static setup and another wants to
> figure out the same data dynamically.
Agreed
> For these reasons I am against throwing the two data sets into a single
> pot. Still I also want to have the devicetree way to configure some
> static setup items.
Sure but why does using the DT for both mean "throwing them into a 
single pot?"

I think we need to seperate the ideas of "DT as a container format" and 
"semantics of DT nodes".

The format is the same everywhere but the semantics could change in 
different parts of the tree.

Since the DT is a tree structure surely all we need to do is agree on a 
designated configuration root node
"linux-config" for example under which we put all configuration related 
stuff specific to linux whilst
retaining the "hardware description only" rule for the rest of the DT.

Martin
