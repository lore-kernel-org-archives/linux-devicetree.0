From: Segher Boessenkool <segher-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH v3] libfdt: Add support for using aliases in
	fdt_path_offset()
Date: Sat, 16 Aug 2008 08:51:06 +0200
Message-ID: <B8AE3E9F-3F7A-4533-8C6C-1C6E2F45044A@kernel.crashing.org>
References: <Pine.LNX.4.64.0808140827220.2701@blarg.am.freescale.net>
	<20080814174348.GA19488@ld0162-tx32.am.freescale.net>
	<20080815013439.GB12327@yookeroo.seuss>
Mime-Version: 1.0 (Apple Message framework v753.1)
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <20080815013439.GB12327-787xzQ0H9iRg7VrjXcPTGA@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

> Hmm.. my reading of 1275 says that an alias pointing to another alias
> is not permitted, but I'm not terribly confident I'm not misreading
> it.  Segher, do you know whether this is allowed?

My reading is the same: if after expanding an alias the path does
not start with "/", the search starts at the current package,
otherwise it starts at the root node; and no further alias expansion
is done.

It's a corner case for sure, but at least the standard doesn't
require us to implement recursive alias expansion; let's see if
common practice does ;-)


Segher
