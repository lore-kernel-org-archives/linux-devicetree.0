From: Anton Vorontsov <avorontsov-hkdhdckH98+B+jHODAdFcQ@public.gmane.org>
Subject: Re: [PATCH v3 3/4] powerpc: NAND: FSL UPM: document new bindings
Date: Fri, 27 Mar 2009 02:32:45 +0300
Message-ID: <20090326233245.GA17048@oksana.dev.rtsoft.ru>
References: <fa686aa40903252209r52a1bc1cn995a7da16bc3527f@mail.gmail.com>
	<49CB31CB.2010704@grandegger.com>
	<fa686aa40903260727y3266e394g5e574680fe70bbbf@mail.gmail.com>
	<49CBA062.5050000@grandegger.com>
	<fa686aa40903260904s67258fbbge3c87e06946c5f58@mail.gmail.com>
	<49CBAED4.8030802@grandegger.com>
	<fa686aa40903261002l2c8e0d41s6e5ad4bc049058bf@mail.gmail.com>
	<20090326173302.GA23187@oksana.dev.rtsoft.ru>
	<49CBFE52.6090706@grandegger.com>
	<fa686aa40903261622wa2a93f9i98435080c7ab6cea@mail.gmail.com>
Reply-To: avorontsov-hkdhdckH98+B+jHODAdFcQ@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <fa686aa40903261622wa2a93f9i98435080c7ab6cea-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, devicetree-discuss list <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 26, 2009 at 05:22:36PM -0600, Grant Likely wrote:
[...]
> That said, I won't oppose it if you go this route.  However at the
> very least, please change the nand node's compatible list to be:
> 
> compatible = "tqc,tqm8548-upm-nand", "fsl,upm-nand";

Yeah, that's definitely a good idea.

-- 
Anton Vorontsov
email: cbouatmailru-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
irc://irc.freenode.net/bd2
