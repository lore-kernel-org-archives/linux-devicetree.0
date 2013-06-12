From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 04/14] bus: mvebu-mbus: Add static window allocation to
 the DT binding
Date: Wed, 12 Jun 2013 23:50:43 +0200
Message-ID: <201306122350.43983.arnd@arndb.de>
References: <1370623671-7748-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20130611215023.GA12649@obsidianresearch.com>
 <20130612200248.GA23012@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130612200248.GA23012@localhost>
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
To: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 12 June 2013, Ezequiel Garcia wrote:
> #define INTERNAL_REGS INTERNAL_REGS_ID 0
> #define DEVBUS_BOOTCS 0x012f0000 0
> #define BOOTROM       0x01e00000 0
> 
> #define INTERNAL_REGS_BASE 0 0xd0000000
> #define DEVBUS_BOOTCS_BASE 0 0xf0000000
> #define BOOTROM_BASE       0 0xfff00000
> ...
>  
> soc {
>         ranges = <INTERNAL_REGS INTERNAL_REGS_BASE 0x100000
>                   BOOTROM       BOOTROM_BASE       0x100000
>                   DEVBUS_BOOTCS DEVBUS_BOOTCS_BASE 0x1000000>;
> 

FWIW, I think using macros to pass INTERNAL_REGS_BASE is counterproductive.
It's much better to use literal numbers for those because then you
can see how things fit together by looking at the source.

The macros for the IDs seem fine, although I would actually find it
easier to have just one macro like

#define MBUS_ID(a, b) (((a) & 0xff) << 24 | ((b) & 0xff) << 16)

and pass the literals into that, to the effect of

soc {
	ranges = <1 0 0 0xd0000000 0x100000>,
		 <MBUS_ID(0x01, 0x2f) 0 0 0xfff00000 0x100000>,
		 <MBUS_ID(0x01, 0xe0) 0 0 0xf0000000 0x100000>;

I'd suggest having each macro expand only to a single value, to make
it clearer which numbers belong together in the ranges array.

	Arnd
